-- Databricks SQL for source: jh_br00014
-- Generated from sqlserver_brz/brz-jh_br00014.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_BR00014"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_br00014 (
    `PROGRAM` STRING,
    `ACTYPE` STRING,
    `TRCODE` STRING,
    `TYPE` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_br00014 IS
'The JH BR00014 landing table captures Jack Henry branch program, account type, transaction code, and transaction type reference data for transaction classification, validation, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_br00014;

INSERT INTO landing_jh.default.jh_br00014 (
    `PROGRAM`, `ACTYPE`, `TRCODE`, `TYPE`, `AsOfDate`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    concat('PROGRAM_', lpad(CAST(idx AS STRING), 2, '0')) AS `PROGRAM`,
    concat('ACTYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACTYPE`,
    concat('TRCODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRCODE`,
    concat('TYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `TYPE`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_br00014' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_br00014;
