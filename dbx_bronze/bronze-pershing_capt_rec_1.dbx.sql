-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_capt_rec_1.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPT_REC_1
-- Source table: landing_pershing.default.pershing_capt_1
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_capt_rec_1 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `TRADE_DATE`,
    `TRADE_REFERENCE_NUMBER`,
    `PERSHING_OFFICE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `ACCOUNT_NAME`,
    `BUY_SELL_INDICATOR`,
    `CANCEL_INDICATOR`,
    `CAPS_SOURCE`,
    `TRADE_QUANTITY`,
    `PRICE`,
    `PRODUCT_CODE`,
    `CUSIP_NUMBER_OF_SECURITY_TRADED`,
    `ACCOUNT_SHORT_NAME`,
    `ORDER_TYPE`,
    `MISCELLANEOUS_FEE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_capt_1;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_capt_rec_1 IS
'Bronze Pershing table bronze_pershing_capt_rec_1 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_capt_1 for warehouse parity, validation, reconciliation, and downstream reporting.';
