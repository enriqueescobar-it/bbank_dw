-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_isca_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ISCA_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_isca_a (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CUSIP_NUMBER` STRING,
    `SECURITY_TYPE` STRING,
    `SECURITY_MODIFIER` STRING,
    `SECURITY_CALCULATION_CODE` STRING,
    `PRIMARY_EXCHANGE` STRING,
    `COUPON_RATE_OR_INDICATED_DIVIDEND` DECIMAL(10,3),
    `UNDERLYING_SECURITY_CUSIP` STRING,
    `FIRST_CALL_PRICE_OR_STRIKE_PRICE` DECIMAL(11,4),
    `FIRST_PAR_CALL_PRICE_OR_UNITS` DECIMAL(11,4),
    `PRIMARY_SYMBOL` STRING,
    `INTEREST_FREQUENCY` STRING,
    `BOND_CLASS` STRING,
    `FIRST_COUPON_DAY` STRING,
    `CALL_INDICATOR` STRING,
    `PUT_INDICATOR` STRING,
    `FEDERAL_MARGINABLE_INDICATOR` STRING,
    `CNS_ELIGIBLE_CODE` STRING,
    `DTCC_ELIGIBLE_CODE` STRING,
    `NSCC_ELIGIBLE_CODE` STRING,
    `FOREIGN_SECURITY` STRING,
    `SECOND_COUPON_DAY` STRING,
    `DIVIDEND_INTEREST_PAYMENT_METHOD` STRING,
    `MINOR_PRODUCT_CODE` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_isca_a IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_isca_a;

INSERT INTO landing_pershing.default.pershing_isca_a (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `CUSIP_NUMBER`, `SECURITY_TYPE`, `SECURITY_MODIFIER`,
    `SECURITY_CALCULATION_CODE`, `PRIMARY_EXCHANGE`, `COUPON_RATE_OR_INDICATED_DIVIDEND`, `UNDERLYING_SECURITY_CUSIP`,
    `FIRST_CALL_PRICE_OR_STRIKE_PRICE`, `FIRST_PAR_CALL_PRICE_OR_UNITS`, `PRIMARY_SYMBOL`, `INTEREST_FREQUENCY`,
    `BOND_CLASS`, `FIRST_COUPON_DAY`, `CALL_INDICATOR`, `PUT_INDICATOR`, `FEDERAL_MARGINABLE_INDICATOR`,
    `CNS_ELIGIBLE_CODE`, `DTCC_ELIGIBLE_CODE`, `NSCC_ELIGIBLE_CODE`, `FOREIGN_SECURITY`, `SECOND_COUPON_DAY`,
    `DIVIDEND_INTEREST_PAYMENT_METHOD`, `MINOR_PRODUCT_CODE`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('SECURITY_TYPE_', format_string('%02d', idx)) AS `SECURITY_TYPE`,
    concat('SECURITY_MODIFIER_', format_string('%02d', idx)) AS `SECURITY_MODIFIER`,
    concat('SECURITY_CALCULATION_COD_', format_string('%02d', idx)) AS `SECURITY_CALCULATION_CODE`,
    concat('PRIMARY_EXCHANGE_', format_string('%02d', idx)) AS `PRIMARY_EXCHANGE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `COUPON_RATE_OR_INDICATED_DIVIDEND`,
    concat('UNDERLYING_SECURITY_CUSI_', format_string('%02d', idx)) AS `UNDERLYING_SECURITY_CUSIP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(11,4)) AS `FIRST_CALL_PRICE_OR_STRIKE_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(11,4)) AS `FIRST_PAR_CALL_PRICE_OR_UNITS`,
    concat('PRIMARY_SYMBOL_', format_string('%02d', idx)) AS `PRIMARY_SYMBOL`,
    concat('INTEREST_FREQUENCY_', format_string('%02d', idx)) AS `INTEREST_FREQUENCY`,
    concat('BOND_CLASS_', format_string('%02d', idx)) AS `BOND_CLASS`,
    concat('FIRST_COUPON_DAY_', format_string('%02d', idx)) AS `FIRST_COUPON_DAY`,
    concat('CALL_INDICATOR_', format_string('%02d', idx)) AS `CALL_INDICATOR`,
    concat('PUT_INDICATOR_', format_string('%02d', idx)) AS `PUT_INDICATOR`,
    concat('FEDERAL_MARGINABLE_INDIC_', format_string('%02d', idx)) AS `FEDERAL_MARGINABLE_INDICATOR`,
    concat('CNS_ELIGIBLE_CODE_', format_string('%02d', idx)) AS `CNS_ELIGIBLE_CODE`,
    concat('DTCC_ELIGIBLE_CODE_', format_string('%02d', idx)) AS `DTCC_ELIGIBLE_CODE`,
    concat('NSCC_ELIGIBLE_CODE_', format_string('%02d', idx)) AS `NSCC_ELIGIBLE_CODE`,
    concat('FOREIGN_SECURITY_', format_string('%02d', idx)) AS `FOREIGN_SECURITY`,
    concat('SECOND_COUPON_DAY_', format_string('%02d', idx)) AS `SECOND_COUPON_DAY`,
    concat('DIVIDEND_INTEREST_PAYMEN_', format_string('%02d', idx)) AS `DIVIDEND_INTEREST_PAYMENT_METHOD`,
    concat('MINOR_PRODUCT_CODE_', format_string('%02d', idx)) AS `MINOR_PRODUCT_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_isca_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_isca_a;
