-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From bronze-mis.dbx.sql
-- Source model: bronze_mis_pershing_officer_code
CREATE OR REPLACE TABLE bronze.default.bronze_mis_pershing_officer_code AS
-- NAME: BRONZE_MIS_PERSHING_OFFICER_CODE
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: December 16, 2025



WITH landing_data AS (
    SELECT
    	IP_CODE,
	    OFFICER_CODE,
	    `NAME`,
	    COST_CENTER,
	    TEAM,
	    DATA_OF_DATA,
	    YEARMONTH,
        LOADED_AT
FROM
    mis.default.file_mis_pershing_officer_code
),

bronze_data AS (
    SELECT
    	IP_CODE,
	    OFFICER_CODE,
	    `NAME`,
	    COST_CENTER,
	    TEAM,
	    DATA_OF_DATA,
	    YEARMONTH,
        current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-mis.dbx.sql
-- Source model: bronze_mis_team_officers_v2
CREATE OR REPLACE TABLE bronze.default.bronze_mis_team_officers_v2 AS
-- NAME: BRONZE_MIS_TEAM_OFFICERS_V2
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: December 16, 2025



WITH landing_data AS (
    SELECT
        OFFICER_CODE,
	    FULL_NAME,
	    SHORT_NAME,
	    TITLE,
	    PHONE_NUMBER,
	    EMAIL,
	    BUSINESS_LINE,
    	TEAM,
	    TEAM_CODE,
	    COST_CENTER,
	    ACTIVEOFFICER,
	    DATA_OF_DATA,
	    YEARMONTH,
	    LOADED_AT
FROM
    mis.default.file_mis_team_officers_v2
),

bronze_data AS (
    SELECT
        OFFICER_CODE,
	    FULL_NAME,
	    SHORT_NAME,
	    TITLE,
	    PHONE_NUMBER,
	    EMAIL,
	    BUSINESS_LINE,
    	TEAM,
	    TEAM_CODE,
	    COST_CENTER,
	    ACTIVEOFFICER,
	    DATA_OF_DATA,
	    YEARMONTH,
        current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;
