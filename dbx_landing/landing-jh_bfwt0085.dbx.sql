-- Databricks SQL for source: jh_bfwt0085
-- Generated from sqlserver_brz/brz-jh_bfwt0085.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_BFWT0085"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_bfwt0085 (
    `WTACT` STRING,
    `WTAMOUNT` DECIMAL(38,10),
    `WTFEE` DECIMAL(38,10),
    `WTCOUNT` INT,
    `WTFEEACT` DECIMAL(38,10),
    `WTRANDATE` STRING,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_bfwt0085 IS
'The JH BFWT0085 landing table captures wire transfer account, amount, fee, count, fee account, transaction date, and load metadata from Jack Henry for wire activity validation and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_bfwt0085;

INSERT INTO landing_jh.default.jh_bfwt0085 (
    `WTACT`, `WTAMOUNT`, `WTFEE`, `WTCOUNT`, `WTFEEACT`, `WTRANDATE`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('WTACT_', lpad(CAST(idx AS STRING), 2, '0')) AS `WTACT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `WTAMOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `WTFEE`,
    idx AS `WTCOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `WTFEEACT`,
    concat('WTRANDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `WTRANDATE`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_bfwt0085' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_bfwt0085;
