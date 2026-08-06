-- NAME: SILVER_CUSTOMER_USER_Q2_DAILY
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
 		,CUSTOMER_ID
 		,USER_ROLE_ID
 		,GROUP_ID
 		,ACTIVE_INACTIVE
 		,CREATED_DATE
 		,DELETED_DATE
 		,GROUP_NAME
 		,GROUP_DELETED_DATES
 		,ZONE_ID
 		,ZONE_DESCRIPTION
 		,AUTO_GENERATED
 		,YEARMONTH
		,GETUTCDATE() LOADED_AT
    FROM
        {{ ref('bronze_q2_user') }}
    {% if is_incremental() %}
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM {{ this }}),'1970-01-01 00:00:00.000')
    {% endif %}
)

SELECT * FROM bronze_data