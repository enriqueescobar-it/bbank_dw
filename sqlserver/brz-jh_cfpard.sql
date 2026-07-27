-- NAME: BRONZE_JH_CFPARD
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        APPCOD
        ,APPDES
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_CFPARD"
),
bronze_data AS (
    SELECT
        APPCOD
        ,APPDES
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) as YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_cfpard"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM landing_data