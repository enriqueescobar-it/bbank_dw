-- NAME: SILVER_REFERENCETABLE_DDALIS_T
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
        ACCTNO
        ,ACTYPE
        ,AGRPCD
        ,AITEM
        ,AATYPE
        ,AIDESC
        ,AICHG
        ,AIFREE
        ,AIDRCR
        ,AIMIN
        ,AIMAX
        ,AIFLAT
        ,AITIER
        ,AINUM
        ,AIPRT0
        ,AICHG1
        ,AICTR2
        ,AICHG2
        ,AICTR3
        ,AICHG3
        ,AICTR4
        ,AICHG4
        ,AICTR5
        ,AICHG5
        ,WAIVEFEE
        ,WVEXPDT6
        ,WVEXPDT7
        ,EXBEGDT6
        ,EXBEGDT7
        ,EXENDDT6
        ,EXENDDT7
        ,RECURITM
        ,RCEXPDT6
        ,RCEXPDT7
        ,HSCHARGE
        ,STATOCUR
        ,CTDIFREE
        ,AILEVEL
        ,AADSCAMT
        ,AADSCPRC
        ,AADSCEXP
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_jh_ddalis_t') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)
SELECT * FROM bronze_data