-- NAME: SILVER_REFERENCETABLE_JH_JHCTRY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: April 30, 2025

{{
   config(
		  tags=["jh_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        JHCNTRY
        ,JHCODEA2
        ,JHCODEA3
        ,JHCODEN3
        ,JHUPLDDAT
        ,JHUPLDUID
        ,JHUPLDWID
        ,JHCHNGUID
        ,JHCHNGWID
        ,JHCTRY_ID
        ,JHCTRYCRTS
        ,JHCTRYMNTS
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM
        {{ ref('bronze_jh_jhctry') }}
)

SELECT * FROM bronze_data