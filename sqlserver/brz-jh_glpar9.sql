-- NAME: BRONZE_JH_GLPAR9
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: March 05, 2025




WITH landing_data AS (
    SELECT
        P9PROD
        ,P9DESC
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
	        FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_GLPAR9"
),

bronze_data AS (
    SELECT
        P9PROD
        ,P9DESC
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_glpar9"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data