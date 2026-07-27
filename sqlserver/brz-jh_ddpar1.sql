-- NAME: BRONZE_JH_DDPAR1
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        RECID
        ,LASTDT
        ,POSTDT
        ,NEXTDT
        ,LASTD7
        ,POSTD7
        ,NEXTD7
        ,RUNSTM
        ,ACCRDA
        ,CHEKDT
        ,CHEKD7
        ,DDEOMD
        ,NOPDAY
        ,ODPANS
        ,DATOPT
        ,PAYOPT
        -- ,DATEADD(DAY,(LASTD7 % 1000) -1,CONVERT(DATETIME,'01/01/' + LEFT(LASTD7,4) )) LastDate
        -- ,DATEADD(DAY,(POSTD7 % 1000) -1,CONVERT(DATETIME,'01/01/' + LEFT(POSTD7,4) )) PostingDate
        -- ,DATEADD(DAY,(NEXTD7 % 1000) -1,CONVERT(DATETIME,'01/01/' + LEFT(NEXTD7,4) )) NextBusinessDate
        ,dbo.ConvertJhDateJulianToDatetime(LASTD7) as LastDate
        ,dbo.ConvertJhDateJulianToDatetime(POSTD7) as PostingDate
        ,dbo.ConvertJhDateJulianToDatetime(NEXTD7) as NextBusinessDate
        ,CONVERT(INT, CONVERT(nvarchar(6), LOADED_AT, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_DDPAR1"
)

SELECT * FROM landing_data