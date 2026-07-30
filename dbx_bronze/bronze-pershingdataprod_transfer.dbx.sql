-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershingdataprod_transfer.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHINGDATAPROD_TRANSFER
-- Source table: landing_pershing.default.pershingdataprod_transfer
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershingdataprod_transfer AS
SELECT
    `ID`,
    `DATA_DT`,
    `RUN_DT`,
    `TYPE`,
    `SEQUENCE`,
    `ACCOUNT`,
    `IP`,
    `TYPE2`,
    `STATUS`,
    `DAYS`,
    `CB_NUMBER`,
    `CB_NAME`,
    `CA_NUMBER`,
    `RETIREMENT`,
    `CREATION_DT`,
    `CREATION_USER`,
    `UPDATE_DT`,
    `UPDATE_USER`,
    `AMOUNT`,
    `SOURCE`,
    `SMA`,
    `CUSTOMER`,
    `TAX_ID`,
    `JSON_DATA`,
    `REJECT`,
    `COMMENTS`,
    `REQUEST_ID`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershingdataprod_transfer;

COMMENT ON TABLE bronze_pershing.default.bronze_pershingdataprod_transfer IS
'Bronze Pershing table bronze_pershingdataprod_transfer contains transfer, ACATS, contra broker, status, and exception records sourced from landing_pershing.default.pershingdataprod_transfer for warehouse parity, validation, reconciliation, and downstream reporting.';
