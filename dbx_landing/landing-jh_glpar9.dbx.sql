-- Databricks SQL for source: jh_glpar9
-- Generated from sqlserver/brz-jh_glpar9.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_GLPAR9"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_glpar9 (
    `P9PROD` STRING,
    `P9DESC` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_glpar9 IS
'The JH_GLPAR9 landing table captures Jack Henry general ledger account, transaction, posting, balance, effective date, and reference attributes for ledger validation, reconciliation, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_glpar9;

INSERT INTO landing_jh.default.jh_glpar9 (
    `P9PROD`, `P9DESC`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('P9PROD_', lpad(CAST(idx AS STRING), 2, '0')) AS `P9PROD`,
    concat('P9DESC_', lpad(CAST(idx AS STRING), 2, '0')) AS `P9DESC`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_glpar9' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_glpar9;
