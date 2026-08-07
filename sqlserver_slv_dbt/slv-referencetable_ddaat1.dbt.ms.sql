-- NAME: SILVER_REFERENCETABLE_DDAAT1
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
        ATBAT
        ,ATSEQ
        ,ACCTNO
        ,ACTYPE
        ,ATITEM
        ,ATCTR
        ,ATCHG
        ,ATDAT6
        ,ATDAT7
        ,ATCLSCHG
        ,HSCHARGE
        ,STATOCUR
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_jh_ddaat1') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)
SELECT * FROM bronze_data