-- NAME: SILVER_REFERENCETABLE_JHOFFR
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
        JHOOFF
        ,JHOXRFNBR
        ,JHONAM
        ,JHOSNA
        ,JHOTIT
        ,JHOPHN
        ,JHOPEX
        ,JHOSLMT
        ,JHOULMT
        ,JHOPRNT
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_jh_jhoffr') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data