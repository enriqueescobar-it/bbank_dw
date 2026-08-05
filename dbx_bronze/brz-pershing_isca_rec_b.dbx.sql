-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isca_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISCA_REC_B
-- Source table: landing_pershing.default.pershing_isca_b
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isca_b AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CUSIP_NUMBER`,
    `NOT_USED`,
    `ETF_INDICATOR`,
    `BID_PRICE`,
    `ASK_PRICE`,
    `PREVIOUS_DAY_PRICE`,
    `LATEST_PRICE`,
    `END_OF_MONTH_PRICE`,
    `ROUND_LOT_QUANTITY`,
    `DIVIDEND_REINVESTMENT_ELIGIBILITY_INDICATOR`,
    `PREVIOUS_PRICE_DATE`,
    `LATEST_PRICE_DATE`,
    `END_OF_MONTH_PRICE_DATE`,
    `RECORD_DATE`,
    `FUNDVEST_INDICATOR`,
    `COUNTRY_CODE`,
    `STANDARD_AND_POORS_RATING`,
    `MOODYS_RATING`,
    `BOND_SUB_CLASS`,
    `RESTRICTION_INDICATOR`,
    `TRACE_INDICATOR`,
    `NEW_INTEREST_CALCULATION_CODE`,
    `SIC_CODE`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isca_b;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isca_b IS
'Bronze Pershing table bronze_pershing_isca_b contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_isca_b for warehouse parity, validation, reconciliation, and downstream reporting.';
