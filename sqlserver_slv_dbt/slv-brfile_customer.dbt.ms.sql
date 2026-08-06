-- NAME: SILVER_BRFILE_CUSTOMER
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

WITH table_result as (
SELECT
     ROW_NUMBER() OVER (ORDER BY FINAL_RESULT.CUST_CIF) AS Cust_RecordID
    ,FINAL_RESULT.Cust_CIF
    ,FINAL_RESULT.Cust_Type
    ,FINAL_RESULT.Cust_BBD_ID
    ,FINAL_RESULT.Cust_BBD_RM
    ,trim(FINAL_RESULT.Cust_Name) as Cust_Name
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
    ,GETUTCDATE() AS LOADED_AT
FROM (
SELECT DISTINCT * FROM (    --INDIVIDUAL CUSTOMERS--
SELECT
     A.CFBRNN
    ,A.[CFCIF__CS]                                                                          AS Cust_CIF
    ,CFCLAS                                                                                 AS Cust_Type -- CLASS CODE
    ,COALESCE(F.BBDID,'')                                                                   AS Cust_BBD_ID
    ,''                                                                                     AS Cust_bbd_rm
    ,CFNA1                                                                                  AS Cust_Name
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
    ,CASE WHEN A.CFAEDAT < (SELECT POSTD7 FROM {{ ref('silver_referencetable_ddpar1') }}  ) AND A.CFAEDAT <> 0 THEN 'N' ELSE 'Y' END AS Cust_W8_Status_Current
    ,ROW_NUMBER() OVER (PARTITION BY A.CFCIF__CS ORDER BY COALESCE(F.BBDID,''))                                               AS cust_bbd_id_count
FROM  {{ ref('silver_customer_cfmast') }} A
     LEFT JOIN (
                SELECT
						Customer_number
						,app_ref
				FROM (
							SELECT DISTINCT
								Customer_number
								,CASE
									WHEN LEFT(LTRIM(RTRIM(UPPER(app_ref))), 2) = 'BR' THEN  CASE
																								WHEN len(app_ref) > 18 THEN REPLACE(app_ref, SUBSTRING(app_ref, 1, 4), 'BRA')
																								ELSE REPLACE(app_ref, SUBSTRING(app_ref, 1, 3), 'BRA')
																							END
									ELSE NULL
								 END AS app_ref
							FROM  {{ ref('silver_customer_applicant') }}
						)app
				WHERE
					app_ref IS NOT NULL

				UNION ALL

				SELECT
					h.cif as Customer_numbe ,
					acct.APP_REF
					FROM {{ ref('silver_customer_acct_holder') }}  h
				INNER JOIN {{ ref('silver_account_bcp_accounts') }}   acct
						ON h.acct_id = acct.id
                  ) B
            ON A.[CFCIF__CS] = B.Customer_number
     LEFT JOIN {{ ref('silver_referencetable_cforgn') }}  C
            ON A.[CFCIF__CS] = C.[FCIF__CS]
    LEFT  JOIN {{ ref('silver_customer_prospect') }}  E
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
                       FROM {{ ref('silver_referencetable_cfusrflds') }}
                       WHERE USFNAM IN ('IN15N1','IN15N2','IN10A1')
                     ) RESULT
                GROUP BY RESULT.CFCIF
              )F
           ON A.CFCIF__CS = F.CFCIF
     LEFT JOIN (
                SELECT
                    [CFCIF__CS] as CFCIF
                FROM {{ ref('silver_account_cfacct') }}  A
                INNER JOIN {{ ref('silver_customer_active_accounts') }}  B
                        ON A.[CFCIF__CS] = B.CIFNO
                GROUP BY [CFCIF__CS]
                )  G
            ON A.[CFCIF__CS] =G.CFCIF
    LEFT JOIN (
                SELECT
                    CIFNO
                    ,MAX(JHBDS1) AS JHBDS1
                FROM {{ ref('silver_product_jhmast') }}
                WHERE
                    ACTYPE IN ('U','R')
                GROUP BY CIFNO
              ) H
           ON A.[CFCIF__CS] = H.CIFNO
    LEFT JOIN {{ ref('silver_customer_acct_holder') }}   cust_bcp
           ON a.[CFCIF__CS] = cust_bcp.cif
    LEFT JOIN {{ ref('silver_account_bcp_accounts') }}   acct_bcp
           ON acct_bcp.id = cust_bcp.acct_id
            WHERE (A.CFBRNN in ('60','61','62','64','65') OR (F.BBDID ='1111133333') OR (F.BBDID <> ''))

        ) RESULT
WHERE
    RESULT.cust_bbd_id_count =1
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
    ,CASE WHEN A.CFAEDAT< (SELECT POSTD7 FROM  {{ ref('silver_referencetable_ddpar1') }}  ) AND A.CFAEDAT <> 0 THEN 'N' ELSE 'Y' END AS Cust_W8_Status_Current
    ,ROW_NUMBER() OVER (PARTITION BY A.CFCIF__CS ORDER BY COALESCE(F.BBDID,'')) AS cust_bbd_id_count
