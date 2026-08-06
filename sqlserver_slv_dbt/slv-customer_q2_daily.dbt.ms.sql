-- NAME: SILVER_CUSTOMER_Q2_DAILY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024

{{
   config(
          materialized='incremental',
		  incremental_strategy='append',
		  tags=["q2_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
		CUSTOMER_ID
		,GROUP_ID
		,GROUP_NAME
		,CUSTOMER_NAME
		,TAX_ID
		,IS_COMPANY
		,IS_TREASURY
		,PRIMARY_CIF
		,SERVICE_CHARGE_PLAN_ID
		,PLAN_NAME
		,CHARGE_ACCOUNT
		,CREATE_DATE
		,STREET_ADDRESS1
		,STREET_ADDRESS2
		,CITY
		,[STATE]
		,POSTAL_CODE
		,PROVINCE
		,IS_INTERNATIONAL
		,ISO_CODE_A3
		,CUSTOMER_DELETED_DATE
		,YEARMONTH
		,GETUTCDATE() LOADED_AT
    FROM
        {{ ref('bronze_q2_customer') }}
    {% if is_incremental() %}
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM {{ this }}),'1970-01-01 00:00:00.000')
    {% endif %}
)

{% if execute %}
{{
    log("Running incrementally: " ~ is_incremental(), info=True)
}}
{% endif %}

SELECT * FROM bronze_data