-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_isca_rec_j.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ISCA_J"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_isca_j (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CUSIP_NUMBER` STRING,
    `NOT_USED_1` STRING,
    `LATEST_PRICE` DECIMAL(18,9),
    `LATEST_PRICE_DATE` INT,
    `FACTORED_MARKET_VALUE_MULTIPLIER` DECIMAL(18,9),
    `CURRENT_YIELD` DECIMAL(18,9),
    `YIELD` DECIMAL(18,9),
    `PRICE_SOURCE` DECIMAL(38,10),
    `COUNTRY_OF_ORIGIN` STRING,
    `RESTRICTED_SECURITY_CODE` STRING,
    `INTERNATIONAL_NON_DOLLAR_SYMBOL` DECIMAL(38,10),
    `INTERNATIONAL_EXCHANGE` STRING,
    `VARIABLE_RATE_CATEGORY_CODE` DECIMAL(38,10),
    `INTEREST_RATE_COMPLETION_INDICATOR` DECIMAL(38,10),
    `NOT_USED_2` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_isca_j IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_isca_j;

INSERT INTO landing_pershing.default.pershing_isca_j (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `CUSIP_NUMBER`, `NOT_USED_1`, `LATEST_PRICE`,
    `LATEST_PRICE_DATE`, `FACTORED_MARKET_VALUE_MULTIPLIER`, `CURRENT_YIELD`, `YIELD`, `PRICE_SOURCE`,
    `COUNTRY_OF_ORIGIN`, `RESTRICTED_SECURITY_CODE`, `INTERNATIONAL_NON_DOLLAR_SYMBOL`, `INTERNATIONAL_EXCHANGE`,
    `VARIABLE_RATE_CATEGORY_CODE`, `INTEREST_RATE_COMPLETION_INDICATOR`, `NOT_USED_2`, `DATE_OF_DATA`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('NOT_USED_1_', format_string('%02d', idx)) AS `NOT_USED_1`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `LATEST_PRICE`,
    idx AS `LATEST_PRICE_DATE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `FACTORED_MARKET_VALUE_MULTIPLIER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `CURRENT_YIELD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `YIELD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PRICE_SOURCE`,
    concat('COUNTRY_OF_ORIGIN_', format_string('%02d', idx)) AS `COUNTRY_OF_ORIGIN`,
    concat('RESTRICTED_SECURITY_CODE_', format_string('%02d', idx)) AS `RESTRICTED_SECURITY_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    concat('INTERNATIONAL_EXCHANGE_', format_string('%02d', idx)) AS `INTERNATIONAL_EXCHANGE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `VARIABLE_RATE_CATEGORY_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `INTEREST_RATE_COMPLETION_INDICATOR`,
    concat('NOT_USED_2_', format_string('%02d', idx)) AS `NOT_USED_2`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_isca_j' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_isca_j;
