-- NAME: BRONZE_JH_CFALTN
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: March 05, 2025




WITH landing_data AS (
    SELECT
        CFALID
        ,CFATYP
        ,CFAACT
        ,CFCIF__CS
        ,CFAAL1
        ,CFAAL2
        ,CFSNME
        ,CFNA1
        ,CFNA2
        ,CFNA3
        ,CFNA4
        ,CFCITY
        ,CFSTAT
        ,CFZIP
        ,CFZIPD
        ,CFCASS
        ,CFADLM
        ,CFADL6
        ,CFFORC
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_CFALTN"
),

bronze_data AS (
    SELECT
        CFALID
        ,CFATYP
        ,CFAACT
        ,CFCIF__CS
        ,CFAAL1
        ,CFAAL2
        ,CFSNME
        ,CFNA1
        ,CFNA2
        ,CFNA3
        ,CFNA4
        ,CFCITY
        ,CFSTAT
        ,CFZIP
        ,CFZIPD
        ,CFCASS
        ,CFADLM
        ,CFADL6
        ,CFFORC
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) as YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_cfaltn"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data