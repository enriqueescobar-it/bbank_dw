-- Databricks SQL for source: jh_cfpard
-- Generated from sqlserver_brz/brz-jh_cfpard.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFPARD"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cfpard (
    `APPCOD` STRING,
    `APPDES` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cfpard IS
'The JH customer parameter landing table captures customer reference codes and descriptions from Jack Henry for classification, validation, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_cfpard;

INSERT INTO landing_jh.default.jh_cfpard (
    `APPCOD`, `APPDES`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('APPCOD_', lpad(CAST(idx AS STRING), 2, '0')) AS `APPCOD`,
    concat('APPDES_', lpad(CAST(idx AS STRING), 2, '0')) AS `APPDES`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cfpard' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cfpard;
