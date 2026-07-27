-- NAME: BRONZE_JH_LNPDUE
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: March 05, 2025




WITH landing_data AS (
    SELECT
        ACCTNO
        ,ACTYPE
        ,CIFNO
        ,PDDAYS
        ,BR__CS
        ,OFFCR
        ,[TYPE]
        ,NPDT6
        ,NPDT
        ,DEPTCD
        ,COLCOD
        ,DLRNO
        ,INVNO
        ,PARTID
        ,PCACC__CS
        ,CLACC__CS
        ,CLCODE
        ,CALREP
        ,GROUP__CS
        ,RATE
        ,[STATUS]
        ,IBASE
        ,PMTCOD
        ,SNAME
        ,CBAL
        ,LPDT6
        ,LPDT
        ,PMIAMR
        ,PMTBOA
        ,SHCOPR
        ,SHGLPR
        ,SHADOW
        ,PMTDU__CS
        ,PDIREP
        ,PDIHIS
        ,PDIRTC
        ,PDIN
        ,PDINS
        ,PDIPRN
        ,PDIINT
        ,PDIESC
        ,PDILC
        ,PDIOTH
        ,PDITOT
        ,PDDAYSREG
        ,PMTDUREG__CS
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) AS AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_LNPDUE"
),

bronze_data AS (
    SELECT
        ACCTNO
        ,ACTYPE
        ,CIFNO
        ,PDDAYS
        ,BR__CS
        ,OFFCR
        ,[TYPE]
        ,NPDT6
        ,NPDT
        ,DEPTCD
        ,COLCOD
        ,DLRNO
        ,INVNO
        ,PARTID
        ,PCACC__CS
        ,CLACC__CS
        ,CLCODE
        ,CALREP
        ,GROUP__CS
        ,RATE
        ,[STATUS]
        ,IBASE
        ,PMTCOD
        ,SNAME
        ,CBAL
        ,LPDT6
        ,LPDT
        ,PMIAMR
        ,PMTBOA
        ,SHCOPR
        ,SHGLPR
        ,SHADOW
        ,PMTDU__CS
        ,PDIREP
        ,PDIHIS
        ,PDIRTC
        ,PDIN
        ,PDINS
        ,PDIPRN
        ,PDIINT
        ,PDIESC
        ,PDILC
        ,PDIOTH
        ,PDITOT
        ,PDDAYSREG
        ,PMTDUREG__CS
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6),AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_lnpdue"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data