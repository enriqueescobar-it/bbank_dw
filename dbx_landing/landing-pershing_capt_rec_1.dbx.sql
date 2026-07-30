-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_capt_rec_1.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPT_1"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_capt_1 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `TRADE_DATE` DATE,
    `TRADE_REFERENCE_NUMBER` STRING,
    `PERSHING_OFFICE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `ACCOUNT_NAME` STRING,
    `BUY_SELL_INDICATOR` STRING,
    `CANCEL_INDICATOR` STRING,
    `CAPS_SOURCE` STRING,
    `TRADE_QUANTITY` DECIMAL(14,4),
    `PRICE` DECIMAL(14,7),
    `PRODUCT_CODE` STRING,
    `CUSIP_NUMBER_OF_SECURITY_TRADED` STRING,
    `ACCOUNT_SHORT_NAME` STRING,
    `ORDER_TYPE` STRING,
    `MISCELLANEOUS_FEE` DECIMAL(14,2),
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_capt_1 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_capt_1;

INSERT INTO landing_pershing.default.pershing_capt_1 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `TRADE_DATE`, `TRADE_REFERENCE_NUMBER`,
    `PERSHING_OFFICE_NUMBER`, `ACCOUNT_NUMBER`, `ACCOUNT_NAME`, `BUY_SELL_INDICATOR`, `CANCEL_INDICATOR`, `CAPS_SOURCE`,
    `TRADE_QUANTITY`, `PRICE`, `PRODUCT_CODE`, `CUSIP_NUMBER_OF_SECURITY_TRADED`, `ACCOUNT_SHORT_NAME`, `ORDER_TYPE`,
    `MISCELLANEOUS_FEE`, `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `TRADE_DATE`,
    concat('TRADE_REFERENCE_NUMBER_', format_string('%02d', idx)) AS `TRADE_REFERENCE_NUMBER`,
    concat('PERSHING_OFFICE_NUMBER_', format_string('%02d', idx)) AS `PERSHING_OFFICE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('ACCOUNT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_NAME`,
    concat('BUY_SELL_INDICATOR_', format_string('%02d', idx)) AS `BUY_SELL_INDICATOR`,
    concat('CANCEL_INDICATOR_', format_string('%02d', idx)) AS `CANCEL_INDICATOR`,
    concat('CAPS_SOURCE_', format_string('%02d', idx)) AS `CAPS_SOURCE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,4)) AS `TRADE_QUANTITY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,7)) AS `PRICE`,
    concat('PRODUCT_CODE_', format_string('%02d', idx)) AS `PRODUCT_CODE`,
    concat('CUSIP_NUMBER_OF_SECURITY_', format_string('%02d', idx)) AS `CUSIP_NUMBER_OF_SECURITY_TRADED`,
    concat('ACCOUNT_SHORT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_SHORT_NAME`,
    concat('ORDER_TYPE_', format_string('%02d', idx)) AS `ORDER_TYPE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,2)) AS `MISCELLANEOUS_FEE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_capt_1' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_capt_1;
