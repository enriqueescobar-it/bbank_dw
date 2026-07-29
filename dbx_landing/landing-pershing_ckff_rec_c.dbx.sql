-- Databricks SQL for source: pershing
-- Generated from sqlserver_dbt/landing-pershing_ckff_rec_c.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CKFF_C"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_ckff_c (
    `TRANSACTION_CODE` STRING,
    `RECORD_TYPE` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `TRANSACTION_AMOUNT` DECIMAL(18,2),
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `DESCRIPTION_CODE` STRING,
    `DESCRIPTION` STRING,
    `ADDITIONAL_DESCRIPTION_OR_CHECK_DEPO_ADD_INFO_LINE_1` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_2` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_3` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_4` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_5` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_6` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_7` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_8` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_9` STRING,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_ckff_c IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_ckff_c;

INSERT INTO landing_pershing.default.pershing_ckff_c (
    `TRANSACTION_CODE`, `RECORD_TYPE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `TRANSACTION_AMOUNT`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `DESCRIPTION_CODE`, `DESCRIPTION`,
    `ADDITIONAL_DESCRIPTION_OR_CHECK_DEPO_ADD_INFO_LINE_1`, `CHECK_DEPO_ADD_INFO_LINE_2`, `CHECK_DEPO_ADD_INFO_LINE_3`,
    `CHECK_DEPO_ADD_INFO_LINE_4`, `CHECK_DEPO_ADD_INFO_LINE_5`, `CHECK_DEPO_ADD_INFO_LINE_6`,
    `CHECK_DEPO_ADD_INFO_LINE_7`, `CHECK_DEPO_ADD_INFO_LINE_8`, `CHECK_DEPO_ADD_INFO_LINE_9`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    concat('RECORD_TYPE_', format_string('%02d', idx)) AS `RECORD_TYPE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `TRANSACTION_AMOUNT`,
    concat('LEGACY_INVESTMENT_PROFES_', format_string('%02d', idx)) AS `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('DESCRIPTION_CODE_', format_string('%02d', idx)) AS `DESCRIPTION_CODE`,
    concat('DESCRIPTION_', format_string('%02d', idx)) AS `DESCRIPTION`,
    concat('ADDITIONAL_DESCRIPTION_O_', format_string('%02d', idx)) AS `ADDITIONAL_DESCRIPTION_OR_CHECK_DEPO_ADD_INFO_LINE_1`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_2`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_3`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_4`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_5`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_6`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_7`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_8`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_9`,
    concat('EXPANDED_INVESTMENT_PROF_', format_string('%02d', idx)) AS `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_ckff_c' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_ckff_c;
