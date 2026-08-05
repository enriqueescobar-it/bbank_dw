-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isca_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISCA_REC_A
-- Source table: landing_pershing.default.pershing_isca_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isca_a AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CUSIP_NUMBER`,
    `SECURITY_TYPE`,
    `SECURITY_MODIFIER`,
    `SECURITY_CALCULATION_CODE`,
    `PRIMARY_EXCHANGE`,
    `COUPON_RATE_OR_INDICATED_DIVIDEND`,
    `UNDERLYING_SECURITY_CUSIP`,
    `FIRST_CALL_PRICE_OR_STRIKE_PRICE`,
    `FIRST_PAR_CALL_PRICE_OR_UNITS`,
    `PRIMARY_SYMBOL`,
    `INTEREST_FREQUENCY`,
    `BOND_CLASS`,
    `FIRST_COUPON_DAY`,
    `CALL_INDICATOR`,
    `PUT_INDICATOR`,
    `FEDERAL_MARGINABLE_INDICATOR`,
    `CNS_ELIGIBLE_CODE`,
    `DTCC_ELIGIBLE_CODE`,
    `NSCC_ELIGIBLE_CODE`,
    `FOREIGN_SECURITY`,
    `SECOND_COUPON_DAY`,
    `DIVIDEND_INTEREST_PAYMENT_METHOD`,
    `MINOR_PRODUCT_CODE`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isca_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isca_a IS
'Bronze Pershing table bronze_pershing_isca_a contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_isca_a for warehouse parity, validation, reconciliation, and downstream reporting.';
