-- Databricks SQL for source: jh_jhoffr
-- Generated from sqlserver/brz-jh_jhoffr.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_JHOFFR"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_jhoffr (
    `JHOOFF` STRING,
    `JHOXRFNBR` INT,
    `JHONAM` STRING,
    `JHOSNA` STRING,
    `JHOTIT` STRING,
    `JHOPHN` STRING,
    `JHOPEX` STRING,
    `JHOSLMT` STRING,
    `JHOULMT` STRING,
    `JHOPRNT` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_jhoffr IS
'The JH_JHOFFR landing table captures Jack Henry institution, class, country, officer, or master reference attributes for source validation, classification, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_jhoffr;

INSERT INTO landing_jh.default.jh_jhoffr (
    `JHOOFF`, `JHOXRFNBR`, `JHONAM`, `JHOSNA`, `JHOTIT`, `JHOPHN`,
    `JHOPEX`, `JHOSLMT`, `JHOULMT`, `JHOPRNT`, `AsOfDate`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    concat('JHOOFF_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHOOFF`,
    idx AS `JHOXRFNBR`,
    concat('JHONAM_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHONAM`,
    concat('JHOSNA_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHOSNA`,
    concat('JHOTIT_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHOTIT`,
    concat('JHOPHN_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHOPHN`,
    concat('JHOPEX_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHOPEX`,
    concat('JHOSLMT_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHOSLMT`,
    concat('JHOULMT_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHOULMT`,
    concat('JHOPRNT_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHOPRNT`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_jhoffr' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_jhoffr;
