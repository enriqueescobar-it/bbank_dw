-- NAME: SILVER_REFERENCETABLE_CFCRGP
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: July 01, 2024

{{
   config(
		  tags=["jh_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        CFCGRP
        ,CFCCIF
        ,CFCTYP
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM {{ ref('bronze_jh_cfcrgp') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data