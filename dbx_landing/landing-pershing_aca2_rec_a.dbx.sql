-- Databricks SQL for source: pershing
-- Generated from sqlserver_dbt/landing-pershing_aca2_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ACA2_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_aca2_a (
    `TRANSACTION_CODE` STRING,
    `RECORD_INDICATOR_TRANSFER_TYPE` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `INVESTMENT_PROFESSIONAL` STRING,
    `RECORD_TYPE` STRING,
    `TRANSFER_TYPE` STRING,
    `TRANSFER_STATUS` STRING,
    `NUMBER_OF_DAYS_IN_PERSHING_STATUS` STRING,
    `CONTRA_BROKER_NUMBER` STRING,
    `CONTRA_BROKER_NAME` STRING,
    `CONTRA_ACCOUNT_NUMBER` STRING,
    `RETIREMENT_ACCOUNT_CLASS_INDICATOR` STRING,
    `REQUEST_CREATION_DATE` INT,
    `REQUEST_CREATION_USER_ID` STRING,
    `LAST_UPDATE_DATE` INT,
    `LAST_UPDATE_USER_ID` STRING,
    `TOTAL_MARKET_VALUE_OF_TRANSFER` DECIMAL(16,2),
    `TOTAL_MARKET_VALUE_SIGN` STRING,
    `SOURCE_CODE` STRING,
    `SPECIAL_MEMORANDUM_ACCOUNT` DECIMAL(16,2),
    `SPECIAL_MEMORANDUM_ACCOUNT_SIGN` STRING,
    `CUSTOMER_NAME` STRING,
    `PRIMARY_TAX_IDENTIFICATION_NUMBER` STRING,
    `NSCC_ACCOUNT_TYPE` STRING,
    `NSCC_STATUS` STRING,
    `NUMBER_OF_DAYS_IN_NSCC_STATUS` STRING,
    `NSCC_CONTROL_NUMBER` STRING,
    `REASON_CODE_FOR_REJECT` STRING,
    `REASON_COMMENTS` STRING,
    `REQUEST_ID` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_aca2_a IS
'The table contains Pershing ACATS transfer record A data with account identifiers, transfer status, contra broker details, request metadata, market values, NSCC status, reject reasons, and data-date controls. It supports landing-layer validation for transfer monitoring, exception review, and downstream brokerage operations reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_aca2_a;

INSERT INTO landing_pershing.default.pershing_aca2_a (
    `TRANSACTION_CODE`, `RECORD_INDICATOR_TRANSFER_TYPE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `INVESTMENT_PROFESSIONAL`, `RECORD_TYPE`,
    `TRANSFER_TYPE`, `TRANSFER_STATUS`, `NUMBER_OF_DAYS_IN_PERSHING_STATUS`, `CONTRA_BROKER_NUMBER`, `CONTRA_BROKER_NAME`, `CONTRA_ACCOUNT_NUMBER`,
    `RETIREMENT_ACCOUNT_CLASS_INDICATOR`, `REQUEST_CREATION_DATE`, `REQUEST_CREATION_USER_ID`, `LAST_UPDATE_DATE`, `LAST_UPDATE_USER_ID`, `TOTAL_MARKET_VALUE_OF_TRANSFER`,
    `TOTAL_MARKET_VALUE_SIGN`, `SOURCE_CODE`, `SPECIAL_MEMORANDUM_ACCOUNT`, `SPECIAL_MEMORANDUM_ACCOUNT_SIGN`, `CUSTOMER_NAME`, `PRIMARY_TAX_IDENTIFICATION_NUMBER`,
    `NSCC_ACCOUNT_TYPE`, `NSCC_STATUS`, `NUMBER_OF_DAYS_IN_NSCC_STATUS`, `NSCC_CONTROL_NUMBER`, `REASON_CODE_FOR_REJECT`, `REASON_COMMENTS`,
    `REQUEST_ID`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    concat('RECORD_INDICATOR_TRANSFE_', format_string('%02d', idx)) AS `RECORD_INDICATOR_TRANSFER_TYPE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('INVESTMENT_PROFESSIONAL_', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL`,
    concat('RECORD_TYPE_', format_string('%02d', idx)) AS `RECORD_TYPE`,
    concat('TRANSFER_TYPE_', format_string('%02d', idx)) AS `TRANSFER_TYPE`,
    concat('TRANSFER_STATUS_', format_string('%02d', idx)) AS `TRANSFER_STATUS`,
    concat('NUMBER_OF_DAYS_IN_PERSHI_', format_string('%02d', idx)) AS `NUMBER_OF_DAYS_IN_PERSHING_STATUS`,
    concat('CONTRA_BROKER_NUMBER_', format_string('%02d', idx)) AS `CONTRA_BROKER_NUMBER`,
    concat('CONTRA_BROKER_NAME_', format_string('%02d', idx)) AS `CONTRA_BROKER_NAME`,
    concat('CONTRA_ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `CONTRA_ACCOUNT_NUMBER`,
    concat('RETIREMENT_ACCOUNT_CLASS_', format_string('%02d', idx)) AS `RETIREMENT_ACCOUNT_CLASS_INDICATOR`,
    idx AS `REQUEST_CREATION_DATE`,
    concat('REQUEST_CREATION_USER_ID_', format_string('%02d', idx)) AS `REQUEST_CREATION_USER_ID`,
    idx AS `LAST_UPDATE_DATE`,
    concat('LAST_UPDATE_USER_ID_', format_string('%02d', idx)) AS `LAST_UPDATE_USER_ID`,
    TRY_CAST(idx * 100.25 AS DECIMAL(16,2)) AS `TOTAL_MARKET_VALUE_OF_TRANSFER`,
    concat('TOTAL_MARKET_VALUE_SIGN_', format_string('%02d', idx)) AS `TOTAL_MARKET_VALUE_SIGN`,
    concat('SOURCE_CODE_', format_string('%02d', idx)) AS `SOURCE_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(16,2)) AS `SPECIAL_MEMORANDUM_ACCOUNT`,
    concat('SPECIAL_MEMORANDUM_ACCOU_', format_string('%02d', idx)) AS `SPECIAL_MEMORANDUM_ACCOUNT_SIGN`,
    concat('CUSTOMER_NAME_', format_string('%02d', idx)) AS `CUSTOMER_NAME`,
    concat('PRIMARY_TAX_IDENTIFICATI_', format_string('%02d', idx)) AS `PRIMARY_TAX_IDENTIFICATION_NUMBER`,
    concat('NSCC_ACCOUNT_TYPE_', format_string('%02d', idx)) AS `NSCC_ACCOUNT_TYPE`,
    concat('NSCC_STATUS_', format_string('%02d', idx)) AS `NSCC_STATUS`,
    concat('NUMBER_OF_DAYS_IN_NSCC_S_', format_string('%02d', idx)) AS `NUMBER_OF_DAYS_IN_NSCC_STATUS`,
    concat('NSCC_CONTROL_NUMBER_', format_string('%02d', idx)) AS `NSCC_CONTROL_NUMBER`,
    concat('REASON_CODE_FOR_REJECT_', format_string('%02d', idx)) AS `REASON_CODE_FOR_REJECT`,
    concat('REASON_COMMENTS_', format_string('%02d', idx)) AS `REASON_COMMENTS`,
    concat('REQUEST_ID_', format_string('%02d', idx)) AS `REQUEST_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_aca2_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_aca2_a;
