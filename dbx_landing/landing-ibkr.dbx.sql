-- Databricks SQL for source: ibkr
-- Generated from sqlserver/brz-ibkr.sql

CREATE CATALOG IF NOT EXISTS ibkr;
USE CATALOG ibkr;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."BCP_IBKR_ACCOUNT"
CREATE TABLE IF NOT EXISTS ibkr.default.bcp_ibkr_account (
    `ID` BIGINT,
    `ACCT_NO` STRING,
    `BRADESCO_AGENCY` STRING,
    `BRADESCO_ACCOUNT` STRING,
    `ACCT_OPENED_AT` DATE,
    `BBDID` STRING,
    `ACCT_STATUS` STRING,
    `TRANSACT_STATUS` STRING,
    `BCP_ACCT_ID` BIGINT,
    `BCP_CUST_ID` BIGINT,
    `BALANCE` DECIMAL(38,10),
    `CREATED_AT` DATE,
    `USER_ID` BIGINT,
    `APP_REF` STRING,
    `RIA_ID` BIGINT,
    `CUSTOMER_ID` BIGINT,
    `SELLER_ID` BIGINT,
    `SEGMENTO` STRING,
    `CBLC` STRING,
    `STATUS_MSG` STRING,
    `MODIFY_DT` DATE,
    `PORTFOLIO` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` BIGINT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE ibkr.default.bcp_ibkr_account IS 
'The table contains information about accounts associated with BCP and IBKR platforms. It includes details such as account numbers, status, balance, and related identifiers. Potential use cases include monitoring account statuses, analyzing customer activity, and tracking changes over time.';

TRUNCATE TABLE ibkr.default.bcp_ibkr_account;

INSERT INTO ibkr.default.bcp_ibkr_account (
    `ID`, `ACCT_NO`, `BRADESCO_AGENCY`, `BRADESCO_ACCOUNT`, `ACCT_OPENED_AT`, `BBDID`,
    `ACCT_STATUS`, `TRANSACT_STATUS`, `BCP_ACCT_ID`, `BCP_CUST_ID`, `BALANCE`, `CREATED_AT`,
    `USER_ID`, `APP_REF`, `RIA_ID`, `CUSTOMER_ID`, `SELLER_ID`, `SEGMENTO`,
    `CBLC`, `STATUS_MSG`, `MODIFY_DT`, `PORTFOLIO`, `AsOfDate`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    idx AS `ID`,
    concat('ACCT_NO_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACCT_NO`,
    concat('BRADESCO_AGENCY_', lpad(CAST(idx AS STRING), 2, '0')) AS `BRADESCO_AGENCY`,
    concat('BRADESCO_ACCOUNT_', lpad(CAST(idx AS STRING), 2, '0')) AS `BRADESCO_ACCOUNT`,
    date_add(DATE '2026-01-01', idx - 1) AS `ACCT_OPENED_AT`,
    concat('BBDID_', lpad(CAST(idx AS STRING), 2, '0')) AS `BBDID`,
    concat('ACCT_STATUS_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACCT_STATUS`,
    concat('TRANSACT_STATUS_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRANSACT_STATUS`,
    idx AS `BCP_ACCT_ID`,
    idx AS `BCP_CUST_ID`,
    CAST(idx * 1000.25 AS DECIMAL(38,10)) AS `BALANCE`,
    date_add(DATE '2026-01-01', idx - 1) AS `CREATED_AT`,
    idx AS `USER_ID`,
    concat('APP_REF_', lpad(CAST(idx AS STRING), 2, '0')) AS `APP_REF`,
    idx AS `RIA_ID`,
    idx AS `CUSTOMER_ID`,
    idx AS `SELLER_ID`,
    concat('SEGMENTO_', lpad(CAST(idx AS STRING), 2, '0')) AS `SEGMENTO`,
    concat('CBLC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CBLC`,
    concat('STATUS_MSG_', lpad(CAST(idx AS STRING), 2, '0')) AS `STATUS_MSG`,
    date_add(DATE '2026-01-01', idx - 1) AS `MODIFY_DT`,
    concat('PORTFOLIO_', lpad(CAST(idx AS STRING), 2, '0')) AS `PORTFOLIO`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."BCP_IBKR_ACCT_HOLDER"
CREATE TABLE IF NOT EXISTS ibkr.default.bcp_ibkr_acct_holder (
    `ID` BIGINT,
    `ACCT_ID` BIGINT,
    `ACCOUNT_RELATION` STRING,
    `EMAIL` STRING,
    `FNAME` STRING,
    `LNAME` STRING,
    `GENDER` STRING,
    `DOB` DATE,
    `MARITAL_STATUS` STRING,
    `PHONE_NUMBER` STRING,
    `ADDRESS_LINE` STRING,
    `STATE` STRING,
    `CITY` STRING,
    `COUNTRY` STRING,
    `ZIP_CODE` STRING,
    `CITIZENSHIP` STRING,
    `COUNTRY_OF_BIRTH` STRING,
    `EMPLOYER_BUSINESS` STRING,
    `EMPLOYER_COMPANY` STRING,
    `EMPLOYER_PRIMARY_ADDRESS_LINE` STRING,
    `EMPLOYER_CITY` STRING,
    `EMPLOYER_STATE_PROVINCE` STRING,
    `EMPLOYER_ZIP_CODE` STRING,
    `EMPLOYER_COUNTRY` STRING,
    `EMPLOYMENT_POSITION` STRING,
    `EMPLOYMENT_STATUS` STRING,
    `ANNUAL_INCOMES` DECIMAL(38,10),
    `NETWORTH_LIQUID` DECIMAL(38,10),
    `NETWORTH_TOTAL` DECIMAL(38,10),
    `INVESTMENT_EXPERIENCES` STRING,
    `WITHDRAW` STRING,
    `CONCERNED` STRING,
    `STOCK_MARKET` STRING,
    `INVESTMENT_OBJETIVES` STRING,
    `POLITICALLY_EXPOSED` STRING,
    `FOREIGN_TAX_ID` BIGINT,
    `ID_NUMBER` STRING,
    `EWF_PROCESSED` STRING,
    `CIF` STRING,
    `IBAN_NUMBER` STRING,
    `RECEIVE_OFFERS` STRING,
    `MONTHLY_HOUSING_PAYMENTS` DECIMAL(38,10),
    `OTHER_MONTHLY_EXPENSES` DECIMAL(38,10),
    `ELIGIBILITY_DATE` DATE,
    `ACK_SIGNED_WHEN` DATE,
    `ID_TYPE` STRING,
    `ID_EXPIRATION_DATE` DATE,
    `ACCOUNT_TYPE` STRING,
    `ACCOUNT_STATUS` STRING,
    `OWNERSHIP_TYPE` STRING,
    `ADVISOR` STRING,
    `LANGUAGE` STRING,
    `DEPENDENTS` BIGINT,
    `ACK_SIGNED_BY` STRING,
    `AFFILIATION` STRING,
    `AFFILIATION_NAME` STRING,
    `AFFILIATION_RELATIONSHIP` STRING,
    `AFFILIATION_COMPANY` STRING,
    `AFFILIATION_ADDRESS` STRING,
    `AFFILIATION_COUNTRY` STRING,
    `AFFILIATION_STATE` STRING,
    `AFFILIATION_CITY` STRING,
    `AFFILIATION_POSTAL_CODE` STRING,
    `LITIGATION` STRING,
    `LITIGATION_DETAILS` STRING,
    `EXCHANGEMEMBERSHIP` STRING,
    `MEMBERSHIP_EXCHANGES` STRING,
    `MEMBERSHIP_ORGANIZATIONS` STRING,
    `INVESTIGATION` STRING,
    `INVESTIGATION_DETAILS` STRING,
    `REGULATORY_CONTROL` STRING,
    `REGULATORY_CONTROL_DETAILS` STRING,
    `CUSTOMER_AGENT_GROUP` STRING,
    `CUSTOMER_AGENT_GROUP_ID` BIGINT,
    `EMPLCOUNTRY_RESCOUNTRY_DETAILS` STRING,
    `INITIAL_DEPOSIT_INFORMED` DECIMAL(38,10),
    `CLIENT_DOCUMENTS` STRING,
    `ACK_TAX_ID_WHEN` DATE,
    `YEARMONTH` BIGINT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE ibkr.default.bcp_ibkr_acct_holder IS
'The table contains detailed information about account holders, including personal, contact, and employment details. It may also include financial data such as incomes and net worth. Use cases include assessing client profiles, analyzing demographic information, and understanding account ownership structures. This table can support compliance checks, risk assessments, and strategic planning.';

TRUNCATE TABLE ibkr.default.bcp_ibkr_acct_holder;

INSERT INTO ibkr.default.bcp_ibkr_acct_holder (
    `ID`, `ACCT_ID`, `ACCOUNT_RELATION`, `EMAIL`, `FNAME`, `LNAME`,
    `GENDER`, `DOB`, `MARITAL_STATUS`, `PHONE_NUMBER`, `ADDRESS_LINE`, `STATE`,
    `CITY`, `COUNTRY`, `ZIP_CODE`, `CITIZENSHIP`, `COUNTRY_OF_BIRTH`, `EMPLOYER_BUSINESS`,
    `EMPLOYER_COMPANY`, `EMPLOYER_PRIMARY_ADDRESS_LINE`, `EMPLOYER_CITY`, `EMPLOYER_STATE_PROVINCE`, `EMPLOYER_ZIP_CODE`, `EMPLOYER_COUNTRY`,
    `EMPLOYMENT_POSITION`, `EMPLOYMENT_STATUS`, `ANNUAL_INCOMES`, `NETWORTH_LIQUID`, `NETWORTH_TOTAL`, `INVESTMENT_EXPERIENCES`,
    `WITHDRAW`, `CONCERNED`, `STOCK_MARKET`, `INVESTMENT_OBJETIVES`, `POLITICALLY_EXPOSED`, `FOREIGN_TAX_ID`,
    `ID_NUMBER`, `EWF_PROCESSED`, `CIF`, `IBAN_NUMBER`, `RECEIVE_OFFERS`, `MONTHLY_HOUSING_PAYMENTS`,
    `OTHER_MONTHLY_EXPENSES`, `ELIGIBILITY_DATE`, `ACK_SIGNED_WHEN`, `ID_TYPE`, `ID_EXPIRATION_DATE`, `ACCOUNT_TYPE`,
    `ACCOUNT_STATUS`, `OWNERSHIP_TYPE`, `ADVISOR`, `LANGUAGE`, `DEPENDENTS`, `ACK_SIGNED_BY`,
    `AFFILIATION`, `AFFILIATION_NAME`, `AFFILIATION_RELATIONSHIP`, `AFFILIATION_COMPANY`, `AFFILIATION_ADDRESS`, `AFFILIATION_COUNTRY`,
    `AFFILIATION_STATE`, `AFFILIATION_CITY`, `AFFILIATION_POSTAL_CODE`, `LITIGATION`, `LITIGATION_DETAILS`, `EXCHANGEMEMBERSHIP`,
    `MEMBERSHIP_EXCHANGES`, `MEMBERSHIP_ORGANIZATIONS`, `INVESTIGATION`, `INVESTIGATION_DETAILS`, `REGULATORY_CONTROL`, `REGULATORY_CONTROL_DETAILS`,
    `CUSTOMER_AGENT_GROUP`, `CUSTOMER_AGENT_GROUP_ID`, `EMPLCOUNTRY_RESCOUNTRY_DETAILS`, `INITIAL_DEPOSIT_INFORMED`, `CLIENT_DOCUMENTS`, `ACK_TAX_ID_WHEN`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    idx AS `ID`,
    idx AS `ACCT_ID`,
    concat('ACCOUNT_RELATION_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACCOUNT_RELATION`,
    concat('EMAIL_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMAIL`,
    concat('FNAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `FNAME`,
    concat('LNAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `LNAME`,
    concat('GENDER_', lpad(CAST(idx AS STRING), 2, '0')) AS `GENDER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DOB`,
    concat('MARITAL_STATUS_', lpad(CAST(idx AS STRING), 2, '0')) AS `MARITAL_STATUS`,
    concat('PHONE_NUMBER_', lpad(CAST(idx AS STRING), 2, '0')) AS `PHONE_NUMBER`,
    concat('ADDRESS_LINE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ADDRESS_LINE`,
    concat('STATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `STATE`,
    concat('CITY_', lpad(CAST(idx AS STRING), 2, '0')) AS `CITY`,
    concat('COUNTRY_', lpad(CAST(idx AS STRING), 2, '0')) AS `COUNTRY`,
    concat('ZIP_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ZIP_CODE`,
    concat('CITIZENSHIP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CITIZENSHIP`,
    concat('COUNTRY_OF_BIRTH_', lpad(CAST(idx AS STRING), 2, '0')) AS `COUNTRY_OF_BIRTH`,
    concat('EMPLOYER_BUSINESS_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMPLOYER_BUSINESS`,
    concat('EMPLOYER_COMPANY_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMPLOYER_COMPANY`,
    concat('EMPLOYER_PRIMARY_ADDRESS_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMPLOYER_PRIMARY_ADDRESS_LINE`,
    concat('EMPLOYER_CITY_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMPLOYER_CITY`,
    concat('EMPLOYER_STATE_PROVINCE_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMPLOYER_STATE_PROVINCE`,
    concat('EMPLOYER_ZIP_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMPLOYER_ZIP_CODE`,
    concat('EMPLOYER_COUNTRY_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMPLOYER_COUNTRY`,
    concat('EMPLOYMENT_POSITION_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMPLOYMENT_POSITION`,
    concat('EMPLOYMENT_STATUS_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMPLOYMENT_STATUS`,
    CAST(idx * 1000.25 AS DECIMAL(38,10)) AS `ANNUAL_INCOMES`,
    CAST(idx * 1000.25 AS DECIMAL(38,10)) AS `NETWORTH_LIQUID`,
    CAST(idx * 1000.25 AS DECIMAL(38,10)) AS `NETWORTH_TOTAL`,
    concat('INVESTMENT_EXPERIENCES_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVESTMENT_EXPERIENCES`,
    concat('WITHDRAW_', lpad(CAST(idx AS STRING), 2, '0')) AS `WITHDRAW`,
    concat('CONCERNED_', lpad(CAST(idx AS STRING), 2, '0')) AS `CONCERNED`,
    concat('STOCK_MARKET_', lpad(CAST(idx AS STRING), 2, '0')) AS `STOCK_MARKET`,
    concat('INVESTMENT_OBJETIVES_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVESTMENT_OBJETIVES`,
    concat('POLITICALLY_EXPOSED_', lpad(CAST(idx AS STRING), 2, '0')) AS `POLITICALLY_EXPOSED`,
    idx AS `FOREIGN_TAX_ID`,
    concat('ID_NUMBER_', lpad(CAST(idx AS STRING), 2, '0')) AS `ID_NUMBER`,
    concat('EWF_PROCESSED_', lpad(CAST(idx AS STRING), 2, '0')) AS `EWF_PROCESSED`,
    concat('CIF_', lpad(CAST(idx AS STRING), 2, '0')) AS `CIF`,
    concat('IBAN_NUMBER_', lpad(CAST(idx AS STRING), 2, '0')) AS `IBAN_NUMBER`,
    concat('RECEIVE_OFFERS_', lpad(CAST(idx AS STRING), 2, '0')) AS `RECEIVE_OFFERS`,
    CAST(idx * 1000.25 AS DECIMAL(38,10)) AS `MONTHLY_HOUSING_PAYMENTS`,
    CAST(idx * 1000.25 AS DECIMAL(38,10)) AS `OTHER_MONTHLY_EXPENSES`,
    date_add(DATE '2026-01-01', idx - 1) AS `ELIGIBILITY_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `ACK_SIGNED_WHEN`,
    concat('ID_TYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ID_TYPE`,
    date_add(DATE '2026-01-01', idx - 1) AS `ID_EXPIRATION_DATE`,
    concat('ACCOUNT_TYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACCOUNT_TYPE`,
    concat('ACCOUNT_STATUS_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACCOUNT_STATUS`,
    concat('OWNERSHIP_TYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `OWNERSHIP_TYPE`,
    concat('ADVISOR_', lpad(CAST(idx AS STRING), 2, '0')) AS `ADVISOR`,
    concat('LANGUAGE_', lpad(CAST(idx AS STRING), 2, '0')) AS `LANGUAGE`,
    idx AS `DEPENDENTS`,
    concat('ACK_SIGNED_BY_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACK_SIGNED_BY`,
    concat('AFFILIATION_', lpad(CAST(idx AS STRING), 2, '0')) AS `AFFILIATION`,
    concat('AFFILIATION_NAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `AFFILIATION_NAME`,
    concat('AFFILIATION_RELATIONSHIP_', lpad(CAST(idx AS STRING), 2, '0')) AS `AFFILIATION_RELATIONSHIP`,
    concat('AFFILIATION_COMPANY_', lpad(CAST(idx AS STRING), 2, '0')) AS `AFFILIATION_COMPANY`,
    concat('AFFILIATION_ADDRESS_', lpad(CAST(idx AS STRING), 2, '0')) AS `AFFILIATION_ADDRESS`,
    concat('AFFILIATION_COUNTRY_', lpad(CAST(idx AS STRING), 2, '0')) AS `AFFILIATION_COUNTRY`,
    concat('AFFILIATION_STATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `AFFILIATION_STATE`,
    concat('AFFILIATION_CITY_', lpad(CAST(idx AS STRING), 2, '0')) AS `AFFILIATION_CITY`,
    concat('AFFILIATION_POSTAL_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `AFFILIATION_POSTAL_CODE`,
    concat('LITIGATION_', lpad(CAST(idx AS STRING), 2, '0')) AS `LITIGATION`,
    concat('LITIGATION_DETAILS_', lpad(CAST(idx AS STRING), 2, '0')) AS `LITIGATION_DETAILS`,
    concat('EXCHANGEMEMBERSHIP_', lpad(CAST(idx AS STRING), 2, '0')) AS `EXCHANGEMEMBERSHIP`,
    concat('MEMBERSHIP_EXCHANGES_', lpad(CAST(idx AS STRING), 2, '0')) AS `MEMBERSHIP_EXCHANGES`,
    concat('MEMBERSHIP_ORGANIZATIONS_', lpad(CAST(idx AS STRING), 2, '0')) AS `MEMBERSHIP_ORGANIZATIONS`,
    concat('INVESTIGATION_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVESTIGATION`,
    concat('INVESTIGATION_DETAILS_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVESTIGATION_DETAILS`,
    concat('REGULATORY_CONTROL_', lpad(CAST(idx AS STRING), 2, '0')) AS `REGULATORY_CONTROL`,
    concat('REGULATORY_CONTROL_DETAI_', lpad(CAST(idx AS STRING), 2, '0')) AS `REGULATORY_CONTROL_DETAILS`,
    concat('CUSTOMER_AGENT_GROUP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CUSTOMER_AGENT_GROUP`,
    idx AS `CUSTOMER_AGENT_GROUP_ID`,
    concat('EMPLCOUNTRY_RESCOUNTRY_D_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMPLCOUNTRY_RESCOUNTRY_DETAILS`,
    CAST(idx * 1000.25 AS DECIMAL(38,10)) AS `INITIAL_DEPOSIT_INFORMED`,
    concat('CLIENT_DOCUMENTS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CLIENT_DOCUMENTS`,
    date_add(DATE '2026-01-01', idx - 1) AS `ACK_TAX_ID_WHEN`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."BCP_IBKR_BALANCE_HISTORY"
CREATE TABLE IF NOT EXISTS ibkr.default.bcp_ibkr_balance_history (
    `ID` BIGINT,
    `ACCT_ID` BIGINT,
    `BALANCE` DECIMAL(38,10),
    `CREATED_AT` DATE,
    `YEARMONTH` BIGINT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE ibkr.default.bcp_ibkr_balance_history IS
'The table contains historical balance data for accounts, recording the balance over time along with timestamps for when the data was created and loaded. Possible use cases include tracking account balance trends, generating reports on account performance, and analyzing financial activity over specific periods. This can help in understanding customer behavior and ensuring accuracy in financial records.';

TRUNCATE TABLE ibkr.default.bcp_ibkr_balance_history;

INSERT INTO ibkr.default.bcp_ibkr_balance_history (
    `ID`, `ACCT_ID`, `BALANCE`, `CREATED_AT`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    idx AS `ID`,
    idx AS `ACCT_ID`,
    CAST(idx * 1000.25 AS DECIMAL(38,10)) AS `BALANCE`,
    date_add(DATE '2026-01-01', idx - 1) AS `CREATED_AT`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

SELECT 'bcp_ibkr_account' AS table_name, COUNT(*) AS record_count
FROM ibkr.default.bcp_ibkr_account
UNION ALL
SELECT 'bcp_ibkr_acct_holder' AS table_name, COUNT(*) AS record_count
FROM ibkr.default.bcp_ibkr_acct_holder
UNION ALL
SELECT 'bcp_ibkr_balance_history' AS table_name, COUNT(*) AS record_count
FROM ibkr.default.bcp_ibkr_balance_history;
