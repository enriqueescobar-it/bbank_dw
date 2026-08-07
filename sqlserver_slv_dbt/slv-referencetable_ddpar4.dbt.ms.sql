-- NAME: SILVER_REFERENCETABLE_DDPAR4
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
        DP4STS
        ,DP4DSC
        ,DP4DSS
        ,DP4TXT
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM
        {{ ref('bronze_jh_ddpar4') }}
)

SELECT * FROM bronze_data