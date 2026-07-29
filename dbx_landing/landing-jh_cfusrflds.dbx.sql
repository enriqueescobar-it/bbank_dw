-- Databricks SQL for source: jh_cfusrflds
-- Generated from sqlserver_brz/brz-jh_cfusrflds.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFUSRFLDS"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cfusrflds (
    `CFCIF__CS` STRING,
    `USFNAM` STRING,
    `USFVAL` STRING,
    `USFDATE6` STRING,
    `USFDATE7` STRING,
    `USFNUM9` STRING,
    `USFNUM15` STRING,
    `USFNUM15_FLAG` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cfusrflds IS
'The JH CFUSRFLDS landing table captures customer user-defined field attributes from Jack Henry for operational enrichment, validation, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_cfusrflds;

INSERT INTO landing_jh.default.jh_cfusrflds (
    `CFCIF__CS`, `USFNAM`, `USFVAL`, `USFDATE6`, `USFDATE7`, `USFNUM9`,
    `USFNUM15`, `USFNUM15_FLAG`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CFCIF__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCIF__CS`,
    concat('USFNAM_', lpad(CAST(idx AS STRING), 2, '0')) AS `USFNAM`,
    concat('USFVAL_', lpad(CAST(idx AS STRING), 2, '0')) AS `USFVAL`,
    concat('USFDATE6_', lpad(CAST(idx AS STRING), 2, '0')) AS `USFDATE6`,
    concat('USFDATE7_', lpad(CAST(idx AS STRING), 2, '0')) AS `USFDATE7`,
    concat('USFNUM9_', lpad(CAST(idx AS STRING), 2, '0')) AS `USFNUM9`,
    concat('USFNUM15_', lpad(CAST(idx AS STRING), 2, '0')) AS `USFNUM15`,
    concat('USFNUM15_FLAG_', lpad(CAST(idx AS STRING), 2, '0')) AS `USFNUM15_FLAG`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cfusrflds' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cfusrflds;
