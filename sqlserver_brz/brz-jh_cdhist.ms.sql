-- NAME: BRONZE_JH_CDHIST
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        CHACCT
        ,CHATYP
        ,CHTRAN
        ,CHDORC
        ,CHAFFT
        ,CHPSTD
        ,CHPST6
        ,CHEFDT
        ,CHEFD6
        ,CHAMT
        ,CHBAT__CS
        ,CHSEQ__CS
        ,CHSERL
        ,CHSRC
        ,CHISRC
        ,CHORAT
        ,CHNRAT
        ,IMAGE__CS
        ,ACFILK
        ,ACBATN
        ,ACSEQN
        ,CHUSER
        ,CHJXPD
        ,CHJXVD
        ,TRCLOSEDRS
        ,AC5CED
        ,AC5COM
        ,CHMREM
        ,dbo.ConvertJhDateJulianToDatetime(CHPSTD) as PostingDate
        ,dbo.ConvertJhDateJulianToDatetime(CHEFDT) as EffectiveDate
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7)) FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), dbo.ConvertJhDateJulianToDatetime(CHEFDT), 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_CDHIST"
),

bronze_data AS (
    SELECT
        CHACCT
        ,CHATYP
        ,CHTRAN
        ,CHDORC
        ,CHAFFT
        ,CHPSTD
        ,CHPST6
        ,CHEFDT
        ,CHEFD6
        ,CHAMT
        ,CHBAT__CS
        ,CHSEQ__CS
        ,CHSERL
        ,CHSRC
        ,CHISRC
        ,CHORAT
        ,CHNRAT
        ,IMAGE__CS
        ,ACFILK
        ,ACBATN
        ,ACSEQN
        ,CHUSER
        ,CHJXPD
        ,CHJXVD
        ,TRCLOSEDRS
        ,AC5CED
        ,AC5COM
        ,CHMREM
        ,PostingDate
        ,EffectiveDate
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
)

SELECT * FROM bronze_data