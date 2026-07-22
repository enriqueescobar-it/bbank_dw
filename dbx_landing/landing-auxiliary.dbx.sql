-- Databricks SQL for source: auxiliary
-- Generated from sqlserver/brz-auxiliary.sql

CREATE CATALOG IF NOT EXISTS landing;
USE CATALOG landing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: static query auxiliary_br_dcode
CREATE TABLE IF NOT EXISTS landing.default.auxiliary_br_dcode (
    `Mapping_Type` STRING,
    `Key` STRING,
    `Value` DECIMAL(38,10),
    `LOADED_AT` TIMESTAMP
);

TRUNCATE TABLE landing.default.auxiliary_br_dcode;

INSERT INTO landing.default.auxiliary_br_dcode (
    `Mapping_Type`, `Key`, `Value`, `LOADED_AT`
)
SELECT
    concat('MAPPING_TYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `Mapping_Type`,
    concat('KEY_', lpad(CAST(idx AS STRING), 2, '0')) AS `Key`,
    CAST(idx * 100.25 AS DECIMAL(38,10)) AS `Value`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: static query auxiliary_jha_sei_trans_code
CREATE TABLE IF NOT EXISTS landing.default.auxiliary_jha_sei_trans_code (
    `TYPE` STRING,
    `CODE` STRING,
    `DEBIT_CREDIT` STRING,
    `AFFECT` STRING,
    `DESCRIPTION` STRING,
    `TRANSACTION_TYPE` STRING,
    `ACCOUNT_TYPE` STRING,
    `DESCRIPTION_CODE` STRING,
    `TREATMENT_CODE` STRING,
    `LOADED_AT` TIMESTAMP
);

TRUNCATE TABLE landing.default.auxiliary_jha_sei_trans_code;

INSERT INTO landing.default.auxiliary_jha_sei_trans_code (
    `TYPE`, `CODE`, `DEBIT_CREDIT`, `AFFECT`, `DESCRIPTION`, `TRANSACTION_TYPE`,
    `ACCOUNT_TYPE`, `DESCRIPTION_CODE`, `TREATMENT_CODE`, `LOADED_AT`
)
SELECT
    concat('TYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `TYPE`,
    concat('CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `CODE`,
    concat('DEBIT_CREDIT_', lpad(CAST(idx AS STRING), 2, '0')) AS `DEBIT_CREDIT`,
    concat('AFFECT_', lpad(CAST(idx AS STRING), 2, '0')) AS `AFFECT`,
    concat('DESCRIPTION_', lpad(CAST(idx AS STRING), 2, '0')) AS `DESCRIPTION`,
    concat('TRANSACTION_TYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRANSACTION_TYPE`,
    concat('ACCOUNT_TYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACCOUNT_TYPE`,
    concat('DESCRIPTION_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `DESCRIPTION_CODE`,
    concat('TREATMENT_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `TREATMENT_CODE`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

SELECT 'auxiliary_br_dcode' AS table_name, COUNT(*) AS record_count
FROM landing.default.auxiliary_br_dcode
UNION ALL
SELECT 'auxiliary_jha_sei_trans_code' AS table_name, COUNT(*) AS record_count
FROM landing.default.auxiliary_jha_sei_trans_code;
