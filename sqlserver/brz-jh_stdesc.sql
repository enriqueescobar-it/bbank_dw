-- NAME: BRONZE_JH_STDESC
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: Full Load
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        DSRID
        ,DSCOD
        ,DSKEY
        ,DSDS1
        ,DSDS2
        ,DSDS3
        ,DSSTA
        ,DSSTK
        ,DSBAT
        ,DSSEQ
        ,DSSER
        ,DSROU
        ,DSACT
        ,DSTYP
        ,DSDC
        ,DSBOR
        ,DSPSQ
        ,DSTRN
        ,DSAMT
        ,DSRCE
        ,dbo.ConvertJhDateJulianToDatetime(DSEFFD) AS DSEFFD
        ,DSEFF6
        ,dbo.ConvertJhDateJulianToDatetime(DSTRAD) AS DSTRAD
        ,DSTRA6
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM "DQP_LANDING"."dbo"."JH_STDESC"
),

bronze_data as (
    SELECT
        DSRID
        ,DSCOD
        ,DSKEY
        ,DSDS1
        ,DSDS2
        ,DSDS3
        ,DSSTA
        ,DSSTK
        ,DSBAT
        ,DSSEQ
        ,DSSER
        ,DSROU
        ,DSACT
        ,DSTYP
        ,DSDC
        ,DSBOR
        ,DSPSQ
        ,DSTRN
        ,DSAMT
        ,DSRCE
        ,DSEFFD
        ,DSEFF6
        ,DSTRAD
        ,DSTRA6
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
)





SELECT * FROM bronze_data
