-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_gcus_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_GCUS_REC_A
-- Source table: landing_pershing.default.pershing_gcus_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_gcus_a AS
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
    `COUNTRY_CODE_SEC_ISSUANCE`,
    `IP`,
    `IBDNUMBER`,
    `CURRENCY_SECURITY_IND`,
    `ISSUE_CURRENCY`,
    `DATE_STAMP_TRADE_DATE`,
    `DATE_STAMP_SETTLEMENT_DATE`,
    `SAFEKEEPING_QTY_MEMO`,
    `TRANSFER_QTY_MEMO`,
    `PENDING_TRANSFER_QTY`,
    `LEGAL_TRANSFER_QTY`,
    `TRADE_DATE_QTY`,
    `SETTLEMENT_DATE_QTY`,
    `SEG_QTY_MEMO`,
    `TENDERED_REORG_QTY_MEMO`,
    `PENDING_PAPERS_MEMO`,
    `SHORT_AGAINST_THE_BOX_QTY_MEMO`,
    `NETWORKED_QTY_MEMO`,
    `PENDING_SPLIT_QTY_MEMO`,
    `QTY_COVERING_OPTIONS_OR_COVERED_QTY`,
    `TRADE_DATE_QTY_BOUGHT`,
    `TRADE_DATE_QTY_SOLD`,
    `FED_REG_T_REQUIREMENT`,
    `HOUSE_PERSHING_MARGIN_REQUIREMENT`,
    `EXCHANGE_NYSE_REQUIREMENT`,
    `EQUITY_REQUIREMENT`,
    `SECURITY_SYMBOL`,
    `SECURITY_TYPE`,
    `SECURITY_MOD`,
    `SECURITY_CALC`,
    `MINOR_PRODUCT_CODE`,
    `NETWORK_ELIGIBILITY_INDICATOR`,
    `STRIKE_PRICE_A`,
    `EXPIRATION_MATURITY_DATE`,
    `CONTRACT_SIZE`,
    `CONVERSION_RATIO`,
    `ACCOUNT_SHORT_NAME`,
    `STATE_CODE`,
    `COUNTRY_CODE_ACCT_LVL_CITIZENSHIP`,
    `NUMBER_OF_SECURITY_DESC_LINES`,
    `SECURITY_DESC_LINE_1`,
    `SECURITY_DESC_LINE_2`,
    `SECURITY_DESC_LINE_3`,
    `SECURITY_DESC_LINE_4`,
    `SECURITY_DESC_LINE_5`,
    `SECURITY_DESC_LINE_6`,
    `DIVIDEND_OPTION`,
    `LONG_TERM_CAPITAL_GAINS_OPTION`,
    `SHORT_TERM_CAPITAL_GAINS_OPTION`,
    `FIRM_TRADING_INDICATOR`,
    `POSITION_CURRENCY`,
    `TRADE_DATE_LIQUIDATING_VALUE`,
    `POOL_FACTOR`,
    `EXCHANGE_RATE`,
    `SETTLEMENT_DATE_LIQUIDATING_VALUE`,
    `ALTERNATE_SECURITY_ID_TYPE`,
    `ALTERNATE_SECURITY_ID`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_gcus_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_gcus_a IS
'Bronze Pershing table bronze_pershing_gcus_a contains custody, position, margin, collateral, and security records sourced from landing_pershing.default.pershing_gcus_a for warehouse parity, validation, reconciliation, and downstream reporting.';
