-- Databricks SQL for source: jh_axidmiav
-- Generated from sqlserver/brz-jh_axidmiav.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_AXIDMIAV"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_axidmiav (
    `ASOFDATE` INT,
    `ACCTNO` STRING,
    `ACTYPE` STRING,
    `AGGR` STRING,
    `AVERAGE` DECIMAL(38,10),
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_axidmiav IS
'The JH AXIDMIAV landing table captures account-level daily aggregate and average balance values with as-of date and account type attributes from Jack Henry for balance validation, reconciliation, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_axidmiav;

INSERT INTO landing_jh.default.jh_axidmiav (
    `ASOFDATE`, `ACCTNO`, `ACTYPE`, `AGGR`, `AVERAGE`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    1012026 + idx - 1 AS `ASOFDATE`,
    concat('ACCTNO_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACCTNO`,
    concat('ACTYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACTYPE`,
    concat('AGGR_', lpad(CAST(idx AS STRING), 2, '0')) AS `AGGR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AVERAGE`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_axidmiav' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_axidmiav;
