-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_capt_rec_5.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPT_5"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_capt_5 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `OPTION_ROOT_ID` STRING,
    `EXPIRATION_DATE` DATE,
    `CALL_PUT_INDICATOR` STRING,
    `STRIKE_PRICE` DECIMAL(10,3),
    `MASTER_CLIENT_NAME` STRING,
    `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER` STRING,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_capt_5 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_capt_5;

INSERT INTO landing_pershing.default.pershing_capt_5 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `OPTION_ROOT_ID`, `EXPIRATION_DATE`, `CALL_PUT_INDICATOR`,
    `STRIKE_PRICE`, `MASTER_CLIENT_NAME`, `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    concat('OPTION_ROOT_ID_', format_string('%02d', idx)) AS `OPTION_ROOT_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `EXPIRATION_DATE`,
    concat('CALL_PUT_INDICATOR_', format_string('%02d', idx)) AS `CALL_PUT_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `STRIKE_PRICE`,
    concat('MASTER_CLIENT_NAME_', format_string('%02d', idx)) AS `MASTER_CLIENT_NAME`,
    concat('PERSHING_INTERNAL_ORDER__', format_string('%02d', idx)) AS `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`,
    concat('EXPANDED_INVESTMENT_PROF_', format_string('%02d', idx)) AS `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('EXPANDED_FROM_INVESTMENT_', format_string('%02d', idx)) AS `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_capt_5' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_capt_5;
