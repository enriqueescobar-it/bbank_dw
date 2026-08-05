-- Databricks SQL for source: jh_lnpdue
-- Generated from sqlserver_brz/brz-jh_lnpdue.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_LNPDUE"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_lnpdue (
    `ACCTNO` INT,
    `ACTYPE` INT,
    `CIFNO` INT,
    `PDDAYS` STRING,
    `BR__CS` STRING,
    `OFFCR` STRING,
    `TYPE` STRING,
    `NPDT6` STRING,
    `NPDT` STRING,
    `DEPTCD` STRING,
    `COLCOD` STRING,
    `DLRNO` INT,
    `INVNO` INT,
    `PARTID` STRING,
    `PCACC__CS` STRING,
    `CLACC__CS` STRING,
    `CLCODE` STRING,
    `CALREP` STRING,
    `GROUP__CS` STRING,
    `RATE` DECIMAL(38,10),
    `STATUS` STRING,
    `IBASE` STRING,
    `PMTCOD` STRING,
    `SNAME` STRING,
    `CBAL` DECIMAL(38,10),
    `LPDT6` STRING,
    `LPDT` STRING,
    `PMIAMR` STRING,
    `PMTBOA` STRING,
    `SHCOPR` STRING,
    `SHGLPR` STRING,
    `SHADOW` STRING,
    `PMTDU__CS` DECIMAL(38,10),
    `PDIREP` STRING,
    `PDIHIS` STRING,
    `PDIRTC` STRING,
    `PDIN` STRING,
    `PDINS` STRING,
    `PDIPRN` STRING,
    `PDIINT` DECIMAL(38,10),
    `PDIESC` STRING,
    `PDILC` STRING,
    `PDIOTH` STRING,
    `PDITOT` STRING,
    `PDDAYSREG` STRING,
    `PMTDUREG__CS` DECIMAL(38,10),
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_lnpdue IS
'The JH_LNPDUE landing table captures Jack Henry loan account, transaction, position, payment, collateral, rate, date, and balance attributes for loan validation, reconciliation, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_lnpdue;

INSERT INTO landing_jh.default.jh_lnpdue (
    `ACCTNO`, `ACTYPE`, `CIFNO`, `PDDAYS`, `BR__CS`, `OFFCR`,
    `TYPE`, `NPDT6`, `NPDT`, `DEPTCD`, `COLCOD`, `DLRNO`,
    `INVNO`, `PARTID`, `PCACC__CS`, `CLACC__CS`, `CLCODE`, `CALREP`,
    `GROUP__CS`, `RATE`, `STATUS`, `IBASE`, `PMTCOD`, `SNAME`,
    `CBAL`, `LPDT6`, `LPDT`, `PMIAMR`, `PMTBOA`, `SHCOPR`,
    `SHGLPR`, `SHADOW`, `PMTDU__CS`, `PDIREP`, `PDIHIS`, `PDIRTC`,
    `PDIN`, `PDINS`, `PDIPRN`, `PDIINT`, `PDIESC`, `PDILC`,
    `PDIOTH`, `PDITOT`, `PDDAYSREG`, `PMTDUREG__CS`, `AsOfDate`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    idx AS `ACCTNO`,
    idx AS `ACTYPE`,
    idx AS `CIFNO`,
    concat('PDDAYS_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDDAYS`,
    concat('BR__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `BR__CS`,
    concat('OFFCR_', lpad(CAST(idx AS STRING), 2, '0')) AS `OFFCR`,
    concat('TYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `TYPE`,
    concat('NPDT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `NPDT6`,
    concat('NPDT_', lpad(CAST(idx AS STRING), 2, '0')) AS `NPDT`,
    concat('DEPTCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `DEPTCD`,
    concat('COLCOD_', lpad(CAST(idx AS STRING), 2, '0')) AS `COLCOD`,
    idx AS `DLRNO`,
    idx AS `INVNO`,
    concat('PARTID_', lpad(CAST(idx AS STRING), 2, '0')) AS `PARTID`,
    concat('PCACC__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `PCACC__CS`,
    concat('CLACC__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CLACC__CS`,
    concat('CLCODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `CLCODE`,
    concat('CALREP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CALREP`,
    concat('GROUP__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `GROUP__CS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RATE`,
    concat('STATUS_', lpad(CAST(idx AS STRING), 2, '0')) AS `STATUS`,
    concat('IBASE_', lpad(CAST(idx AS STRING), 2, '0')) AS `IBASE`,
    concat('PMTCOD_', lpad(CAST(idx AS STRING), 2, '0')) AS `PMTCOD`,
    concat('SNAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `SNAME`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CBAL`,
    concat('LPDT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `LPDT6`,
    concat('LPDT_', lpad(CAST(idx AS STRING), 2, '0')) AS `LPDT`,
    concat('PMIAMR_', lpad(CAST(idx AS STRING), 2, '0')) AS `PMIAMR`,
    concat('PMTBOA_', lpad(CAST(idx AS STRING), 2, '0')) AS `PMTBOA`,
    concat('SHCOPR_', lpad(CAST(idx AS STRING), 2, '0')) AS `SHCOPR`,
    concat('SHGLPR_', lpad(CAST(idx AS STRING), 2, '0')) AS `SHGLPR`,
    concat('SHADOW_', lpad(CAST(idx AS STRING), 2, '0')) AS `SHADOW`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PMTDU__CS`,
    concat('PDIREP_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDIREP`,
    concat('PDIHIS_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDIHIS`,
    concat('PDIRTC_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDIRTC`,
    concat('PDIN_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDIN`,
    concat('PDINS_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDINS`,
    concat('PDIPRN_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDIPRN`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PDIINT`,
    concat('PDIESC_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDIESC`,
    concat('PDILC_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDILC`,
    concat('PDIOTH_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDIOTH`,
    concat('PDITOT_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDITOT`,
    concat('PDDAYSREG_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDDAYSREG`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PMTDUREG__CS`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_lnpdue' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_lnpdue;
