-- Databricks SQL for source: jh_cfpar1
-- Generated from sqlserver/brz-jh_cfpar1.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFPAR1"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cfpar1 (
    `CP1REL` STRING,
    `CP1DSC` STRING,
    `CP1TYP` STRING,
    `CP1VAL` STRING,
    `CP1LLB` STRING,
    `CP1TXT` STRING,
    `CP1RGP` STRING,
    `CP1ADR` STRING,
    `CP1ALR` STRING,
    `CP1PDN` STRING,
    `CP1STR` STRING,
    `CP1OWN` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cfpar1 IS
'The JH customer parameter landing table captures customer reference codes and descriptions from Jack Henry for classification, validation, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_cfpar1;

INSERT INTO landing_jh.default.jh_cfpar1 (
    `CP1REL`, `CP1DSC`, `CP1TYP`, `CP1VAL`, `CP1LLB`, `CP1TXT`,
    `CP1RGP`, `CP1ADR`, `CP1ALR`, `CP1PDN`, `CP1STR`, `CP1OWN`,
    `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CP1REL_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1REL`,
    concat('CP1DSC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1DSC`,
    concat('CP1TYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1TYP`,
    concat('CP1VAL_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1VAL`,
    concat('CP1LLB_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1LLB`,
    concat('CP1TXT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1TXT`,
    concat('CP1RGP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1RGP`,
    concat('CP1ADR_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1ADR`,
    concat('CP1ALR_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1ALR`,
    concat('CP1PDN_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1PDN`,
    concat('CP1STR_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1STR`,
    concat('CP1OWN_', lpad(CAST(idx AS STRING), 2, '0')) AS `CP1OWN`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cfpar1' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cfpar1;
