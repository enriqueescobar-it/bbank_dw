-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_ckff_rec_c.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CKFF_REC_C
-- Source table: landing_pershing.default.pershing_ckff_c
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_ckff_c AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_TYPE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `TRANSACTION_AMOUNT`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `DESCRIPTION_CODE`,
    `DESCRIPTION`,
    `ADDITIONAL_DESCRIPTION_OR_CHECK_DEPO_ADD_INFO_LINE_1`,
    `CHECK_DEPO_ADD_INFO_LINE_2`,
    `CHECK_DEPO_ADD_INFO_LINE_3`,
    `CHECK_DEPO_ADD_INFO_LINE_4`,
    `CHECK_DEPO_ADD_INFO_LINE_5`,
    `CHECK_DEPO_ADD_INFO_LINE_6`,
    `CHECK_DEPO_ADD_INFO_LINE_7`,
    `CHECK_DEPO_ADD_INFO_LINE_8`,
    `CHECK_DEPO_ADD_INFO_LINE_9`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_ckff_c;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_ckff_c IS
'Bronze Pershing table bronze_pershing_ckff_c contains transaction, cash, financial activity, and reconciliation records sourced from landing_pershing.default.pershing_ckff_c for warehouse parity, validation, reconciliation, and downstream reporting.';
