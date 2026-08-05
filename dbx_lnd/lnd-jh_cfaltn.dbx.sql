-- Databricks SQL for source: jh_cfaltn
-- Generated from sqlserver_brz/brz-jh_cfaltn.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFALTN"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cfaltn (
    `CFALID` STRING,
    `CFATYP` STRING,
    `CFAACT` STRING,
    `CFCIF__CS` STRING,
    `CFAAL1` STRING,
    `CFAAL2` STRING,
    `CFSNME` STRING,
    `CFNA1` STRING,
    `CFNA2` STRING,
    `CFNA3` STRING,
    `CFNA4` STRING,
    `CFCITY` STRING,
    `CFSTAT` STRING,
    `CFZIP` STRING,
    `CFZIPD` STRING,
    `CFCASS` STRING,
    `CFADLM` STRING,
    `CFADL6` STRING,
    `CFFORC` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cfaltn IS
'The JH CFALTN landing table captures alternate customer name and identifier attributes from Jack Henry for customer identity validation and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_cfaltn;

INSERT INTO landing_jh.default.jh_cfaltn (
    `CFALID`, `CFATYP`, `CFAACT`, `CFCIF__CS`, `CFAAL1`, `CFAAL2`,
    `CFSNME`, `CFNA1`, `CFNA2`, `CFNA3`, `CFNA4`, `CFCITY`,
    `CFSTAT`, `CFZIP`, `CFZIPD`, `CFCASS`, `CFADLM`, `CFADL6`,
    `CFFORC`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CFALID_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFALID`,
    concat('CFATYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFATYP`,
    concat('CFAACT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFAACT`,
    concat('CFCIF__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCIF__CS`,
    concat('CFAAL1_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFAAL1`,
    concat('CFAAL2_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFAAL2`,
    concat('CFSNME_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFSNME`,
    concat('CFNA1_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFNA1`,
    concat('CFNA2_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFNA2`,
    concat('CFNA3_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFNA3`,
    concat('CFNA4_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFNA4`,
    concat('CFCITY_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCITY`,
    concat('CFSTAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFSTAT`,
    concat('CFZIP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFZIP`,
    concat('CFZIPD_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFZIPD`,
    concat('CFCASS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCASS`,
    concat('CFADLM_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFADLM`,
    concat('CFADL6_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFADL6`,
    concat('CFFORC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFFORC`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cfaltn' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cfaltn;
