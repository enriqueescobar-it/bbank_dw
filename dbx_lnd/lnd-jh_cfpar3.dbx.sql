-- Databricks SQL for source: jh_cfpar3
-- Generated from sqlserver_brz/brz-jh_cfpar3.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFPAR3"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cfpar3 (
    `CP3RID` STRING,
    `CP3UIC` STRING,
    `CP3UID` STRING,
    `CP3UCD` STRING,
    `CP3DSC` STRING,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cfpar3 IS
'The JH customer parameter landing table captures customer reference codes and descriptions from Jack Henry for classification, validation, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_cfpar3;

INSERT INTO landing_jh.default.jh_cfpar3 (
    `CP3RID`, `CP3UIC`, `CP3UID`, `CP3UCD`, `CP3DSC`, `LOADED_AT`
)
SELECT
    concat('CP3RID_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP3RID`,
    concat('CP3UIC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP3UIC`,
    concat('CP3UID_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP3UID`,
    concat('CP3UCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP3UCD`,
    concat('CP3DSC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP3DSC`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cfpar3' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cfpar3;
