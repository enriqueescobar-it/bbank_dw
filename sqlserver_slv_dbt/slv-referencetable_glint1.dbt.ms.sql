-- NAME: SILVER_REFERENCETABLE_GLINT1
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
        GISTAT
        ,BRANCH
        ,APPCDE
        ,INTER__CS
        ,INDORC
        ,GROUP__CS
        ,PRACCT
        ,PRCOST
        ,PRPRDC
        ,GDESC
        ,FORCBR
        ,CHGREC
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_jh_glint1') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)
SELECT * FROM bronze_data