-- NAME: BRONZE_JH_JHOFFR
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        JHOOFF
        ,JHOXRFNBR
        ,JHONAM
        ,JHOSNA
        ,JHOTIT
        ,JHOPHN
        ,JHOPEX
        ,JHOSLMT
        ,JHOULMT
        ,JHOPRNT
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) AS AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_JHOFFR"
),

bronze_data AS (
    SELECT
        JHOOFF
        ,JHOXRFNBR
        ,JHONAM
        ,JHOSNA
        ,JHOTIT
        ,JHOPHN
        ,JHOPEX
        ,JHOSLMT
        ,JHOULMT
        ,JHOPRNT
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6),AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_jhoffr"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data