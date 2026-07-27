-- NAME: BRONZE_PERSHING_ISCA_REC_G
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024

{{
   config(
          materialized='incremental',
          incremental_strategy='append',
		  tags=["pershing_standard"]
        )
}}

WITH landing_data AS (
    SELECT DISTINCT
	    RECORD_INDICATOR_VALUE
	    ,CONVERT(INT, RECORD_ID_SEQUENCE_NUMBER) AS RECORD_ID_SEQUENCE_NUMBER
	    ,CUSIP_NUMBER
	    ,NOT_USED_1
		,CONVERT(DECIMAL(18, 9), CONVERT(FLOAT, DELTA)) AS DELTA
		,DELTA_VALUE_PRESENCE_INDICATOR
		,NOT_USED_2
		,ISIN_CODE
		,ISSUER_IDENTIFIER
		,PIUO
		,NOT_USED_3
		,SYMBOL_OF_THE_UNDERLYING_SECURITY
		,ASSET_TYPE
		,ASSET_SUBTYPE
		,ASSET_SUB_SUBTYPE
	    ,CONVERT(INT, PAYMENT_DAY_DELAYS) AS PAYMENT_DAY_DELAYS
		,RESERVED_FOR_FUTURE_RATING
	    ,CONVERT(DATE, DATE_OF_DATA) AS DATE_OF_DATA
	    ,YEARMONTH
    FROM
        {{ source("pershing", "PERSHING_ISCA_G") }}
	{% if is_incremental() %}
        WHERE DATE_OF_DATA > COALESCE((SELECT MAX(DATE_OF_DATA) FROM {{ this }}),'1970-01-01 00:00:00.000')
    {% endif %}
)

{% if execute %}
{{
    log("Running incrementally: " ~ is_incremental(), info=True)
}}
{% endif %}

SELECT *, GETUTCDATE() AS LOADED_AT FROM landing_data