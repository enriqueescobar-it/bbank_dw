-- NAME: SILVER_SBLC_LCTRANX
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: November 27, 2025

-- Most Recent Data!

{{
   config(
          tags=["sblc_standard"]
        )
}}

WITH bronze_data AS (
	SELECT
	   	TRBR
	    ,TRCOST
	    ,TRPROD
	    ,TRAGLN
	    ,TRACCN
	    ,LCMACC
	    ,TRCODE
	    ,TRATYP
	    ,DESCRI
	    ,TRDORC
	    ,AMOUNT
	    ,TREFF6
	    ,DDMUID
        ,DATE_OF_DATA
	    ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
	FROM {{ ref('bronze_sblc_lctranx')}}
        WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data