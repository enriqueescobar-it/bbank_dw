-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isca_rec_j.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISCA_REC_J
-- Source table: landing_pershing.default.pershing_isca_j
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isca_j AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CUSIP_NUMBER`,
    `NOT_USED_1`,
    `LATEST_PRICE`,
    `LATEST_PRICE_DATE`,
    `FACTORED_MARKET_VALUE_MULTIPLIER`,
    `CURRENT_YIELD`,
    `YIELD`,
    `PRICE_SOURCE`,
    `COUNTRY_OF_ORIGIN`,
    `RESTRICTED_SECURITY_CODE`,
    `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    `INTERNATIONAL_EXCHANGE`,
    `VARIABLE_RATE_CATEGORY_CODE`,
    `INTEREST_RATE_COMPLETION_INDICATOR`,
    `NOT_USED_2`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isca_j;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isca_j IS
'Bronze Pershing table bronze_pershing_isca_j contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_isca_j for warehouse parity, validation, reconciliation, and downstream reporting.';
