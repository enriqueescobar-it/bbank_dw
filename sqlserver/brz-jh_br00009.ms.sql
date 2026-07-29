-- NAME: BRONZE_JH_BR00009
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
         CUSRECID
        ,ACCTNO
        ,ACTYPE
        ,STATUS
        ,CFBNKN
        ,BRANCH
        ,GLPROD
        ,CIFNO
        ,BBDCUST
        ,OFFICR
        ,DATOP8
        ,DTCLS8
        ,MATDT8
        ,CBAL
        ,CBALDATE
        ,AVERAGE
        ,AVERDATE
        ,NEWMONEY
        ,REVENUMTD
        ,PROFITABI
        ,REFERFLAG
        ,REFERRAID
        ,ACCMNINTIN
        ,ACCMBBDBRA
        ,ACCMINTERE
        ,ACCMFTP
        ,ACCMNETINT
        ,ACCMNINTEX
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
FROM
    "DQP_LANDING"."dbo"."JH_BR00009"
),

bronze_data AS (
    SELECT
        CUSRECID
        ,ACCTNO
        ,ACTYPE
        ,STATUS
        ,CFBNKN
        ,BRANCH
        ,GLPROD
        ,CIFNO
        ,BBDCUST
        ,OFFICR
        ,DATOP8
        ,DTCLS8
        ,MATDT8
        ,CBAL
        ,CBALDATE
        ,AVERAGE
        ,AVERDATE
        ,NEWMONEY
        ,REVENUMTD
        ,PROFITABI
        ,REFERFLAG
        ,REFERRAID
        ,ACCMNINTIN
        ,ACCMBBDBRA
        ,ACCMINTERE
        ,ACCMFTP
        ,ACCMNETINT
        ,ACCMNINTEX
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), DATEADD("m", -1, LOADED_AT), 112)) as YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_br00009"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data