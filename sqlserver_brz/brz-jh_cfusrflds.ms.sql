-- NAME: BRONZE_JH_CFUSRFLDS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        CFCIF__CS
        ,USFNAM
        ,USFVAL
        ,USFDATE6
        ,USFDATE7
        ,USFNUM9
        ,USFNUM15
        ,CASE WHEN USFNAM IN ('IN15N1','IN15N2') THEN
            CASE WHEN USFNUM15 IS NULL THEN 1 ELSE 0 END
            ELSE 0
        END USFNUM15_FLAG
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_CFUSRFLDS"
),

bronze_data AS (
    SELECT
        CFCIF__CS
        ,USFNAM
        ,USFVAL
        ,USFDATE6
        ,USFDATE7
        ,USFNUM9
        ,USFNUM15
        ,USFNUM15_FLAG
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) as YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_cfusrflds"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data