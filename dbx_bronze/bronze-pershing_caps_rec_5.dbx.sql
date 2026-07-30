-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_caps_rec_5.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPS_REC_5
-- Source table: landing_pershing.default.pershing_caps_5
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_caps_rec_5 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `OPTION_ROOT_ID`,
    `EXPIRATION_DATE`,
    `CALL_PUT_INDICATOR`,
    `STRIKE_PRICE`,
    `MASTER_CLIENT_NAME`,
    `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_caps_5;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_caps_rec_5 IS
'Bronze Pershing table bronze_pershing_caps_rec_5 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_caps_5 for warehouse parity, validation, reconciliation, and downstream reporting.';
