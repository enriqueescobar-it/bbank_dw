-- Databricks SQL for source: jh_jhctry
-- Generated from sqlserver/brz-jh_jhctry.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_JHCTRY"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_jhctry (
    `JHCNTRY` STRING,
    `JHCODEA2` STRING,
    `JHCODEA3` STRING,
    `JHCODEN3` STRING,
    `JHUPLDDAT` STRING,
    `JHUPLDUID` STRING,
    `JHUPLDWID` STRING,
    `JHCHNGUID` STRING,
    `JHCHNGWID` STRING,
    `JHCTRY_ID` STRING,
    `JHCTRYCRTS` STRING,
    `JHCTRYMNTS` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_jhctry IS
'The JH_JHCTRY landing table captures Jack Henry institution, class, country, officer, or master reference attributes for source validation, classification, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_jhctry;

INSERT INTO landing_jh.default.jh_jhctry (
    `JHCNTRY`, `JHCODEA2`, `JHCODEA3`, `JHCODEN3`, `JHUPLDDAT`, `JHUPLDUID`,
    `JHUPLDWID`, `JHCHNGUID`, `JHCHNGWID`, `JHCTRY_ID`, `JHCTRYCRTS`, `JHCTRYMNTS`,
    `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('JHCNTRY_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCNTRY`,
    concat('JHCODEA2_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCODEA2`,
    concat('JHCODEA3_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCODEA3`,
    concat('JHCODEN3_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCODEN3`,
    concat('JHUPLDDAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHUPLDDAT`,
    concat('JHUPLDUID_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHUPLDUID`,
    concat('JHUPLDWID_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHUPLDWID`,
    concat('JHCHNGUID_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCHNGUID`,
    concat('JHCHNGWID_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCHNGWID`,
    concat('JHCTRY_ID_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCTRY_ID`,
    concat('JHCTRYCRTS_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCTRYCRTS`,
    concat('JHCTRYMNTS_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHCTRYMNTS`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_jhctry' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_jhctry;
