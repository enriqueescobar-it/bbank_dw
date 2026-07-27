-- Databricks SQL for source: jh_cfparg
-- Generated from sqlserver/brz-jh_cfparg.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFPARG"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cfparg (
    `CPGRP__CS` STRING,
    `CPGRPD` STRING,
    `CPGOF1` STRING,
    `CPGOF2` STRING,
    `CPGBR__CS` STRING,
    `CPGCIF` STRING,
    `CPGRTCD` STRING,
    `CPGTYP` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cfparg IS
'The JH customer parameter landing table captures customer reference codes and descriptions from Jack Henry for classification, validation, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_cfparg;

INSERT INTO landing_jh.default.jh_cfparg (
    `CPGRP__CS`, `CPGRPD`, `CPGOF1`, `CPGOF2`, `CPGBR__CS`, `CPGCIF`,
    `CPGRTCD`, `CPGTYP`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CPGRP__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CPGRP__CS`,
    concat('CPGRPD_', lpad(CAST(idx AS STRING), 2, '0')) AS `CPGRPD`,
    concat('CPGOF1_', lpad(CAST(idx AS STRING), 2, '0')) AS `CPGOF1`,
    concat('CPGOF2_', lpad(CAST(idx AS STRING), 2, '0')) AS `CPGOF2`,
    concat('CPGBR__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CPGBR__CS`,
    concat('CPGCIF_', lpad(CAST(idx AS STRING), 2, '0')) AS `CPGCIF`,
    concat('CPGRTCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `CPGRTCD`,
    concat('CPGTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CPGTYP`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cfparg' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cfparg;
