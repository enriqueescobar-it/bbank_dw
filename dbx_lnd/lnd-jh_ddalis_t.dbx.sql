-- Databricks SQL for source: jh_ddalis_t
-- Generated from sqlserver_brz/brz-jh_ddalis_t.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_DDALIS_T"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_ddalis_t (
    `ACCTNO` INT,
    `ACTYPE` INT,
    `AGRPCD` STRING,
    `AITEM` STRING,
    `AATYPE` STRING,
    `AIDESC` STRING,
    `AICHG` DECIMAL(38,10),
    `AIFREE` STRING,
    `AIDRCR` STRING,
    `AIMIN` STRING,
    `AIMAX` STRING,
    `AIFLAT` STRING,
    `AITIER` STRING,
    `AINUM` INT,
    `AIPRT0` STRING,
    `AICHG1` DECIMAL(38,10),
    `AICTR2` STRING,
    `AICHG2` DECIMAL(38,10),
    `AICTR3` STRING,
    `AICHG3` DECIMAL(38,10),
    `AICTR4` STRING,
    `AICHG4` DECIMAL(38,10),
    `AICTR5` STRING,
    `AICHG5` DECIMAL(38,10),
    `WAIVEFEE` DECIMAL(38,10),
    `WVEXPDT6` STRING,
    `WVEXPDT7` STRING,
    `EXBEGDT6` STRING,
    `EXBEGDT7` STRING,
    `EXENDDT6` STRING,
    `EXENDDT7` STRING,
    `RECURITM` STRING,
    `RCEXPDT6` STRING,
    `RCEXPDT7` STRING,
    `HSCHARGE` STRING,
    `STATOCUR` STRING,
    `CTDIFREE` STRING,
    `AILEVEL` STRING,
    `AADSCAMT` DECIMAL(38,10),
    `AADSCPRC` STRING,
    `AADSCEXP` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_ddalis_t IS
'The JH DDALIS_T landing table captures demand deposit account list and relationship attributes from Jack Henry for account validation, customer review, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_ddalis_t;

INSERT INTO landing_jh.default.jh_ddalis_t (
    `ACCTNO`, `ACTYPE`, `AGRPCD`, `AITEM`, `AATYPE`, `AIDESC`,
    `AICHG`, `AIFREE`, `AIDRCR`, `AIMIN`, `AIMAX`, `AIFLAT`,
    `AITIER`, `AINUM`, `AIPRT0`, `AICHG1`, `AICTR2`, `AICHG2`,
    `AICTR3`, `AICHG3`, `AICTR4`, `AICHG4`, `AICTR5`, `AICHG5`,
    `WAIVEFEE`, `WVEXPDT6`, `WVEXPDT7`, `EXBEGDT6`, `EXBEGDT7`, `EXENDDT6`,
    `EXENDDT7`, `RECURITM`, `RCEXPDT6`, `RCEXPDT7`, `HSCHARGE`, `STATOCUR`,
    `CTDIFREE`, `AILEVEL`, `AADSCAMT`, `AADSCPRC`, `AADSCEXP`, `AsOfDate`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    idx AS `ACCTNO`,
    idx AS `ACTYPE`,
    concat('AGRPCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `AGRPCD`,
    concat('AITEM_', lpad(CAST(idx AS STRING), 2, '0')) AS `AITEM`,
    concat('AATYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `AATYPE`,
    concat('AIDESC_', lpad(CAST(idx AS STRING), 2, '0')) AS `AIDESC`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AICHG`,
    concat('AIFREE_', lpad(CAST(idx AS STRING), 2, '0')) AS `AIFREE`,
    concat('AIDRCR_', lpad(CAST(idx AS STRING), 2, '0')) AS `AIDRCR`,
    concat('AIMIN_', lpad(CAST(idx AS STRING), 2, '0')) AS `AIMIN`,
    concat('AIMAX_', lpad(CAST(idx AS STRING), 2, '0')) AS `AIMAX`,
    concat('AIFLAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `AIFLAT`,
    concat('AITIER_', lpad(CAST(idx AS STRING), 2, '0')) AS `AITIER`,
    idx AS `AINUM`,
    concat('AIPRT0_', lpad(CAST(idx AS STRING), 2, '0')) AS `AIPRT0`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AICHG1`,
    concat('AICTR2_', lpad(CAST(idx AS STRING), 2, '0')) AS `AICTR2`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AICHG2`,
    concat('AICTR3_', lpad(CAST(idx AS STRING), 2, '0')) AS `AICTR3`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AICHG3`,
    concat('AICTR4_', lpad(CAST(idx AS STRING), 2, '0')) AS `AICTR4`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AICHG4`,
    concat('AICTR5_', lpad(CAST(idx AS STRING), 2, '0')) AS `AICTR5`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AICHG5`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `WAIVEFEE`,
    concat('WVEXPDT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `WVEXPDT6`,
    concat('WVEXPDT7_', lpad(CAST(idx AS STRING), 2, '0')) AS `WVEXPDT7`,
    concat('EXBEGDT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `EXBEGDT6`,
    concat('EXBEGDT7_', lpad(CAST(idx AS STRING), 2, '0')) AS `EXBEGDT7`,
    concat('EXENDDT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `EXENDDT6`,
    concat('EXENDDT7_', lpad(CAST(idx AS STRING), 2, '0')) AS `EXENDDT7`,
    concat('RECURITM_', lpad(CAST(idx AS STRING), 2, '0')) AS `RECURITM`,
    concat('RCEXPDT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `RCEXPDT6`,
    concat('RCEXPDT7_', lpad(CAST(idx AS STRING), 2, '0')) AS `RCEXPDT7`,
    concat('HSCHARGE_', lpad(CAST(idx AS STRING), 2, '0')) AS `HSCHARGE`,
    concat('STATOCUR_', lpad(CAST(idx AS STRING), 2, '0')) AS `STATOCUR`,
    concat('CTDIFREE_', lpad(CAST(idx AS STRING), 2, '0')) AS `CTDIFREE`,
    concat('AILEVEL_', lpad(CAST(idx AS STRING), 2, '0')) AS `AILEVEL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AADSCAMT`,
    concat('AADSCPRC_', lpad(CAST(idx AS STRING), 2, '0')) AS `AADSCPRC`,
    concat('AADSCEXP_', lpad(CAST(idx AS STRING), 2, '0')) AS `AADSCEXP`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_ddalis_t' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_ddalis_t;
