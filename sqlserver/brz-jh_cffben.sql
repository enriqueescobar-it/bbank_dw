-- NAME: BRONZE_JH_CFFBEN
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: February 26, 2026



WITH landing_data AS (
    SELECT
	    ECIFNO,
        OIDNO,
        OIDTYPE,
        OCIFNO,
        OWNTYP,
        OWNPCT,
        OTITLE,
        OIDCTRY,
        CAST(NULLIF(OBIRDATE, '0001-01-01') AS DATE) AS OBIRDATE,
        CAST(NULLIF(OREMDATE, '0001-01-01') AS DATE) AS OREMDATE,
        OCFFORN,
        OCFNA1,
        OCFNA2,
        OCFNA3,
        OCFNA4,
        OCFCITY,
        OCFSTAT,
        OCFZIP,
        OCFZIPD,
        OCFFORC,
        (SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
	        FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate,
        NULL AS YEARMONTH,
        LOADED_AT
    FROM
    	"DQP_LANDING"."dbo"."JH_CFFBEN"
),

bronze_data AS (
    SELECT
	    ECIFNO,
        OIDNO,
        OIDTYPE,
        OCIFNO,
        OWNTYP,
        OWNPCT,
        OTITLE,
        OIDCTRY,
        OBIRDATE,
        OREMDATE,
        OCFFORN,
        OCFNA1,
        OCFNA2,
        OCFNA3,
        OCFNA4,
        OCFCITY,
        OCFSTAT,
        OCFZIP,
        OCFZIPD,
        OCFFORC,
        AsOfDate,
        CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) as YEARMONTH,
        GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE AsOfDate NOT IN (SELECT DISTINCT AsOfDate FROM "DQP_BRONZE"."dbo"."bronze_jh_cffben")
    
)





SELECT * FROM bronze_data