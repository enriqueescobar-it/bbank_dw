-- NAME: SILVER_BRFILE_ACCOUNT
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


WITH  cte_requestJson AS (
SELECT
	 customer_number
	,CASE
		WHEN LEFT(LTRIM(RTRIM(UPPER(app_ref))), 2) = 'BR' THEN  CASE
																	WHEN len(app_ref) > 18 THEN REPLACE(app_ref, SUBSTRING(app_ref, 1, 4), 'BRA')
																	ELSE REPLACE(app_ref, SUBSTRING(app_ref, 1, 3), 'BRA')
																END
		ELSE NULL
	 END AS app_ref
	,Acct_Nome_Gerente_Relacioanamento
	,Acct_Segmento
FROM (
		SELECT
			customer_number
			,app_ref
			,dt_reference_app_date
			,Acct_Nome_Gerente_Relacioanamento
			,Acct_Segmento
			,ROW_NUMBER() over (partition by customer_number order by dt_reference_app_date desc) id
		FROM (
				SELECT
					 B.customer_number
					,A.app_ref
					--,CONVERT(DATE,CONCAT(SUBSTRING(SUBSTRING(A.app_ref, CHARINDEX('-', A.app_ref) + 1, CHARINDEX('-', A.app_ref, CHARINDEX('-', A.app_ref) + 1) - CHARINDEX('-', A.app_ref) - 1),5, 4), '-', SUBSTRING(SUBSTRING(A.app_ref, CHARINDEX('-', A.app_ref) + 1, CHARINDEX('-', A.app_ref, CHARINDEX('-', A.app_ref) + 1) - CHARINDEX('-', A.app_ref) - 1),1, 2),'-', SUBSTRING(SUBSTRING(A.app_ref, CHARINDEX('-', A.app_ref) + 1, CHARINDEX('-', A.app_ref, CHARINDEX('-', A.app_ref) + 1) - CHARINDEX('-', A.app_ref) - 1),3, 2))) AS dt_reference_app_date
					,try_convert(date,convert(varchar,trim(replace(replace(replace(TRIM(CONCAT(SUBSTRING(SUBSTRING(A.app_ref,CHARINDEX('-', A.app_ref) + 1, 8), 5,4), '-', SUBSTRING(SUBSTRING(A.app_ref,CHARINDEX('-', A.app_ref) + 1, 8), 1,2), '-', SUBSTRING(SUBSTRING(A.app_ref,CHARINDEX('-', A.app_ref) + 1, 8), 3,2))),CHAR(10), ''),CHAR(13), '') ,CHAR(9), '')),23)) as dt_reference_app_date
					,request_data
					,COALESCE(JSON_VALUE(request_data, '$.relacionamentoBradesco.nomeGerenteRelacioanamento'),'')  AS Acct_Nome_Gerente_Relacioanamento --
					,COALESCE(JSON_VALUE(request_data, '$.relacionamentoBradesco.segmento'),'')						AS Acct_Segmento --
				FROM {{ ref('silver_customer_applicant') }}  B
					LEFT JOIN {{ ref('silver_customer_prospect') }} A
							on A.app_ref = B.app_ref
				WHERE
					A.app_ref NOT IN ('ARRAY', '')
				 and left(A.app_ref,3) <> 'LAT'
			)A
	)B
where
	id = 1
),
silver_account_br00002 as (
SELECT
	 ROW_NUMBER() OVER (ORDER BY Acc_Account_Number) AS Acc_RecordID
	,Acc_Account_Number
	,Acc_Account_Type
	,convert(int,Acc_Account_Status) as Acc_Account_Status
	,Acc_Company_Code
	,convert(int,Acc_Branch_Code) as Acc_Branch_Code
	,convert(int,Acc_Product_Code) as Acc_Product_Code
	,Acc_Primary_CIF
	,Acc_BBD_CustomerID
	,Acc_Officer_Code
	,cast(FORMAT(Acc_Date_open, 'MMddyyyy') as integer) as Acc_Date_Open
	,cast(FORMAT(Acc_Date_Close, 'MMddyyyy') as integer) as Acc_Date_Close
	,cast(FORMAT(Acc_Date_Maturity, 'MMddyyyy') as integer) as Acc_Date_Maturity
	,Acc_Balance
	,cast(FORMAT(Acc_Balance_Date, 'MMddyyyy') as integer) as Acc_Balance_Date
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
	,GETUTCDATE() LOADED_AT
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
	 ,TRIM(SCC.CFOFFR)										 AS Acc_Officer_Code
	 ,SAB.Opening_Date										 AS Acc_Date_Open
	 ,SAB.DateClosed										 AS Acc_Date_Close
	 ,SAB.MaturityDate										 AS Acc_Date_Maturity
	 ,SAB.CBAL												 AS Acc_Balance
	 ,(SELECT PostingDate FROM {{ ref('silver_referencetable_ddpar1') }}) AS Acc_Balance_Date
	 ,NULL AS Acc_Revenue_MTD
	 ,NULL AS acc_Profitability
	 ,CASE
		WHEN LEFT(LTRIM(RTRIM(UPPER(app.app_ref))), 2) = 'BR' THEN 'Y'
		ELSE 'N'
	  END AS acc_Referral_Flag
	 ,CASE
		WHEN LEFT(LTRIM(RTRIM(UPPER(app.app_ref))), 2) = 'BR' THEN app.app_ref
		ELSE ''
	  END AS Acc_Referral_ID
	,NULL													AS Acc_NonInte_Income
	,app.Acct_Nome_Gerente_Relacioanamento
	,app.Acct_Segmento
	,''														AS acct_Additional4
	,''														AS acct_Additional5
	,SNM.NEW_MONEY											AS AccM_New_Money
	FROM (
		SELECT
	 		gcf.CUST_CIF
			,sac.CFACC__CS
			,sac.CFATYP
			,gcf.Cust_Referral_ID
		FROM {{ ref('silver_brfile_customer') }}  GCF
		INNER JOIN {{ ref('silver_account_cfacct') }} SAC
			ON gcf.CUST_CIF = sac.CFCIF__CS
		   AND sac.CFRELA in ('P')
		   AND sac.CFATYP IN ('C','D','E','L','R','T','U','S','Q','J','M')
		)RES
	 LEFT JOIN {{ ref('silver_all_bradesco_accounts') }} SAB
			ON RES.CFACC__CS = SAB.ACCOUNT_NUMBER
		   AND RES.CFATYP = SAB.ACTYPE
	LEFT  JOIN {{ ref('silver_customer_cfmast') }}   SCC
			ON SAB.CIFNO = SCC.CFCIF__CS
	LEFT  JOIN {{ ref('silver_referencetable_cfusrflds') }}   SRC
			ON SAB.CIFNO = SRC.CFCIF__CS
		   AND SRC.USFNAM ='IN10A1'
	LEFT JOIN cte_requestJson APP
		    ON RES.Cust_CIF = APP.customer_number
	--LEFT  JOIN (select  distinct app_ref, request_data from silver_customer_prospect ) SCP --VERIFICAR PERFORMANCE
	--		ON  APP.app_ref = SCP.app_ref
	LEFT  JOIN (
				SELECT
					 TRACCT
					,LOADED_AT
					,SUM(NEW_MONEY) AS  NEW_MONEY
				FROM {{ ref('silver_account_new_money') }}
				WHERE
					CONVERT(DATE,LOADED_AT) = CONVERT(DATE, GETUTCDATE())
				GROUP BY
					 TRACCT
					,LOADED_AT
				)SNM
			ON RES.CFACC__CS = SNM.TRACCT
		  AND CONVERT(DATE, SNM.LOADED_AT) = CONVERT(DATE, GETUTCDATE())

UNION

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
    ,(SELECT PostingDate FROM {{ ref('silver_referencetable_ddpar1') }} ) as Acc_Balance_Date
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
FROM {{ ref('silver_account_bcp_accounts') }}   BCP
	inner join {{ ref('silver_customer_acct_holder') }}  ACC
			on bcp.id = acc.acct_id
WHERE
	BCP.acct_status = 'O'
AND ACC.account_relation = 'primary'
AND BCP.transact_status = 'E'
	)FINAL_RESULT
)select * from silver_account_br00002