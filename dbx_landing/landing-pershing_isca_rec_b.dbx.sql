-- Databricks SQL for source: pershing
-- Generated from sqlserver_dbt/landing-pershing_isca_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ISCA_B"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_isca_b (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CUSIP_NUMBER` STRING,
    `NOT_USED` STRING,
    `ETF_INDICATOR` STRING,
    `BID_PRICE` DECIMAL(10,3),
    `ASK_PRICE` DECIMAL(10,3),
    `PREVIOUS_DAY_PRICE` DECIMAL(10,3),
    `LATEST_PRICE` DECIMAL(10,3),
    `END_OF_MONTH_PRICE` DECIMAL(10,3),
    `ROUND_LOT_QUANTITY` INT,
    `DIVIDEND_REINVESTMENT_ELIGIBILITY_INDICATOR` STRING,
    `PREVIOUS_PRICE_DATE` INT,
    `LATEST_PRICE_DATE` INT,
    `END_OF_MONTH_PRICE_DATE` INT,
    `RECORD_DATE` INT,
    `FUNDVEST_INDICATOR` STRING,
    `COUNTRY_CODE` STRING,
    `STANDARD_AND_POORS_RATING` STRING,
    `MOODYS_RATING` STRING,
    `BOND_SUB_CLASS` STRING,
    `RESTRICTION_INDICATOR` STRING,
    `TRACE_INDICATOR` STRING,
    `NEW_INTEREST_CALCULATION_CODE` STRING,
    `SIC_CODE` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_isca_b IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_isca_b;

INSERT INTO landing_pershing.default.pershing_isca_b (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `CUSIP_NUMBER`, `NOT_USED`, `ETF_INDICATOR`, `BID_PRICE`,
    `ASK_PRICE`, `PREVIOUS_DAY_PRICE`, `LATEST_PRICE`, `END_OF_MONTH_PRICE`, `ROUND_LOT_QUANTITY`,
    `DIVIDEND_REINVESTMENT_ELIGIBILITY_INDICATOR`, `PREVIOUS_PRICE_DATE`, `LATEST_PRICE_DATE`,
    `END_OF_MONTH_PRICE_DATE`, `RECORD_DATE`, `FUNDVEST_INDICATOR`, `COUNTRY_CODE`, `STANDARD_AND_POORS_RATING`,
    `MOODYS_RATING`, `BOND_SUB_CLASS`, `RESTRICTION_INDICATOR`, `TRACE_INDICATOR`, `NEW_INTEREST_CALCULATION_CODE`,
    `SIC_CODE`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('NOT_USED_', format_string('%02d', idx)) AS `NOT_USED`,
    concat('ETF_INDICATOR_', format_string('%02d', idx)) AS `ETF_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `BID_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `ASK_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `PREVIOUS_DAY_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `LATEST_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `END_OF_MONTH_PRICE`,
    idx AS `ROUND_LOT_QUANTITY`,
    concat('DIVIDEND_REINVESTMENT_EL_', format_string('%02d', idx)) AS `DIVIDEND_REINVESTMENT_ELIGIBILITY_INDICATOR`,
    idx AS `PREVIOUS_PRICE_DATE`,
    idx AS `LATEST_PRICE_DATE`,
    idx AS `END_OF_MONTH_PRICE_DATE`,
    idx AS `RECORD_DATE`,
    concat('FUNDVEST_INDICATOR_', format_string('%02d', idx)) AS `FUNDVEST_INDICATOR`,
    concat('COUNTRY_CODE_', format_string('%02d', idx)) AS `COUNTRY_CODE`,
    concat('STANDARD_AND_POORS_RATIN_', format_string('%02d', idx)) AS `STANDARD_AND_POORS_RATING`,
    concat('MOODYS_RATING_', format_string('%02d', idx)) AS `MOODYS_RATING`,
    concat('BOND_SUB_CLASS_', format_string('%02d', idx)) AS `BOND_SUB_CLASS`,
    concat('RESTRICTION_INDICATOR_', format_string('%02d', idx)) AS `RESTRICTION_INDICATOR`,
    concat('TRACE_INDICATOR_', format_string('%02d', idx)) AS `TRACE_INDICATOR`,
    concat('NEW_INTEREST_CALCULATION_', format_string('%02d', idx)) AS `NEW_INTEREST_CALCULATION_CODE`,
    concat('SIC_CODE_', format_string('%02d', idx)) AS `SIC_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_isca_b' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_isca_b;
