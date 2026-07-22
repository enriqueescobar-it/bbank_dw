-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From bronze-rprt.dbx.sql
-- Source model: bronze_rprt_sharing_agreement_exception
CREATE OR REPLACE TABLE bronze.default.bronze_rprt_sharing_agreement_exception AS
-- NAME: BRONZE_RPRT_SHARING_AGREEMENT_EXCEPTION
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        ID
        ,CIF_NO
        ,ACTIVE
        ,TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.rprt_sharing_agreement_exception
),

bronze_data AS (
    SELECT
        ID
        ,CIF_NO
        ,ACTIVE
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;
