-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_ckff_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CKFF_REC_A
-- Source table: landing_pershing.default.pershing_ckff_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_ckff_rec_a AS
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
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `INTERMEDIARY_DESCRIPTION_LINE_1`,
    `INTERMEDIARY_DESCRIPTION_LINE_2`,
    `ACCOUNT_WITH_INSTITUTION`,
    `BENEFICIARY_CUSTOMER_1`,
    `BENEFICIARY_CUSTOMER_2`,
    `BENEFICIARY_CUSTOMER_3`,
    `BENEFICIARY_CUSTOMER_4`,
    `OUTGOING_WIRES_ADD_INFO1_OR_DESC_TRANSACT`,
    `OUTGOING_WIRES_ADD_INFO2_OR_ABA_NUMBER`,
    `OUTGOING_WIRES_ADD_INFO3_OR_DDA_NUMBER`,
    `OUTGOING_WIRES_ACH_ADD_INFO4`,
    `OUTGOING_WIRES_ACH_ADD_INFO5`,
    `OUTGOING_WIRES_ACH_ADD_INFO6`,
    `OUTGOING_WIRES_ACH_ADD_INFO7`,
    `OUTGOING_WIRES_ACH_ADD_INFO8`,
    `OUTGOING_WIRES_ACH_ADD_INFO9`,
    `DUPLICATE_RECORD_INDICATOR`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_ckff_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_ckff_rec_a IS
'Bronze Pershing table bronze_pershing_ckff_rec_a contains transaction, cash, financial activity, and reconciliation records sourced from landing_pershing.default.pershing_ckff_a for warehouse parity, validation, reconciliation, and downstream reporting.';
