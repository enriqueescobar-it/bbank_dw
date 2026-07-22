-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From bronze-promontory.dbx.sql
-- Source model: bronze_intrafi_account_trial_balance
CREATE OR REPLACE TABLE bronze.default.bronze_intrafi_account_trial_balance AS
-- NAME: BRONZE_INTRAFI_ACCOUNT_TRIAL_BALANCE
-- CATEGORY: MODEL
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: April 1, 2026



WITH landing_data AS (
    SELECT
        INSTITUTION_TRANSACTION_ACCOUNT_NO,
        ICS_ACCOUNT_ID,
        SHADOW_ACCOUNT_NO,
        ACCOUNT_TITLE,
        PRIMARY_CUSTOMER_TAX_ID,
        INTERNAL_CUSTOMER_ID,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(PRINCIPAL_BALANCE, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS PRINCIPAL_BALANCE,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(ACCRUED_INTEREST, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS ACCRUED_INTEREST,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(DAILY_ACCRUAL, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS DAILY_ACCRUAL,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(INTEREST_PAID_TODAY, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS INTEREST_PAID_TODAY,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(INTEREST_PAID_MTD, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS INTEREST_PAID_MTD,
        ICS_DEPOSIT_OPTION,
        PROGRAM_NAME,
        RATE_DESCRIPTION,
        TRY_CAST(CURRENT_PROGRAM_INTEREST_RATE AS DOUBLE) AS CURRENT_PROGRAM_INTEREST_RATE,  
        TRY_CAST(OWS_RATE AS DOUBLE) AS OWS_RATE,
        TRY_CAST(RATE_APPLIED_TODAY AS DOUBLE) AS RATE_APPLIED_TODAY, 
        TRY_CAST(PROGRAM_WITHDRAWALS_MTD AS INT) AS PROGRAM_WITHDRAWALS_MTD, 
        TRY_CAST(TOTAL_PROGRAM_WITHDRAWAL_VIOLATIONS AS INT) AS TOTAL_PROGRAM_WITHDRAWAL_VIOLATIONS,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(AVERAGE_DAILY_BALANCE_MTD, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS AVERAGE_DAILY_BALANCE_MTD,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(AVERAGE_DAILY_BALANCE_YTD, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS AVERAGE_DAILY_BALANCE_YTD,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(AVERAGE_RECIPROCAL_DAILY_BALANCE_MTD, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS AVERAGE_RECIPROCAL_DAILY_BALANCE_MTD,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(AVERAGE_RECIPROCAL_DAILY_BALANCE_YTD, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS AVERAGE_RECIPROCAL_DAILY_BALANCE_YTD,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(AVERAGE_OWS_DAILY_BALANCE_MTD, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS AVERAGE_OWS_DAILY_BALANCE_MTD,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(AVERAGE_OWS_DAILY_BALANCE_YTD, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS AVERAGE_OWS_DAILY_BALANCE_YTD,
        TRY_CAST(NUMBER_OF_DAYS_AS_A_RECIPROCAL_ACCOUNT_MTD AS INT) AS NUMBER_OF_DAYS_AS_A_RECIPROCAL_ACCOUNT_MTD, 
        TRY_CAST(NUMBER_OF_DAYS_AS_A_OWS_ACCOUNT_MTD AS INT) AS NUMBER_OF_DAYS_AS_A_OWS_ACCOUNT_MTD, 
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(INTEREST_PAID_YTD, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS INTEREST_PAID_YTD,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(INTEREST_PAID_LAST_YEAR, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS INTEREST_PAID_LAST_YEAR,
        BRANCH_ID__NAME,
        INSTITUTION_SALES_CONTACT,
        to_date(DATE_ICS_ACCOUNT_OPENED, 'MM/dd/yyyy') AS DATE_ICS_ACCOUNT_OPENED,
        to_date(DATE_LAST_TRANSACTION, 'MM/dd/yyyy') AS DATE_LAST_TRANSACTION, 
        ACCOUNT_STATUS,
        ACCOUNT_TYPE,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(MTD_FEE_INCOME, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS MTD_FEE_INCOME,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(YTD_FEE_INCOME, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS YTD_FEE_INCOME,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(MTD_FEE_EXPENSE, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS MTD_FEE_EXPENSE,
        TRY_CAST(
            TRIM(
                REPLACE(
                    REPLACE(YTD_FEE_EXPENSE, '$', ''),
                    ',', ''
                )
            ) AS DOUBLE
        ) AS YTD_FEE_EXPENSE,
        OWNERSHIP_RIGHT_AND_CAPACITY_CODES,
        LIQUIDITY_COVERAGE_RATIO_LCR_CATEGORY,
        MAIL_CUSTOMER_STATEMENTS_ON_BEHALF_OF_YOUR_INSTITUTION,
        ICS_SAVINGS_CUSTOM_FIELD_,
        TRY_CAST(DATE_OF_DATA AS DATE) AS DATE_OF_DATA,                                
        TRY_CAST(LOADED_AT AS TIMESTAMP) AS LOADED_AT                  
    FROM
        landing.default.intrafi_r4230
),

bronze_data AS(
    SELECT
        INSTITUTION_TRANSACTION_ACCOUNT_NO,
        ICS_ACCOUNT_ID,
        SHADOW_ACCOUNT_NO,
        ACCOUNT_TITLE,
        PRIMARY_CUSTOMER_TAX_ID,
        INTERNAL_CUSTOMER_ID,
        PRINCIPAL_BALANCE,
        ACCRUED_INTEREST,
        DAILY_ACCRUAL,
        INTEREST_PAID_TODAY,
        INTEREST_PAID_MTD,
        ICS_DEPOSIT_OPTION,
        PROGRAM_NAME,
        RATE_DESCRIPTION,
        CURRENT_PROGRAM_INTEREST_RATE,
        OWS_RATE,
        RATE_APPLIED_TODAY,
        PROGRAM_WITHDRAWALS_MTD,
        TOTAL_PROGRAM_WITHDRAWAL_VIOLATIONS,
        AVERAGE_DAILY_BALANCE_MTD,
        AVERAGE_DAILY_BALANCE_YTD,
        AVERAGE_RECIPROCAL_DAILY_BALANCE_MTD,
        AVERAGE_RECIPROCAL_DAILY_BALANCE_YTD,
        AVERAGE_OWS_DAILY_BALANCE_MTD,
        AVERAGE_OWS_DAILY_BALANCE_YTD,
        NUMBER_OF_DAYS_AS_A_RECIPROCAL_ACCOUNT_MTD,
        NUMBER_OF_DAYS_AS_A_OWS_ACCOUNT_MTD,
        INTEREST_PAID_YTD,
        INTEREST_PAID_LAST_YEAR,
        BRANCH_ID__NAME,
        INSTITUTION_SALES_CONTACT,
        DATE_ICS_ACCOUNT_OPENED,
        DATE_LAST_TRANSACTION,
        ACCOUNT_STATUS,
        ACCOUNT_TYPE,
        MTD_FEE_INCOME,
        YTD_FEE_INCOME,
        MTD_FEE_EXPENSE,
        YTD_FEE_EXPENSE,
        OWNERSHIP_RIGHT_AND_CAPACITY_CODES,
        LIQUIDITY_COVERAGE_RATIO_LCR_CATEGORY,
        MAIL_CUSTOMER_STATEMENTS_ON_BEHALF_OF_YOUR_INSTITUTION,
        ICS_SAVINGS_CUSTOM_FIELD_,
        DATE_OF_DATA
    FROM landing_data
    
    
)





SELECT bd.*, current_timestamp() AS LOADED_AT  
FROM bronze_data bd;
