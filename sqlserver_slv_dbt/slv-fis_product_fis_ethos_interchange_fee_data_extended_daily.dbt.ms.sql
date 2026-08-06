-- NAME: SILVER_PRODUCT_FIS_ETHOS_INTERCHANGE_FEE_DATA_EXTENDED_DAILY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: Feb 18, 2026

{{
   config(
          tags=["fis_standard"]
        )
}}
WITH CardTransactions as (
	SELECT
	    INDEX__CS
	    ,ACCOUNT_NUMBER
	    ,CUSTOMER_NUMBER
	    ,BIN
	    ,PRODUCT
	    ,BLOCK_RECLASS_DESC
	    ,TRANSACTION_CODE
	    ,TRANS_REASON_CODE
	    ,TRANS_REASON_DESC
	    ,SUB_PRODUCT
	    ,INTERCHANGE_FEE
	    ,TRANSACTION_AMOUNT
	    ,MERCHANT_NAME
	    ,MERCHANT_COUNTRY_CODE
	    ,TRANSACTION_DATE
	    ,POSTING_DATE
	    ,SIC_4_CODE
	    ,SIC_DESCRIPTION
	    ,CASE
	        WHEN Interchange_Fee <> 0 THEN Interchange_Fee
	        WHEN Trans_Reason_Code IN (7140,7120,7143,7102,6040,8033,6200,8011,8099,6400,7200,7911) THEN Transaction_Amount
	        WHEN Transaction_Code IN (81) THEN Transaction_Amount
	    END AS Revenue
	    ,CASE
	        WHEN Interchange_Fee <> 0 THEN 443082
	        WHEN Trans_Reason_Code IN (8099) THEN 443082
	        WHEN Trans_Reason_Code IN (6400) THEN 440380
	        WHEN Trans_Reason_Code IN (6040) THEN 442080
	        WHEN Trans_Reason_Code IN (8033) THEN 442081
	        WHEN Trans_Reason_Code IN (6200) THEN 442082
	        WHEN Trans_Reason_Code IN (8011) THEN 442084
	        WHEN Transaction_Code  IN (81) THEN 442086
	        WHEN Trans_Reason_Code IN (7140, 7120, 7143, 7102, 7200, 7911) THEN 556670
	    END AS GL_Account
	    ,c.CFOFFR as CIF_Officer_Code
	    ,oc.Cost_Center AS 'Officer_Cost_Center'
	    ,c.CFNAME as CIF_Name
	    ,CASE
	    	WHEN Trans_Reason_Code IN (6040) THEN nc.NextProcessDate
	    	ELSE nb.NextProcessDate
	    END AS [GL_Posting_Date]
	    ,oc.Officer_Code
	    ,t.DATE_OF_DATA
	    ,t.YEARMONTH
	FROM {{ref('silver_product_fis_ethos_interchange_fee_data')}} t
	LEFT JOIN {{ref('CONTROL_GENERAL_CALENDAR')}} nb ON nb.process_date = t.Posting_Date
	LEFT JOIN {{ref('CONTROL_GENERAL_CALENDAR')}} nc ON nc.process_date = t.Transaction_Date
	LEFT JOIN {{ref('silver_customer_cfmast')}} c on trim(t.Customer_Number) = c.CFCIF__CS
	LEFT JOIN {{ref('silver_mis_team_officers_v2')}} oc ON ISNULL(TRY_CONVERT(VARCHAR(50), TRY_CONVERT(INT, c.CFOFFR)), c.CFOFFR) = oc.Officer_Code
)
SELECT t.*,GETUTCDATE() AS LOADED_AT,a.MISProductLevel1, a.MISProductLevel2, a.MISProductLevel3
FROM CardTransactions t
LEFT JOIN {{ref('silver_account_axiom_acct')}} a ON t.gl_account = a.ACCT