-- Databricks SQL for source: jh_jhclas
-- Generated from sqlserver_brz/brz-jh_jhclas.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_JHCLAS"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_jhclas (
    `JHCCOD` STRING,
    `JHCDES` STRING,
    `JHCLID` STRING,
    `JHCARC` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_jhclas IS
'The JH_JHCLAS landing table captures Jack Henry institution, class, country, officer, or master reference attributes for source validation, classification, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_jhclas;

INSERT INTO landing_jh.default.jh_jhclas (
    `JHCCOD`, `JHCDES`, `JHCLID`, `JHCARC`, `AsOfDate`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    concat('JHCCOD_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCCOD`,
    concat('JHCDES_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCDES`,
    concat('JHCLID_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCLID`,
    concat('JHCARC_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCARC`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_jhclas' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_jhclas;
