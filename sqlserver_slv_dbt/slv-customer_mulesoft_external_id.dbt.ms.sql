-- NAME: SILVER_CUSTOMER_MULESOFT_EXTERNAL_ID
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: November 11, 2024

{{
   config(
          tags=["mulesoft_standard"]
        )
}}


WITH bronze_data as (
SELECT
	 id
	,uuid
	,tenant_id
	,customer_id
	,[type]
	,source_system
	,external_id
	,sys_created_by
	,sys_created_at_ts
	,sys_last_modify_by
	,sys_last_modify_at_ts
	,yearmonth
	,GETUTCDATE() AS LOADED_AT
FROM {{ ref('bronze_mulesoft_customer_external_id') }}
WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
) select * from bronze_data