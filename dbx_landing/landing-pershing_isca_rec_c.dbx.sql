-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_isca_rec_c.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ISCA_C"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_isca_c (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CUSIP_NUMBER` STRING,
    `STATE_TAX_INDICATOR` STRING,
    `FEDERAL_TAXABLE_STATUS_INDICATOR` STRING,
    `AMT_INDICATOR` STRING,
    `RIC_INDICATOR` STRING,
    `NUMBER_OF_DESCRIPTION_LINES` STRING,
    `SECURITY_DESCRIPTION_LINE_1` STRING,
    `SECURITY_DESCRIPTION_LINE_2` STRING,
    `SECURITY_DESCRIPTION_LINE_3` STRING,
    `SECURITY_DESCRIPTION_LINE_4` STRING,
    `SECURITY_DESCRIPTION_LINE_5` STRING,
    `USER_CUSIP_IDENTIFIER` STRING,
    `TAXABLE_INDICATOR` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_isca_c IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_isca_c;

INSERT INTO landing_pershing.default.pershing_isca_c (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `CUSIP_NUMBER`, `STATE_TAX_INDICATOR`,
    `FEDERAL_TAXABLE_STATUS_INDICATOR`, `AMT_INDICATOR`, `RIC_INDICATOR`, `NUMBER_OF_DESCRIPTION_LINES`,
    `SECURITY_DESCRIPTION_LINE_1`, `SECURITY_DESCRIPTION_LINE_2`, `SECURITY_DESCRIPTION_LINE_3`,
    `SECURITY_DESCRIPTION_LINE_4`, `SECURITY_DESCRIPTION_LINE_5`, `USER_CUSIP_IDENTIFIER`, `TAXABLE_INDICATOR`,
    `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('STATE_TAX_INDICATOR_', format_string('%02d', idx)) AS `STATE_TAX_INDICATOR`,
    concat('FEDERAL_TAXABLE_STATUS_I_', format_string('%02d', idx)) AS `FEDERAL_TAXABLE_STATUS_INDICATOR`,
    concat('AMT_INDICATOR_', format_string('%02d', idx)) AS `AMT_INDICATOR`,
    concat('RIC_INDICATOR_', format_string('%02d', idx)) AS `RIC_INDICATOR`,
    concat('NUMBER_OF_DESCRIPTION_LI_', format_string('%02d', idx)) AS `NUMBER_OF_DESCRIPTION_LINES`,
    concat('SECURITY_DESCRIPTION_LIN_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION_LINE_1`,
    concat('SECURITY_DESCRIPTION_LIN_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION_LINE_2`,
    concat('SECURITY_DESCRIPTION_LIN_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION_LINE_3`,
    concat('SECURITY_DESCRIPTION_LIN_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION_LINE_4`,
    concat('SECURITY_DESCRIPTION_LIN_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION_LINE_5`,
    concat('USER_CUSIP_IDENTIFIER_', format_string('%02d', idx)) AS `USER_CUSIP_IDENTIFIER`,
    concat('TAXABLE_INDICATOR_', format_string('%02d', idx)) AS `TAXABLE_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_isca_c' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_isca_c;
