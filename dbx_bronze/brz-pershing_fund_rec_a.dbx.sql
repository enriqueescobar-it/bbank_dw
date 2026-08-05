-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_fund_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_FUND_REC_A
-- Source table: landing_pershing.default.pershing_fund_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_fund_a AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `IP`,
    `FUND_MNEMONIC`,
    `ACCOUNT_NUMBER_AT_FUND`,
    `FUND_MANAGER`,
    `LAST_SWEEP_DATE`,
    `LAST_UPDATE_DATE`,
    `PRINCIPAL`,
    `ACCRUED_DIVIDEND`,
    `GROUP_NUMBER`,
    `OMNIBUS_ACCOUNT_INDICATOR`,
    `SWEEP_ACCOUNT_INDICATOR`,
    `MARGIN_DEBIT_AUTO_SWEEP_INDICATOR`,
    `CUSIP_NUMBER`,
    `PRICING_GROUP`,
    `IBDNUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_fund_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_fund_a IS
'Bronze Pershing table bronze_pershing_fund_a contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_fund_a for warehouse parity, validation, reconciliation, and downstream reporting.';
