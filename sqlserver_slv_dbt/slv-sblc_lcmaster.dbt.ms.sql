-- NAME: SILVER_SBLC_LCMASTER
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: November 27, 2025

{{
   config(
          tags=["sblc_standard"]
        )
}}

WITH bronze_data AS (
	SELECT
        LCMBRN
	    ,LCMCCY
	    ,LCMGLN
	    ,LCMCCN
	    ,LCMPRC
	    ,LCMACN
	    ,LCMFCY
	    ,LCMSTS
	    ,LCMTYP
	    ,LCMORF
	    ,LCMRTY
	    ,LCMOFX
	    ,LCMCNF
	    ,LCMTRF
	    ,LCMTNR
	    ,LCMOFI
	    ,LCMGCD
	    ,LCMGRC
	    ,LCMOAM
	    ,LCMAMN
	    ,LCMCOM
	    ,LCMEXP
	    ,LCMMEB
	    ,LCMCFK
	    ,LCMODM
	    ,LCMODD
	    ,LCMODY
	    ,LCMOPJ
	    ,LCMLAM
	    ,LCMLAD
	    ,LCMLAY
	    ,LCMLAJ
	    ,LCMEXM
	    ,LCMEXD
	    ,LCMEXY
	    ,LCMEXJ
	    ,LCMCLM
	    ,LCMCLD
	    ,LCMCLY
	    ,LCMCLJ
	    ,LCMIB1
	    ,LCMIB2
	    ,LCMIB3
	    ,LCMIBA
	    ,LCMBN1
	    ,LCMBN2
	    ,LCMBN3
	    ,LCMACC
	    ,DATE_OF_DATA
	    ,YEARMONTH
	FROM {{ ref('bronze_sblc_lcmaster')}}
        WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT *, GETUTCDATE() AS LOADED_AT FROM bronze_data