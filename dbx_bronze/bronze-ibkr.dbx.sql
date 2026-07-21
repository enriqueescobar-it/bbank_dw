-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From bronze-ibkr.dbx.sql
-- Source model: bronze_bcp_ibkr_account
CREATE OR REPLACE TABLE bronze.default.bronze_bcp_ibkr_account AS
-- NAME: BRONZE_BCP_IBKR_ACCOUNT
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
        ,ACCT_NO
        ,BRADESCO_AGENCY
        ,BRADESCO_ACCOUNT
        ,ACCT_OPENED_AT
        ,BBDID
        ,ACCT_STATUS
        ,TRANSACT_STATUS
        ,BCP_ACCT_ID
        ,BCP_CUST_ID
        ,BALANCE
        ,CREATED_AT
        ,USER_ID
        ,APP_REF
        ,RIA_ID
        ,CUSTOMER_ID
        ,SELLER_ID
        ,SEGMENTO
        ,CBLC
        ,STATUS_MSG
        ,MODIFY_DT
        ,PORTFOLIO
        ,(SELECT TRY_CAST(POSTD7 AS DATE) FROM ibkr.default.jh_ddpar1) as AsOfDate
        ,TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
    ibkr.default.bcp_ibkr_account
),

bronze_data AS(
    SELECT
        ID
        ,ACCT_NO
        ,BRADESCO_AGENCY
        ,BRADESCO_ACCOUNT
        ,ACCT_OPENED_AT
        ,BBDID
        ,ACCT_STATUS
        ,TRANSACT_STATUS
        ,BCP_ACCT_ID
        ,BCP_CUST_ID
        ,BALANCE
        ,CREATED_AT
        ,USER_ID
        ,APP_REF
        ,RIA_ID
        ,CUSTOMER_ID
        ,SELLER_ID
        ,SEGMENTO
        ,CBLC
        ,STATUS_MSG
        ,MODIFY_DT
        ,PORTFOLIO
        ,AsOfDate
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-ibkr.dbx.sql
-- Source model: bronze_bcp_ibkr_acct_holder
CREATE OR REPLACE TABLE bronze.default.bronze_bcp_ibkr_acct_holder AS
-- NAME: BRONZE_BCP_IBKR_ACCT_HOLDER
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
        ,ACCT_ID
        ,ACCOUNT_RELATION
        ,EMAIL
        ,FNAME
        ,LNAME
        ,GENDER
        ,DOB
        ,MARITAL_STATUS
        ,PHONE_NUMBER
        ,ADDRESS_LINE
        ,`STATE`
        ,CITY
        ,COUNTRY
        ,ZIP_CODE
        ,CITIZENSHIP
        ,COUNTRY_OF_BIRTH
        ,EMPLOYER_BUSINESS
        ,EMPLOYER_COMPANY
        ,EMPLOYER_PRIMARY_ADDRESS_LINE
        ,EMPLOYER_CITY
        ,EMPLOYER_STATE_PROVINCE
        ,EMPLOYER_ZIP_CODE
        ,EMPLOYER_COUNTRY
        ,EMPLOYMENT_POSITION
        ,EMPLOYMENT_STATUS
        ,ANNUAL_INCOMES
        ,NETWORTH_LIQUID
        ,NETWORTH_TOTAL
        ,INVESTMENT_EXPERIENCES
        ,WITHDRAW
        ,CONCERNED
        ,STOCK_MARKET
        ,INVESTMENT_OBJETIVES
        ,POLITICALLY_EXPOSED
        ,FOREIGN_TAX_ID
        ,ID_NUMBER
        ,EWF_PROCESSED
        ,CIF
        ,IBAN_NUMBER
        ,RECEIVE_OFFERS
        ,MONTHLY_HOUSING_PAYMENTS
        ,OTHER_MONTHLY_EXPENSES
        ,ELIGIBILITY_DATE
        ,ACK_SIGNED_WHEN
        ,ID_TYPE
        ,ID_EXPIRATION_DATE
        ,ACCOUNT_TYPE
        ,ACCOUNT_STATUS
        ,OWNERSHIP_TYPE
        ,ADVISOR
        ,`LANGUAGE`
        ,DEPENDENTS
        ,ACK_SIGNED_BY
        ,AFFILIATION
        ,AFFILIATION_NAME
        ,AFFILIATION_RELATIONSHIP
        ,AFFILIATION_COMPANY
        ,AFFILIATION_ADDRESS
        ,AFFILIATION_COUNTRY
        ,AFFILIATION_STATE
        ,AFFILIATION_CITY
        ,AFFILIATION_POSTAL_CODE
        ,LITIGATION
        ,LITIGATION_DETAILS
        ,EXCHANGEMEMBERSHIP
        ,MEMBERSHIP_EXCHANGES
        ,MEMBERSHIP_ORGANIZATIONS
        ,INVESTIGATION
        ,INVESTIGATION_DETAILS
        ,REGULATORY_CONTROL
        ,REGULATORY_CONTROL_DETAILS
        ,CUSTOMER_AGENT_GROUP
        ,CUSTOMER_AGENT_GROUP_ID
        ,EMPLCOUNTRY_RESCOUNTRY_DETAILS
        ,INITIAL_DEPOSIT_INFORMED
        ,CLIENT_DOCUMENTS
        ,ACK_TAX_ID_WHEN
        ,TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
    ibkr.default.bcp_ibkr_acct_holder
),

