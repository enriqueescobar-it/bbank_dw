-- Databricks SQL for source: jh_bfgp0087
-- Generated from sqlserver/brz-jh_bfgp0087.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_BFGP0087"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_bfgp0087 (
    `ASOFDATE` STRING,
    `ACCTNO` INT,
    `CIFNO` INT,
    `ACTYPE` STRING,
    `TCBAL` DECIMAL(38,10),
    `TDAYCBAL` DECIMAL(38,10),
    `DAYSM` INT,
    `AVERAGE` DECIMAL(38,10),
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_bfgp0087 IS
'The JH BFGP0087 landing table captures account, customer, balance, daily balance, days maintained, and average balance attributes from Jack Henry for monthly balance validation, reconciliation, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_bfgp0087;

INSERT INTO landing_jh.default.jh_bfgp0087 (
    `ASOFDATE`, `ACCTNO`, `CIFNO`, `ACTYPE`, `TCBAL`, `TDAYCBAL`,
    `DAYSM`, `AVERAGE`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('ASOFDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASOFDATE`,
    idx AS `ACCTNO`,
    idx AS `CIFNO`,
    concat('ACTYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACTYPE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `TCBAL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `TDAYCBAL`,
    idx AS `DAYSM`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AVERAGE`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_bfgp0087' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_bfgp0087;
