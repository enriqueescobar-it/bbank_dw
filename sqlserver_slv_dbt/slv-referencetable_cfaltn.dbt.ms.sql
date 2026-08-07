-- NAME: SILVER_REFERENCETABLE_CFALTN
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
        CFALID
        ,CFATYP
        ,CFAACT
        ,CFCIF__CS
        ,CFAAL1
        ,CFAAL2
        ,CFSNME
        ,CFNA1
        ,CFNA2
        ,CFNA3
        ,CFNA4
        ,CFCITY
        ,CFSTAT
        ,CFZIP
        ,CFZIPD
        ,CFCASS
        ,CFADLM
        ,CFADL6
        ,CFFORC
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_jh_cfaltn') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)
SELECT * FROM bronze_data