FROM {{ ref('silver_customer_cfmast') }}  A
    LEFT JOIN (
               SELECT
						Customer_number
						,app_ref
				FROM (
							SELECT DISTINCT
								Customer_number
								,CASE
									WHEN LEFT(LTRIM(RTRIM(UPPER(app_ref))), 2) = 'BR' THEN  CASE
																								WHEN len(app_ref) > 18 THEN REPLACE(app_ref, SUBSTRING(app_ref, 1, 4), 'BRA')
																								ELSE REPLACE(app_ref, SUBSTRING(app_ref, 1, 3), 'BRA')
																							END
									ELSE NULL
								 END AS app_ref
							FROM {{ ref('silver_customer_applicant') }}
						)app
				WHERE
					app_ref IS NOT NULL

				UNION ALL

				SELECT
					h.cif as Customer_numbe ,
					acct.APP_REF
					FROM {{ ref('silver_customer_acct_holder') }}    h
				INNER JOIN {{ ref('silver_account_bcp_accounts') }}   acct
						ON h.acct_id = acct.id
              ) B
           ON A.[CFCIF__CS] = B.Customer_number
    LEFT JOIN {{ ref('silver_referencetable_cforgn') }}  C
           ON A.[CFCIF__CS] = C.[FCIF__CS]
    LEFT JOIN {{ ref('silver_customer_prospect') }}   E
           ON B.APP_REF = E.APP_REF
    LEFT JOIN (
                    SELECT RESULT.CFCIF, MAX(RESULT.AGENCIA)AS AGENCIA, MAX(RESULT.CONTA) AS CONTA, MAX(RESULT.BBDID) AS BBDID FROM (
                        SELECT [CFCIF__CS] as CFCIF,
                        CASE WHEN USFNAM = 'IN15N1' THEN USFNUM15 END AS AGENCIA,
                        CASE WHEN USFNAM = 'IN15N2' THEN USFNUM15 END AS CONTA,
                        CASE WHEN USFNAM = 'IN10A1' THEN USFVAL END AS BBDID
                        FROM {{ ref('silver_referencetable_cfusrflds') }}
                        WHERE USFNAM IN ('IN15N1','IN15N2','IN10A1')
                     ) RESULT
                    GROUP BY RESULT.CFCIF
                 )F
            ON A.CFCIF__CS = F.CFCIF
    LEFT JOIN (
                SELECT
                    [CFCIF__CS] as CFCIF
                FROM {{ ref('silver_account_cfacct') }}   A
                    INNER JOIN {{ ref('silver_customer_active_accounts') }}   B
                            ON A.[CFCIF__CS] = B.CIFNO
                GROUP BY [CFCIF__CS]
                   )  G
            ON A.[CFCIF__CS] =G.CFCIF
    LEFT JOIN (SELECT CIFNO,MAX(JHBDS1) AS JHBDS1  FROM {{ ref('silver_product_jhmast') }}   WHERE ACTYPE IN ('U','R')GROUP BY CIFNO) H
          ON A.[CFCIF__CS] = H.CIFNO
    LEFT JOIN {{ ref('silver_customer_acct_holder') }}  cust_bcp
           ON a.[CFCIF__CS] = cust_bcp.cif
    LEFT JOIN {{ ref('silver_account_bcp_accounts') }}   acct_bcp
           ON acct_bcp.id = cust_bcp.acct_id
    WHERE (A.CFBRNN in ('60','61','62','64','65') OR (F.BBDID ='1111133333') OR (F.BBDID <> ''))
        ) RESULT
        WHERE RESULT.cust_bbd_id_count =1 AND  RESULT.Cust_Type <>'A'
    ) FINAL_RESULT
)SELECT
	 Cust_RecordID
	,Cust_CIF
	,Cust_Type
	,Cust_BBD_ID
	,Cust_BBD_RM
	,Cust_Name
	,Cust_Q2Login
	,Cust_Created_Date
	,Cust_ID_Status_Valid
	,Cust_W8_Status_Current
	,CASE
        WHEN Cust_CPF LIKE '%[^0-9]%' THEN ''
        ELSE Cust_CPF
     END AS Cust_CPF
	,Cust_All_AcctClosed
	,Cust_PershingID
	,Cust_Referral_ID
	,Cust_BradescoAgoraAccount
	,CASE
        WHEN Cust_CNPJ LIKE '%[^0-9]%' THEN ''
        ELSE Cust_CNPJ
     END AS Cust_CNPJ
	,Cust_Additional3
	,Cust_Additional4
	,Cust_Additional5
	,loaded_at
FROM table_result