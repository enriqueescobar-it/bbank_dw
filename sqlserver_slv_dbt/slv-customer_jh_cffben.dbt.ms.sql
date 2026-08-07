-- NAME: SILVER_CUSTOMER_JH_CFFBEN
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: February 26, 2026

{{
   config(
          tags=["jh_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        ECIFNO,
        OIDNO,
        OIDTYPE,
        OCIFNO,
        OWNTYP,
        OWNPCT,
        OTITLE,
        OIDCTRY,
        OBIRDATE,
        OREMDATE,
        OCFFORN,
        OCFNA1,
        OCFNA2,
        OCFNA3,
        OCFNA4,
        OCFCITY,
        OCFSTAT,
        OCFZIP,
        OCFZIPD,
        OCFFORC,
        AsOfDate,
        YEARMONTH,
        GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_jh_cffben') }}
    WHERE CONVERT(date, AsOfDate) = (SELECT MAX(AsOfDate) from {{ ref('bronze_jh_cffben') }})
)

SELECT * FROM bronze_data