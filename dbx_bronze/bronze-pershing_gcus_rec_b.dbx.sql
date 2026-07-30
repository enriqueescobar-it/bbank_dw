-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_gcus_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_GCUS_REC_B
-- Source table: landing_pershing.default.pershing_gcus_b
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_gcus_rec_b AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `CUSIP_NUMBER`,
    `PORTFOLIO_CURRENCY`,
    `UNDERLYING_CUSIP_NUMBER`,
    `COUNTRY_CODE`,
    `IP`,
    `IBDNUMBER`,
    `FULLY_PAID_LENDING_QTY`,
    `FULLY_PAID_LENDING_QTY_COLLAT_AMT`,
    `OPTION_ROOT_ID`,
    `EXPIRATION_DATE`,
    `CALL_PUT_INDICATOR`,
    `STRIKE_PRICE_B`,
    `TRADE_DATE_REPO_QTY`,
    `SETTLEMENT_DATE_REPO_QTY`,
    `TRADE_DATE_REVERSE_REPO_QTY`,
    `SETTLEMENT_DATE_REVERSE_REPO_QTY`,
    `COLLAT_PLEDGE_QTY`,
    `CORP_EXEC_SERVICES_COLLAT_PLEDGE_QTY`,
    `TRADE_DATE_REPO_LIQUIDATING_VALUE`,
    `SETTLEMENT_DATE_REPO_LIQUIDATING_VALUE`,
    `TRADE_DATE_REVERSE_REPO_LIQUIDATING_VALUE`,
    `SETTLEMENT_DATE_REVERSE_REPO_LIQUIDATING_VALUE`,
    `COLLAT_PLEDGE_LIQUIDATING_VALUE`,
    `CORP_EXEC_SERVICES_COLLAT_PLEDGE_LIQUIDATING_VALUE`,
    `TRADE_DATE_REPO_LOAN_AMOUNT`,
    `SETTLEMENT_DATE_REPO_LOAN_AMOUNT`,
    `TRADE_DATE_REVERSE_REPO_LOAN_AMOUNT`,
    `SETTLEMENT_DATE_REVERSE_REPO_LOAN_AMOUNT`,
    `ACCRUED_INTEREST_VALUE_FROM_LAST_PAYABLE`,
    `DIVIDEND_or_COUPON_RATE`,
    `PENDING_SPLIT_QTY_LIQUIDATING_VALUE`,
    `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    `PLEDGED_QTY_MEMO`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_gcus_b;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_gcus_rec_b IS
'Bronze Pershing table bronze_pershing_gcus_rec_b contains custody, position, margin, collateral, and security records sourced from landing_pershing.default.pershing_gcus_b for warehouse parity, validation, reconciliation, and downstream reporting.';
