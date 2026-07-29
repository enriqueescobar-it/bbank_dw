-- Databricks SQL for source: jh_cfcrgp
-- Generated from sqlserver_brz/brz-jh_cfcrgp.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFCRGP"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cfcrgp (
    `CFCGRP` STRING,
    `CFCCIF` STRING,
    `CFCTYP` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cfcrgp IS
'The JH CFCRGP landing table captures customer group and classification reference attributes from Jack Henry for customer segmentation validation and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_cfcrgp;

INSERT INTO landing_jh.default.jh_cfcrgp (
    `CFCGRP`, `CFCCIF`, `CFCTYP`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CFCGRP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCGRP`,
    concat('CFCCIF_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCCIF`,
    concat('CFCTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCTYP`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cfcrgp' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cfcrgp;
