-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_capt_rec_4.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPT_REC_4
-- Source table: landing_pershing.default.pershing_capt_4
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_capt_4 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `CURRENCY_CODE`,
    `CURRENCY_AMOUNT_OF_REVENUE`,
    `FOREIGN_EXCHANGE_RATE`,
    `CURRENCY_MULTI_DIV_INDICATOR`,
    `IBD_SETTLEMENT_FEE_USD`,
    `CUSTOMER_SETTLEMENT_FEE_USD`,
    `GLOSS_REFERENCE_NUMBER`,
    `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_capt_4;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_capt_4 IS
'Bronze Pershing table bronze_pershing_capt_4 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_capt_4 for warehouse parity, validation, reconciliation, and downstream reporting.';
