-- Databricks SQL for source: jh_ddpar4
-- Generated from sqlserver_brz/brz-jh_ddpar4.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_DDPAR4"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_ddpar4 (
    `DP4STS` STRING,
    `DP4DSC` STRING,
    `DP4DSS` STRING,
    `DP4TXT` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_ddpar4 IS
'The JH demand deposit parameter landing table captures DDA product, transaction, service charge, and account reference attributes for validation, classification, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_ddpar4;

INSERT INTO landing_jh.default.jh_ddpar4 (
    `DP4STS`, `DP4DSC`, `DP4DSS`, `DP4TXT`, `AsOfDate`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    concat('DP4STS_', lpad(CAST(idx AS STRING), 2, '0')) AS `DP4STS`,
    concat('DP4DSC_', lpad(CAST(idx AS STRING), 2, '0')) AS `DP4DSC`,
    concat('DP4DSS_', lpad(CAST(idx AS STRING), 2, '0')) AS `DP4DSS`,
    concat('DP4TXT_', lpad(CAST(idx AS STRING), 2, '0')) AS `DP4TXT`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_ddpar4' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_ddpar4;
