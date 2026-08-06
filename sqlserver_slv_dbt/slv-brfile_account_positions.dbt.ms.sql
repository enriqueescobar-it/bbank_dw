-- NAME: SILVER_BRFILE_ACCOUNT_POSITIONS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: silver
-- FREQUENCY: DAYLI
-- LOAD TYPE: FULL LOAD
-- TYPE: AGGREGATION
-- DATE: January 17, 2025

{{
   config(
          tags=["aggregation_standard"]
        )
}}


WITH cte_account_day as (
SELECT DISTINCT
	 acc_primary_cif
	,Acc_Account_Number
	,Acc_Account_Type
	,Acc_Account_Status
	,Acc_Product_Code
	,Acc_Date_Open
	,Acc_Balance
	,Acc_Date_Maturity
FROM  {{ ref('gold_brfile_account') }} gaf
WHERE
	acc_primary_cif IN (SELECT CFCIF__CS FROM {{ ref('silver_customer_cfmast') }}  )
),

cte_account_file_accf as (
SELECT
	 gaf.Acc_Account_Number
	,sra.*
FROM  {{ ref('gold_brfile_account') }} gaf
	INNER JOIN {{ ref('silver_referencetable_accf') }} sra
			ON SUBSTRING(Acc_Account_Number,9,6) = SUBSTRING(sra.ACCTNUMBER, 4, 6)
),

cte_cfusrflds as (
SELECT
	 CFCIF__CS
	,MAX(AGENCIA) AS agencia
	,MAX(CONTA)   AS contaCorrente
FROM(
	 SELECT
	 	 CFCIF__CS
	 	,CASE WHEN USFNAM ='IN15N1' THEN USFNUM15 END AGENCIA
	 	,CASE WHEN USFNAM ='IN15N2' THEN USFNUM15 END  CONTA
	 FROM {{ ref('silver_referencetable_cfusrflds') }}
	 WHERE
	 	USFNAM IN ('IN15N1','IN15N2')
	)result
GROUP BY
	CFCIF__CS
),
sei_custodian_accounts as (
	SELECT DISTINCT
		 ACCOUNT_NUMBER
		,DATE_OF_DATA
		,ACCOUNT_STATUS_CODE
		,ACCOUNT_OPEN_DATE
		,DATE_PORTFOLIO_CLOSED
		,ACCOUNT_CLASSIFICATION_NAME
	FROM {{ ref('silver_account_sei_Accounts')}}
	WHERE ACCOUNT_CLASSIFICATION_NAME = 'Custodian'
),
sei_assets as (
	SELECT DISTINCT
		 INSTRUMENT_ID
		,DATE_OF_DATA
		,ASSET_TYPE
		,ASSET_NAME
		,ISIN
		,CUSIP
		,INTEREST_RATE
		,COUPON_RATE
		,MATURITY_DATE
	FROM {{ ref('silver_product_sei_Assets')}}
),

