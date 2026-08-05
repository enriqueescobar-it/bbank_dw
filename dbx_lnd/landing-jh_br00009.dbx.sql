-- Databricks SQL for source: jh_br00009
-- Generated from sqlserver_brz/brz-jh_br00009.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_BR00009"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_br00009 (
    `CUSRECID` STRING,
    `ACCTNO` INT,
    `ACTYPE` STRING,
    `STATUS` STRING,
    `CFBNKN` STRING,
    `BRANCH` STRING,
    `GLPROD` STRING,
    `CIFNO` INT,
    `BBDCUST` STRING,
    `OFFICR` STRING,
    `DATOP8` STRING,
    `DTCLS8` STRING,
    `MATDT8` STRING,
    `CBAL` DECIMAL(38,10),
    `CBALDATE` DECIMAL(38,10),
    `AVERAGE` DECIMAL(38,10),
    `AVERDATE` STRING,
    `NEWMONEY` DECIMAL(38,10),
    `REVENUMTD` DECIMAL(38,10),
    `PROFITABI` DECIMAL(38,10),
    `REFERFLAG` STRING,
    `REFERRAID` STRING,
    `ACCMNINTIN` DECIMAL(38,10),
    `ACCMBBDBRA` STRING,
    `ACCMINTERE` STRING,
    `ACCMFTP` STRING,
    `ACCMNETINT` DECIMAL(38,10),
    `ACCMNINTEX` DECIMAL(38,10),
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_br00009 IS
'The JH BR00009 landing table captures branch and account profitability attributes, including account status, officer, balances, average balances, new money, revenue, profitability, referral, and interest metrics for operational reporting and reconciliation.';

TRUNCATE TABLE landing_jh.default.jh_br00009;

INSERT INTO landing_jh.default.jh_br00009 (
    `CUSRECID`, `ACCTNO`, `ACTYPE`, `STATUS`, `CFBNKN`, `BRANCH`,
    `GLPROD`, `CIFNO`, `BBDCUST`, `OFFICR`, `DATOP8`, `DTCLS8`,
    `MATDT8`, `CBAL`, `CBALDATE`, `AVERAGE`, `AVERDATE`, `NEWMONEY`,
    `REVENUMTD`, `PROFITABI`, `REFERFLAG`, `REFERRAID`, `ACCMNINTIN`, `ACCMBBDBRA`,
    `ACCMINTERE`, `ACCMFTP`, `ACCMNETINT`, `ACCMNINTEX`, `AsOfDate`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    concat('CUSRECID_', lpad(CAST(idx AS STRING), 2, '0')) AS `CUSRECID`,
    idx AS `ACCTNO`,
    concat('ACTYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACTYPE`,
    concat('STATUS_', lpad(CAST(idx AS STRING), 2, '0')) AS `STATUS`,
    concat('CFBNKN_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFBNKN`,
    concat('BRANCH_', lpad(CAST(idx AS STRING), 2, '0')) AS `BRANCH`,
    concat('GLPROD_', lpad(CAST(idx AS STRING), 2, '0')) AS `GLPROD`,
    idx AS `CIFNO`,
    concat('BBDCUST_', lpad(CAST(idx AS STRING), 2, '0')) AS `BBDCUST`,
    concat('OFFICR_', lpad(CAST(idx AS STRING), 2, '0')) AS `OFFICR`,
    concat('DATOP8_', lpad(CAST(idx AS STRING), 2, '0')) AS `DATOP8`,
    concat('DTCLS8_', lpad(CAST(idx AS STRING), 2, '0')) AS `DTCLS8`,
    concat('MATDT8_', lpad(CAST(idx AS STRING), 2, '0')) AS `MATDT8`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CBAL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CBALDATE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AVERAGE`,
    concat('AVERDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `AVERDATE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `NEWMONEY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `REVENUMTD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PROFITABI`,
    concat('REFERFLAG_', lpad(CAST(idx AS STRING), 2, '0')) AS `REFERFLAG`,
    concat('REFERRAID_', lpad(CAST(idx AS STRING), 2, '0')) AS `REFERRAID`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `ACCMNINTIN`,
    concat('ACCMBBDBRA_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACCMBBDBRA`,
    concat('ACCMINTERE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACCMINTERE`,
    concat('ACCMFTP_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACCMFTP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `ACCMNETINT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `ACCMNINTEX`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_br00009' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_br00009;
