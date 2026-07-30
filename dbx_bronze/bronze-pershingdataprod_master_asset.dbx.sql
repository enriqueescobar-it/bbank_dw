-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershingdataprod_master_asset.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHINGDATAPROD_MASTER_ASSET
-- Source table: landing_pershing.default.pershingdataprod_master_asset
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershingdataprod_master_asset AS
SELECT
    `ID`,
    `TRANSFER_ID`,
    `DATA_DT`,
    `RUN_DT`,
    `TRANSFER_TYPE`,
    `SEQUENCE`,
    `ACCOUNT`,
    `IP`,
    `ASSET_TYPE`,
    `ASSET_TYPE_ID`,
    `NUMBER`,
    `DESCRIPTION`,
    `STATUS`,
    `QUANTITY`,
    `VALUE`,
    `CASH_MARGIN`,
    `DELIVERY`,
    `JSON_DATA`,
    `REQUEST_ID`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershingdataprod_master_asset;

COMMENT ON TABLE bronze_pershing.default.bronze_pershingdataprod_master_asset IS
'Bronze Pershing table bronze_pershingdataprod_master_asset contains brokerage records sourced from landing_pershing.default.pershingdataprod_master_asset for warehouse parity, validation, reconciliation, and downstream reporting.';
