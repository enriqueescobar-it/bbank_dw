-- NAME: BRONZE_JH_CFMESG
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: March 05, 2025




WITH landing_data AS (
    SELECT
        CFMSID
        ,CFATYP
        ,CFACC__CS
        ,CFMSEQ
        ,CFCOLM
        ,CFMSG
        ,CFCIF__CS
        ,CFALTA
        ,CFEXPD
        ,CFEXP6
        ,CFMPDT
        ,CFMPD6
        ,CFMUIC
        ,CFMPLN
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) AS AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_CFMESG"
),

bronze_data AS (
    SELECT
        CFMSID
        ,CFATYP
        ,CFACC__CS
        ,CFMSEQ
        ,CFCOLM
        ,CFMSG
        ,CFCIF__CS
        ,CFALTA
        ,CFEXPD
        ,CFEXP6
        ,CFMPDT
        ,CFMPD6
        ,CFMUIC
        ,CFMPLN
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6),AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_cfmesg"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data