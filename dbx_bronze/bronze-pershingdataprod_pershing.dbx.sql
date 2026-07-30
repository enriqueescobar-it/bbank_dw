-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershingdataprod_pershing.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHINGDATAPROD_PERSHING
-- Source table: landing_pershing.default.pershingdataprod_pershing
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershingdataprod_pershing AS
SELECT
    `PERSHINGID`,
    `ACCTNO`,
    `INVACC`,
    `INVACT`,
    `BRANCH`,
    `GLPROD`,
    `CFNA1`,
    `CFNATITLE`,
    `CFNA2`,
    `CFNA3`,
    `CFNA4`,
    `CFCITY`,
    `CFSTAT`,
    `CFZIP`,
    `CFCOUNTRY`,
    `INVAMT`,
    `TEST1`,
    `TEST2`,
    `INVCIF`,
    `INVTAXID`,
    `OFFICR`,
    `CBAL`,
    `INVDT6`,
    `CFHPHO`,
    `CFBPHO`,
    `CFFAX`,
    `CLASS`,
    `MMAMOUNT`,
    `CREATEDATE`,
    `ACCTSTATUS`,
    `ACCTDATECLOSED`,
    `IP`,
    `RISKFACTORCODE`,
    `INVESTOBJCODE`,
    `NAMEINVESTPRO`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershingdataprod_pershing;

COMMENT ON TABLE bronze_pershing.default.bronze_pershingdataprod_pershing IS
'Bronze Pershing table bronze_pershingdataprod_pershing contains account, registration, client, status, and relationship records sourced from landing_pershing.default.pershingdataprod_pershing for warehouse parity, validation, reconciliation, and downstream reporting.';
