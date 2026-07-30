-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_isca_rec_g.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ISCA_G"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_isca_g (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CUSIP_NUMBER` STRING,
    `NOT_USED_1` STRING,
    `DELTA` DECIMAL(18,9),
    `DELTA_VALUE_PRESENCE_INDICATOR` DECIMAL(38,10),
    `NOT_USED_2` STRING,
    `ISIN_CODE` STRING,
    `ISSUER_IDENTIFIER` STRING,
    `PIUO` STRING,
    `NOT_USED_3` STRING,
    `SYMBOL_OF_THE_UNDERLYING_SECURITY` STRING,
    `ASSET_TYPE` STRING,
    `ASSET_SUBTYPE` STRING,
    `ASSET_SUB_SUBTYPE` STRING,
    `PAYMENT_DAY_DELAYS` INT,
    `RESERVED_FOR_FUTURE_RATING` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_isca_g IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_isca_g;

INSERT INTO landing_pershing.default.pershing_isca_g (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `CUSIP_NUMBER`, `NOT_USED_1`, `DELTA`,
    `DELTA_VALUE_PRESENCE_INDICATOR`, `NOT_USED_2`, `ISIN_CODE`, `ISSUER_IDENTIFIER`, `PIUO`, `NOT_USED_3`,
    `SYMBOL_OF_THE_UNDERLYING_SECURITY`, `ASSET_TYPE`, `ASSET_SUBTYPE`, `ASSET_SUB_SUBTYPE`, `PAYMENT_DAY_DELAYS`,
    `RESERVED_FOR_FUTURE_RATING`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('NOT_USED_1_', format_string('%02d', idx)) AS `NOT_USED_1`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `DELTA`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `DELTA_VALUE_PRESENCE_INDICATOR`,
    concat('NOT_USED_2_', format_string('%02d', idx)) AS `NOT_USED_2`,
    concat('ISIN_CODE_', format_string('%02d', idx)) AS `ISIN_CODE`,
    concat('ISSUER_IDENTIFIER_', format_string('%02d', idx)) AS `ISSUER_IDENTIFIER`,
    concat('PIUO_', format_string('%02d', idx)) AS `PIUO`,
    concat('NOT_USED_3_', format_string('%02d', idx)) AS `NOT_USED_3`,
    concat('SYMBOL_OF_THE_UNDERLYING_', format_string('%02d', idx)) AS `SYMBOL_OF_THE_UNDERLYING_SECURITY`,
    concat('ASSET_TYPE_', format_string('%02d', idx)) AS `ASSET_TYPE`,
    concat('ASSET_SUBTYPE_', format_string('%02d', idx)) AS `ASSET_SUBTYPE`,
    concat('ASSET_SUB_SUBTYPE_', format_string('%02d', idx)) AS `ASSET_SUB_SUBTYPE`,
    idx AS `PAYMENT_DAY_DELAYS`,
    concat('RESERVED_FOR_FUTURE_RATI_', format_string('%02d', idx)) AS `RESERVED_FOR_FUTURE_RATING`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_isca_g' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_isca_g;
