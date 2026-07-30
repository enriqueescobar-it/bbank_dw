-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isrc_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISRC_REC_A
-- Source table: landing_pershing.default.pershing_isrc_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isrc_a AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_SEQUENCE_IDENTIFIER`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CHANGE_INDICATOR`,
    `SOURCE_CODE`,
    `SOURCE_CODE_DESCRIPTION_LINE_ONE`,
    `SOURCE_CODE_DESCRIPTION_LINE_TWO`,
    `SOURCE_CODE_DESCRIPTION_LINE_THREE`,
    `TAX_STATUS`,
    `USERID_OF_PERSON_WHO_LAST_ADDED_UPDATED_RECORD`,
    `DATE_ADDED`,
    `DATE_UPDATED`,
    `IRA_INCOME_ELEGIBLE`,
    `RETAIL_INCOME_ELEGIBLE`,
    `CUSTOMER_FIRM`,
    `CREDIT_DEBIT`,
    `STATEMENT_INDICATOR`,
    `STATEMENT_ACTIVITY_SUMMARY_INDICATOR`,
    `STATEMENT_ACTIVITY_SUMMARY_NUMBER`,
    `STATEMENT_TRANSACTION_SUMMARY_INDICATOR`,
    `STATEMENT_TRANSACTION_NUMBER`,
    `STATEMENT_DISTRIBUTION_INDICATOR`,
    `STATEMENT_DISTRIBUTION_NUMBER`,
    `STATEMENT_DISTRIBUTION_TAXABLE_INDICATOR`,
    `STATEMENT_DIVIDEND_INDICATOR`,
    `STATEMENT_DIVIDEND_NUMBER`,
    `STATEMENT_DIVIDEND_TAXABLE_INDICATOR`,
    `PERSHING_DEPARTMENT`,
    `PERSHING_GROUP_THAT_MANAGES_THE_SOURCE_CODE`,
    `USERID_OF_PERSON_WHO_ADDED_CODE`,
    `USERID_OF_PERSON_WHO_UPDATED_CODE`,
    `PORTFOLIO_ELIGIBLE_INDICATOR`,
    `REINVEST_INDICATOR`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isrc_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isrc_a IS
'Bronze Pershing table bronze_pershing_isrc_a contains brokerage records sourced from landing_pershing.default.pershing_isrc_a for warehouse parity, validation, reconciliation, and downstream reporting.';
