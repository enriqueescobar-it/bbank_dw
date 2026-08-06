-- REVIEW (Needs to be upgraded to code standard and needs to be validated agains the incremental logic)
-- REVIEW (This code could be upgraded to smaller version, most variables are not used)

-- NAME: SILVER_BRFILE_ACCOUNT_RELATIONSHIP
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: AGGREGATION
-- DATE: June 28, 2024

{{
   config(
          materialized='incremental',
		  incremental_strategy='append',
          tags=["aggregation_standard"]
        )
}}


with cte_mulesoft_tables AS (
	SELECT DISTINCT
	 mei.EXTERNAL_ID AS CIF
	,mpe.EXTERNAL_ID AS APP_REF
	,mpe.market_segment
	,mpe.source_account_primary_owner
from {{ref('silver_customer_mulesoft_external_id')}}  mei
	INNER JOIN {{ref('silver_customer_mulesoft_party')}}  mpa
			ON mei.customer_id = mpa.id
	INNER JOIN {{ref('silver_customer_mulesoft_prospect_external_data')}}  mpe
			ON mpa.primary_id_number = mpe.primary_id_number
),
br02_accounts as (
	SELECT 
		DISTINCT Acc_Account_Number AS ACCOUNT_NUMBER
		FROM {{ ref('gold_brfile_account') }}
),
customer_file as (
SELECT
     ROW_NUMBER() OVER (ORDER BY FINAL_RESULT.CUST_CIF) AS Cust_RecordID
    ,FINAL_RESULT.Cust_CIF
    ,FINAL_RESULT.Cust_Type
    ,FINAL_RESULT.Cust_BBD_ID
    ,FINAL_RESULT.Cust_BBD_RM
    ,trim(FINAL_RESULT.Cust_Name) as Cust_Name
    ,COALESCE(FINAL_RESULT.Cust_Q2Cust,0) AS Cust_Q2Cust
    ,COALESCE(FINAL_RESULT.Cust_Q2User,0) AS Cust_Q2User
    ,trim(FINAL_RESULT.Cust_Q2Login) as Cust_Q2Login
    ,FINAL_RESULT.Cust_Create_Date AS Cust_Created_Date
    ,'Y' AS Cust_ID_Status_Valid
    ,FINAL_RESULT.Cust_W8_Status_Current
    ,COALESCE(LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(FINAL_RESULT.Cust_CPF,'-',''),';',''),',',''),'.',''),'/',''),'\',''),'|',''),' ',''))),'') as Cust_CPF
    ,FINAL_RESULT.Cust_All_AcctClosed
    ,FINAL_RESULT.Cust_PershingID
    ,FINAL_RESULT.Cust_Referral_ID
    ,COALESCE(IIF(FINAL_RESULT.AGENCIA IS NOT NULL, CONCAT('1',  RIGHT('00000'+CONVERT(VARCHAR, FINAL_RESULT.AGENCIA), 5), RIGHT('0000000000000'+CAST(FINAL_RESULT.CONTA AS VARCHAR),13)), NULL),'') AS Cust_BradescoAgoraAccount
    ,COALESCE(LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(FINAL_RESULT.Cust_CNPJ,'-',''),';',''),',',''),'.',''),'/',''),'\',''),'|',''),' ',''))),'') as Cust_CNPJ
    ,'' AS Cust_Additional3
    ,'' AS Cust_Additional4
    ,'' AS Cust_Additional5
    ,CONVERT(DATE,GETUTCDATE()) AS created_dt
