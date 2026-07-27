-- Databricks SQL for source: jh_cd2160petl
-- Generated from sqlserver/brz-jh_cd2160petl.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CD2160petl"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cd2160petl (
    `LSKIP` STRING,
    `LSPACE` STRING,
    `PLINE` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cd2160petl IS
'The JH_CD2160PETL landing table captures Jack Henry source attributes for landing-layer validation, reconciliation, operational review, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_cd2160petl;

INSERT INTO landing_jh.default.jh_cd2160petl (
    `LSKIP`, `LSPACE`, `PLINE`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('LSKIP_', lpad(CAST(idx AS STRING), 2, '0')) AS `LSKIP`,
    concat('LSPACE_', lpad(CAST(idx AS STRING), 2, '0')) AS `LSPACE`,
    concat('PLINE_', lpad(CAST(idx AS STRING), 2, '0')) AS `PLINE`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cd2160petl' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cd2160petl;
