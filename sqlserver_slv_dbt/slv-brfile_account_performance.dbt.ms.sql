-- NAME: SILVER_BRFILE_ACCOUNT_PERFORMANCE
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: GOLD
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: FULL LOAD
-- TYPE: AGGREGATION
-- DATE: June 28, 2024

{{
   config(
		  tags=["Monthly_4BD", "BR00009"]
        )
}}



WITH acc_avg_balance_dt_cte AS (
	SELECT [Date]
		FROM(
			SELECT
				[Date]
				,ROW_NUMBER() Over (ORDER BY [Date] DESC) AS RowNumber
		    FROM
		    	DQP_CONTROL.DBO.BB_PROCESSING_DATES
		    WHERE
		    	CoreProcessDay = 'Y' AND
		    	[Date] LIKE CONCAT((LEFT(CONVERT(VARCHAR, dateadd(MONTH,-1, GETUTCDATE()), 120),8)), '__')
		    ) subquery
		WHERE RowNumber = 1
),

gold_tables AS (

SELECT
		a.Acc_RecordID 										AS account_recordID
    	,a.Acc_Account_Number								AS account_number -- key
		,a.Acc_Date_Maturity								AS account_date_maturity
    	,a.Acc_Account_Type									AS account_type -- key
		,a.Acc_Balance_Date									AS account_current_balance_date
    	,a.Acc_Account_Status								AS account_status
		,a.Acc_Company_Code									AS company_code
		,CASE
			WHEN LEFT(LTRIM(RTRIM(UPPER(b.app_ref))), 2) = 'BR' AND LEFT(LTRIM(RTRIM(UPPER(b.app_ref))),3) != 'BRA'
				THEN REPLACE(b.app_ref, SUBSTRING(b.app_ref, 1, 3), 'BRA')
			WHEN LEFT(LTRIM(RTRIM(UPPER(b.app_ref))), 3) = 'BRA'
				THEN LTRIM(RTRIM(b.app_ref))
			ELSE a.Acc_Referral_ID
		END AS account_referralID
		,CASE
			WHEN LEFT(LTRIM(RTRIM(UPPER(b.app_ref))), 2) = 'BR' THEN 'Y'
			ELSE 'N'
	  	END AS account_referral_flag
		/*,a.Acc_Referral_ID								AS account_referralID*/
		/*,a.acc_Referral_Flag								AS account_referral_flag*/
		,a.Acc_Branch_Code									AS branch_code
		,GETUTCDATE() 										AS account_avg_balance_date
    	,a.Acc_Primary_CIF									AS primary_CIF
    	,a.Acc_Product_Code									AS product_code
    	,c.BBDID											AS BBD_customerID
		,a.Acc_Officer_Code									AS officer_code
		,a.Acc_Date_Close									AS date_close
		,NULL 												AS account_BBD_branch_number
		,a.Acct_Segmento									AS cust_segment
		,c.Cust_CPF											AS cust_cpf
		,c.Cust_CNPJ										AS cust_cnpj
		,a.Acc_Date_Open									AS account_date_open
    	,c.Cust_BradescoAgoraAccount						AS cust_breadesco_agora_account
		,a.Acct_Nome_Gerente_Relacioanamento				AS cust_nome_gerent_relacionamento
		,a.Acc_Balance										AS account_current_balance
		,NULL 												AS account_avg_balance

FROM {{ref('silver_brfile_account')}}  a
LEFT JOIN (
    SELECT app_ref, customer_number
    FROM (
        SELECT
            app_ref,
            customer_number,
            ROW_NUMBER() OVER (PARTITION BY customer_number ORDER BY app_ref) AS rn
        FROM {{ref('silver_customer_applicant')}}
    ) subquery
    WHERE rn = 1
) b ON LTRIM(RTRIM(UPPER(b.customer_number))) = LTRIM(RTRIM(UPPER(a.Acc_Primary_CIF)))

 INNER JOIN (
	SELECT
		CASE WHEN CFINDI = 'Y'
		THEN COALESCE(FFORTIN,'')
		END                              					AS Cust_CPF
		,CASE WHEN CFINDI = 'N'
		THEN COALESCE(FFORTIN,'')
		END                              					AS Cust_CNPJ
		,BradescoAgoraAccount								AS Cust_BradescoAgoraAccount
		,CFCIF__CS
		,BBDID
	FROM {{ref('silver_referencetable_customer_info')}}
	WHERE (CFBRNN in ('60','61','62','64','65') OR (BBDID ='1111133333') OR (BBDID <> ''))
) c ON c.CFCIF__CS = a.acc_primary_cif
	AND CONVERT(DATE, a.loaded_at) = '{{ generate_date_params("EOMLoaded_at") }}'

/*Validacao de ambas as golds para que facam referencia as regras de EOM*/
),





