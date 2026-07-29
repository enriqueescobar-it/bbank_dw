-- Databricks SQL for source: jh_cffben
-- Generated from sqlserver_brz/brz-jh_cffben.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFFBEN"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cffben (
    `ECIFNO` INT,
    `OIDNO` INT,
    `OIDTYPE` STRING,
    `OCIFNO` INT,
    `OWNTYP` STRING,
    `OWNPCT` STRING,
    `OTITLE` STRING,
    `OIDCTRY` STRING,
    `OBIRDATE` STRING,
    `OREMDATE` STRING,
    `OCFFORN` STRING,
    `OCFNA1` STRING,
    `OCFNA2` STRING,
    `OCFNA3` STRING,
    `OCFNA4` STRING,
    `OCFCITY` STRING,
    `OCFSTAT` STRING,
    `OCFZIP` STRING,
    `OCFZIPD` STRING,
    `OCFFORC` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cffben IS
'The JH CFFBEN landing table captures customer foreign beneficiary attributes from Jack Henry for compliance validation, relationship analysis, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_cffben;

INSERT INTO landing_jh.default.jh_cffben (
    `ECIFNO`, `OIDNO`, `OIDTYPE`, `OCIFNO`, `OWNTYP`, `OWNPCT`,
    `OTITLE`, `OIDCTRY`, `OBIRDATE`, `OREMDATE`, `OCFFORN`, `OCFNA1`,
    `OCFNA2`, `OCFNA3`, `OCFNA4`, `OCFCITY`, `OCFSTAT`, `OCFZIP`,
    `OCFZIPD`, `OCFFORC`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    idx AS `ECIFNO`,
    idx AS `OIDNO`,
    concat('OIDTYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `OIDTYPE`,
    idx AS `OCIFNO`,
    concat('OWNTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `OWNTYP`,
    concat('OWNPCT_', lpad(CAST(idx AS STRING), 2, '0')) AS `OWNPCT`,
    concat('OTITLE_', lpad(CAST(idx AS STRING), 2, '0')) AS `OTITLE`,
    concat('OIDCTRY_', lpad(CAST(idx AS STRING), 2, '0')) AS `OIDCTRY`,
    concat('OBIRDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `OBIRDATE`,
    concat('OREMDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `OREMDATE`,
    concat('OCFFORN_', lpad(CAST(idx AS STRING), 2, '0')) AS `OCFFORN`,
    concat('OCFNA1_', lpad(CAST(idx AS STRING), 2, '0')) AS `OCFNA1`,
    concat('OCFNA2_', lpad(CAST(idx AS STRING), 2, '0')) AS `OCFNA2`,
    concat('OCFNA3_', lpad(CAST(idx AS STRING), 2, '0')) AS `OCFNA3`,
    concat('OCFNA4_', lpad(CAST(idx AS STRING), 2, '0')) AS `OCFNA4`,
    concat('OCFCITY_', lpad(CAST(idx AS STRING), 2, '0')) AS `OCFCITY`,
    concat('OCFSTAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `OCFSTAT`,
    concat('OCFZIP_', lpad(CAST(idx AS STRING), 2, '0')) AS `OCFZIP`,
    concat('OCFZIPD_', lpad(CAST(idx AS STRING), 2, '0')) AS `OCFZIPD`,
    concat('OCFFORC_', lpad(CAST(idx AS STRING), 2, '0')) AS `OCFFORC`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cffben' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cffben;