cte_silver_brfile_account_positions as(
-- pershing investment accounts

    SELECT
	 A.Acc_Primary_CIF				AS [CUSTOMER NUMBER]
	,A.Acc_Account_Number			AS ACCTNUMBER
	,ISNULL(cfu.agencia,0)			AS [BRAZIL BRANCH]
	,ISNULL(cfu.contaCorrente,0)	AS [BRAZIL ACCOUNT]
	,G.CUSIP_NUMBER					AS [PORTFOLIO NUMBER]
	,A.Acc_Product_Code				AS [PRODUCT CODE]
	,CASE
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 1 THEN TRIM(G.SECURITY_DESC_LINE_1)
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 2 THEN CONCAT(TRIM(G.SECURITY_DESC_LINE_1), ' ', TRIM(G.SECURITY_DESC_LINE_2))
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 3 THEN CONCAT(TRIM(G.SECURITY_DESC_LINE_1), ' ' ,TRIM(G.SECURITY_DESC_LINE_2), ' ',TRIM(G.SECURITY_DESC_LINE_3))
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 4 THEN CONCAT(TRIM(G.SECURITY_DESC_LINE_1), ' ' ,TRIM(G.SECURITY_DESC_LINE_2), ' ',TRIM(G.SECURITY_DESC_LINE_3), ' ', TRIM(G.SECURITY_DESC_LINE_4))
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 5 THEN CONCAT(TRIM(G.SECURITY_DESC_LINE_1), ' ' ,TRIM(G.SECURITY_DESC_LINE_2), ' ',TRIM(G.SECURITY_DESC_LINE_3), ' ', TRIM(G.SECURITY_DESC_LINE_4), ' ' ,TRIM(G.SECURITY_DESC_LINE_5))
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 6 THEN CONCAT(TRIM(G.SECURITY_DESC_LINE_1), ' ' ,TRIM(G.SECURITY_DESC_LINE_2), ' ',TRIM(G.SECURITY_DESC_LINE_3), ' ', TRIM(G.SECURITY_DESC_LINE_4), ' ' ,TRIM(G.SECURITY_DESC_LINE_5), ' ', TRIM(G.SECURITY_DESC_LINE_6))
	 END							AS [DESCRIPTION]
	,0								AS [REFERENCE ID]
	,SUBSTRING(irg.ISIN_CODE,3,9)	AS [ISIN]
	,CASE														/*After make a task to improve this rule in the case*/
		WHEN irg.ASSET_TYPE = 'CURRENCY'THEN 'NOW'
		WHEN irg.ASSET_TYPE = 'MUTFUND' THEN 'MUT'
		WHEN irg.ASSET_TYPE = 'EQUITY'  THEN 'EQT'
		WHEN irg.ASSET_TYPE = 'LIMPART' THEN 'ALT'
		WHEN irg.ASSET_TYPE = 'EQUITY'  AND ASSET_SUBTYPE = 'MFCLOSE' THEN 'MUT'
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND irg.ASSET_SUBTYPE = 'CB' AND irg.ASSET_SUB_SUBTYPE = 'INDLKCRP' THEN 'STR'
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND irg.ASSET_SUB_SUBTYPE = 'INDLKMTN' THEN 'STR'
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND irg.ASSET_SUB_SUBTYPE = 'INDLKCRP' THEN 'STR'
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND  irg.ASSET_SUBTYPE = 'MEDTRMNT' AND G.SECURITY_DESC_LINE_1 LIKE '%bradesco%' THEN 'STR' /* Fixed Income (FI)*/
		WHEN irg.ASSET_TYPE = 'CORPDEBT' THEN 'FIX'
		WHEN irg.ASSET_TYPE = 'GOVTSEC'  AND irg.ASSET_SUBTYPE = 'FGNGOVT' THEN 'FIX'
		WHEN irg.ASSET_TYPE = 'GOVTSEC'  AND irg.ASSET_SUBTYPE = 'DIRUSGVT' THEN 'FIX'
		WHEN irg.ASSET_TYPE = 'MUNIDEBT' AND irg.ASSET_SUBTYPE = 'MNCPN' THEN 'FIX'
		WHEN irg.ASSET_TYPE = 'MONEYMKT' AND irg.ASSET_SUBTYPE = 'CERTDEPT' AND irg.ASSET_SUB_SUBTYPE = 'CDCPN' THEN 'FIX'
		WHEN irg.ASSET_TYPE = 'OPTION'   AND irg.ASSET_SUBTYPE = 'OPTEQTY' THEN 'EQT'
		ELSE 'MIS'
	  END											AS [ACCOUNT TYPE]
	 ,G.ISSUE_CURRENCY								AS [CCY]
	 ,0												AS [FACEVAL]
	 ,G.SETTLEMENT_DATE_QTY							AS [QUANTITY]
	 ,0												AS [% INTERESR RATE]
	 ,0												AS [PURCHASE PRICE]
	 ,irj.LATEST_PRICE								AS [MARKET PRICE]
	 ,A.Acc_Account_Status							AS [STATUS]
	 ,A.acc_date_open								AS [OPENING DATE]
	 ,CASE
		WHEN g.EXPIRATION_MATURITY_DATE <> '0' THEN CONCAT(SUBSTRING(g.EXPIRATION_MATURITY_DATE, 5, 2), SUBSTRING(g.EXPIRATION_MATURITY_DATE, 7, 2), SUBSTRING(g.EXPIRATION_MATURITY_DATE, 1, 4))
		ELSE '00000000'
	  END											AS [MATURITY DATE]
	 ,0												AS [ORIGINAL AMOUNT]
	 ,CASE																/*After make a task to improve this rule in the case*/
		WHEN irg.ASSET_TYPE = 'CURRENCY' THEN G.SETTLEMENT_DATE_QTY
		WHEN irg.ASSET_TYPE = 'MUNIDEBT' AND irg.ASSET_SUBTYPE = 'MNCPN' THEN G.SETTLEMENT_DATE_QTY * (irj.LATEST_PRICE / 100) /*STR--*/
		WHEN irg.ASSET_TYPE = 'MUTFUND' THEN G.SETTLEMENT_DATE_QTY * irj.LATEST_PRICE
		WHEN irg.ASSET_TYPE = 'EQUITY' AND ASSET_SUBTYPE = 'MFCLOSE' THEN G.SETTLEMENT_DATE_QTY * irj.LATEST_PRICE /*EQ--*/
		WHEN irg.ASSET_TYPE = 'OPTION' AND irg.ASSET_SUBTYPE = 'OPTEQTY' THEN G.SETTLEMENT_DATE_QTY * irj.LATEST_PRICE
		WHEN irg.ASSET_TYPE = 'EQUITY' THEN G.SETTLEMENT_DATE_QTY * irj.LATEST_PRICE
		WHEN irg.ASSET_TYPE = 'LIMPART' THEN G.SETTLEMENT_DATE_QTY * irj.LATEST_PRICE
		WHEN irg.ASSET_TYPE = 'GOVTSEC' AND irg.ASSET_SUBTYPE = 'FGNGOVT' THEN G.SETTLEMENT_DATE_QTY * (irj.LATEST_PRICE / 100)
		WHEN irg.ASSET_TYPE = 'GOVTSEC' AND irg.ASSET_SUBTYPE = 'DIRUSGVT' THEN G.SETTLEMENT_DATE_QTY * (irj.LATEST_PRICE / 100)
		WHEN irg.ASSET_TYPE = 'CORPDEBT' THEN G.SETTLEMENT_DATE_QTY * (irj.LATEST_PRICE / 100)
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND irg.ASSET_SUB_SUBTYPE = 'INDLKMTN' THEN G.SETTLEMENT_DATE_QTY * (irj.LATEST_PRICE / 100)
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND irg.ASSET_SUB_SUBTYPE = 'INDLKCRP' THEN G.SETTLEMENT_DATE_QTY * (irj.LATEST_PRICE / 100)
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND irg.ASSET_SUBTYPE = 'CB' AND irg.ASSET_SUB_SUBTYPE = 'INDLKCRP' THEN G.SETTLEMENT_DATE_QTY * (irj.LATEST_PRICE / 100)
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND irg.ASSET_SUBTYPE = 'MEDTRMNT' AND G.SECURITY_DESC_LINE_1 LIKE '%bradesco%' THEN G.SETTLEMENT_DATE_QTY * (irj.LATEST_PRICE / 100)
	 END											  AS [POSITION VALUE]
	,G.SETTLEMENT_DATE_LIQUIDATING_VALUE			  AS [VALUATION BALANCE]
	,G.EXCHANGE_RATE								  AS [FX RATE]
	,grb.ACCRUED_INTEREST_VALUE_FROM_LAST_PAYABLE	  AS [ACCRUED INTEREST] --  -- VERIRY COLUMN
	,REPLACE(
	    CONVERT(
	        VARCHAR,
	        CASE
	            WHEN DATENAME(WEEKDAY, GETUTCDATE()) = 'Monday'
	                THEN DATEADD(DAY, -3, GETUTCDATE())
	            ELSE DATEADD(DAY, -1, GETUTCDATE())
	        END,
	        101
	    ),
	    '/',
	    ''
	) AS [REFERENCE DATE]
	,GETUTCDATE()									  AS [CREATION REPORT DATE]

FROM cte_account_day A
	INNER JOIN {{source("account", "bronze_referencetable_account_type_code") }}  atc
			ON A.Acc_Account_Type = atc.acct_type_code
	INNER JOIN cte_account_file_accf B
			ON A.Acc_Account_Number = B.Acc_Account_Number
	INNER JOIN {{ ref('silver_account_gcus_rec_a') }}    G
			ON SUBSTRING(B.ACCTNUMBER, 4, 6) = SUBSTRING(LEFT(G.ACCOUNT_NUMBER,9) , 4, 6)
	LEFT  JOIN {{ ref('silver_account_gcus_rec_b') }}   grb
			ON G.ACCOUNT_NUMBER = grb.ACCOUNT_NUMBER
		   AND G.cusip_number = grb.cusip_number
	LEFT  JOIN {{ ref('silver_account_isca_rec_b') }} irb
			ON G.CUSIP_NUMBER = irb.CUSIP_NUMBER
	LEFT  JOIN {{ ref('silver_account_isca_rec_j') }} irj
			ON G.CUSIP_NUMBER = irj.CUSIP_NUMBER
	LEFT  JOIN {{ ref('silver_account_isca_rec_g') }} irg
			ON G.CUSIP_NUMBER = irg.CUSIP_NUMBER
	LEFT  JOIN cte_cfusrflds cfu
		    ON A.acc_primary_cif = cfu.CFCIF__CS
	LEFT  JOIN {{ ref('gold_brfile_customer') }} gcf
		    ON a.acc_primary_cif = gcf.Cust_CIF
	LEFT  JOIN {{ ref('silver_referencetable_sharing_agreement_exception') }} sae
		    ON A.acc_primary_cif = sae.cif_no
		   AND sae.active = 'true'
WHERE
	A.Acc_Account_Type IN ('U')
AND A.Acc_Account_Status NOT IN (2, 8)
AND G.CUSIP_NUMBER NOT LIKE '%999997%'
AND sae.cif_no IS NULL



UNION ALL


-- PERSING CASH ACCOUNT
SELECT DISTINCT
	 A.Acc_Primary_CIF				AS [CUSTOMER NUMBER]
	,A.Acc_Account_Number			AS ACCTNUMBER
	,ISNULL(cfu.agencia,0)			AS [BRAZIL BRANCH]
	,ISNULL(cfu.contaCorrente,0)	AS [BRAZIL ACCOUNT]
	,G.CUSIP_NUMBER					AS [PORTFOLIO NUMBER]
	,A.Acc_Product_Code				AS [PRODUCT CODE]
	,CASE
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 1 THEN TRIM(G.SECURITY_DESC_LINE_1)
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 2 THEN CONCAT(TRIM(G.SECURITY_DESC_LINE_1), ' ', TRIM(G.SECURITY_DESC_LINE_2))
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 3 THEN CONCAT(TRIM(G.SECURITY_DESC_LINE_1), ' ' ,TRIM(G.SECURITY_DESC_LINE_2), ' ',TRIM(G.SECURITY_DESC_LINE_3))
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 4 THEN CONCAT(TRIM(G.SECURITY_DESC_LINE_1), ' ' ,TRIM(G.SECURITY_DESC_LINE_2), ' ',TRIM(G.SECURITY_DESC_LINE_3), ' ', TRIM(G.SECURITY_DESC_LINE_4))
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 5 THEN CONCAT(TRIM(G.SECURITY_DESC_LINE_1), ' ' ,TRIM(G.SECURITY_DESC_LINE_2), ' ',TRIM(G.SECURITY_DESC_LINE_3), ' ', TRIM(G.SECURITY_DESC_LINE_4), ' ' ,TRIM(G.SECURITY_DESC_LINE_5))
		WHEN G.NUMBER_OF_SECURITY_DESC_LINES = 6 THEN CONCAT(TRIM(G.SECURITY_DESC_LINE_1), ' ' ,TRIM(G.SECURITY_DESC_LINE_2), ' ',TRIM(G.SECURITY_DESC_LINE_3), ' ', TRIM(G.SECURITY_DESC_LINE_4), ' ' ,TRIM(G.SECURITY_DESC_LINE_5), ' ', TRIM(G.SECURITY_DESC_LINE_6))
	 END							AS [DESCRIPTION]
	,0								AS [REFERENCE ID]
	,SUBSTRING(irg.ISIN_CODE,3,9)	AS [ISIN]
	,CASE														/*After make a task to improve this rule in the case*/
		WHEN irg.ASSET_TYPE = 'CURRENCY'THEN 'NOW'
		WHEN irg.ASSET_TYPE = 'MUTFUND' THEN 'MUT'
		WHEN irg.ASSET_TYPE = 'EQUITY'  THEN 'EQT'
		WHEN irg.ASSET_TYPE = 'LIMPART' THEN 'ALT'
		WHEN irg.ASSET_TYPE = 'EQUITY'  AND ASSET_SUBTYPE = 'MFCLOSE' THEN 'MUT'
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND irg.ASSET_SUBTYPE = 'CB' AND irg.ASSET_SUB_SUBTYPE = 'INDLKCRP' THEN 'STR'
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND irg.ASSET_SUB_SUBTYPE = 'INDLKMTN' THEN 'STR'
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND irg.ASSET_SUB_SUBTYPE = 'INDLKCRP' THEN 'STR'
		WHEN irg.ASSET_TYPE = 'CORPDEBT' AND  irg.ASSET_SUBTYPE = 'MEDTRMNT' AND G.SECURITY_DESC_LINE_1 LIKE '%bradesco%' THEN 'STR' /* Fixed Income (FI)*/
		WHEN irg.ASSET_TYPE = 'CORPDEBT' THEN 'FIX'
		WHEN irg.ASSET_TYPE = 'GOVTSEC'  AND irg.ASSET_SUBTYPE = 'FGNGOVT' THEN 'FIX'
		WHEN irg.ASSET_TYPE = 'GOVTSEC'  AND irg.ASSET_SUBTYPE = 'DIRUSGVT' THEN 'FIX'
		WHEN irg.ASSET_TYPE = 'MUNIDEBT' AND irg.ASSET_SUBTYPE = 'MNCPN' THEN 'FIX'
		WHEN irg.ASSET_TYPE = 'MONEYMKT' AND irg.ASSET_SUBTYPE = 'CERTDEPT' AND irg.ASSET_SUB_SUBTYPE = 'CDCPN' THEN 'FIX'
		WHEN irg.ASSET_TYPE = 'OPTION'   AND irg.ASSET_SUBTYPE = 'OPTEQTY' THEN 'EQT'
		ELSE 'MIS'
	  END											AS [ACCOUNT TYPE]
	 ,G.ISSUE_CURRENCY								AS [CCY]
	 ,0												AS [FACEVAL]
	 ,G.SETTLEMENT_DATE_QTY							AS [QUANTITY]
	 ,0												AS [% INTERESR RATE]
	 ,0												AS [PURCHASE PRICE]
	 ,irj.LATEST_PRICE								AS [MARKET PRICE]
	 ,A.Acc_Account_Status							AS [STATUS]
	 ,A.acc_date_open								AS [OPENING DATE]
	 ,CASE
		WHEN g.EXPIRATION_MATURITY_DATE <> '0' THEN CONCAT(SUBSTRING(g.EXPIRATION_MATURITY_DATE, 5, 2), SUBSTRING(g.EXPIRATION_MATURITY_DATE, 7, 2), SUBSTRING(g.EXPIRATION_MATURITY_DATE, 1, 4))
		ELSE '00000000'
	  END											  AS [MATURITY DATE]
	 ,0												  AS [ORIGINAL AMOUNT]
	 ,G.SETTLEMENT_DATE_QTY							  AS [POSITION VALUE]
	 ,G.SETTLEMENT_DATE_LIQUIDATING_VALUE			  AS [VALUATION BALANCE]
	,G.EXCHANGE_RATE								  AS [FX RATE]
	,grb.ACCRUED_INTEREST_VALUE_FROM_LAST_PAYABLE	  AS [ACCRUED INTEREST]--,G.ACCRUED_INTEREST_VALUE_FROM_LAST_PAYABLE AS [ACCRUED INTEREST] -- VERIRY COLUMN
	,REPLACE(
	    CONVERT(
	        VARCHAR,
	        CASE
	            WHEN DATENAME(WEEKDAY, GETUTCDATE()) = 'Monday'
	                THEN DATEADD(DAY, -3, GETUTCDATE())
	            ELSE DATEADD(DAY, -1, GETUTCDATE())
	        END,
	        101
	    ),
	    '/',
	    ''
	) AS [REFERENCE DATE]
	,GETUTCDATE()									  AS [CREATION REPORT DATE]

FROM cte_account_day A
	INNER JOIN {{source("account", "bronze_referencetable_account_type_code") }} atc
			ON A.Acc_Account_Type = atc.acct_type_code
	INNER  JOIN cte_account_file_accf B
			ON A.Acc_Account_Number = B.Acc_Account_Number
	INNER  JOIN {{ ref('silver_account_gcus_rec_a') }} G
			ON SUBSTRING(B.ACCTNUMBER, 4, 6) = SUBSTRING(LEFT(G.ACCOUNT_NUMBER,9) , 4, 6)
	LEFT JOIN {{ ref('silver_account_gcus_rec_b') }} grb
			ON G.ACCOUNT_NUMBER = grb.ACCOUNT_NUMBER
		   AND G.cusip_number = grb.cusip_number
	LEFT  JOIN {{ ref('silver_account_isca_rec_j') }} irj
			ON G.CUSIP_NUMBER = irj.CUSIP_NUMBER
	LEFT  JOIN {{ ref('silver_account_isca_rec_g') }} irg
			ON G.CUSIP_NUMBER = irg.CUSIP_NUMBER
	LEFT  JOIN cte_cfusrflds cfu
		    ON A.acc_primary_cif = cfu.CFCIF__CS
	LEFT  JOIN {{ ref('gold_brfile_customer') }}  gcf
		    ON a.acc_primary_cif = gcf.Cust_CIF
	LEFT  JOIN {{ ref('silver_referencetable_sharing_agreement_exception') }} sae
		    ON A.acc_primary_cif = sae.cif_no
		   AND sae.active = 'true'
WHERE
	A.Acc_Account_Type IN ('R')
AND A.Acc_Account_Status NOT IN (2, 8)
AND G.CUSIP_NUMBER LIKE '%999997%' --
AND sae.cif_no IS NULL

UNION ALL

SELECT
	 A.Acc_Primary_CIF				AS [CUSTOMER NUMBER]
	,A.Acc_Account_Number			AS ACCTNUMBER
	,ISNULL(cfu.agencia,0)			AS [BRAZIL BRANCH]
	,ISNULL(cfu.contaCorrente,0)	AS [BRAZIL ACCOUNT]
	,''								AS [PORTFOLIO NUMBER]
	,A.Acc_Product_Code				AS [PRODUCT CODE]
	,CASE
		WHEN atc.inquiry_type = 'DDA' THEN 'CASH ACCOUNT USD'
		WHEN atc.inquiry_type = 'TimeDeposit'THEN concat('TIME DEPOSIT ' , CAST(b.CDTERM AS VARCHAR(20)) ,  ' ' ,  CASE
																														WHEN B.CDTCOD = 'D' THEN 'DAY'
																														WHEN B.CDTCOD = 'M' THEN 'MONTH'
																													END + ' ' + CAST(DATENAME(MONTH, B.MaturityDate) + RIGHT(CONVERT(VARCHAR(12), B.MaturityDate, 107), 9) AS VARCHAR(30)) ,' ' , CAST((CAST(b.RATE * 100 AS DECIMAL(9, 2))) AS VARCHAR(20)) , '%' )
	 END	AS [DESCRIPTION]
	,0		AS [REFERENCE ID]
	,''		AS [ISIN]
	,CASE
		WHEN atc.inquiry_type IN ('DDA', 'TimeDeposit') THEN 'NOW'
		WHEN atc.inquiry_type = 'Loan' THEN 'LNS'
	 END							AS [ACCOUNT TYPE]
	,'USD'							AS [CCY]
	,0								AS [FACEVAL]
	,A.Acc_Balance					AS [QUANTITY]
	,0								AS [% INTERESR RATE]
	,0								AS [PURCHASE PRICE]
	,0								AS [MARKET PRICE]
	,A.Acc_Account_Status			AS [STATUS]
	,A.acc_date_open				AS [OPENING DATE]
	,convert(varchar,A.acc_date_maturity)			AS [MATURITY DATE]
	,0								AS [ORIGINAL AMOUNT]
	,A.acc_balance					AS [POSITION VALUE]
	,A.acc_balance * 1				AS [VALUATION BALANCE]
	,1								AS [FX RATE]
	,0 								AS [ACCRUED INTEREST]
	,REPLACE(
	    CONVERT(
	        VARCHAR,
	        CASE
	            WHEN DATENAME(WEEKDAY, GETUTCDATE()) = 'Monday'
	                THEN DATEADD(DAY, -3, GETUTCDATE())
	            ELSE DATEADD(DAY, -1, GETUTCDATE())
	        END,
	        101
	    ),
	    '/',
	    ''
	) AS [REFERENCE DATE]
	,GETUTCDATE()											AS [CREATION REPORT DATE]
FROM cte_account_day A
	INNER JOIN {{source("account", "bronze_referencetable_account_type_code") }}   atc
			ON A.Acc_Account_Type = atc.acct_type_code
	LEFT  JOIN {{ ref('silver_product_cdmast') }}  b
		    ON a.Acc_Account_Number = convert(varchar,b.ACCTNO)
	LEFT  JOIN cte_cfusrflds cfu
			ON A.acc_primary_cif = cfu.CFCIF__CS
	LEFT  JOIN {{ ref('gold_brfile_customer') }} gcf
		    ON a.acc_primary_cif = gcf.Cust_CIF
	LEFT  JOIN {{ ref('silver_referencetable_sharing_agreement_exception') }} sae
		    ON A.acc_primary_cif = sae.cif_no
		   AND sae.active = 'true'
WHERE
	A.Acc_Account_Type NOT IN ('U', 'R', 'E', 'F', 'C')
AND A.Acc_Account_Status NOT IN (2, 8)
AND sae.cif_no IS NULL
AND atc.inquiry_type <> 'LOAN'


UNION ALL


SELECT
	 cah.cif												 AS [CUSTOMER NUMBER] -- OK
	,aba.acct_no											 AS ACCTNUMBER -- OK
	,CASE
		WHEN CHARINDEX('-',aba.bradesco_agency) > 1 then convert(int,LEFT(aba.bradesco_agency,CHARINDEX('-',aba.bradesco_agency) -1))
		ELSE aba.bradesco_agency
	 END agencia
	--,CASE
	--	WHEN CHARINDEX('-',aba.bradesco_account) >1 THEN  convert(int,LEFT(aba.bradesco_account,CHARINDEX('-',aba.bradesco_account) -1))
	--	ELSE aba.bradesco_account
	-- END contaCorrente
	 ,CASE
		WHEN CHARINDEX('-',aba.bradesco_account) > 1 THEN  convert(int,REPLACE (aba.bradesco_account, '-', ''))
		ELSE convert(int,REPLACE (aba.bradesco_account, '-', ''))
	 END contaCorrente
	,''														AS [PORTFOLIO NUMBER]
	,889													AS [PRODUCT CODE]
	,CASE
		WHEN (SUBSTRING(aba.portfolio, 0, CHARINDEX('|', aba.portfolio))) = 'Fixed Income' THEN 'RENDA FIXA'
		WHEN (SUBSTRING(aba.portfolio, 0, CHARINDEX('|', aba.portfolio))) = 'Conservative' THEN 'CONSERVADOR'
		WHEN (SUBSTRING(aba.portfolio, 0, CHARINDEX('|', aba.portfolio))) = 'Moderate' THEN 'MODERADO'
		WHEN (SUBSTRING(aba.portfolio, 0, CHARINDEX('|', aba.portfolio))) = 'Growth' THEN 'CRESCIMENTO'
		WHEN (SUBSTRING(aba.portfolio, 0, CHARINDEX('|', aba.portfolio))) = 'Equity' THEN 'ARROJADO'
		WHEN (SUBSTRING(aba.portfolio, 0, CHARINDEX('|', aba.portfolio))) = 'Short Term Fixed Income' THEN 'RENDA FIXA CURTO PRAZO'
		WHEN (SUBSTRING(aba.portfolio, 0, CHARINDEX('|', aba.portfolio))) = 'FI Ultra Short Term' THEN 'RENDA FIXA CURTO PRAZO'
		WHEN (SUBSTRING(aba.portfolio, 0, CHARINDEX('|', aba.portfolio))) = 'Cash' THEN  'CAIXA'
		ELSE ''
	 END													  AS [DESCRIPTION]
	 ,0														  AS [REFERENCE ID]
	 ,''													  AS [ISIN]
	 ,'BMP'													  AS [ACCOUNT TYPE]
	 ,'USD'													  AS [CCY]
	 , 0													  AS [FACEVAL]
	 ,CAST(aba.balance AS decimal(14, 2))					  AS [QUANTITY]
	 ,0														  AS [% INTERESR RATE]
	 ,0														  AS [PURCHASE PRICE]
	 ,0														  AS [MARKET PRICE]
	 ,1														  AS [STATUS]
	 ,CAST(CONCAT(SUBSTRING(aba.acct_opened_at, 6, 2), SUBSTRING(aba.acct_opened_at, 9, 2), SUBSTRING(aba.acct_opened_at, 1, 4)) AS INT) AS [OPENING DATE]
	 ,NULL													 AS [MATURITY DATE]
	 ,0 AS [ORIGINAL AMOUNT]
	 ,CAST(aba.balance AS decimal(14, 2))					  AS [POSITION VALUE]
	 ,CAST(aba.balance AS decimal(14, 2)) * 1				  AS [VALUATION BALANCE]
	 , 1													  AS [FX RATE]
	 , 0													  AS [ACCRUED INTEREST]
	,REPLACE(
	    CONVERT(
	        VARCHAR,
	        CASE
	            WHEN DATENAME(WEEKDAY, GETUTCDATE()) = 'Monday'
	                THEN DATEADD(DAY, -3, GETUTCDATE())
	            ELSE DATEADD(DAY, -1, GETUTCDATE())
	        END,
	        101
	    ),
	    '/',
	    ''
	) AS [REFERENCE DATE]
	 ,GETUTCDATE()											  AS [CREATION REPORT DATE]
FROM {{ ref('silver_account_bcp_accounts') }}  aba
	INNER JOIN {{ ref('silver_customer_acct_holder') }}  cah
			ON aba.id = cah.acct_id
	LEFT  JOIN {{ ref('gold_brfile_customer') }} gcf
			ON cah.cif = gcf.Cust_CIF
	LEFT  JOIN {{ ref('silver_referencetable_sharing_agreement_exception') }}  sha
			ON cah.cif = sha.cif_no
		   and sha.active = 'true'
WHERE
	aba.ACCT_STATUS = 'O'
and cah.account_relation = 'primary'
and aba.transact_status = 'E'

),
	/*Rules from apex */
