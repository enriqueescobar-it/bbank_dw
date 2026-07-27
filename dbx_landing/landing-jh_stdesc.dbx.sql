-- Databricks SQL for source: jh_stdesc
-- Generated from sqlserver/brz-jh_stdesc.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_STDESC"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_stdesc (
    `DSRID` STRING,
    `DSCOD` STRING,
    `DSKEY` STRING,
    `DSDS1` STRING,
    `DSDS2` STRING,
    `DSDS3` STRING,
    `DSSTA` STRING,
    `DSSTK` STRING,
    `DSBAT` STRING,
    `DSSEQ` STRING,
    `DSSER` STRING,
    `DSROU` STRING,
    `DSACT` STRING,
    `DSTYP` STRING,
    `DSDC` STRING,
    `DSBOR` STRING,
    `DSPSQ` STRING,
    `DSTRN` STRING,
    `DSAMT` DECIMAL(38,10),
    `DSRCE` STRING,
    `DSEFFD` STRING,
    `DSEFF6` STRING,
    `DSTRAD` STRING,
    `DSTRA6` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_stdesc IS
'The JH STDESC landing table captures statement description, transaction, amount, effective date, and routing attributes for transaction description validation and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_stdesc;

INSERT INTO landing_jh.default.jh_stdesc (
    `DSRID`, `DSCOD`, `DSKEY`, `DSDS1`, `DSDS2`, `DSDS3`,
    `DSSTA`, `DSSTK`, `DSBAT`, `DSSEQ`, `DSSER`, `DSROU`,
    `DSACT`, `DSTYP`, `DSDC`, `DSBOR`, `DSPSQ`, `DSTRN`,
    `DSAMT`, `DSRCE`, `DSEFFD`, `DSEFF6`, `DSTRAD`, `DSTRA6`,
    `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('DSRID_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSRID`,
    concat('DSCOD_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSCOD`,
    concat('DSKEY_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSKEY`,
    concat('DSDS1_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSDS1`,
    concat('DSDS2_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSDS2`,
    concat('DSDS3_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSDS3`,
    concat('DSSTA_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSSTA`,
    concat('DSSTK_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSSTK`,
    concat('DSBAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSBAT`,
    concat('DSSEQ_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSSEQ`,
    concat('DSSER_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSSER`,
    concat('DSROU_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSROU`,
    concat('DSACT_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSACT`,
    concat('DSTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSTYP`,
    concat('DSDC_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSDC`,
    concat('DSBOR_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSBOR`,
    concat('DSPSQ_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSPSQ`,
    concat('DSTRN_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSTRN`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `DSAMT`,
    concat('DSRCE_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSRCE`,
    concat('DSEFFD_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSEFFD`,
    concat('DSEFF6_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSEFF6`,
    concat('DSTRAD_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSTRAD`,
    concat('DSTRA6_', lpad(CAST(idx AS STRING), 2, '0')) AS `DSTRA6`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_stdesc' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_stdesc;
