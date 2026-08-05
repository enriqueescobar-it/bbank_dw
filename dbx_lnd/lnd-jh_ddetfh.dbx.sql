-- Databricks SQL for source: jh_ddetfh
-- Generated from sqlserver_brz/brz-jh_ddetfh.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_DDEFTH"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_ddetfh (
    `EFHRID` STRING,
    `EFHCOD` STRING,
    `EFHKEY` STRING,
    `EFHDS1` STRING,
    `EFHDS2` STRING,
    `EFHACT` STRING,
    `EFHTYP` STRING,
    `EFHTC` STRING,
    `EFHAMT` DECIMAL(38,10),
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_ddetfh IS
'The JH DDETFH landing table captures demand deposit electronic funds transfer history attributes, including EFT identifiers, descriptions, account references, transaction codes, amounts, and as-of dates for reconciliation and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_ddetfh;

INSERT INTO landing_jh.default.jh_ddetfh (
    `EFHRID`, `EFHCOD`, `EFHKEY`, `EFHDS1`, `EFHDS2`, `EFHACT`,
    `EFHTYP`, `EFHTC`, `EFHAMT`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('EFHRID_', lpad(CAST(idx AS STRING), 2, '0')) AS `EFHRID`,
    concat('EFHCOD_', lpad(CAST(idx AS STRING), 2, '0')) AS `EFHCOD`,
    concat('EFHKEY_', lpad(CAST(idx AS STRING), 2, '0')) AS `EFHKEY`,
    concat('EFHDS1_', lpad(CAST(idx AS STRING), 2, '0')) AS `EFHDS1`,
    concat('EFHDS2_', lpad(CAST(idx AS STRING), 2, '0')) AS `EFHDS2`,
    concat('EFHACT_', lpad(CAST(idx AS STRING), 2, '0')) AS `EFHACT`,
    concat('EFHTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `EFHTYP`,
    concat('EFHTC_', lpad(CAST(idx AS STRING), 2, '0')) AS `EFHTC`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `EFHAMT`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_ddetfh' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_ddetfh;
