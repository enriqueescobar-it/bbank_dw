-- Databricks SQL for source: pershingdataprod
-- Generated from sqlserver_landing_desc/landing-pershingdataprod_transfer-desc.ms.txt

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHINGDATAPROD_TRANSFER"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershingdataprod_transfer (
    `ID` INT,
    `DATA_DT` DATE,
    `RUN_DT` TIMESTAMP,
    `TYPE` STRING,
    `SEQUENCE` INT,
    `ACCOUNT` STRING,
    `IP` STRING,
    `TYPE2` STRING,
    `STATUS` STRING,
    `DAYS` SMALLINT,
    `CB_NUMBER` STRING,
    `CB_NAME` STRING,
    `CA_NUMBER` STRING,
    `RETIREMENT` STRING,
    `CREATION_DT` TIMESTAMP,
    `CREATION_USER` STRING,
    `UPDATE_DT` TIMESTAMP,
    `UPDATE_USER` STRING,
    `AMOUNT` DECIMAL(38,10),
    `SOURCE` STRING,
    `SMA` DECIMAL(38,10),
    `CUSTOMER` STRING,
    `TAX_ID` STRING,
    `JSON_DATA` STRING,
    `REJECT` STRING,
    `COMMENTS` STRING,
    `REQUEST_ID` STRING,
    `LOADED_AT` TIMESTAMP,
    `YEARMONTH` INT
);
COMMENT ON TABLE landing_pershing.default.pershingdataprod_transfer IS
'The table contains Pershing transfer records with data and run dates, transfer type, account and IP references, transfer status, aging, contra broker details, creation and update metadata, amounts, source, SMA, customer, tax identifier, reject reason, comments, request identifier, and load timestamp. It supports landing-layer validation for ACATS transfer operations and exception tracking.';

TRUNCATE TABLE landing_pershing.default.pershingdataprod_transfer;

INSERT INTO landing_pershing.default.pershingdataprod_transfer (
    `ID`, `DATA_DT`, `RUN_DT`, `TYPE`, `SEQUENCE`, `ACCOUNT`,
    `IP`, `TYPE2`, `STATUS`, `DAYS`, `CB_NUMBER`, `CB_NAME`,
    `CA_NUMBER`, `RETIREMENT`, `CREATION_DT`, `CREATION_USER`, `UPDATE_DT`, `UPDATE_USER`,
    `AMOUNT`, `SOURCE`, `SMA`, `CUSTOMER`, `TAX_ID`, `JSON_DATA`,
    `REJECT`, `COMMENTS`, `REQUEST_ID`, `LOADED_AT`, `YEARMONTH`
)
SELECT
    idx AS `ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATA_DT`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `RUN_DT`,
    concat('TYPE_', format_string('%02d', idx)) AS `TYPE`,
    idx AS `SEQUENCE`,
    concat('ACCOUNT_', format_string('%02d', idx)) AS `ACCOUNT`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('TYPE2_', format_string('%02d', idx)) AS `TYPE2`,
    concat('STATUS_', format_string('%02d', idx)) AS `STATUS`,
    idx AS `DAYS`,
    concat('CB_NUMBER_', format_string('%02d', idx)) AS `CB_NUMBER`,
    concat('CB_NAME_', format_string('%02d', idx)) AS `CB_NAME`,
    concat('CA_NUMBER_', format_string('%02d', idx)) AS `CA_NUMBER`,
    concat('RETIREMENT_', format_string('%02d', idx)) AS `RETIREMENT`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `CREATION_DT`,
    concat('CREATION_USER_', format_string('%02d', idx)) AS `CREATION_USER`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `UPDATE_DT`,
    concat('UPDATE_USER_', format_string('%02d', idx)) AS `UPDATE_USER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AMOUNT`,
    concat('SOURCE_', format_string('%02d', idx)) AS `SOURCE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `SMA`,
    concat('CUSTOMER_', format_string('%02d', idx)) AS `CUSTOMER`,
    concat('TAX_ID_', format_string('%02d', idx)) AS `TAX_ID`,
    concat('JSON_DATA_', format_string('%02d', idx)) AS `JSON_DATA`,
    concat('REJECT_', format_string('%02d', idx)) AS `REJECT`,
    concat('COMMENTS_', format_string('%02d', idx)) AS `COMMENTS`,
    concat('REQUEST_ID_', format_string('%02d', idx)) AS `REQUEST_ID`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`,
    202601 AS `YEARMONTH`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershingdataprod_transfer' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershingdataprod_transfer;
