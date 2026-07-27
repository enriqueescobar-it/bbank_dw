-- NAME: BRONZE_JH_DDPAR4
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
         DP4STS
        ,DP4DSC
        ,DP4DSS
        ,DP4TXT
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_DDPAR4"
),

bronze_data AS (
    SELECT
         DP4STS
        ,DP4DSC
        ,DP4DSS
        ,DP4TXT
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
)

SELECT * FROM bronze_data