FROM (
SELECT DISTINCT * FROM (    --INDIVIDUAL CUSTOMERS--
SELECT
     A.CFBRNN
    ,A.[CFCIF__CS]                                                                          AS Cust_CIF
    ,CFCLAS                                                                                 AS Cust_Type -- CLASS CODE
    ,COALESCE(F.BBDID,'')                                                                   AS Cust_BBD_ID
    ,''                                                                                     AS Cust_bbd_rm
    ,CFNA1                                                                                  AS Cust_Name
    ,CASE WHEN COALESCE(D.CUSTOMER_ID,0) = 0 THEN ISNULL(acct_bcp.customer_id, D.CUSTOMER_ID) ELSE D.CUSTOMER_ID END AS cust_q2cust
    ,CASE WHEN COALESCE(D.USER_ID,0) = 0 THEN ISNULL(acct_bcp.user_id, D.USER_ID) ELSE D.USER_ID END AS cust_q2user
    ,CFEML1                                                                                 AS Cust_Q2Login
    ,OriginalCustomerDate                                                                   AS Cust_Create_Date --Transform & To confirm Field
    ,CASE WHEN A. CFINDI = 'Y' THEN COALESCE(C.FFORTIN,'') END                              AS Cust_CPF-- To confirm table and field
    ,COALESCE(B.APP_REF,'')                                                                 AS Cust_Referral_ID
    ,F.AGENCIA                                                                              AS  Agencia
    ,F.CONTA                                                                                AS  Conta
    ,CASE WHEN G.CFCIF IS NULL THEN 'Y' ELSE 'N' END                                        AS Cust_All_AcctClosed
    ,COALESCE(H.JHBDS1,'')                                                                  AS Cust_PershingID
    ,CASE WHEN A. CFINDI = 'N' THEN COALESCE(C.FFORTIN,'') END                              AS Cust_CNPJ
    ,''                                                                                     AS Cust_Additional3
    ,''                                                                                     AS Cust_Additional4
    ,''                                                                                     AS Cust_Additional5
    ,CAST(GETUTCDATE() AS Date) AS created_dt
    ,CASE WHEN A.CFAEDAT < (SELECT POSTD7 FROM {{ref('silver_referencetable_ddpar1')}}) AND A.CFAEDAT <> 0 THEN 'N' ELSE 'Y' END AS Cust_W8_Status_Current
    ,ROW_NUMBER() OVER (PARTITION BY A.CFCIF__CS ORDER BY COALESCE(F.BBDID,''))                                               AS cust_bbd_id_count
FROM  {{ref('silver_customer_cfmast')}}   A
     LEFT JOIN (
                SELECT RESULT.customer_number,MAX(RESULT.APP_REF) AS APP_REF   FROM (
						SELECT Customer_number,APP_REF FROM {{ref('silver_customer_applicant')}}
											WHERE (CUSTOMER_NUMBER IS NOT NULL)
						UNION ALL
						SELECT h.cif as Customer_numbe  ,acct.APP_REF FROM {{ref('silver_customer_acct_holder')}} h
						INNER JOIN {{ref('silver_account_bcp_accounts')}} acct ON h.acct_id = acct.id
						WHERE (CIF IS NOT NULL)
						) RESULT
					GROUP BY RESULT.customer_number
                  ) B
            ON A.[CFCIF__CS] = B.Customer_number
     LEFT JOIN {{ref('silver_referencetable_cforgn')}}    C
            ON A.[CFCIF__CS] = C.[FCIF__CS]
     LEFT JOIN (
                SELECT
                     MAX(B.CUSTOMER_ID) AS CUSTOMER_ID
                    ,MAX(A.USER_ID) as USER_ID,A.PRIMARY_CIF AS PRIMARY_CIF
                FROM {{ref('silver_customer_user_pii_q2')}} A
                    INNER JOIN {{ref('silver_customer_user_q2')}} B
                            ON A.USER_ID = B.[USER_ID]
                           AND B.[ACTIVE_INACTIVE] ='Active'
                WHERE A.PRIMARY_CIF <> ''
                GROUP BY
                        A.PRIMARY_CIF
              ) D ON A.CFCIF__CS = D.PRIMARY_CIF -- EXTRACT DATA FOR Q2 ID
    LEFT  JOIN {{ref('silver_customer_prospect')}}    E
            ON B.APP_REF = E.APP_REF
    LEFT JOIN (
                SELECT
                    RESULT.CFCIF,
                    MAX(RESULT.AGENCIA) AS AGENCIA,
                    MAX(RESULT.CONTA) AS CONTA,
                    MAX(RESULT.BBDID) AS BBDID
                FROM (
                       SELECT
                        [CFCIF__CS] as CFCIF,
                        CASE WHEN USFNAM = 'IN15N1' THEN USFNUM15 END AS AGENCIA,
                        CASE WHEN USFNAM = 'IN15N2' THEN USFNUM15 END AS CONTA,
                        CASE WHEN USFNAM = 'IN10A1' THEN USFVAL END AS BBDID
                       FROM {{ref('silver_referencetable_cfusrflds')}}
                       WHERE USFNAM IN ('IN15N1','IN15N2','IN10A1')
                     ) RESULT
                GROUP BY RESULT.CFCIF
              )F
           ON A.CFCIF__CS = F.CFCIF
     LEFT JOIN (
                SELECT
                    [CFCIF__CS] as CFCIF
                FROM {{ref('silver_account_cfacct')}} A
                INNER JOIN {{ref('silver_customer_active_accounts')}} B
                        ON A.[CFCIF__CS] = B.CIFNO
                GROUP BY [CFCIF__CS]
                )  G
            ON A.[CFCIF__CS] =G.CFCIF
    LEFT JOIN (
                SELECT
                    CIFNO
                    ,MAX(JHBDS1) AS JHBDS1
                FROM {{ref('silver_product_jhmast')}}
                WHERE
                    ACTYPE IN ('U','R')
                GROUP BY CIFNO
              ) H
           ON A.[CFCIF__CS] = H.CIFNO
    LEFT JOIN {{ref('silver_referencetable_sharing_agreement_exception')}} sha
           ON a.[CFCIF__CS]= sha.cif_no
           AND sha.active = 'true' ---exceptions
    LEFT JOIN {{ref('silver_customer_acct_holder')}}   cust_bcp
           ON a.[CFCIF__CS] = cust_bcp.cif
    LEFT JOIN {{ref('silver_account_bcp_accounts')}} acct_bcp
           ON acct_bcp.id = cust_bcp.acct_id
            WHERE (A.CFBRNN in ('60','61','62','64') OR (F.BBDID ='1111133333') OR (F.BBDID <> ''))
        AND sha.cif_no IS NULL --include only customers with sharing agreemment
        ) RESULT
WHERE
    RESULT.cust_bbd_id_count =1
AND RESULT.cust_q2cust > 0
AND RESULT.Cust_Type ='A'
UNION ALL
        --PIC CUSTOMERS--
SELECT DISTINCT * FROM (
SELECT
     A.CFBRNN
    ,A.[CFCIF__CS] AS Cust_CIF
    ,CFCLAS AS Cust_Type -- CLASS CODE
    ,COALESCE(F.BBDID,'') AS Cust_BBD_ID
    ,'' as Cust_bbd_rm
    ,CFNA1 AS Cust_Name
    --CASE WHEN D.cust_q2cust = 0 THEN ISNULL(acct_bcp.customer_id, D.cust_q2cust) ELSE D.cust_q2cust END AS cust_q2cust,-- Should be data from Q2
    --CASE WHEN D.cust_q2user = 0 THEN ISNULL(acct_bcp.user_id, D.cust_q2user) ELSE D.cust_q2user END AS cust_q2user, -- Should be data from Q2
    ,CASE WHEN COALESCE(D.CUSTOMER_ID,0) = 0 THEN ISNULL(acct_bcp.customer_id, D.CUSTOMER_ID) ELSE D.CUSTOMER_ID END AS cust_q2cust
    ,CASE WHEN COALESCE(D.USER_ID,0) = 0 THEN ISNULL(acct_bcp.user_id, D.USER_ID) ELSE D.USER_ID END AS cust_q2user
    ,CFEML1 AS Cust_Q2Login
    ,OriginalCustomerDate AS Cust_Create_Date --Transform & To confirm Field
    ,CASE WHEN A. CFINDI = 'Y' THEN COALESCE(C.FFORTIN,'') END  AS Cust_CPF-- To confirm table and field
    ,COALESCE(B.APP_REF,'') AS Cust_Referral_ID
    ,F.AGENCIA  AS  Agencia
    ,F.CONTA  AS  Conta
    ,CASE WHEN G.CFCIF IS NULL THEN 'Y' ELSE 'N' END AS Cust_All_AcctClosed
    ,COALESCE(H.JHBDS1,'') AS Cust_PershingID
    ,CASE WHEN A. CFINDI = 'N' THEN COALESCE(C.FFORTIN,'') END  AS  Cust_CNPJ
    ,'' AS Cust_Additional3
    ,'' AS Cust_Additional4
    ,'' AS Cust_Additional5
    ,CAST(GETUTCDATE() AS Date) AS created_dt
    ,CASE WHEN A.CFAEDAT< (SELECT POSTD7 FROM {{ref('silver_referencetable_ddpar1')}}  ) AND A.CFAEDAT <> 0 THEN 'N' ELSE 'Y' END AS Cust_W8_Status_Current
    ,ROW_NUMBER() OVER (PARTITION BY A.CFCIF__CS ORDER BY COALESCE(F.BBDID,'')) AS cust_bbd_id_count
FROM {{ref('silver_customer_cfmast')}}   A
    LEFT JOIN (
               SELECT RESULT.customer_number,MAX(RESULT.APP_REF) AS APP_REF   FROM (
						SELECT Customer_number,APP_REF FROM  {{ref('silver_customer_applicant')}}
											WHERE (CUSTOMER_NUMBER IS NOT NULL)
						UNION ALL
						SELECT h.cif as Customer_numbe  ,acct.APP_REF FROM {{ref('silver_customer_acct_holder')}}  h
						INNER JOIN {{ref('silver_account_bcp_accounts')}} acct ON h.acct_id = acct.id
						WHERE (CIF IS NOT NULL)
						) RESULT
					GROUP BY RESULT.customer_number
              ) B
           ON A.[CFCIF__CS] = B.Customer_number
    LEFT JOIN {{ref('silver_referencetable_cforgn')}} C
           ON A.[CFCIF__CS] = C.[FCIF__CS]
    LEFT JOIN (
                SELECT
                     A.CUSTOMER_ID
                    ,MAX(A.GROUP_NAME)  AS GROUP_NAME
                    ,MAX(A.PRIMARY_CIF) AS PRIMARY_CIF
                    ,COUNT(B.USER_ID )  AS '#USER_ID'
                    ,MAX(B.USER_ID)     AS USER_ID
                FROM  {{ref('silver_customer_q2')}} A
                     LEFT JOIN {{ref('silver_customer_user_q2')}}    B
                            ON A.CUSTOMER_ID= B.[CUSTOMER_ID]
                WHERE A.PRIMARY_CIF <> '' AND B.[ACTIVE_INACTIVE] ='Active'
                GROUP BY A.CUSTOMER_ID
                ) D
           ON  A.CFCIF__CS = D.PRIMARY_CIF -- EXTRACT DATA FOR Q2 ID
    LEFT JOIN {{ref('silver_customer_prospect')}}     E
           ON B.APP_REF = E.APP_REF
    LEFT JOIN (
                    SELECT RESULT.CFCIF, MAX(RESULT.AGENCIA)AS AGENCIA, MAX(RESULT.CONTA) AS CONTA, MAX(RESULT.BBDID) AS BBDID FROM (
                        SELECT [CFCIF__CS] as CFCIF,
                        CASE WHEN USFNAM = 'IN15N1' THEN USFNUM15 END AS AGENCIA,
                        CASE WHEN USFNAM = 'IN15N2' THEN USFNUM15 END AS CONTA,
                        CASE WHEN USFNAM = 'IN10A1' THEN USFVAL END AS BBDID
                        FROM {{ref('silver_referencetable_cfusrflds')}}
                        WHERE USFNAM IN ('IN15N1','IN15N2','IN10A1')
                     ) RESULT
                    GROUP BY RESULT.CFCIF
                 )F
            ON A.CFCIF__CS = F.CFCIF
    LEFT JOIN (
                SELECT
                    [CFCIF__CS] as CFCIF
                FROM {{ref('silver_account_cfacct')}}    A
                    INNER JOIN {{ref('silver_customer_active_accounts')}}    B
                            ON A.[CFCIF__CS] = B.CIFNO
                GROUP BY [CFCIF__CS]
                   )  G
            ON A.[CFCIF__CS] =G.CFCIF
    LEFT JOIN (SELECT CIFNO,MAX(JHBDS1) AS JHBDS1  FROM {{ref('silver_product_jhmast')}} WHERE ACTYPE IN ('U','R')GROUP BY CIFNO) H
          ON A.[CFCIF__CS] = H.CIFNO
    LEFT JOIN {{ref('silver_referencetable_sharing_agreement_exception')}} sha
           ON a.[CFCIF__CS]= sha.cif_no
          AND sha.active = 'true' ---exceptions
    LEFT JOIN {{ref('silver_customer_acct_holder')}}   cust_bcp
           ON a.[CFCIF__CS] = cust_bcp.cif
    LEFT JOIN {{ref('silver_account_bcp_accounts')}}    acct_bcp
           ON acct_bcp.id = cust_bcp.acct_id
    WHERE (A.CFBRNN in ('60','61','62','64','65') OR (F.BBDID ='1111133333') OR (F.BBDID <> ''))
    AND sha.cif_no IS NULL --include only customers with sharing agreemment
        ) RESULT
        WHERE RESULT.cust_bbd_id_count =1 AND  RESULT.Cust_Type <>'A'
    ) FINAL_RESULT
),

