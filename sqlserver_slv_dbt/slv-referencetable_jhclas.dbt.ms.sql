-- NAME: SILVER_REFERENCETABLE_JHCLAS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: March 05, 2025

{{
   config(
		  tags=["jh_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        JHCCOD
        ,JHCDES
        ,JHCLID
        ,JHCARC
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_jh_jhclas') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)
SELECT * FROM bronze_data