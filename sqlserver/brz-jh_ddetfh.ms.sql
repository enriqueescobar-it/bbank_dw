-- NAME: BRONZE_JH_DDEFTH
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: June 04, 2025



WITH query_01 AS (
    SELECT
        A.EFHRID
        ,A.EFHCOD
        ,A.EFHKEY
        ,A.EFHDS1
        ,A.EFHDS2
        ,A.EFHACT
        ,A.EFHTYP
        ,A.EFHTC
        ,A.EFHAMT
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(B.TRDATE))) AS AsOfDate
        ,NULL AS YEARMONTH
        ,A.LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_DDEFTH" A
    INNER JOIN
        "DQP_BRONZE"."dbo"."bronze_jh_ddhist" B
    ON
        A.EFHKEY = B.ATMCOD
),

bronze_data AS (
    SELECT
        EFHRID
        ,EFHCOD
        ,EFHKEY
        ,EFHDS1
        ,EFHDS2
        ,EFHACT
        ,EFHTYP
        ,EFHTC
        ,EFHAMT
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) as YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM query_01
    
        WHERE AsOfDate > COALESCE((SELECT MAX(AsOfDate) FROM "DQP_BRONZE"."dbo"."bronze_jh_ddefth"),'1970-01-01 00:00:00.000')
    
)

SELECT * FROM bronze_data