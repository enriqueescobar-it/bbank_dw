-- Databricks SQL for source: jh_cdpar3
-- Generated from sqlserver/brz-jh_cdpar3.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CDPAR3"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cdpar3 (
    `C3TRAN` STRING,
    `C3DORC` STRING,
    `C3AFFT` STRING,
    `C3LACT` STRING,
    `C3YTDC` DECIMAL(38,10),
    `C3LINE` STRING,
    `C3ADSB` STRING,
    `C3DESC` STRING,
    `C3STMD` STRING,
    `C3CONTYP` STRING,
    `C3LIN2` STRING,
    `C3ADD2` STRING,
    `C3TXYR` STRING,
    `C3AMDA` STRING,
    `C3ADIR` STRING,
    `C3DIST` STRING,
    `C3STMT` STRING,
    `C3TAXB` DECIMAL(38,10),
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cdpar3 IS
'The JH CD parameter landing table captures certificate of deposit reference and configuration attributes for CD product validation, classification, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_cdpar3;

INSERT INTO landing_jh.default.jh_cdpar3 (
    `C3TRAN`, `C3DORC`, `C3AFFT`, `C3LACT`, `C3YTDC`, `C3LINE`,
    `C3ADSB`, `C3DESC`, `C3STMD`, `C3CONTYP`, `C3LIN2`, `C3ADD2`,
    `C3TXYR`, `C3AMDA`, `C3ADIR`, `C3DIST`, `C3STMT`, `C3TAXB`,
    `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('C3TRAN_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3TRAN`,
    concat('C3DORC_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3DORC`,
    concat('C3AFFT_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3AFFT`,
    concat('C3LACT_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3LACT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `C3YTDC`,
    concat('C3LINE_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3LINE`,
    concat('C3ADSB_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3ADSB`,
    concat('C3DESC_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3DESC`,
    concat('C3STMD_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3STMD`,
    concat('C3CONTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3CONTYP`,
    concat('C3LIN2_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3LIN2`,
    concat('C3ADD2_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3ADD2`,
    concat('C3TXYR_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3TXYR`,
    concat('C3AMDA_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3AMDA`,
    concat('C3ADIR_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3ADIR`,
    concat('C3DIST_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3DIST`,
    concat('C3STMT_', lpad(CAST(idx AS STRING), 2, '0')) AS `C3STMT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `C3TAXB`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cdpar3' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cdpar3;