bronze_data AS(
    SELECT
        ID
        ,ACCT_ID
        ,ACCOUNT_RELATION
        ,EMAIL
        ,FNAME
        ,LNAME
        ,GENDER
        ,DOB
        ,MARITAL_STATUS
        ,PHONE_NUMBER
        ,ADDRESS_LINE
        ,`STATE`
        ,CITY
        ,COUNTRY
        ,ZIP_CODE
        ,CITIZENSHIP
        ,COUNTRY_OF_BIRTH
        ,EMPLOYER_BUSINESS
        ,EMPLOYER_COMPANY
        ,EMPLOYER_PRIMARY_ADDRESS_LINE
        ,EMPLOYER_CITY
        ,EMPLOYER_STATE_PROVINCE
        ,EMPLOYER_ZIP_CODE
        ,EMPLOYER_COUNTRY
        ,EMPLOYMENT_POSITION
        ,EMPLOYMENT_STATUS
        ,ANNUAL_INCOMES
        ,NETWORTH_LIQUID
        ,NETWORTH_TOTAL
        ,INVESTMENT_EXPERIENCES
        ,WITHDRAW
        ,CONCERNED
        ,STOCK_MARKET
        ,INVESTMENT_OBJETIVES
        ,POLITICALLY_EXPOSED
        ,FOREIGN_TAX_ID
        ,ID_NUMBER
        ,EWF_PROCESSED
        ,CIF
        ,IBAN_NUMBER
        ,RECEIVE_OFFERS
        ,MONTHLY_HOUSING_PAYMENTS
        ,OTHER_MONTHLY_EXPENSES
        ,ELIGIBILITY_DATE
        ,ACK_SIGNED_WHEN
        ,ID_TYPE
        ,ID_EXPIRATION_DATE
        ,ACCOUNT_TYPE
        ,ACCOUNT_STATUS
        ,OWNERSHIP_TYPE
        ,ADVISOR
        ,`LANGUAGE`
        ,DEPENDENTS
        ,ACK_SIGNED_BY
        ,AFFILIATION
        ,AFFILIATION_NAME
        ,AFFILIATION_RELATIONSHIP
        ,AFFILIATION_COMPANY
        ,AFFILIATION_ADDRESS
        ,AFFILIATION_COUNTRY
        ,AFFILIATION_STATE
        ,AFFILIATION_CITY
        ,AFFILIATION_POSTAL_CODE
        ,LITIGATION
        ,LITIGATION_DETAILS
        ,EXCHANGEMEMBERSHIP
        ,MEMBERSHIP_EXCHANGES
        ,MEMBERSHIP_ORGANIZATIONS
        ,INVESTIGATION
        ,INVESTIGATION_DETAILS
        ,REGULATORY_CONTROL
        ,REGULATORY_CONTROL_DETAILS
        ,CUSTOMER_AGENT_GROUP
        ,CUSTOMER_AGENT_GROUP_ID
        ,EMPLCOUNTRY_RESCOUNTRY_DETAILS
        ,INITIAL_DEPOSIT_INFORMED
        ,CLIENT_DOCUMENTS
        ,ACK_TAX_ID_WHEN
        ,YEARMONTH
        ,current_timestamp() LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-ibkr.dbx.sql
-- Source model: bronze_bcp_ibkr_balance_history
CREATE OR REPLACE TABLE bronze.default.bronze_bcp_ibkr_balance_history AS
-- NAME: BCP_IBKR_BALANCE_HISTORY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 30, 2024



WITH landing_data AS (
    SELECT
	    ID
        ,ACCT_ID
        ,BALANCE
        ,CREATED_AT
        ,TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
      ibkr.default.bcp_ibkr_balance_history
),

bronze_data AS (
    SELECT
        ID
        ,ACCT_ID
        ,BALANCE
        ,CREATED_AT
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;
