-- Databricks SQL for source: pershing
-- Generated from sqlserver_dbt/landing-pershing_capt_rec_2.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPT_2"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_capt_2 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `MARKET_CODE` STRING,
    `BLOTTER_CODE` STRING,
    `SECURITY_TYPE` STRING,
    `STOCK_SYMBOL` STRING,
    `SECURITY_DESCRIPTION` STRING,
    `CENTS_PER_SHARE` DECIMAL(10,4),
    `DISCOUNT_PERCENT` DECIMAL(8,2),
    `PAYCODE` STRING,
    `MASTER_CLIENT_MNEMONIC` STRING,
    `INSTITUTIONAL_RETAIL_INDICATOR` STRING,
    `STATE_CODE` STRING,
    `COMISSION_INDICATOR` STRING,
    `FIRM_TRADING_ACCOUNT` STRING,
    `POSTED_DATE` DATE,
    `SETTLEMENT_DATE` DATE,
    `RECYCLE_INDICATOR` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_capt_2 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_capt_2;

INSERT INTO landing_pershing.default.pershing_capt_2 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `MARKET_CODE`, `BLOTTER_CODE`, `SECURITY_TYPE`, `STOCK_SYMBOL`,
    `SECURITY_DESCRIPTION`, `CENTS_PER_SHARE`, `DISCOUNT_PERCENT`, `PAYCODE`, `MASTER_CLIENT_MNEMONIC`,
    `INSTITUTIONAL_RETAIL_INDICATOR`, `STATE_CODE`, `COMISSION_INDICATOR`, `FIRM_TRADING_ACCOUNT`, `POSTED_DATE`,
    `SETTLEMENT_DATE`, `RECYCLE_INDICATOR`, `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    concat('MARKET_CODE_', format_string('%02d', idx)) AS `MARKET_CODE`,
    concat('BLOTTER_CODE_', format_string('%02d', idx)) AS `BLOTTER_CODE`,
    concat('SECURITY_TYPE_', format_string('%02d', idx)) AS `SECURITY_TYPE`,
    concat('STOCK_SYMBOL_', format_string('%02d', idx)) AS `STOCK_SYMBOL`,
    concat('SECURITY_DESCRIPTION_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,4)) AS `CENTS_PER_SHARE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(8,2)) AS `DISCOUNT_PERCENT`,
    concat('PAYCODE_', format_string('%02d', idx)) AS `PAYCODE`,
    concat('MASTER_CLIENT_MNEMONIC_', format_string('%02d', idx)) AS `MASTER_CLIENT_MNEMONIC`,
    concat('INSTITUTIONAL_RETAIL_IND_', format_string('%02d', idx)) AS `INSTITUTIONAL_RETAIL_INDICATOR`,
    concat('STATE_CODE_', format_string('%02d', idx)) AS `STATE_CODE`,
    concat('COMISSION_INDICATOR_', format_string('%02d', idx)) AS `COMISSION_INDICATOR`,
    concat('FIRM_TRADING_ACCOUNT_', format_string('%02d', idx)) AS `FIRM_TRADING_ACCOUNT`,
    date_add(DATE '2026-01-01', idx - 1) AS `POSTED_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `SETTLEMENT_DATE`,
    concat('RECYCLE_INDICATOR_', format_string('%02d', idx)) AS `RECYCLE_INDICATOR`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_capt_2' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_capt_2;
