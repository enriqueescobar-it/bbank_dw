-- Databricks SQL for source: jh_cfacct
-- Generated from sqlserver_brz/brz-jh_cfacct.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFACCT"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cfacct (
    `CFACID` STRING,
    `CFCIF__CS` STRING,
    `CFATYP` STRING,
    `CFACC__CS` STRING,
    `CFSNME` STRING,
    `CFRELA` STRING,
    `CFNOTC` STRING,
    `CFANOS` STRING,
    `CFADLM` STRING,
    `CFADL6` STRING,
    `CFAPCT` STRING,
    `CFAMAX` STRING,
    `CFCAT` STRING,
    `CFINS` STRING,
    `CFMRG` STRING,
    `CFMRG6` STRING,
    `CFMRG7` STRING,
    `CFBEN` STRING,
    `CFPOWN` STRING,
    `CFRPDN` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cfacct IS
'The JH CFACCT landing table captures customer-to-account relationship attributes from Jack Henry for account ownership validation, relationship analysis, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_cfacct;

INSERT INTO landing_jh.default.jh_cfacct (
    `CFACID`, `CFCIF__CS`, `CFATYP`, `CFACC__CS`, `CFSNME`, `CFRELA`,
    `CFNOTC`, `CFANOS`, `CFADLM`, `CFADL6`, `CFAPCT`, `CFAMAX`,
    `CFCAT`, `CFINS`, `CFMRG`, `CFMRG6`, `CFMRG7`, `CFBEN`,
    `CFPOWN`, `CFRPDN`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CFACID_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFACID`,
    concat('CFCIF__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCIF__CS`,
    concat('CFATYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFATYP`,
    concat('CFACC__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFACC__CS`,
    concat('CFSNME_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFSNME`,
    concat('CFRELA_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFRELA`,
    concat('CFNOTC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFNOTC`,
    concat('CFANOS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFANOS`,
    concat('CFADLM_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFADLM`,
    concat('CFADL6_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFADL6`,
    concat('CFAPCT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFAPCT`,
    concat('CFAMAX_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFAMAX`,
    concat('CFCAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCAT`,
    concat('CFINS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFINS`,
    concat('CFMRG_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFMRG`,
    concat('CFMRG6_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFMRG6`,
    concat('CFMRG7_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFMRG7`,
    concat('CFBEN_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFBEN`,
    concat('CFPOWN_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFPOWN`,
    concat('CFRPDN_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFRPDN`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cfacct' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cfacct;
