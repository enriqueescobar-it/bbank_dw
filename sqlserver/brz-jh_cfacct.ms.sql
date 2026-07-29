-- NAME: BRONZE_JH_CFACCT
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        CFACID
        ,CFCIF__CS
        ,CFATYP
        ,CFACC__CS
        ,CFSNME
        ,CFRELA
        ,CFNOTC
        ,CFANOS
        ,CFADLM
        ,CFADL6
        ,CFAPCT
        ,CFAMAX
        ,CFCAT
        ,CFINS
        ,CFMRG
        ,CFMRG6
        ,CFMRG7
        ,CFBEN
        ,CFPOWN
        ,CFRPDN
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) AS AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_CFACCT"
),

bronze_data AS (
    SELECT
        CFACID
        ,CFCIF__CS
        ,CFATYP
        ,CFACC__CS
        ,CFSNME
        ,CFRELA
        ,CFNOTC
        ,CFANOS
        ,CFADLM
        ,CFADL6
        ,CFAPCT
        ,CFAMAX
        ,CFCAT
        ,CFINS
        ,CFMRG
        ,CFMRG6
        ,CFMRG7
        ,CFBEN
        ,CFPOWN
        ,CFRPDN
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6),AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() LOADED_AT
        FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_cfacct"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data