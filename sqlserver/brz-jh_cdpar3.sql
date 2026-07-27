-- NAME: BRONZE_JH_CDPAR3
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: December 21, 2024



WITH landing_data AS (
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
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) AS AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_CDPAR3"
),

bronze_data AS (
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
        ,CONVERT(INT, CONVERT(nvarchar(6),AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_cdpar3"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data