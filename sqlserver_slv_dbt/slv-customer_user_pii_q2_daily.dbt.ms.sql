-- NAME: SILVER_CUSTOMER_USER_PII_Q2_DAILY
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
        USER_ID
		,PRIMARY_CIF
		,LAST_NAME
		,FIRST_NAME
		,MIDDLE_NAME
		,SALUTATION
		,SUFFIX
		,SOCIAL_SECURITY_NUMBER
		,EMAIL_ADDRESS
		,STREET_ADDRESS_1
		,STREET_ADDRESS_2
		,CITY
		,[STATE]
		,POSTAL_CODE
		,PROVINCE
		,IS_INTERNATIONAL
		,ISO_CODE_A3
		,YEARMONTH
		,GETUTCDATE() LOADED_AT
    FROM
        {{ ref('bronze_q2_user_pii') }}
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