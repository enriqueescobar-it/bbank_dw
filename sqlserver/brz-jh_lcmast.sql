-- NAME: BRONZE_JH_LCMAST
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
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
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
	        FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL as YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_LCMAST"
),

bronze_data AS (
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
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE AsOfDate > COALESCE((SELECT MAX(AsOfDate) FROM "DQP_BRONZE"."dbo"."bronze_jh_lcmast"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data