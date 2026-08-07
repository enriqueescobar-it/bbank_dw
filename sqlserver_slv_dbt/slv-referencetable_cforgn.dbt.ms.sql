-- NAME: SILVER_REFERENCETABLE_CFORGN
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
        FCIF__CS
		,FPCITY
		,FPPROV
		,FPCODE
		,FPCNTR
		,FCNTRY
		,FEXMPT
		,FRECIP
		,FCITZN
		,FFORTIN
		,AsOfDate
		,YEARMONTH
		,GETUTCDATE() AS LOADED_AT
    FROM {{ ref('bronze_jh_cforgn') }}
	WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data