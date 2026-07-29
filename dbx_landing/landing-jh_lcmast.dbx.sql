-- Databricks SQL for source: jh_lcmast
-- Generated from sqlserver_brz/brz-jh_lcmast.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_LCMAST"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_lcmast (
    `LCMBRN` STRING,
    `LCMCCY` STRING,
    `LCMGLN` STRING,
    `LCMCCN` STRING,
    `LCMPRC` STRING,
    `LCMACN` STRING,
    `LCMFCY` STRING,
    `LCMSTS` STRING,
    `LCMTYP` STRING,
    `LCMORF` STRING,
    `LCMRTY` STRING,
    `LCMOFX` STRING,
    `LCMCNF` STRING,
    `LCMTRF` STRING,
    `LCMTNR` STRING,
    `LCMOFI` STRING,
    `LCMGCD` STRING,
    `LCMGRC` STRING,
    `LCMOAM` STRING,
    `LCMAMN` STRING,
    `LCMCOM` STRING,
    `LCMEXP` STRING,
    `LCMMEB` STRING,
    `LCMCFK` STRING,
    `LCMODM` STRING,
    `LCMODD` STRING,
    `LCMODY` STRING,
    `LCMOPJ` STRING,
    `LCMLAM` STRING,
    `LCMLAD` STRING,
    `LCMLAY` STRING,
    `LCMLAJ` STRING,
    `LCMEXM` STRING,
    `LCMEXD` STRING,
    `LCMEXY` STRING,
    `LCMEXJ` STRING,
    `LCMCLM` STRING,
    `LCMCLD` STRING,
    `LCMCLY` STRING,
    `LCMCLJ` STRING,
    `LCMIB1` STRING,
    `LCMIB2` STRING,
    `LCMIB3` STRING,
    `LCMIBA` STRING,
    `LCMBN1` STRING,
    `LCMBN2` STRING,
    `LCMBN3` STRING,
    `LCMACC` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_lcmast IS
'The JH_LCMAST landing table captures Jack Henry letter of credit account and customer attributes for credit exposure validation, reconciliation, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_lcmast;

INSERT INTO landing_jh.default.jh_lcmast (
    `LCMBRN`, `LCMCCY`, `LCMGLN`, `LCMCCN`, `LCMPRC`, `LCMACN`,
    `LCMFCY`, `LCMSTS`, `LCMTYP`, `LCMORF`, `LCMRTY`, `LCMOFX`,
    `LCMCNF`, `LCMTRF`, `LCMTNR`, `LCMOFI`, `LCMGCD`, `LCMGRC`,
    `LCMOAM`, `LCMAMN`, `LCMCOM`, `LCMEXP`, `LCMMEB`, `LCMCFK`,
    `LCMODM`, `LCMODD`, `LCMODY`, `LCMOPJ`, `LCMLAM`, `LCMLAD`,
    `LCMLAY`, `LCMLAJ`, `LCMEXM`, `LCMEXD`, `LCMEXY`, `LCMEXJ`,
    `LCMCLM`, `LCMCLD`, `LCMCLY`, `LCMCLJ`, `LCMIB1`, `LCMIB2`,
    `LCMIB3`, `LCMIBA`, `LCMBN1`, `LCMBN2`, `LCMBN3`, `LCMACC`,
    `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('LCMBRN_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMBRN`,
    concat('LCMCCY_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMCCY`,
    concat('LCMGLN_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMGLN`,
    concat('LCMCCN_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMCCN`,
    concat('LCMPRC_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMPRC`,
    concat('LCMACN_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMACN`,
    concat('LCMFCY_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMFCY`,
    concat('LCMSTS_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMSTS`,
    concat('LCMTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMTYP`,
    concat('LCMORF_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMORF`,
    concat('LCMRTY_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMRTY`,
    concat('LCMOFX_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMOFX`,
    concat('LCMCNF_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMCNF`,
    concat('LCMTRF_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMTRF`,
    concat('LCMTNR_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMTNR`,
    concat('LCMOFI_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMOFI`,
    concat('LCMGCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMGCD`,
    concat('LCMGRC_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMGRC`,
    concat('LCMOAM_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMOAM`,
    concat('LCMAMN_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMAMN`,
    concat('LCMCOM_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMCOM`,
    concat('LCMEXP_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMEXP`,
    concat('LCMMEB_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMMEB`,
    concat('LCMCFK_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMCFK`,
    concat('LCMODM_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMODM`,
    concat('LCMODD_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMODD`,
    concat('LCMODY_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMODY`,
    concat('LCMOPJ_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMOPJ`,
    concat('LCMLAM_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMLAM`,
    concat('LCMLAD_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMLAD`,
    concat('LCMLAY_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMLAY`,
    concat('LCMLAJ_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMLAJ`,
    concat('LCMEXM_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMEXM`,
    concat('LCMEXD_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMEXD`,
    concat('LCMEXY_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMEXY`,
    concat('LCMEXJ_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMEXJ`,
    concat('LCMCLM_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMCLM`,
    concat('LCMCLD_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMCLD`,
    concat('LCMCLY_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMCLY`,
    concat('LCMCLJ_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMCLJ`,
    concat('LCMIB1_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMIB1`,
    concat('LCMIB2_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMIB2`,
    concat('LCMIB3_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMIB3`,
    concat('LCMIBA_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMIBA`,
    concat('LCMBN1_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMBN1`,
    concat('LCMBN2_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMBN2`,
    concat('LCMBN3_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMBN3`,
    concat('LCMACC_', lpad(CAST(idx AS STRING), 2, '0')) AS `LCMACC`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_lcmast' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_lcmast;
