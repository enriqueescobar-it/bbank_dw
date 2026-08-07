-- NAME: SILVER_REFERENCETABLE_LNPDUE
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: March 05, 2025

{{
   config(
		  tags=["jh_standard"]
        )
}}

WITH bronze_data AS (
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
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_jh_lnpdue') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)
SELECT * FROM bronze_data