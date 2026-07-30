-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_ckff_rec_d.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CKFF_REC_D
-- Source table: landing_pershing.default.pershing_ckff_d
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_ckff_rec_d AS
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
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_1`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_2`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_3`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_4`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_5`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_6`,
    `BANK_NAME`,
    `ORD_INST_INFO_1_OR_DESC_TRAN_ADD_INFO_1`,
    `ORD_INST_INFO_2_OR_ABA_NUMBER_ADD_INFO_2`,
    `ORD_INST_INFO_3_OR_DDA_NUMBER_ADD_INFO_3`,
    `ORD_INST_INFO_4_OR_ADD_INFO_4`,
    `ORD_INST_INFO_5_OR_ADD_INFO_5`,
    `ORD_INST_INFO_6_OR_ADD_INFO_6`,
    `ORD_INST_INFO_7_OR_ADD_INFO_7`,
    `ORD_INST_INFO_8_OR_ADD_INFO_8`,
    `ORD_INST_INFO_9_OR_ADD_INFO_9`,
    `INCOMING_WIRE_INDICATOR`,
    `TRANSACTION_IDENTIFIER`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_ckff_d;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_ckff_rec_d IS
'Bronze Pershing table bronze_pershing_ckff_rec_d contains transaction, cash, financial activity, and reconciliation records sourced from landing_pershing.default.pershing_ckff_d for warehouse parity, validation, reconciliation, and downstream reporting.';
