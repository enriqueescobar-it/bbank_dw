-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isca_rec_g.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISCA_REC_G
-- Source table: landing_pershing.default.pershing_isca_g
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isca_g AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CUSIP_NUMBER`,
    `NOT_USED_1`,
    `DELTA`,
    `DELTA_VALUE_PRESENCE_INDICATOR`,
    `NOT_USED_2`,
    `ISIN_CODE`,
    `ISSUER_IDENTIFIER`,
    `PIUO`,
    `NOT_USED_3`,
    `SYMBOL_OF_THE_UNDERLYING_SECURITY`,
    `ASSET_TYPE`,
    `ASSET_SUBTYPE`,
    `ASSET_SUB_SUBTYPE`,
    `PAYMENT_DAY_DELAYS`,
    `RESERVED_FOR_FUTURE_RATING`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isca_g;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isca_g IS
'Bronze Pershing table bronze_pershing_isca_g contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_isca_g for warehouse parity, validation, reconciliation, and downstream reporting.';
