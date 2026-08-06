-- NAME: SILVER_FILE_INVOICE_REQUESTS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: April 29, 2026

{{
   config(
		  tags=["invoice_standard"]
        )
}}

WITH bronze_data AS (
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
        [DESCRIPTION],
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
		YEARMONTH,
        GETUTCDATE() AS LOADED_AT
    FROM {{ ref('bronze_file_invoice_requests')}}
    WHERE DATE_OF_DATA = (SELECT MAX(DATE_OF_DATA) FROM {{ ref('bronze_file_invoice_requests')}})
)

SELECT * FROM bronze_data