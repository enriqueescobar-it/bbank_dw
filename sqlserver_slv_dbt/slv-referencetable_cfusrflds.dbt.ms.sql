-- NAME: SILVER_REFERENCETABLE_CFUSRFLDS
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
        CFCIF__CS
        ,USFNAM
        ,USFVAL
        ,USFDATE6
        ,USFDATE7
        ,USFNUM9
        ,USFNUM15
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM {{ ref('bronze_jh_cfusrflds') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data