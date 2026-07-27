-- Databricks SQL for source: jh_transactions
-- Generated from sqlserver/brz-jh_transactions.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_BFAS002"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_transactions (
    `ASTRCD` STRING,
    `ASAMTB` DECIMAL(38,10),
    `ASTRDA` DATE,
    `ASACCT` STRING,
    `ASDESC` STRING,
    `ASAMTO` DECIMAL(38,10),
    `ASCURC` STRING,
    `ASAPCO` STRING,
    `ASTIME` STRING,
    `ASORGI` STRING,
    `ASTOBK` STRING,
    `ASTIBK` STRING,
    `ASTBBK` STRING,
    `ASBENE` STRING,
    `ASTRCO` STRING,
    `ASORDE` STRING,
    `ASTRDE` STRING,
    `ASTVDA` DATE,
    `ASTBNK` STRING,
    `ASIBAN` STRING,
    `ASCNTR` STRING,
    `AsOfDate` DATE,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_transactions IS
'The JH TRANSACTIONS landing table captures transaction code, account, amount, currency, routing, beneficiary, order, value date, and country attributes from Jack Henry for transaction validation, reconciliation, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_transactions;

INSERT INTO landing_jh.default.jh_transactions (
    `ASTRCD`, `ASAMTB`, `ASTRDA`, `ASACCT`, `ASDESC`, `ASAMTO`,
    `ASCURC`, `ASAPCO`, `ASTIME`, `ASORGI`, `ASTOBK`, `ASTIBK`,
    `ASTBBK`, `ASBENE`, `ASTRCO`, `ASORDE`, `ASTRDE`, `ASTVDA`,
    `ASTBNK`, `ASIBAN`, `ASCNTR`, `AsOfDate`, `LOADED_AT`
)
SELECT
    concat('ASTRCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTRCD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `ASAMTB`,
    date_add(DATE '2026-01-01', idx - 1) AS `ASTRDA`,
    concat('ASACCT_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASACCT`,
    concat('ASDESC_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASDESC`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `ASAMTO`,
    concat('ASCURC_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCURC`,
    concat('ASAPCO_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASAPCO`,
    concat('ASTIME_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTIME`,
    concat('ASORGI_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASORGI`,
    concat('ASTOBK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTOBK`,
    concat('ASTIBK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTIBK`,
    concat('ASTBBK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTBBK`,
    concat('ASBENE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASBENE`,
    concat('ASTRCO_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTRCO`,
    concat('ASORDE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASORDE`,
    concat('ASTRDE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTRDE`,
    date_add(DATE '2026-01-01', idx - 1) AS `ASTVDA`,
    concat('ASTBNK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTBNK`,
    concat('ASIBAN_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASIBAN`,
    concat('ASCNTR_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCNTR`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_transactions' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_transactions;
