-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_capt_rec_3.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPT_REC_3
-- Source table: landing_pershing.default.pershing_capt_3
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_capt_3 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `AS_OF_TRADE_INDICATOR`,
    `DISTRIBUTION_INDICATOR`,
    `EXPLODE_INDICATOR`,
    `REVENUE_TYPE`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `INVESTMENT_PROFESSIONAL_CAPS_REVENUE_CENTER`,
    `INVESTMENT_PROFESSIONAL_CAPS_OFFICE_NUMBER`,
    `INVESTMENT_PROFESSIONAL_SPLIT_PERCENT`,
    `TOTAL_AMOUNT_OF_REVENUE_GENERATED_AND_CREDITED_TO_IP`,
    `PERSHING_CHARGE`,
    `LEGACY_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    `CAPS_REVENUE_CENTER_ASSOCIATED_WITH_IP`,
    `CAPS_OFFICE_NUMBER_ASSOCIATED_WITH_IP`,
    `TOTAL_ORDER_COMMISSION`,
    `SPREAD_STRADDLE_MUTUAL_FUND_VALUES`,
    `CORRECTION_CODE`,
    `SECURITY_MODIFIER`,
    `SECURITY_CALCULATION_CODE`,
    `PRINCIPAL`,
    `CRD_NUMBER`,
    `SOURCE_OF_INPUT`,
    `SERVICE_CHARGE_OTHER_FEE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_capt_3;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_capt_3 IS
'Bronze Pershing table bronze_pershing_capt_3 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_capt_3 for warehouse parity, validation, reconciliation, and downstream reporting.';
