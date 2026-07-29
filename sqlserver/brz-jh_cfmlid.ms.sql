-- NAME: BRONZE_JH_CFMLID
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: December 29, 2025



WITH landing_data AS (
    SELECT
        CFCIF__CS,
        CFIDCD,
        CFIDNO,
        CFPLIS,
        CFIISD6,
        CFIISD7,
        CFIEXD6,
        CFIEXD7,
        CFICTD6,
        CFICTD7,
        CFVRYCD,
        CFVTXST,
        CONVERT(DATE, dqp_bronze.dbo.ConvertJhDateJulianToDatetime(CFIISD7)) as ExpirationDate,
        CASE
            WHEN CFIEXD7 < 0 OR CFIEXD7 = 0 THEN NULL
            ELSE
                CONVERT(
                    DATE,
                    DATEADD(
                        DAY,
                        (CFIEXD7 % 1000) - 1,
                        CONVERT(DATE, '01/01/' + LEFT(CFIEXD7, 4))
                    )
                )
        END AS IssuanceDate,
        CONVERT(DATE, dqp_bronze.dbo.ConvertJhDateJulianToDatetime(CFICTD7)) as ContactDate,
        (
            SELECT CONVERT(
                DATE,
                dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7)
            )
            FROM dqp_landing.dbo.jh_ddpar1
        ) as AsOfDate,
        NULL as YEARMONTH,
        LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_CFMLID"
),

bronze_data AS (
    SELECT
        CFCIF__CS,
        CFIDCD,
        CFIDNO,
        CFPLIS,
        CFIISD6,
        CFIISD7,
        CFIEXD6,
        CFIEXD7,
        CFICTD6,
        CFICTD7,
        CFVRYCD,
        CFVTXST,
        ExpirationDate,
        IssuanceDate,
        ContactDate,
        AsOfDate,
        CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) AS YEARMONTH,
        GETUTCDATE() LOADED_AT
    FROM landing_data
    
        WHERE AsOfDate NOT IN (SELECT DISTINCT AsOfDate FROM "DQP_BRONZE"."dbo"."bronze_jh_cfmlid")
    
)





SELECT * FROM bronze_data