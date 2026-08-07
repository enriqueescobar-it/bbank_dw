-- NAME: SILVER_REFERENCETABLE_CFMESG
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
        CFMSID
        ,CFATYP
        ,CFACC__CS
        ,CFMSEQ
        ,CFCOLM
        ,CFMSG
        ,CFCIF__CS
        ,CFALTA
        ,CFEXPD
        ,CFEXP6
        ,CFMPDT
        ,CFMPD6
        ,CFMUIC
        ,CFMPLN
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_jh_cfmesg') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)
SELECT * FROM bronze_data