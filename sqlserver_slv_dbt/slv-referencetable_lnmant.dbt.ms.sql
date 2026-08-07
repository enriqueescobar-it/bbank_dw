-- NAME: SILVER_REFERENCETABLE_LNMANT
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
        JHMACT
        ,JHMTYP
        ,JHMCIF
        ,JHMUID
        ,JHMWID
        ,JHMTIM
        ,JHMPGM
        ,JHMDLM
        ,JHMDL6
        ,JHMDTM
        ,JHMDT6
        ,JHMAPL
        ,JHMFLD
        ,JHMNEW
        ,JHMOLD
        ,JHMBR__CS
        ,JHMTPE
        ,JHMLIN
        ,LNCSMN
        ,LNCSPD
        ,LNMUNM
        ,DQP_BRONZE.dbo.ConvertJhDateJulianToDatetime(JHMDTM) AS MAINTENANCEDATE
        ,AsOfDate
        ,YEARMONTH
		,GETUTCDATE() AS LOADED_AT
    FROM {{ ref('bronze_jh_lnmant') }}
	WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data