-- NAME: SILVER_CUSTOMER_MULESOFT_PARTY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: November 08, 2024

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
		,primary_id_type
		,primary_id_country
		,primary_id_number
		,sys_created_by
		,sys_created_at_ts
		,sys_last_modify_by
		,sys_last_modify_at_ts
		,yearmonth
		,GETUTCDATE()loaded_at
	FROM {{ ref('bronze_mulesoft_party') }}
	WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
) select * from bronze_data