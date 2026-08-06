-- NAME: SILVER_PRODUCT_FIS_ETHOS_INTERCHANGE_FEE_DATA_DAILY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: January 26, 2026

{{
   config(
            materialized='incremental',
            incremental_strategy='append',
            tags=["fis_standard"]
        )
}}

-- depends_on: {{ ref('silver_product_fis_ethos_interchange_fee_data') }}

WITH cte_fis_ethos_interchange_fee_data AS (
        select
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
			,DATE_OF_DATA
			,YEARMONTH
		from {{ref('silver_product_fis_ethos_interchange_fee_data')}} silver_ethos
		{% if is_incremental() %}
        	where NOT EXISTS(
				SELECT 1
				FROM {{ this }} ethos_daily
				WHERE ethos_daily.INDEX__CS = silver_ethos.INDEX__CS AND
				ethos_daily.POSTING_DATE = silver_ethos.POSTING_DATE)
    	{% endif %}
)

select
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
	,DATE_OF_DATA
	,YEARMONTH
	,GETUTCDATE() AS LOADED_AT

FROM cte_fis_ethos_interchange_fee_data