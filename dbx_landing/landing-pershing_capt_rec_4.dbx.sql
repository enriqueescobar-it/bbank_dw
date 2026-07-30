-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_capt_rec_4.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPT_4"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_capt_4 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `CURRENCY_CODE` STRING,
    `CURRENCY_AMOUNT_OF_REVENUE` DECIMAL(20,3),
    `FOREIGN_EXCHANGE_RATE` DECIMAL(20,10),
    `CURRENCY_MULTI_DIV_INDICATOR` STRING,
    `IBD_SETTLEMENT_FEE_USD` DECIMAL(20,3),
    `CUSTOMER_SETTLEMENT_FEE_USD` DECIMAL(20,3),
    `GLOSS_REFERENCE_NUMBER` STRING,
    `CURRENCY_AMOUNT_OF_PERSHING_CHARGE` DECIMAL(14,2),
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_capt_4 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_capt_4;

INSERT INTO landing_pershing.default.pershing_capt_4 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `CURRENCY_CODE`, `CURRENCY_AMOUNT_OF_REVENUE`,
    `FOREIGN_EXCHANGE_RATE`, `CURRENCY_MULTI_DIV_INDICATOR`, `IBD_SETTLEMENT_FEE_USD`, `CUSTOMER_SETTLEMENT_FEE_USD`,
    `GLOSS_REFERENCE_NUMBER`, `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`, `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    concat('CURRENCY_CODE_', format_string('%02d', idx)) AS `CURRENCY_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,3)) AS `CURRENCY_AMOUNT_OF_REVENUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,10)) AS `FOREIGN_EXCHANGE_RATE`,
    concat('CURRENCY_MULTI_DIV_INDIC_', format_string('%02d', idx)) AS `CURRENCY_MULTI_DIV_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,3)) AS `IBD_SETTLEMENT_FEE_USD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,3)) AS `CUSTOMER_SETTLEMENT_FEE_USD`,
    concat('GLOSS_REFERENCE_NUMBER_', format_string('%02d', idx)) AS `GLOSS_REFERENCE_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,2)) AS `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_capt_4' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_capt_4;
