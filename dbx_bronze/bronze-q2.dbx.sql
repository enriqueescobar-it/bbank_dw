-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From bronze-q2.dbx.sql
-- Source model: bronze_q2_customer
CREATE OR REPLACE TABLE bronze.default.bronze_q2_customer AS
-- NAME: BRONZE_Q2_CUSTOMER
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        CUSTOMER_ID
        ,GROUP_ID
        ,GROUP_NAME
        ,CUSTOMER_NAME
        ,TAX_ID
        ,IS_COMPANY
        ,IS_TREASURY
        ,PRIMARY_CIF
        ,SERVICE_CHARGE_PLAN_ID
        ,PLAN_NAME
        ,CHARGE_ACCOUNT
        ,CREATE_DATE
        ,STREET_ADDRESS1
        ,STREET_ADDRESS2
        ,CITY
        ,`STATE`
        ,POSTAL_CODE
        ,PROVINCE
        ,IS_INTERNATIONAL
        ,ISO_CODE_A3
        ,CUSTOMER_DELETED_DATE
        ,TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.q2_customer
),

bronze_data AS (
    SELECT
        CUSTOMER_ID
        ,GROUP_ID
        ,GROUP_NAME
        ,CUSTOMER_NAME
        ,TAX_ID
        ,IS_COMPANY
        ,IS_TREASURY
        ,PRIMARY_CIF
        ,SERVICE_CHARGE_PLAN_ID
        ,PLAN_NAME
        ,CHARGE_ACCOUNT
        ,CREATE_DATE
        ,STREET_ADDRESS1
        ,STREET_ADDRESS2
        ,CITY
        ,`STATE`
        ,POSTAL_CODE
        ,PROVINCE
        ,IS_INTERNATIONAL
        ,ISO_CODE_A3
        ,CUSTOMER_DELETED_DATE
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-q2.dbx.sql
-- Source model: bronze_q2_user
CREATE OR REPLACE TABLE bronze.default.bronze_q2_user AS
-- NAME: BRONZE_Q2_CUSTOMER
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        USER_ID
        ,CUSTOMER_ID
        ,USER_ROLE_ID
        ,GROUP_ID
        ,ACTIVE_INACTIVE
        ,CREATED_DATE
        ,DELETED_DATE
        ,GROUP_NAME
        ,GROUP_DELETED_DATES
        ,ZONE_ID
        ,ZONE_DESCRIPTION
        ,AUTO_GENERATED
        ,TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.q2_user
),

bronze_data AS (
    SELECT
        USER_ID
        ,CUSTOMER_ID
        ,USER_ROLE_ID
        ,GROUP_ID
        ,ACTIVE_INACTIVE
        ,CREATED_DATE
        ,DELETED_DATE
        ,GROUP_NAME
        ,GROUP_DELETED_DATES
        ,ZONE_ID
        ,ZONE_DESCRIPTION
        ,AUTO_GENERATED
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-q2.dbx.sql
-- Source model: bronze_q2_user_pii
CREATE OR REPLACE TABLE bronze.default.bronze_q2_user_pii AS
-- NAME: BRONZE_Q2_CUSTOMER
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        USER_ID
        ,PRIMARY_CIF
        ,LAST_NAME
        ,FIRST_NAME
        ,MIDDLE_NAME
        ,SALUTATION
        ,SUFFIX
        ,SOCIAL_SECURITY_NUMBER
        ,EMAIL_ADDRESS
        ,STREET_ADDRESS_1
        ,STREET_ADDRESS_2
        ,CITY
        ,`STATE`
        ,POSTAL_CODE
        ,PROVINCE
        ,IS_INTERNATIONAL
        ,ISO_CODE_A3
        ,TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.q2_user_pii
),

bronze_data AS (
    SELECT
        USER_ID
        ,PRIMARY_CIF
        ,LAST_NAME
        ,FIRST_NAME
        ,MIDDLE_NAME
        ,SALUTATION
        ,SUFFIX
        ,SOCIAL_SECURITY_NUMBER
        ,EMAIL_ADDRESS
        ,STREET_ADDRESS_1
        ,STREET_ADDRESS_2
        ,CITY
        ,`STATE`
        ,POSTAL_CODE
        ,PROVINCE
        ,IS_INTERNATIONAL
        ,ISO_CODE_A3
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;
