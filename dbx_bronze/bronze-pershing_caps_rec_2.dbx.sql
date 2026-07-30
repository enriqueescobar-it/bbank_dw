-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_caps_rec_2.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPS_REC_2
-- Source table: landing_pershing.default.pershing_caps_2
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_caps_2 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `MARKET_CODE`,
    `BLOTTER_CODE`,
    `SECURITY_TYPE`,
    `STOCK_SYMBOL`,
    `SECURITY_DESCRIPTION`,
    `CENTS_PER_SHARE`,
    `DISCOUNT_PERCENT`,
    `PAYCODE`,
    `MASTER_CLIENT_MNEMONIC`,
    `INSTITUTIONAL_RETAIL_INDICATOR`,
    `STATE_CODE`,
    `COMISSION_INDICATOR`,
    `FIRM_TRADING_ACCOUNT`,
    `POSTED_DATE`,
    `SETTLEMENT_DATE`,
    `RECYCLE_INDICATOR`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_caps_2;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_caps_2 IS
'Bronze Pershing table bronze_pershing_caps_2 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_caps_2 for warehouse parity, validation, reconciliation, and downstream reporting.';
