-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isca_rec_c.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISCA_REC_C
-- Source table: landing_pershing.default.pershing_isca_c
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isca_rec_c AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CUSIP_NUMBER`,
    `STATE_TAX_INDICATOR`,
    `FEDERAL_TAXABLE_STATUS_INDICATOR`,
    `AMT_INDICATOR`,
    `RIC_INDICATOR`,
    `NUMBER_OF_DESCRIPTION_LINES`,
    `SECURITY_DESCRIPTION_LINE_1`,
    `SECURITY_DESCRIPTION_LINE_2`,
    `SECURITY_DESCRIPTION_LINE_3`,
    `SECURITY_DESCRIPTION_LINE_4`,
    `SECURITY_DESCRIPTION_LINE_5`,
    `USER_CUSIP_IDENTIFIER`,
    `TAXABLE_INDICATOR`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isca_c;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isca_rec_c IS
'Bronze Pershing table bronze_pershing_isca_rec_c contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_isca_c for warehouse parity, validation, reconciliation, and downstream reporting.';