silver_tables AS (
SELECT
	 ISNULL(ii.acct_no,nii.acct_no)			AS acct_no
	,ISNULL(ii.acct_type,nii.acct_type)		AS acct_type
	,ISNULL(nii.non_interest_income, 0.00)	AS non_interest_income																		-- Non Interest Income
	,ISNULL(ii.acct_interest_income, 0.00)	AS Accm_Interest																		 	-- Accm_Interest
	,ISNULL(r.adjusted_ftp_amount, 0.00)	AS FTP																					    -- FTP
	,CAST(ISNULL(r.adjusted_ftp_amount, 0.00) AS MONEY) + CAST(ISNULL(ii.acct_interest_income, 0.00) AS MONEY) AS net_interest_income 	-- Net Interest Income
	,r.total_noninterest_expense			AS non_interest_expense  																	-- Non Interest Expense
	,(CAST(ISNULL(nii.non_interest_income, 0.00) AS MONEY) + (CAST(ISNULL(r.adjusted_ftp_amount, 0.00) AS MONEY) + CAST(ISNULL(ii.acct_interest_income, 0.00) AS MONEY))) AS profitability -- Profitability
	,r.yearmonth

FROM {{ref('silver_product_rdci')}}    r
	LEFT JOIN	(
				  SELECT
					 acct_no
					,acct_type
					,CASE
						WHEN acct_type IN ('D', 'S') THEN 'DD_' +  convert(varchar,acct_no)
						WHEN acct_type = 'L' THEN 'LN_' +  convert(varchar,acct_no)
						WHEN acct_type = 'E' THEN 'DMILN' +  convert(varchar,acct_no)
						WHEN acct_type = 'T' THEN 'CD_' +  convert(varchar,acct_no)
					 END AS parsed_account_no
				  ,non_interest_income
				  FROM {{ref('silver_account_non_interest_income_eom')}}
				  WHERE YEARMONTH = '{{ generate_date_params("ReferenceDateYearMonth") }}'
				) nii
			ON nii.parsed_account_no = r.Instrument_ID

	LEFT JOIN	(
			  SELECT
					 acct_no
					,acct_type
				  	,CASE
						WHEN acct_type IN ('D', 'S') THEN 'DD_' +  convert(varchar,acct_no)
						WHEN acct_type = 'L' THEN 'LN_' +  convert(varchar,acct_no)
						WHEN acct_type = 'E' THEN 'DMILN' +  convert(varchar,acct_no)
						WHEN acct_type = 'T' THEN 'CD_' +  convert(varchar,acct_no)
				  	 END AS parsed_account_no
				  	,acct_interest_amount AS acct_interest_income
				  FROM {{ref('silver_account_interest_income_eom')}}
				  WHERE YEARMONTH = '{{ generate_date_params("ReferenceDateYearMonth") }}'

				) ii
		  ON ii.parsed_account_no = r.Instrument_ID
),

cte_sei_last_business_day AS (
	SELECT TOP 1 process_date AS last_biz_day
	FROM {{ ref('CONTROL_GENERAL_CALENDAR') }}
	WHERE IsLastBusinessDayMonth = 1
	  AND process_date < DATEADD(dd, 1, EOMONTH(GETUTCDATE(), -1))
	ORDER BY process_date DESC
),

