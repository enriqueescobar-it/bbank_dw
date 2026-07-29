-- Databricks SQL for source: jh_ddaat1
-- Generated from sqlserver_brz/brz-jh_ddaat1.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_DDAAT1"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_ddaat1 (
    `ATBAT` STRING,
    `ATSEQ` STRING,
    `ACCTNO` INT,
    `ACTYPE` INT,
    `ATITEM` STRING,
    `ATCTR` STRING,
    `ATCHG` DECIMAL(38,10),
    `ATDAT6` STRING,
    `ATDAT7` STRING,
    `ATCLSCHG` DECIMAL(38,10),
    `HSCHARGE` STRING,
    `STATOCUR` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_ddaat1 IS
'The JH DDAAT1 landing table captures demand deposit account transaction and attribute reference fields from Jack Henry for DDA validation and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_ddaat1;

INSERT INTO landing_jh.default.jh_ddaat1 (
    `ATBAT`, `ATSEQ`, `ACCTNO`, `ACTYPE`, `ATITEM`, `ATCTR`,
    `ATCHG`, `ATDAT6`, `ATDAT7`, `ATCLSCHG`, `HSCHARGE`, `STATOCUR`,
    `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('ATBAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `ATBAT`,
    concat('ATSEQ_', lpad(CAST(idx AS STRING), 2, '0')) AS `ATSEQ`,
    idx AS `ACCTNO`,
    idx AS `ACTYPE`,
    concat('ATITEM_', lpad(CAST(idx AS STRING), 2, '0')) AS `ATITEM`,
    concat('ATCTR_', lpad(CAST(idx AS STRING), 2, '0')) AS `ATCTR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `ATCHG`,
    concat('ATDAT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `ATDAT6`,
    concat('ATDAT7_', lpad(CAST(idx AS STRING), 2, '0')) AS `ATDAT7`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `ATCLSCHG`,
    concat('HSCHARGE_', lpad(CAST(idx AS STRING), 2, '0')) AS `HSCHARGE`,
    concat('STATOCUR_', lpad(CAST(idx AS STRING), 2, '0')) AS `STATOCUR`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_ddaat1' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_ddaat1;
