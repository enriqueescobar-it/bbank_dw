-- NAME: BRONZE_JH_JHCTRY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: April 30, 2025




WITH landing_data AS (
    SELECT
        JHCNTRY
        ,JHCODEA2
        ,JHCODEA3
        ,JHCODEN3
        ,JHUPLDDAT
        ,JHUPLDUID
        ,JHUPLDWID
        ,JHCHNGUID
        ,JHCHNGWID
        ,JHCTRY_ID
        ,JHCTRYCRTS
        ,JHCTRYMNTS
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
	        FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL as YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_JHCTRY"
),

bronze_data AS (
    SELECT
        JHCNTRY
        ,JHCODEA2
        ,JHCODEA3
        ,JHCODEN3
        ,JHUPLDDAT
        ,JHUPLDUID
        ,JHUPLDWID
        ,JHCHNGUID
        ,JHCHNGWID
        ,JHCTRY_ID
        ,JHCTRYCRTS
        ,JHCTRYMNTS
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6),  AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
)

SELECT * FROM bronze_data