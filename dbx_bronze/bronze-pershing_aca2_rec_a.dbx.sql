-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_aca2_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ACA2_REC_A
-- Source table: landing_pershing.default.pershing_aca2_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_aca2_rec_a AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_TRANSFER_TYPE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `INVESTMENT_PROFESSIONAL`,
    `RECORD_TYPE`,
    `TRANSFER_TYPE`,
    `TRANSFER_STATUS`,
    `NUMBER_OF_DAYS_IN_PERSHING_STATUS`,
    `CONTRA_BROKER_NUMBER`,
    `CONTRA_BROKER_NAME`,
    `CONTRA_ACCOUNT_NUMBER`,
    `RETIREMENT_ACCOUNT_CLASS_INDICATOR`,
    `REQUEST_CREATION_DATE`,
    `REQUEST_CREATION_USER_ID`,
    `LAST_UPDATE_DATE`,
    `LAST_UPDATE_USER_ID`,
    `TOTAL_MARKET_VALUE_OF_TRANSFER`,
    `TOTAL_MARKET_VALUE_SIGN`,
    `SOURCE_CODE`,
    `SPECIAL_MEMORANDUM_ACCOUNT`,
    `SPECIAL_MEMORANDUM_ACCOUNT_SIGN`,
    `CUSTOMER_NAME`,
    `PRIMARY_TAX_IDENTIFICATION_NUMBER`,
    `NSCC_ACCOUNT_TYPE`,
    `NSCC_STATUS`,
    `NUMBER_OF_DAYS_IN_NSCC_STATUS`,
    `NSCC_CONTROL_NUMBER`,
    `REASON_CODE_FOR_REJECT`,
    `REASON_COMMENTS`,
    `REQUEST_ID`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_aca2_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_aca2_rec_a IS
'Bronze Pershing table bronze_pershing_aca2_rec_a contains transfer, ACATS, contra broker, status, and exception records sourced from landing_pershing.default.pershing_aca2_a for warehouse parity, validation, reconciliation, and downstream reporting.';
