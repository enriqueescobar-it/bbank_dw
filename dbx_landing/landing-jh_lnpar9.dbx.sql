-- Databricks SQL for source: jh_lnpar9
-- Generated from sqlserver/brz-jh_lnpar9.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_LNPAR9"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_lnpar9 (
    `LP9PUR` STRING,
    `LP9DES` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_lnpar9 IS
'The JH_LNPAR9 landing table captures Jack Henry loan account, transaction, position, payment, collateral, rate, date, and balance attributes for loan validation, reconciliation, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_lnpar9;

INSERT INTO landing_jh.default.jh_lnpar9 (
    `LP9PUR`, `LP9DES`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('LP9PUR_', lpad(CAST(idx AS STRING), 2, '0')) AS `LP9PUR`,
    concat('LP9DES_', lpad(CAST(idx AS STRING), 2, '0')) AS `LP9DES`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_lnpar9' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_lnpar9;
