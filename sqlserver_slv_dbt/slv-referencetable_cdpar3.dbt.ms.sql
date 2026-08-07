-- NAME: SILVER_REFERENCETABLE_CDPAR3
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: December 21, 2024

{{
   config(
		  tags=["jh_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
         C3TRAN
        ,C3DORC
        ,C3AFFT
        ,C3LACT
        ,C3YTDC
        ,C3LINE
        ,C3ADSB
        ,C3DESC
        ,C3STMD
        ,C3CONTYP
        ,C3LIN2
        ,C3ADD2
        ,C3TXYR
        ,C3AMDA
        ,C3ADIR
        ,C3DIST
        ,C3STMT
        ,C3TAXB
        ,AsOfDate
        ,YEARMONTH
		,GETUTCDATE() AS LOADED_AT
    FROM {{ ref('bronze_jh_cdpar3') }}
	WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data