cte_apex as (
	SELECT
		aos.cif										  AS [CUSTOMER NUMBER]
		,dsr.ACCOUNT_NUMBER								  AS [ACCTNUMBER]
		,rci.AGENCIA									  AS [BRAZIL BRANCH]
		,rci.CONTA										  AS [BRAZIL ACCOUNT]
		,rci.FFORTIN
		,dsr.cusip										  AS [PORTFOLIO NUMBER]
		,gaf.Acc_Product_Code							  AS [PRODUCT CODE]
		,dsr.symbol_description							  AS [DESCRIPTION]
		,0												  AS [REFERENCE ID]
		,''												  AS [ISIN]
		--,dsr.ASSET_TYPE									  AS [ACCOUNT TYPE]		-- ok
		,CASE
			WHEN dsr.ASSET_TYPE = 'EQUITY' THEN 'EQT'
			WHEN dsr.ASSET_TYPE = 'CURRENCY' THEN 'NOW'
			ELSE dsr.ASSET_TYPE
		 END	AS [ACCOUNT TYPE]
		,dsr.currency_code								  AS CCY
		,0												  AS [FACEVAL]			-- ok
		,dsr.settled_position							  AS QUANTITY
		,0												  AS [% INTERESR RATE]
		,0												  AS [PURCHASE PRICE]
		,dsr.closing_price								  AS [MARKET PRICE]
		,CASE
			WHEN ada.status	= 'Open' THEN 1
			ELSE 0
		 END											  AS [Status]
		,CONVERT(DATE,ada.opened_time)					  AS [OPENING DATE]
		,''												  AS [MATURITY DATE]		-- could be a maturity_payment_date from silver_account_apex_daily_activities, check with Nestor or renato
		,0												  AS [ORIGINAL AMOUNT]
		,dsr.settled_position_value_usd					  AS [POSITION VALUE]
		,dsr.settled_position_value_usd					  AS [VALUATION BALANCE]	-- ok
		,dsr.currency_rate								  AS [FX RATE]				-- ok
		,apc.accrued_interests							  AS [ACCRUED INTEREST]
		,REPLACE(
		    CONVERT(
		        VARCHAR,
		        CASE
		            WHEN DATENAME(WEEKDAY, GETUTCDATE()) = 'Monday'
		                THEN DATEADD(DAY, -3, GETUTCDATE())
		            ELSE DATEADD(DAY, -1, GETUTCDATE())
		        END,
		        101
		    ),
		    '/',
		    ''
		) AS [REFERENCE DATE]
		,GETUTCDATE()									  AS [CREATION REPORT DATE]
	FROM {{ ref('silver_account_apex_daily_positions') }}  adp
		LEFT JOIN {{ ref('silver_account_apex_daily_stock_record') }}  dsr
				ON adp.ACCOUNT_ID = dsr.ACCOUNT_ID
		INNER JOIN {{ ref('silver_account_apex_onboarding_status') }}  aos
				ON adp.account_id = aos.brokerAccountId
		INNER JOIN {{ ref('silver_referencetable_customer_info') }}  rci
				ON aos.cif = rci.CFCIF__CS
		INNER JOIN  {{ ref('gold_brfile_account') }}  gaf
				--on aos.cif = gaf.Acc_Primary_CIF
			    on dsr.ACCOUNT_NUMBER = gaf.Acc_Account_Number
		INNER JOIN {{ ref('silver_account_apex_daily_accounts') }}  ada
				on adp.account_id = ada.account_id
		LEFT JOIN {{ ref('silver_account_apex_daily_activities') }}  apc
				on adp.account_id = apc.account_id
		INNER JOIN {{ ref('silver_account_apex_daily_overnight_balances') }}  dob
				on adp.account_id = dob.account_id
	WHERE adp.ASSET_ID <> 1
	--and dsr.ACCOUNT_NUMBER = 'ZGVPS1R'

	UNION all

	SELECT DISTINCT
		 aos.cif										  AS customer_number
		,dsr.ACCOUNT_NUMBER
		,rci.AGENCIA									  AS BRAZIL_BRANCH
		,rci.CONTA										  AS BRAZIL_ACCOUNT
		,rci.FFORTIN
		,dsr.cusip										  AS PORTFOLIO_NUMBER
		,gaf.Acc_Product_Code							  AS PRODUCT_CODE
		,'UNITED STATES DOLLAR'							  AS [DESCRIPTION]
		,0												  AS REFERENCE_ID
		,''												  AS ISIN
		,'NOW'										  AS ACCOUNT_TYPE		--ok
		,dsr.currency_code								  AS CCY
		,0												  AS [FACEVAL]			-- ok
		,adp.settled									  AS QUANTITY
		,0												  AS [% INTEREST RATE]
		,0												  AS [PURCHASE PRICE]
		,adp.adjusted_settled							  AS [MARKET PRICE]
		,CASE
			WHEN ada.status	= 'Open' THEN 1
			ELSE 0
		 END											  AS [Status]
		,CONVERT(DATE,ada.opened_time)					  AS OPENING_DATE
		,''												  AS [MATURITY DATE]	-- could be a maturity_payment_date from silver_account_apex_daily_activities, check with Nestor or renato
		,0												  AS [ORIGINAL AMOUNT]
		,(dsr.closing_price * dsr.settled_position)		  AS POSITION_VALUE
		,dsr.SETTLED_POSITION_VALUE_USD					  AS VALUATION_BALANCE -- ok
		,dsr.currency_rate								  AS [FX RATE]		   -- ok
		,apc.accrued_interests							  AS [ACCRUED INTEREST]
		,REPLACE(
		    CONVERT(
		        VARCHAR,
		        CASE
		            WHEN DATENAME(WEEKDAY, GETUTCDATE()) = 'Monday'
		                THEN DATEADD(DAY, -3, GETUTCDATE())
		            ELSE DATEADD(DAY, -1, GETUTCDATE())
		        END,
		        101
		    ),
		    '/',
		    ''
		) AS [REFERENCE DATE]
		,GETUTCDATE()									  AS [CREATION REPORT DATE]
	FROM {{ ref('silver_account_apex_daily_positions') }}  adp
		LEFT JOIN {{ ref('silver_account_apex_daily_stock_record') }}  dsr
				ON adp.ACCOUNT_ID = dsr.ACCOUNT_ID
		INNER JOIN {{ ref('silver_account_apex_onboarding_status') }}  aos
				ON adp.account_id = aos.brokerAccountId
		INNER JOIN {{ ref('silver_referencetable_customer_info') }}  rci
				ON aos.cif = rci.CFCIF__CS
		INNER JOIN  {{ ref('gold_brfile_account') }}  gaf
				on dsr.ACCOUNT_NUMBER = gaf.Acc_Account_Number
		INNER JOIN {{ ref('silver_account_apex_daily_accounts') }}  ada
				ON adp.account_id = ada.account_id
		LEFT  JOIN {{ ref('silver_account_apex_daily_activities') }}  apc
				ON adp.account_id = apc.account_id
		INNER JOIN {{ ref('silver_account_apex_daily_overnight_balances') }}  dob
				ON adp.account_id = dob.account_id
	WHERE adp.ASSET_ID = 1

),
accounts_sei as (
SELECT 
	 CAST(cli.EXTERNAL_PARTY_ID AS VARCHAR(50))                         AS [CUSTOMER NUMBER]
	,pos.ACCOUNT_NUMBER                                                 AS [ACCTNUMBER]
	,rci.FFORTIN                                                        AS [CPF]
	,ISNULL(cfu.agencia, 0)                                             AS [BRAZIL BRANCH]
	,ISNULL(cfu.contaCorrente, 0)                                       AS [BRAZIL ACCOUNT]
	,COALESCE(ast.CUSIP, '') AS [PORTFOLIO NUMBER]
	,CAST(COALESCE(ad.Acc_Product_Code, 0) AS INT)                     AS [PRODUCT CODE]
	,COALESCE(ast.ASSET_NAME, '')                                       AS [DESCRIPTION]
	,0                                                                  AS [REFERENCE ID]
	,COALESCE(ast.ISIN, '')                                             AS [ISIN]
	,CASE
		WHEN UPPER(LTRIM(RTRIM(ast.ASSET_TYPE))) = 'CURRENCY' THEN 'NOW'
		WHEN UPPER(LTRIM(RTRIM(ast.ASSET_TYPE))) = 'EQUITY'   THEN 'EQT'
		WHEN UPPER(LTRIM(RTRIM(ast.ASSET_TYPE))) = 'MUTFUND'  THEN 'MUT'
		WHEN UPPER(LTRIM(RTRIM(ast.ASSET_TYPE))) IN ('CORPDEBT', 'GOVTSEC', 'MUNIDEBT', 'MONEYMKT', 'MONEYMRKT', 'MMF')
			THEN 'FIX'
		WHEN UPPER(LTRIM(RTRIM(ast.ASSET_TYPE))) IN ('LIMPART', 'OPTION')
			THEN 'ALT'
		ELSE 'MUT'
	 END                                                                AS [ACCOUNT TYPE]
	,pos.ASSET_CURRENCY                                                 AS [CCY]
	,COALESCE(pos.SETTLED_CURRENT_FACE_AMT, 0)                          AS [FACEVAL]
	,pos.SETTLED_QTY                                                    AS [QUANTITY]
	,COALESCE(ast.INTEREST_RATE, ast.COUPON_RATE, 0)                    AS [% INTERESR RATE]
	,0                                                                  AS [PURCHASE PRICE]
	,pos.ASSET_PRICE                                                    AS [MARKET PRICE]
	,CASE 
		WHEN sa.ACCOUNT_STATUS_CODE = 3
		THEN 1
		WHEN sa.ACCOUNT_STATUS_CODE = 5
		THEN 5
		ELSE 2
	END                                                                 AS [STATUS]
	,CONVERT(INT, FORMAT(CAST(sa.ACCOUNT_OPEN_DATE AS DATE), 'MMddyyyy')) AS [OPENING DATE]
	,CASE
		WHEN ast.MATURITY_DATE IS NOT NULL
			THEN CONVERT(VARCHAR(8), FORMAT(CAST(ast.MATURITY_DATE AS DATE), 'MMddyyyy'))
		ELSE ''
	 END                                                                AS [MATURITY DATE]
	,COALESCE(pos.SETTLED_ORIGINAL_COST_IN_ASSET_CURRENCY, 0)           AS [ORIGINAL AMOUNT]
	,pos.SETTLED_MARKET_VALUE_IN_ASSET_CURRENCY                         AS [POSITION VALUE]
	,pos.SETTLED_MARKET_VALUE_IN_BASE_CURRENCY                          AS [VALUATION BALANCE]
	,pos.LOCAL_TO_BASE_EXCH_RATE                                        AS [FX RATE]
	,ISNULL(CONVERT(VARCHAR(50), pos.VALUATION_ACCRUED_INTEREST), '')   AS [ACCRUED INTEREST]
	,REPLACE(CONVERT(CHAR(10), COALESCE(pos.AS_OF_DATE, pos.DATE_OF_DATA), 101), '/', '')
	                                                                    AS [REFERENCE DATE]
	,GETUTCDATE()                                                       AS [CREATION REPORT DATE]
	,CAST(GETUTCDATE() AS DATE)                                         AS [CREATED_DT] 
FROM cte_account_day ad
INNER JOIN {{ ref('silver_account_sei_EODPositions') }} pos
ON pos.ACCOUNT_NUMBER = ad.Acc_Account_Number
AND ad.Acc_Account_Type = 'U'
INNER JOIN sei_custodian_accounts sa
	ON pos.ACCOUNT_NUMBER = sa.ACCOUNT_NUMBER
   AND pos.DATE_OF_DATA = sa.DATE_OF_DATA
INNER JOIN {{ ref('silver_customer_sei_ClientAccountLink') }} cal
	ON pos.ACCOUNT_NUMBER = cal.ACCOUNT_NUMBER
   AND pos.DATE_OF_DATA = cal.DATE_OF_DATA
   AND cal.RELATIONSHIP = 'Primary Owner'
INNER JOIN {{ ref('silver_customer_sei_Clients')}} cli
	ON cal.CLIENT_ID = cli.CLIENT_ID
   AND cal.DATE_OF_DATA = cli.DATE_OF_DATA
   AND cli.ADDRESS_PRIMARY_FLAG = 'Y'
   AND cli.ADDRESS_PURPOSE = 6
INNER JOIN sei_assets ast
	ON pos.INSTRUMENT_ID = ast.INSTRUMENT_ID
   AND pos.DATE_OF_DATA = ast.DATE_OF_DATA
LEFT JOIN {{ ref('silver_referencetable_customer_info')}} rci
	ON rci.CFCIF__CS = CAST(cli.EXTERNAL_PARTY_ID AS VARCHAR(50))
LEFT JOIN cte_cfusrflds cfu
	ON cfu.CFCIF__CS = CAST(cli.EXTERNAL_PARTY_ID AS VARCHAR(50))
WHERE sa.ACCOUNT_CLASSIFICATION_NAME = 'Custodian'
  AND cli.EXTERNAL_PARTY_ID IS NOT NULL
),
cte_union as (
SELECT DISTINCT
	 sap.[CUSTOMER NUMBER]
	,sap.[ACCTNUMBER]
	,rci.[FFORTIN] AS CPF
	,sap.[BRAZIL BRANCH]
	,sap.[BRAZIL ACCOUNT]
	,sap.[PORTFOLIO NUMBER]
	,sap.[PRODUCT CODE]
	,sap.[DESCRIPTION]
	,sap.[REFERENCE ID]
	,sap.[ISIN]
	,sap.[ACCOUNT TYPE]
	,sap.[CCY]
	,sap.[FACEVAL]
	,sap.[QUANTITY]
	,sap.[% INTERESR RATE]
	,sap.[PURCHASE PRICE]
	,sap.[MARKET PRICE]
	,convert(varchar,sap.[STATUS]) as [STATUS]
	,sap.[OPENING DATE]
	,sap.[MATURITY DATE]
	,sap.[ORIGINAL AMOUNT]
	,sap.[POSITION VALUE]
	,sap.[VALUATION BALANCE]
	,sap.[FX RATE]
	,isnull(convert(varchar,sap.[ACCRUED INTEREST]),'') as [ACCRUED INTEREST]
	,sap.[REFERENCE DATE]
	,sap.[CREATION REPORT DATE]
	,GETUTCDATE() AS LOADED_AT
FROM cte_silver_brfile_account_positions sap
	LEFT JOIN  {{ ref('silver_referencetable_customer_info') }} rci
		   ON sap.[CUSTOMER NUMBER] = rci.CFCIF__CS

UNION

SELECT
	 [CUSTOMER NUMBER]
	,[ACCTNUMBER]
	,[FFORTIN]			AS CPF
	,[BRAZIL BRANCH]
	,[BRAZIL ACCOUNT]
	,[PORTFOLIO NUMBER]
	,[PRODUCT CODE]
	,[DESCRIPTION]
	,[REFERENCE ID]
	,[ISIN]
	,[ACCOUNT TYPE]
	,[CCY]
	,[FACEVAL]
	,[QUANTITY]
	,[% INTERESR RATE]
	,[PURCHASE PRICE]
	,[MARKET PRICE]
	,[STATUS]
	,CONVERT(INT, FORMAT(CAST([OPENING DATE] AS DATE), 'MMddyyyy')) as [OPENING DATE]
	,[MATURITY DATE]
	,[ORIGINAL AMOUNT]
	,[POSITION VALUE]
	,[VALUATION BALANCE]
	,[FX RATE]
	,isnull([ACCRUED INTEREST],'')
	,[REFERENCE DATE]
	,[CREATION REPORT DATE]
	,GETUTCDATE() AS LOADED_AT
FROM cte_apex
UNION 
SELECT DISTINCT
         asei.[CUSTOMER NUMBER]
        ,asei.[ACCTNUMBER]
        ,rci.[FFORTIN] AS CPF
        ,asei.[BRAZIL BRANCH]
        ,asei.[BRAZIL ACCOUNT]
        ,asei.[PORTFOLIO NUMBER]
        ,asei.[PRODUCT CODE]
        ,asei.[DESCRIPTION]
        ,asei.[REFERENCE ID]
        ,asei.[ISIN]
        ,asei.[ACCOUNT TYPE]
        ,asei.[CCY]
        ,asei.[FACEVAL]
        ,asei.[QUANTITY]
        ,asei.[% INTERESR RATE]
        ,asei.[PURCHASE PRICE]
        ,asei.[MARKET PRICE]
        ,convert(varchar,asei.[STATUS]) as [STATUS]
        ,asei.[OPENING DATE]
        ,asei.[MATURITY DATE]
        ,asei.[ORIGINAL AMOUNT]
        ,asei.[POSITION VALUE]
        ,asei.[VALUATION BALANCE]
        ,asei.[FX RATE]
        ,isnull(convert(varchar,asei.[ACCRUED INTEREST]),'') as [ACCRUED INTEREST]
        ,asei.[REFERENCE DATE]
        ,asei.[CREATION REPORT DATE]
        ,GETUTCDATE() AS LOADED_AT
FROM accounts_sei asei
        LEFT JOIN {{ ref('silver_referencetable_customer_info') }} rci
                   ON asei.[CUSTOMER NUMBER] = rci.CFCIF__CS
)

SELECT * FROM  CTE_UNION WHERE [ACCOUNT TYPE] IS NOT NULL