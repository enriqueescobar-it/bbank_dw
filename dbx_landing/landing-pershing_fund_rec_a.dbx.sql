-- Databricks SQL for source: pershing
-- Generated from sqlserver_dbt/landing-pershing_fund_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_FUND_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_fund_a (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `IP` STRING,
    `FUND_MNEMONIC` STRING,
    `ACCOUNT_NUMBER_AT_FUND` STRING,
    `FUND_MANAGER` STRING,
    `LAST_SWEEP_DATE` DATE,
    `LAST_UPDATE_DATE` DATE,
    `PRINCIPAL` DECIMAL(18,3),
    `ACCRUED_DIVIDEND` DECIMAL(18,3),
    `GROUP_NUMBER` STRING,
    `OMNIBUS_ACCOUNT_INDICATOR` STRING,
    `SWEEP_ACCOUNT_INDICATOR` STRING,
    `MARGIN_DEBIT_AUTO_SWEEP_INDICATOR` DECIMAL(38,10),
    `CUSIP_NUMBER` STRING,
    `PRICING_GROUP` STRING,
    `IBDNUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_fund_a IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_fund_a;

INSERT INTO landing_pershing.default.pershing_fund_a (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `IP`, `FUND_MNEMONIC`,
    `ACCOUNT_NUMBER_AT_FUND`, `FUND_MANAGER`, `LAST_SWEEP_DATE`, `LAST_UPDATE_DATE`, `PRINCIPAL`, `ACCRUED_DIVIDEND`,
    `GROUP_NUMBER`, `OMNIBUS_ACCOUNT_INDICATOR`, `SWEEP_ACCOUNT_INDICATOR`, `MARGIN_DEBIT_AUTO_SWEEP_INDICATOR`,
    `CUSIP_NUMBER`, `PRICING_GROUP`, `IBDNUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('FUND_MNEMONIC_', format_string('%02d', idx)) AS `FUND_MNEMONIC`,
    concat('ACCOUNT_NUMBER_AT_FUND_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER_AT_FUND`,
    concat('FUND_MANAGER_', format_string('%02d', idx)) AS `FUND_MANAGER`,
    date_add(DATE '2026-01-01', idx - 1) AS `LAST_SWEEP_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `LAST_UPDATE_DATE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `PRINCIPAL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `ACCRUED_DIVIDEND`,
    concat('GROUP_NUMBER_', format_string('%02d', idx)) AS `GROUP_NUMBER`,
    concat('OMNIBUS_ACCOUNT_INDICATO_', format_string('%02d', idx)) AS `OMNIBUS_ACCOUNT_INDICATOR`,
    concat('SWEEP_ACCOUNT_INDICATOR_', format_string('%02d', idx)) AS `SWEEP_ACCOUNT_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `MARGIN_DEBIT_AUTO_SWEEP_INDICATOR`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('PRICING_GROUP_', format_string('%02d', idx)) AS `PRICING_GROUP`,
    concat('IBDNUMBER_', format_string('%02d', idx)) AS `IBDNUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_fund_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_fund_a;
