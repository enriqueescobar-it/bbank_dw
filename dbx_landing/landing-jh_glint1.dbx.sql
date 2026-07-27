-- Databricks SQL for source: jh_glint1
-- Generated from sqlserver/brz-jh_glint1.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_GLINT1"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_glint1 (
    `GISTAT` STRING,
    `BRANCH` INT,
    `APPCDE` STRING,
    `INTER__CS` DECIMAL(38,10),
    `INDORC` STRING,
    `GROUP__CS` STRING,
    `PRACCT` STRING,
    `PRCOST` STRING,
    `PRPRDC` STRING,
    `GDESC` STRING,
    `FORCBR` STRING,
    `CHGREC` DECIMAL(38,10),
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_glint1 IS
'The JH_GLINT1 landing table captures Jack Henry general ledger account, transaction, posting, balance, effective date, and reference attributes for ledger validation, reconciliation, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_glint1;

INSERT INTO landing_jh.default.jh_glint1 (
    `GISTAT`, `BRANCH`, `APPCDE`, `INTER__CS`, `INDORC`, `GROUP__CS`,
    `PRACCT`, `PRCOST`, `PRPRDC`, `GDESC`, `FORCBR`, `CHGREC`,
    `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('GISTAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `GISTAT`,
    idx AS `BRANCH`,
    concat('APPCDE_', lpad(CAST(idx AS STRING), 2, '0')) AS `APPCDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `INTER__CS`,
    concat('INDORC_', lpad(CAST(idx AS STRING), 2, '0')) AS `INDORC`,
    concat('GROUP__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `GROUP__CS`,
    concat('PRACCT_', lpad(CAST(idx AS STRING), 2, '0')) AS `PRACCT`,
    concat('PRCOST_', lpad(CAST(idx AS STRING), 2, '0')) AS `PRCOST`,
    concat('PRPRDC_', lpad(CAST(idx AS STRING), 2, '0')) AS `PRPRDC`,
    concat('GDESC_', lpad(CAST(idx AS STRING), 2, '0')) AS `GDESC`,
    concat('FORCBR_', lpad(CAST(idx AS STRING), 2, '0')) AS `FORCBR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CHGREC`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_glint1' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_glint1;
