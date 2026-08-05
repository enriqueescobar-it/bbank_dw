-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pers_pershing.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERS_PERSHING
-- Source table: landing_pershing.default.pers_pershing
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pers_pershing AS
SELECT
    `PershingID`,
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
    `ACCTDATEOPEN`,
    `LASTREFRESHDATE`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pers_pershing;

COMMENT ON TABLE bronze_pershing.default.bronze_pers_pershing IS
'Bronze Pershing table bronze_pers_pershing contains account, registration, client, status, and relationship records sourced from landing_pershing.default.pers_pershing for warehouse parity, validation, reconciliation, and downstream reporting.';
