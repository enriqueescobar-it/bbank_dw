-- Databricks SQL for source: pershingdataprod
-- Generated from sqlserver_landing_desc/landing-pershingdataprod_master_asset-desc.ms.txt

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHINGDATAPROD_MASTER_ASSET"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershingdataprod_master_asset (
    `ID` INT,
    `TRANSFER_ID` INT,
    `DATA_DT` DATE,
    `RUN_DT` TIMESTAMP,
    `TRANSFER_TYPE` STRING,
    `SEQUENCE` INT,
    `ACCOUNT` STRING,
    `IP` STRING,
    `ASSET_TYPE` STRING,
    `ASSET_TYPE_ID` STRING,
    `NUMBER` STRING,
    `DESCRIPTION` STRING,
    `STATUS` STRING,
    `QUANTITY` DECIMAL(38,10),
    `VALUE` DECIMAL(38,10),
    `CASH_MARGIN` STRING,
    `DELIVERY` STRING,
    `JSON_DATA` STRING,
    `REQUEST_ID` STRING,
    `LOADED_AT` TIMESTAMP,
    `YEARMONTH` INT
);
COMMENT ON TABLE landing_pershing.default.pershingdataprod_master_asset IS
'The table contains Pershing transfer master asset records with transfer identifiers, account references, asset classification, security number and description, status, quantity, value, delivery details, request identifiers, and load timestamps. It supports landing-layer validation for asset transfers, holdings movement, and transfer exception analysis.';

TRUNCATE TABLE landing_pershing.default.pershingdataprod_master_asset;

INSERT INTO landing_pershing.default.pershingdataprod_master_asset (
    `ID`, `TRANSFER_ID`, `DATA_DT`, `RUN_DT`, `TRANSFER_TYPE`, `SEQUENCE`,
    `ACCOUNT`, `IP`, `ASSET_TYPE`, `ASSET_TYPE_ID`, `NUMBER`, `DESCRIPTION`,
    `STATUS`, `QUANTITY`, `VALUE`, `CASH_MARGIN`, `DELIVERY`, `JSON_DATA`,
    `REQUEST_ID`, `LOADED_AT`, `YEARMONTH`
)
SELECT
    idx AS `ID`,
    idx AS `TRANSFER_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATA_DT`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `RUN_DT`,
    concat('TRANSFER_TYPE_', format_string('%02d', idx)) AS `TRANSFER_TYPE`,
    idx AS `SEQUENCE`,
    concat('ACCOUNT_', format_string('%02d', idx)) AS `ACCOUNT`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('ASSET_TYPE_', format_string('%02d', idx)) AS `ASSET_TYPE`,
    concat('ASSET_TYPE_ID_', format_string('%02d', idx)) AS `ASSET_TYPE_ID`,
    concat('NUMBER_', format_string('%02d', idx)) AS `NUMBER`,
    concat('DESCRIPTION_', format_string('%02d', idx)) AS `DESCRIPTION`,
    concat('STATUS_', format_string('%02d', idx)) AS `STATUS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `QUANTITY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `VALUE`,
    concat('CASH_MARGIN_', format_string('%02d', idx)) AS `CASH_MARGIN`,
    concat('DELIVERY_', format_string('%02d', idx)) AS `DELIVERY`,
    concat('JSON_DATA_', format_string('%02d', idx)) AS `JSON_DATA`,
    concat('REQUEST_ID_', format_string('%02d', idx)) AS `REQUEST_ID`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`,
    202601 AS `YEARMONTH`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershingdataprod_master_asset' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershingdataprod_master_asset;
