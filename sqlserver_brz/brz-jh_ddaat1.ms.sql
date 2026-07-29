-- NAME: BRONZE_JH_DDAAT1
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: March 05, 2025




WITH landing_data AS (
    SELECT
        ATBAT
        ,ATSEQ
        ,ACCTNO
        ,ACTYPE
        ,ATITEM
        ,ATCTR
        ,ATCHG
        ,ATDAT6
        ,ATDAT7
        ,ATCLSCHG
        ,HSCHARGE
        ,STATOCUR
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) AS AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_DDAAT1"
),

bronze_data AS (
    SELECT
        ATBAT
        ,ATSEQ
        ,ACCTNO
        ,ACTYPE
        ,ATITEM
        ,ATCTR
        ,ATCHG
        ,ATDAT6
        ,ATDAT7
        ,ATCLSCHG
        ,HSCHARGE
        ,STATOCUR
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6),AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_ddaat1"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data