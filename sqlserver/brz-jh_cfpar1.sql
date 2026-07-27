-- NAME: BRONZE_JH_CFPAR1
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        CP1REL
        ,CP1DSC
        ,CP1TYP
        ,CP1VAL
        ,CP1LLB
        ,CP1TXT
        ,CP1RGP
        ,CP1ADR
        ,CP1ALR
        ,CP1PDN
        ,CP1STR
        ,CP1OWN
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) AS AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_CFPAR1"
),

bronze_data AS (
    SELECT
        CP1REL
        ,CP1DSC
        ,CP1TYP
        ,CP1VAL
        ,CP1LLB
        ,CP1TXT
        ,CP1RGP
        ,CP1ADR
        ,CP1ALR
        ,CP1PDN
        ,CP1STR
        ,CP1OWN
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6),AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_cfpar1"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data