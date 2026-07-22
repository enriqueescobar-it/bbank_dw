-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From bronze-invoice.dbx.sql
-- Source model: bronze_file_invoice_requests
CREATE OR REPLACE TABLE bronze.default.bronze_file_invoice_requests AS
-- NAME: BRONZE_FILE_INVOICE_REQUESTS
-- CATEGORY: MODEL
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: April 29, 2026



WITH landing_data AS (
    SELECT 
        INVOICE_NAME,
        EMPLOYEE_NAME,
        VENDOR_NAME,
        INVOICE_RECEIVED,
        ORIGIN_SOURCE,
        APPROVAL_STATUS,
        PAYMENT_STATUS,
        REQUEST_TOTAL,
        REQUEST_KEY,
        CHECK_NUMBER,
        CREATE_DATE,
        `DESCRIPTION`,
        INVOICE_AMOUNT,
        INVOICE_DATE,
        PAYMENT_AMOUNT,
        PAYMENT_DUE_DATE,
        INVOICE_NUMBER,
        PAYMENT_STATUS_DATE,
        CUSTOM_01_COST_CENTER,
        CUSTOM_02_ENTITY,
        CUSTOM_7_COST_CENTER,
        CUSTOM_6_ENTITY,
        PAYMENT_METHOD_TYPE,
        CLOSED_DATE,
        SEND_DATE,
        FUNDING_DATE,
        DATE_OF_DATA,
        YEARMONTH
    FROM  
        landing.default.file_invoice_requests
    
    
)





SELECT *, current_timestamp() AS LOADED_AT FROM landing_data;