account_file as (
SELECT
	 ROW_NUMBER() OVER (ORDER BY Acc_Account_Number) AS Acc_RecordID
	,Acc_Account_Number
	,Acc_Account_Type
	,Acc_Account_Status
	,Acc_Company_Code
	,Acc_Branch_Code
	,Acc_Product_Code
	,Acc_Primary_CIF
	,Acc_BBD_CustomerID
	,Acc_Officer_Code
	,Acc_Date_Open
	,Acc_Date_Close
	,Acc_Date_Maturity
	,Acc_Balance
	,Acc_Balance_Date
	,Acc_Revenue_MTD
	,acc_Profitability
	,acc_Referral_Flag
	,Acc_Referral_ID
	,Acc_NonInte_Income
	,Acct_Nome_Gerente_Relacioanamento
	,Acct_Segmento
	,acct_Additional4
	,acct_Additional5
	,AccM_New_Money
	,created_dt
FROM
(
SELECT
	 convert(varchar,RES.CFACC__CS)							 AS Acc_Account_Number
	,RES.CFATYP												 AS Acc_Account_Type
	,SAB.STATUS												 AS Acc_Account_Status
	,CASE
		WHEN RES.CFATYP IN ('U','R') THEN 'BFI'
		WHEN RES.CFATYP IN ('C','D','E','L','T') THEN 'BFB'
		WHEN RES.CFATYP IN ('I') THEN 'IBK'
	 END													 AS Acc_Company_Code
	 ,SAB.BRANCH											 AS Acc_Branch_Code
	 ,SAB.GLPROD											 AS Acc_Product_Code
	 ,SAB.CIFNO												 AS Acc_Primary_CIF
	 ,SRC.USFVAL											 AS Acc_BBD_CustomerID
	 ,SCC.CFOFFR											 AS Acc_Officer_Code
	 ,SAB.Opening_Date										 AS Acc_Date_Open
	 ,SAB.DateClosed										 AS Acc_Date_Close
	 ,SAB.MaturityDate										 AS Acc_Date_Maturity
	 ,SAB.CBAL												 AS Acc_Balance
	 ,(SELECT PostingDate FROM {{ref('silver_referencetable_ddpar1')}} ) AS Acc_Balance_Date
	 ,NULL AS Acc_Revenue_MTD
	 ,NULL AS acc_Profitability
	 ,CASE
		WHEN LEFT(LTRIM(RTRIM(UPPER(SCP.app_ref))), 2) = 'BR' THEN 'Y'
		ELSE 'N'
	  END AS acc_Referral_Flag
	 ,CASE
		WHEN LEFT(LTRIM(RTRIM(UPPER(SCP.app_ref))), 2) = 'BR' THEN SCP.app_ref
		ELSE ''
	  END AS Acc_Referral_ID
	,NULL													AS Acc_NonInte_Income
	,COALESCE(JSON_VALUE(SCP.request_data, '$.relacionamentoBradesco.nomeGerenteRelacioanamento'),'') AS Acct_Nome_Gerente_Relacioanamento --
	,COALESCE(JSON_VALUE(SCP.request_data, '$.relacionamentoBradesco.segmento'),'')											AS Acct_Segmento --
	,''														AS acct_Additional4
	,''														AS acct_Additional5
	-- Remove integration with SNM (silver_account_new_money)
    ,SNM.NEW_MONEY											AS AccM_New_Money
	,(SELECT PostingDate FROM {{ref('silver_referencetable_ddpar1')}} ) AS created_dt
FROM (
SELECT
	 gcf.CUST_CIF
	,sac.CFACC__CS
	,sac.CFATYP
	,gcf.Cust_Referral_ID
FROM customer_file  GCF
	INNER JOIN {{ref('silver_account_cfacct')}}   SAC
			ON gcf.CUST_CIF = sac.CFCIF__CS
		   AND sac.CFRELA in ('P')
		   AND sac.CFATYP IN ('C','D','E','L','R','T','U','S','Q','J','M')
		)RES
	 LEFT JOIN {{ref('silver_all_bradesco_accounts')}}  SAB
			ON RES.CFACC__CS = SAB.ACCOUNT_NUMBER
		   AND RES.CFATYP = SAB.ACTYPE
	LEFT  JOIN {{ref('silver_customer_cfmast')}}   SCC
			ON SAB.CIFNO = SCC.CFCIF__CS
	LEFT  JOIN {{ref('silver_referencetable_cfusrflds')}}   SRC
			ON SAB.CIFNO = SRC.CFCIF__CS
		   AND SRC.USFNAM ='IN10A1'
	LEFT  JOIN {{ref('silver_referencetable_sharing_agreement_exception')}}  SAE
			ON SAB.CIFNO = SAE.cif_no
		   AND SAE.active = '1'
	LEFT JOIN(
				SELECT
					 customer_number
					,MIN(app_ref) AS app_ref
				FROM {{ref('silver_customer_applicant')}}
				WHERE
					LEFT(LTRIM(RTRIM(UPPER(app_ref))), 2) = 'BR'
				GROUP BY
					customer_number
			 ) APP
		    ON RES.Cust_CIF = APP.customer_number
	LEFT  JOIN (select  distinct app_ref, request_data from {{ref('silver_customer_prospect')}}   ) SCP --VERIFICAR PERFORMANCE
			ON  APP.app_ref = SCP.app_ref
	LEFT  JOIN {{ref('silver_account_new_money')}}    SNM
			ON RES.CFACC__CS = SNM.TRACCT
           and CONVERT(date, SNM.LOADED_AT) = CONVERT(date, GETUTCDATE()) -- Adjust to get a current date from silver_account_new_money data because append
-- WHERE
-- 	(SCC.CFSIC6 ='Y' OR  CFCLAS <> 'A')
-- AND SAE.cif_no IS NULL

UNION ALL

SELECT
     BCP.acct_no						AS Acc_Account_Number
	,'I'								AS Acc_Account_Type
    ,'1'								AS Acc_Account_Status
    ,'IBK'								AS Acc_Company_Code
    ,CAST(88 as INT)					AS Acc_Branch_Code
    ,CAST(889 as INT)					AS Acc_Product_Code
	,ACC.cif							AS Acc_Primary_CIF
    ,BCP.bbdid							AS Acc_BBD_CustomerID
    ,'IBK'								AS Acc_Officer_Code
	,BCP.acct_opened_at					AS Acc_Date_Open
	,NULL								AS Acc_Date_Close
	,NULL								AS Acc_Date_Maturity
    ,CAST(BCP.balance as decimal(14,2)) AS Acc_Balance
    ,(SELECT PostingDate FROM {{ref('silver_referencetable_ddpar1')}} ) as Acc_Balance_Date
	,NULL								AS Acc_Revenue_MTD
    ,NULL								AS Acc_Profitability
    ,CASE
		WHEN LEFT(LTRIM(RTRIM(UPPER(BCP.app_ref))), 3) = 'BRK' THEN 'Y'
		ELSE 'N'
	 END AS  Acc_Referral_Flag
	,BCP.app_ref						AS Acc_Referral_ID
	,NULL								AS Acc_NonInte_Income
	,NULL								AS Acct_Nome_Gerente_Relacioanamento
	,NULL								AS Acct_Segmento
    ,NULL								AS acct_Additional4
    ,NULL								AS acct_Additional5
	,NULL								AS AccM_New_Money
	,(SELECT PostingDate FROM {{ref('silver_referencetable_ddpar1')}} ) AS created_dt --
FROM {{ref('silver_account_bcp_accounts')}} BCP
	inner join {{ref('silver_customer_acct_holder')}} ACC
			on bcp.id = acc.acct_id
WHERE
	BCP.acct_status = 'O'
AND ACC.account_relation = 'primary'
AND BCP.transact_status = 'E'

UNION ALL

SELECT DISTINCT
	 aba.ACCOUNT_NUMBER
	,aba.ACTYPE
	,aba.STATUS
	,'APX'													 AS Acc_Company_Code
	,aba.BRANCH
	,aba.GLPROD												 AS Acc_Product_Code
	,aba.CIFNO												 AS Acc_Primary_CIF
	,cmt.source_account_primary_owner						 AS Acc_BBD_CustomerID
	,TRIM(aba.OFFICR)										 AS Acc_Officer_Code
	,aba.Opening_Date										 AS Acc_Date_Open
	,aba.DateClosed											 AS Acc_Date_Close
	,aba.MaturityDate										 AS Acc_Date_Maturity
	,aba.CBAL												 AS Acc_Balance
	,(SELECT PostingDate FROM {{ref('silver_referencetable_ddpar1')}} )	 AS Acc_Balance_Date
	,NULL AS Acc_Revenue_MTD
	,NULL AS acc_Profitability
	,CASE
		WHEN LEFT(LTRIM(RTRIM(UPPER(cmt.app_ref))), 2) = 'BR' THEN 'Y'
		ELSE 'N'
	  END AS acc_Referral_Flag
	,CASE
		WHEN LEFT(LTRIM(RTRIM(UPPER(cmt.app_ref))), 2) = 'BR' THEN cmt.app_ref
		ELSE ''
	  END AS Acc_Referral_ID
	, null													AS Acc_NonInte_Income
	,''														AS Acct_Nome_Gerente_Relacioanamento
	,cmt.market_segment										AS Acct_Segmento
	,''														AS acct_Additional4
	,''														AS acct_Additional5
	,null													AS AccM_New_Money
	,(SELECT PostingDate FROM {{ref('silver_referencetable_ddpar1')}} ) AS created_dt

FROM  {{ref('silver_all_bradesco_accounts')}}  aba
	LEFT  JOIN {{ref('silver_referencetable_cfusrflds')}}  src
			ON aba.CIFNO = src.CFCIF__CS
		  -- AND src.USFNAM ='IN10A1'
	LEFT  JOIN {{ref('silver_customer_cfmast')}}   scc
			ON aba.CIFNO = SCC.CFCIF__CS
	LEFT JOIN cte_mulesoft_tables cmt
		    ON aba.CIFNO = cmt.cif
WHERE
	APP = 'APEX'

UNION ALL

SELECT DISTINCT
	 aba.ACCOUNT_NUMBER 									 AS Acc_Account_Number
	,CASE WHEN aba.Account_Type = 'SEI' THEN 'V'
		ELSE aba.Account_Type
		END												 	 AS Acc_Account_Type
	,aba.Account_Status 									 AS Acc_Account_Status
	,'SEI'													 AS Acc_Company_Code
	,aba.Account_Branch 									 AS Acc_Branch_Code
	,aba.Product_Code 										 AS Acc_Product_Code
	,aba.Customer_Number 									 AS Acc_Primary_CIF
	,cmt.source_account_primary_owner						 AS Acc_BBD_CustomerID
	,TRIM(aba.Officer_Code)								     AS Acc_Officer_Code
	,aba.Opening_Date										 AS Acc_Date_Open
	,aba.Closing_Date 										 AS Acc_Date_Close
	,aba.Maturity_Date 										 AS Acc_Date_Maturity
	,''												 		 AS Acc_Balance
	,(SELECT PostingDate FROM {{ref('silver_referencetable_ddpar1')}} )	 AS Acc_Balance_Date
	,NULL 													 AS Acc_Revenue_MTD
	,NULL 													 AS Acc_Profitability
	,CASE
		WHEN LEFT(LTRIM(RTRIM(UPPER(cmt.app_ref))), 2) = 'BR' THEN 'Y'
		ELSE 'N'
	  END 													 AS Acc_Referral_Flag
	,CASE
		WHEN LEFT(LTRIM(RTRIM(UPPER(cmt.app_ref))), 2) = 'BR' THEN cmt.app_ref
		ELSE ''
	  END 													 AS Acc_Referral_ID
	, null													 AS Acc_NonInte_Income
	,''														 AS Acct_Nome_Gerente_Relacioanamento
	,cmt.market_segment										 AS Acct_Segmento
	,''														 AS Acct_Additional4
	,''														 AS Acct_Additional5
	,null													 AS AccM_New_Money
	,(SELECT PostingDate FROM {{ref('silver_referencetable_ddpar1')}} ) AS created_dt
FROM  {{ref('silver_all_bradesco_accounts_v3')}} aba
	LEFT  JOIN {{ref('silver_referencetable_cfusrflds')}} src
			ON aba.Customer_Number  = src.CFCIF__CS
	LEFT  JOIN {{ref('silver_customer_cfmast')}} scc
			ON aba.Customer_Number = SCC.CFCIF__CS
	LEFT JOIN cte_mulesoft_tables cmt
		    ON aba.Customer_Number = cmt.cif
WHERE
	aba.Account_Type in ('SEI', 'V')
	AND aba.ACCOUNT_NUMBER in (select ACCOUNT_NUMBER from br02_accounts) 
  )FINAL_RESULT
WHERE Acc_Account_Status not in (2,8) or Acc_Account_Status is null -- Rule to ensure on br008 exists only open account
)
,cte_silver_brfile_account_relationship as (
    SELECT
		ROW_NUMBER() OVER (ORDER BY CUST_2.CFACC__CS) AS relate_rec_id,
		convert(varchar,CUST_2.CFACC__CS) as CFACC__CS,
		CUST_2.relate_cif,
		CUST_2.relate_acct_type,
		CUST_2.relate_acct_num,
		CUST_2.relate_relationship_type_code,
		CUST_2.relate_relationship_type_description,
		CUST_2.created_dt,
		CUST_2.loaded_at
	FROM(
		SELECT DISTINCT
			RESULT_CFACCT.CFACC__CS,
			RESULT_CFACCT.CFCIF__CS								 AS relate_cif,
			RESULT_CFACCT.CFATYP								 AS relate_acct_type,
			CAST(RESULT_CFACCT.CFACC__CS AS VARCHAR(16))		 AS relate_acct_num,
			RESULT_CFACCT.CFRELA								 AS relate_relationship_type_code,
			cfp.CP1TXT											 AS relate_relationship_type_description,
			CAST(GETUTCDATE() AS DATE)							 AS created_dt,
			GETUTCDATE()										 AS loaded_at
		FROM customer_file  CUST
			INNER JOIN (
				SELECT
 					a.CFACC__CS,
					CFCIF__CS,
					CFATYP,
					CFRELA
				FROM {{ref('silver_account_cfacct')}}   a
					INNER JOIN account_file b
							on cast(a.CFACC__CS as varchar(16)) = b.[Acc_Account_Number]
				) AS RESULT_CFACCT
				ON CUST.Cust_CIF = RESULT_CFACCT.CFCIF__CS
			INNER JOIN {{ref('bronze_jh_cfpar1')}} cfp
				ON RESULT_CFACCT.CFRELA = cfp.CP1REL
                and CONVERT(date, cfp.LOADED_AT) = CONVERT(date, GETUTCDATE())
			) CUST_2


	UNION ALL

/*Add records from Apex*/
	SELECT
		ROW_NUMBER() OVER (ORDER BY acc_account_number) AS relate_rec_id
	   ,acc_account_number
	   ,CONVERT(VARCHAR,Acc_Primary_CIF)
	   ,Acc_Account_Type
	   ,acc_account_number
	   ,'P'									AS relate_relationship_type_code
	   ,'Primary account owner'				AS relate_relationship_type_description
	   ,CAST(GETUTCDATE() AS DATE)				AS created_dt
	   ,GETUTCDATE()						AS loaded_at
	FROM account_file
	WHERE
		Acc_Company_Code = 'APX'

	UNION ALL 
        SELECT
           ROW_NUMBER() OVER (ORDER BY acc_account_number) AS relate_rec_id
           ,acc_account_number
           ,CONVERT(VARCHAR,Acc_Primary_CIF)
           ,Acc_Account_Type
           ,acc_account_number
           ,arfile.ACCOUNT_RELATIONSHIP                         AS relate_relationship_type_code
           ,rsrm.SWP_ROLE			                            AS relate_relationship_type_description
           ,CAST(GETUTCDATE() AS DATE)                          AS created_dt
           ,GETUTCDATE()                                                AS loaded_at
        FROM account_file af
        INNER JOIN {{ ref('silver_sei_as400_jha_accounts_relationships_file')}} arfile
		ON CAST(arfile.ACCTNO as varchar)= cast(af.acc_account_number as varchar)
		AND cast(arfile.CIFNO as varchar)= cast(af.Acc_Primary_CIF as varchar)
		INNER JOIN {{ ref('silver_referencetable_sei_RelationshipMapping_sei_jha')}} rsrm
		ON cast(rsrm.RELATIONSHIP_CODE as varchar) = cast(arfile.ACCOUNT_RELATIONSHIP as varchar)
        WHERE
              Acc_Company_Code = 'SEI'
              AND (arfile.SEND_ACCOUNT = 1 OR arfile.SEND_RELATIONSHIP = 1)

)
select 
	relate_rec_id
	, relate_cif
	, relate_acct_type
	, relate_relationship_type_code
	, relate_relationship_type_description
	, created_dt
	, loaded_at
	, relate_acct_num
 from cte_silver_brfile_account_relationship