cte_sei_account AS (
	SELECT
		 sa.ACCOUNT_NUMBER
		,sa.ACCOUNT_STATUS_CODE
		,sa.ACCOUNT_OPEN_DATE
		,sa.DATE_PORTFOLIO_CLOSED
		,sa.LOADED_AT
		,CAST(cli.EXTERNAL_PARTY_ID AS VARCHAR(50))           AS primary_CIF
		,cal.CLIENT_DSR_EMP_ID_1
		,ROW_NUMBER() OVER (
			PARTITION BY sa.ACCOUNT_NUMBER
			ORDER BY sa.LOADED_AT DESC
		) AS rn
	FROM {{ ref('silver_account_sei_Accounts') }} sa
	INNER JOIN {{ ref('silver_customer_sei_ClientAccountLink') }} cal
		ON sa.ACCOUNT_NUMBER = cal.ACCOUNT_NUMBER
	   AND sa.DATE_OF_DATA = cal.DATE_OF_DATA
	   AND cal.RELATIONSHIP = 'Primary Owner'
	INNER JOIN {{ ref('silver_customer_sei_Clients') }} cli
		ON cal.CLIENT_ID = cli.CLIENT_ID
	   AND cal.DATE_OF_DATA = cli.DATE_OF_DATA
	WHERE sa.ACCOUNT_CLASSIFICATION_NAME = 'Custodian'
	  AND sa.ACCOUNT_OPEN_DATE < DATEADD(day, 1, EOMONTH(GETUTCDATE(), -1))
)

SELECT
	 A.account_recordid					AS acc_record_id
	,A.account_number					AS acc_acct_num
	,A.account_type						AS acc_acct_type_code
	,A.account_status					AS acc_acct_status
	,A.company_code						AS acc_company_code
	,A.branch_code						AS acc_branch_code
	,A.product_code						AS acc_prod_code
	,A.primary_CIF						AS acc_primary_cif
	,A.BBD_customerID					AS acc_bbd_cust_id
	,TRIM(A.officer_code)				AS acc_officer_code
	,A.account_date_open				AS acc_date_open
	,A.date_close						AS acc_date_close
	,a.account_date_maturity			AS acc_date_maturity
	,A.account_current_balance			AS acc_balance
	,A.account_current_balance_date		AS acc_balance_dt
	,E.AVERAGE							AS accm_average_balance
	,(SELECT [Date] FROM acc_avg_balance_dt_cte) AS AccM_Average_Balance_Date
	,D.NNA								AS accm_new_money
	,CASE
		WHEN LTRIM(RTRIM(A.account_type	)) = 'U' then F.accm_revenue_mtd
		ELSE C.revenumtd
	 END AS acc_revenue_mtd --
	,b.profitability					AS acc_profitability
	,a.account_referral_flag			AS acc_referral_flag
	,A.account_referralID				AS acc_referral_id
	,B.non_interest_income				AS acct_noninte_income
	,a.account_BBD_branch_number		AS acc_bbd_branch_number
	,B.Accm_Interest
	,B.FTP								AS accm_FTP
	,B.net_interest_income				AS accm_netinterest_income
	,B.non_interest_expense				AS accm_non_interest_expense
	,A.cust_cpf							AS accm_acc_cpf
	,A.cust_cnpj						AS acctm_cnpj
	,A.cust_breadesco_agora_account		AS acctm_bradesco_agora_acct
	,A.cust_nome_gerent_relacionamento	AS accm_nome_gerente_relacioanamento
	,A.cust_segment						AS accm_segmento
	,B.yearmonth
	,GETUTCDATE() AS LOADED_AT

