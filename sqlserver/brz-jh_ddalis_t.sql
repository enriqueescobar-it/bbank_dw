-- NAME: BRONZE_JH_DDALIS_T
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: March 05, 2025




WITH landing_data AS (
    SELECT
        ACCTNO
        ,ACTYPE
        ,AGRPCD
        ,AITEM
        ,AATYPE
        ,AIDESC
        ,AICHG
        ,AIFREE
        ,AIDRCR
        ,AIMIN
        ,AIMAX
        ,AIFLAT
        ,AITIER
        ,AINUM
        ,AIPRT0
        ,AICHG1
        ,AICTR2
        ,AICHG2
        ,AICTR3
        ,AICHG3
        ,AICTR4
        ,AICHG4
        ,AICTR5
        ,AICHG5
        ,WAIVEFEE
        ,WVEXPDT6
        ,WVEXPDT7
        ,EXBEGDT6
        ,EXBEGDT7
        ,EXENDDT6
        ,EXENDDT7
        ,RECURITM
        ,RCEXPDT6
        ,RCEXPDT7
        ,HSCHARGE
        ,STATOCUR
        ,CTDIFREE
        ,AILEVEL
        ,AADSCAMT
        ,AADSCPRC
        ,AADSCEXP
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_DDALIS_T"
),

bronze_data AS (
    SELECT
        ACCTNO
        ,ACTYPE
        ,AGRPCD
        ,AITEM
        ,AATYPE
        ,AIDESC
        ,AICHG
        ,AIFREE
        ,AIDRCR
        ,AIMIN
        ,AIMAX
        ,AIFLAT
        ,AITIER
        ,AINUM
        ,AIPRT0
        ,AICHG1
        ,AICTR2
        ,AICHG2
        ,AICTR3
        ,AICHG3
        ,AICTR4
        ,AICHG4
        ,AICTR5
        ,AICHG5
        ,WAIVEFEE
        ,WVEXPDT6
        ,WVEXPDT7
        ,EXBEGDT6
        ,EXBEGDT7
        ,EXENDDT6
        ,EXENDDT7
        ,RECURITM
        ,RCEXPDT6
        ,RCEXPDT7
        ,HSCHARGE
        ,STATOCUR
        ,CTDIFREE
        ,AILEVEL
        ,AADSCAMT
        ,AADSCPRC
        ,AADSCEXP
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) as YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_ddalis_t"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data