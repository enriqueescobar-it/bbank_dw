-- NAME: BRONZE_JH_TRANSACTIONS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: January 26, 2026



WITH landing_data AS (
    SELECT
        ASTRCD,
        CONVERT(DECIMAL(18,2), ASAMTB) AS ASAMTB,
        CONVERT(DATE, ASTRDA, 101) AS ASTRDA,
        ASACCT,
        ASDESC,
        CONVERT(DECIMAL(18,2), ASAMTO) AS ASAMTO,
        ASCURC,
        ASAPCO,
        ASTIME,
        ASORGI,
        ASTOBK,
        ASTIBK,
        ASTBBK,
        ASBENE,
        ASTRCO,
        ASORDE,
        ASTRDE,
        CONVERT(DATE, ASTVDA, 101) AS ASTVDA,
        ASTBNK,
        ASIBAN,
        ASCNTR,
        (
            SELECT
                CONVERT(
                    DATE,
                    dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7)
                )
            FROM "DQP_LANDING"."dbo"."JH_DDPAR1"
        ) AS AsOfDate
    FROM "DQP_LANDING"."dbo"."JH_BFAS002"
),
bronze_data AS (
    SELECT
        ASTRCD,
        ASAMTB,
        ASTRDA,
        ASACCT,
        ASDESC,
        ASAMTO,
        ASCURC,
        ASAPCO,
        ASTIME,
        ASORGI,
        ASTOBK,
        ASTIBK,
        ASTBBK,
        ASBENE,
        ASTRCO,
        ASORDE,
        ASTRDE,
        ASTVDA,
        ASTBNK,
        ASIBAN,
        ASCNTR,
        AsOfDate,
        CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) AS YEARMONTH
    FROM landing_data
    
        WHERE ASTRDA > COALESCE((SELECT MAX(ASTRDA) FROM "DQP_BRONZE"."dbo"."bronze_jh_transactions"), '1970-01-01 00:00:00.000')
    
)


    


SELECT *, GETUTCDATE() AS LOADED_AT FROM bronze_data