FROM gold_tables A
		LEFT JOIN silver_tables b
			   ON A.account_number = convert(varchar,B.acct_no)
			  AND A.account_type = B.acct_type
		LEFT JOIN {{ref('silver_account_core_br00009_eom')}}  C
			   ON  A.account_number = convert(varchar,C.acctno)
			  AND A.account_type = C.actype
		LEFT JOIN(
					SELECT
						 account_number
						,Account_Type
						,YEARMONTH
						,SUM(NNA) AS NNA
					FROM {{ref('silver_account_new_nna')}}
					where
					 YEARMONTH = '{{ generate_date_params("ReferenceDateYearMonth") }}'
					GROUP BY
					account_number,  Account_Type, YEARMONTH
				 ) D
			   ON A.account_number = D.account_number
			  --AND A.account_type = D.account_type
		LEFT JOIN (
			SELECT
					CASE
						WHEN LEN(ACCTNO) = 4 AND ACTYPE ='U' THEN CONVERT(VARCHAR, CONVERT(BIGINT, '989' + '00000000000') + CONVERT(BIGINT, ACCTNO))
						WHEN LEFT(ACCTNO, 2) = '11'AND ACTYPE ='U' THEN '989' + RIGHT('00000000000' + SUBSTRING(ACCTNO, 3, LEN(ACCTNO) - 1), 11)
						WHEN LEFT(ACCTNO, 1) = '1' AND ACTYPE ='R' THEN '990' + RIGHT('00000000000' + SUBSTRING(ACCTNO, 2, LEN(ACCTNO) - 1), 11)
						WHEN LEFT(ACCTNO, 1) = '2' AND ACTYPE ='U' THEN '995' + RIGHT('00000000000' + SUBSTRING(ACCTNO, 2, LEN(ACCTNO) - 1), 11)
						WHEN LEFT(ACCTNO, 1) = '3' AND ACTYPE ='R' THEN '996' + RIGHT('00000000000' + SUBSTRING(ACCTNO, 2, LEN(ACCTNO) - 1), 11)
						WHEN LEFT(ACCTNO, 1) = '4' AND ACTYPE ='U' THEN '993' + RIGHT('00000000000' + SUBSTRING(ACCTNO, 2, LEN(ACCTNO) - 1), 11)
						WHEN LEFT(ACCTNO, 1) = '5' AND ACTYPE ='R' THEN '994' + RIGHT('00000000000' + SUBSTRING(ACCTNO, 2, LEN(ACCTNO) - 1), 11)
						WHEN LEFT(ACCTNO, 1) = '6' AND ACTYPE ='U' THEN '991' + RIGHT('00000000000' + SUBSTRING(ACCTNO, 2, LEN(ACCTNO) - 1), 11)
						WHEN LEFT(ACCTNO, 1) = '7' AND ACTYPE ='U' THEN '997' + RIGHT('00000000000' + SUBSTRING(ACCTNO, 2, LEN(ACCTNO) - 1), 11)
						WHEN LEFT(ACCTNO, 1) = '8' AND ACTYPE ='R' THEN '998' + RIGHT('00000000000' + SUBSTRING(ACCTNO, 2, LEN(ACCTNO) - 1), 11)
						WHEN LEFT(ACCTNO, 1) = '9' AND ACTYPE ='R' THEN '992' + RIGHT('00000000000' + SUBSTRING(ACCTNO, 2, LEN(ACCTNO) - 1), 11)
						ELSE ACCTNO
					END AS ACCTNO,
					ACTYPE,
					AVERAGE
			FROM {{ref('silver_account_bfgp0087')}}

			UNION ALL

			SELECT ACCTNO, ACTYPE, AVERAGE FROM {{ref('silver_product_axidmiav')}}
		) E
			ON A.account_number = E.ACCTNO
		   AND A.account_type = E.ACTYPE
		/*LEFT JOIN silver_account_bfgp0087 E
			  ON A.account_number = E.ACCTNO*/
		LEFT JOIN (
					SELECT
					 account_number
					,SUM(amount) AS accm_revenue_mtd
				FROM (
						SELECT
							account_number
							,SUM(amount) as amount
						FROM {{ref('silver_account_trailer_fees')}}
						WHERE  YEARMONTH = '{{ generate_date_params("ReferenceDateYearMonth") }}'
						GROUP BY
							account_number

						UNION ALL

						SELECT
							CASE WHEN LEFT(cap.account_number, 3) = 'T2G' THEN '993'
								WHEN LEFT(cap.account_number, 3) = '3GM' THEN '995'
								WHEN LEFT(cap.account_number, 3) = 'T1M' THEN '997'
								WHEN LEFT(cap.account_number, 3) = '03Z' THEN '991'
								WHEN LEFT(cap.account_number, 3) = 'AKS' THEN '989'
								ELSE cap.account_number
							END + RIGHT('00000000000' + SUBSTRING(account_number, 4, LEN(account_number) - 3), 11)
							,CASE
								WHEN cap.AMOUNT < 0 THEN 0
								ELSE cap.AMOUNT
							END AS AMOUNT
						FROM (
								SELECT
									account_number
									,SUM(total_amt_of_rev_gen_by_tr_and_cred_to_ip) AS amount
								FROM {{ref('silver_account_caps_hist')}}
								WHERE
									as_of_date BETWEEN DATEADD(MONTH, DATEDIFF(MONTH, 0, GETUTCDATE())-1, 0) AND DATEADD(MONTH, DATEDIFF(MONTH, -1, GETUTCDATE())-1, -1)
									AND LEFT(TRADE_REFERENCE_NUMBER,1) <> '#'
								GROUP BY
								account_number
								)cap
					)revenue -- calculate revenueMtd when account_type is U
				GROUP BY
					account_number
				   )F
			ON A.account_number = F.account_number

	UNION ALL

	-- SEI Custodian accounts
	SELECT
		 ROW_NUMBER() OVER (ORDER BY sp.LOADED_AT)                AS acc_record_id
		,sp.ACCOUNT_NUMBER                                        AS acc_acct_num
		,'V'                                                      AS acc_acct_type_code
		,CASE WHEN sp.ACCOUNT_STATUS_CODE IN (1, 2) THEN 1 ELSE 2 END AS acc_acct_status
		,'BFB'                                                    AS acc_company_code
		,99                                                       AS acc_branch_code
		,0                                                        AS acc_prod_code
		,sp.primary_CIF                                           AS acc_primary_cif
		,c_sei.BBDID                                              AS acc_bbd_cust_id
		,COALESCE(CAST(dsr.[officer_code] AS VARCHAR(50)), TRIM(c_sei.CFOFFR)) AS acc_officer_code
		,CAST(FORMAT(sp.ACCOUNT_OPEN_DATE, 'MMddyyyy') AS INT)   AS acc_date_open
		,CAST(FORMAT(sp.DATE_PORTFOLIO_CLOSED, 'MMddyyyy') AS INT) AS acc_date_close
		,NULL                                                     AS acc_date_maturity
		,COALESCE(bal.acc_balance, 0)                             AS acc_balance
		,CAST(REPLACE(CONVERT(CHAR(10), lbd.last_biz_day, 101), '/', '') AS INT) AS acc_balance_dt
		,COALESCE(avg_bal.AccM_Average_Balance, 0)                AS accm_average_balance
		,lbd.last_biz_day                                        AS AccM_Average_Balance_Date
		,COALESCE(sei_nna.NNA, 0)                                 AS accm_new_money
		,COALESCE(rev.acc_revenue_mtd, 0)                         AS acc_revenue_mtd
		,NULL                                                     AS acc_profitability
		,CASE
			WHEN LEFT(LTRIM(RTRIM(UPPER(b_sei.app_ref))), 2) = 'BR' THEN 'Y'
			ELSE 'N'
		 END                                                      AS acc_referral_flag
		,CASE
			WHEN LEFT(LTRIM(RTRIM(UPPER(b_sei.app_ref))), 2) = 'BR' AND LEFT(LTRIM(RTRIM(UPPER(b_sei.app_ref))),3) != 'BRA'
				THEN REPLACE(b_sei.app_ref, SUBSTRING(b_sei.app_ref, 1, 3), 'BRA')
			WHEN LEFT(LTRIM(RTRIM(UPPER(b_sei.app_ref))), 3) = 'BRA'
				THEN LTRIM(RTRIM(b_sei.app_ref))
			ELSE ''
		 END                                                      AS acc_referral_id
		,NULL                                                     AS acct_noninte_income
		,NULL                                                     AS acc_bbd_branch_number
		,NULL                                                     AS Accm_Interest
		,NULL                                                     AS accm_FTP
		,NULL                                                     AS accm_netinterest_income
		,NULL                                                     AS accm_non_interest_expense
		,c_sei.Cust_CPF                                           AS accm_acc_cpf
		,c_sei.Cust_CNPJ                                          AS acctm_cnpj
		,c_sei.Cust_BradescoAgoraAccount                          AS acctm_bradesco_agora_acct
		,COALESCE(JSON_VALUE(scp.request_data, '$.relacionamentoBradesco.nomeGerenteRelacioanamento'), '') AS accm_nome_gerente_relacioanamento
		,COALESCE(JSON_VALUE(scp.request_data, '$.relacionamentoBradesco.segmento'), '') AS accm_segmento
		,CONVERT(INT, LEFT(CONVERT(VARCHAR, DATEADD(MONTH, -1, GETUTCDATE()), 112), 6)) AS yearmonth
		,GETUTCDATE()                                             AS LOADED_AT
	FROM cte_sei_account sp
	CROSS JOIN cte_sei_last_business_day lbd
	INNER JOIN (
		SELECT
			CASE WHEN CFINDI = 'Y' THEN COALESCE(FFORTIN,'') END AS Cust_CPF
			,CASE WHEN CFINDI = 'N' THEN COALESCE(FFORTIN,'') END AS Cust_CNPJ
			,BradescoAgoraAccount                                 AS Cust_BradescoAgoraAccount
			,CFCIF__CS
			,BBDID
			,CFOFFR
		FROM {{ ref('silver_referencetable_customer_info') }}
		WHERE (CFBRNN IN ('60','61','62','64','65') OR (BBDID = '1111133333') OR (BBDID <> ''))
	) c_sei ON c_sei.CFCIF__CS = sp.primary_CIF
	LEFT JOIN (
		SELECT app_ref, customer_number
		FROM (
			SELECT app_ref, customer_number,
				ROW_NUMBER() OVER (PARTITION BY customer_number ORDER BY app_ref) AS rn
			FROM {{ ref('silver_customer_applicant') }}
		) subquery
		WHERE rn = 1
	) b_sei ON LTRIM(RTRIM(UPPER(b_sei.customer_number))) = LTRIM(RTRIM(UPPER(sp.primary_CIF)))
	LEFT JOIN (
		SELECT DISTINCT app_ref, request_data
		FROM {{ ref('silver_customer_prospect') }}
	) scp ON b_sei.app_ref = scp.app_ref
	LEFT JOIN (
		SELECT employee_id, MAX(officer_code) AS officer_code
		FROM {{ source("dsr", "silver_sei_dsr_managers") }}
		GROUP BY employee_id
	) dsr ON sp.CLIENT_DSR_EMP_ID_1 = dsr.[employee_id]
	LEFT JOIN (
		SELECT [Account Number], SUM([Account Balance]) AS acc_balance
		FROM {{ ref('silver_account_acct_history') }}
		WHERE [AsOfDate] = (SELECT last_biz_day FROM cte_sei_last_business_day)
		  AND [Account Type] = 'SEI'
		GROUP BY [Account Number]
	) bal ON sp.ACCOUNT_NUMBER = bal.[Account Number]
	LEFT JOIN (
		SELECT account_number, monthly_avg_balance AS AccM_Average_Balance
		FROM {{ ref('silver_account_average_balance_mtd') }}
		WHERE yearmonth = '{{ generate_date_params("ReferenceDateYearMonth") }}'
		  AND account_type = 'SEI'
	) avg_bal ON sp.ACCOUNT_NUMBER = avg_bal.account_number
	LEFT JOIN (
		SELECT account_number, SUM(NNA) AS NNA
		FROM {{ ref('silver_account_new_nna') }}
		WHERE Account_Type = 'SEI'
		  AND YEARMONTH = '{{ generate_date_params("ReferenceDateYearMonth") }}'
		GROUP BY account_number
	) sei_nna ON sp.ACCOUNT_NUMBER = sei_nna.account_number
	LEFT JOIN (
		SELECT account_number, SUM(Trade_Revenue) AS acc_revenue_mtd
		FROM {{ ref('silver_account_sei_trading_revenue') }} 
		WHERE DATE_OF_DATA BETWEEN '{{ generate_date_params("StartDate") }}' AND '{{ generate_date_params("EndDate") }}'
		GROUP BY account_number
	) rev ON sp.ACCOUNT_NUMBER = rev.account_number
	WHERE sp.rn = 1