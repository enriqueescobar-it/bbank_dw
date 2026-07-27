-- Databricks SQL for source: jh_cdmant
-- Generated from sqlserver/brz-jh_cdmant.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CDMANT"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cdmant (
    `JHMACT` STRING,
    `JHMTYP` STRING,
    `JHMCIF` STRING,
    `JHMUID` STRING,
    `JHMWID` STRING,
    `JHMTIM` STRING,
    `JHMPGM` STRING,
    `JHMDLM` STRING,
    `JHMDL6` STRING,
    `JHMDTM` STRING,
    `JHMDT6` STRING,
    `JHMAPL` STRING,
    `JHMFLD` STRING,
    `JHMNEW` STRING,
    `JHMOLD` STRING,
    `JHMBR__CS` STRING,
    `JHMTPE` STRING,
    `JHCSMN` STRING,
    `JHCSPD` STRING,
    `JHMUNM` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cdmant IS
'The JH CDMANT landing table captures certificate of deposit maintenance activity, including account identifiers, change attributes, dates, and load metadata for operational audit and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_cdmant;

INSERT INTO landing_jh.default.jh_cdmant (
    `JHMACT`, `JHMTYP`, `JHMCIF`, `JHMUID`, `JHMWID`, `JHMTIM`,
    `JHMPGM`, `JHMDLM`, `JHMDL6`, `JHMDTM`, `JHMDT6`, `JHMAPL`,
    `JHMFLD`, `JHMNEW`, `JHMOLD`, `JHMBR__CS`, `JHMTPE`, `JHCSMN`,
    `JHCSPD`, `JHMUNM`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('JHMACT_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMACT`,
    concat('JHMTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMTYP`,
    concat('JHMCIF_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMCIF`,
    concat('JHMUID_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMUID`,
    concat('JHMWID_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMWID`,
    concat('JHMTIM_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMTIM`,
    concat('JHMPGM_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMPGM`,
    concat('JHMDLM_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMDLM`,
    concat('JHMDL6_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMDL6`,
    concat('JHMDTM_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMDTM`,
    concat('JHMDT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMDT6`,
    concat('JHMAPL_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMAPL`,
    concat('JHMFLD_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMFLD`,
    concat('JHMNEW_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMNEW`,
    concat('JHMOLD_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMOLD`,
    concat('JHMBR__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMBR__CS`,
    concat('JHMTPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMTPE`,
    concat('JHCSMN_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCSMN`,
    concat('JHCSPD_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCSPD`,
    concat('JHMUNM_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHMUNM`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cdmant' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cdmant;
