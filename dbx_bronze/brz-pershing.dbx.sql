
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershingdataprod_caps_hist.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHINGDATAPROD_CAPS_HIST
-- Source table: landing_pershing.default.pershingdataprod_caps_hist
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershingdataprod_caps_hist AS
SELECT
    `id`,
    `IBD_1`,
    `RECORD_ID_1`,
    `TRADE_DATE`,
    `TRADE_REFERENCE_NUMBER`,
    `PERSHING_OFFICE_NUMBER`,
    `ACCOUNT_NUMBER`,
    `ACCOUNT_NAME`,
    `BUY_SELL_INDICATOR`,
    `CANCEL_INDICATOR`,
    `CAPS_SOURCE`,
    `TRADE_QUANTITY`,
    `PRICE`,
    `PRODUCT_CODE`,
    `CUSIP_NUMBER_OF_SECURITY_TRADED`,
    `ACCOUNT_SHORT_NAME`,
    `ORDER_TYPE`,
    `MISCELLANEOUS_FEE`,
    `NOT_USED_1`,
    `IBD_2`,
    `RECORD_ID_2`,
    `MARKET_CODE`,
    `BLOTTER_CODE`,
    `SECURITY_TYPE`,
    `STOCK_SYMBOL`,
    `SECURITY_DESCRIPTION`,
    `CENTS_PER_SHARE`,
    `DISCOUNT_PERCENT`,
    `PAYCODE`,
    `MASTER_CLIENT_MNEMONIC`,
    `INSTITUTIONAL_RETAIL_INDICATOR`,
    `STATE_CODE`,
    `COMMISSION_INDICATOR`,
    `FIRM_TRADING_ACCOUNT`,
    `POSTED_DATE`,
    `SETTLEMENT_DATE`,
    `NOT_USED_2`,
    `RECYCLE_INDICATOR`,
    `IBD_3`,
    `RECORD_ID_3`,
    `AS_OF_TRADE_INDICATOR`,
    `DISTRIBUTION_INDICATOR`,
    `EXPLODE_INDICATOR`,
    `REVENUE_TYPE`,
    `IP`,
    `IP_CAPS_REVENUE_CENTER`,
    `IP_CAPS_OFFICE_NUMBER`,
    `IP_SPLIT_PERCENT`,
    `TOTAL_AMT_OF_REV_GEN_BY_TR_AND_CRED_TO_IP`,
    `PERSHING_CHARGE`,
    `FROM_IP_NUMBER`,
    `CAPS_REV_CENTER_ASSOC_W_THE_FROM_IP`,
    `CAPS_OFFICE_NO_ASSOC_W_THE_FROM_IP`,
    `TOTAL_ORDER_COMMISSION`,
    `SPREAD_STRADDLE`,
    `CORRECTION_CODE`,
    `SECURITY_MODIFIER`,
    `SECURITY_CALCULATION_CODE`,
    `PRINCIPAL`,
    `CRD_NUMBER`,
    `SOURCE_OF_INPUT`,
    `FOR_PERS_INT_USE_ONLY_3`,
    `SERVICE_CHARGE_OTHER_FEE`,
    `IBD_4`,
    `RECORD_ID_4`,
    `CURRENCY_CODE`,
    `CURRENCY_AMOUNT_OF_REVENUE`,
    `FOREIGN_EXCHANGE_RATE`,
    `CURRENCY_MULTI_DIV_INDICATOR`,
    `IBD_SETTLEMENT_FEE`,
    `CUSTOMER_SETTLEMENT_FEE`,
    `GLOSS_REFERENCE_NUMBER`,
    `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`,
    `NOT_USED_4`,
    `IBD_5`,
    `RECORD_ID_5`,
    `OPTION_ROOT_ID`,
    `EXPIRATION_DATE`,
    `CALL_PUT_INDICATOR`,
    `STRIKE_PRICE`,
    `MASTER_CLIENT_NAME`,
    `FOR_PERS_INT_USE_ONLY_5`,
    `PERS_INT_ORDER_REF_NO`,
    `NOT_USED_5`,
    `AS_OF_DATE`,
    `IMPORTED_DATE`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershingdataprod_caps_hist;

COMMENT ON TABLE bronze_pershing.default.bronze_pershingdataprod_caps_hist IS
'Bronze Pershing table bronze_pershingdataprod_caps_hist contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershingdataprod_caps_hist for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershingdataprod_master_asset.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHINGDATAPROD_MASTER_ASSET
-- Source table: landing_pershing.default.pershingdataprod_master_asset
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershingdataprod_master_asset AS
SELECT
    `ID`,
    `TRANSFER_ID`,
    `DATA_DT`,
    `RUN_DT`,
    `TRANSFER_TYPE`,
    `SEQUENCE`,
    `ACCOUNT`,
    `IP`,
    `ASSET_TYPE`,
    `ASSET_TYPE_ID`,
    `NUMBER`,
    `DESCRIPTION`,
    `STATUS`,
    `QUANTITY`,
    `VALUE`,
    `CASH_MARGIN`,
    `DELIVERY`,
    `JSON_DATA`,
    `REQUEST_ID`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershingdataprod_master_asset;

COMMENT ON TABLE bronze_pershing.default.bronze_pershingdataprod_master_asset IS
'Bronze Pershing table bronze_pershingdataprod_master_asset contains brokerage records sourced from landing_pershing.default.pershingdataprod_master_asset for warehouse parity, validation, reconciliation, and downstream reporting.';
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
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershingdataprod_transfer.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHINGDATAPROD_TRANSFER
-- Source table: landing_pershing.default.pershingdataprod_transfer
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershingdataprod_transfer AS
SELECT
    `ID`,
    `DATA_DT`,
    `RUN_DT`,
    `TYPE`,
    `SEQUENCE`,
    `ACCOUNT`,
    `IP`,
    `TYPE2`,
    `STATUS`,
    `DAYS`,
    `CB_NUMBER`,
    `CB_NAME`,
    `CA_NUMBER`,
    `RETIREMENT`,
    `CREATION_DT`,
    `CREATION_USER`,
    `UPDATE_DT`,
    `UPDATE_USER`,
    `AMOUNT`,
    `SOURCE`,
    `SMA`,
    `CUSTOMER`,
    `TAX_ID`,
    `JSON_DATA`,
    `REJECT`,
    `COMMENTS`,
    `REQUEST_ID`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershingdataprod_transfer;

COMMENT ON TABLE bronze_pershing.default.bronze_pershingdataprod_transfer IS
'Bronze Pershing table bronze_pershingdataprod_transfer contains transfer, ACATS, contra broker, status, and exception records sourced from landing_pershing.default.pershingdataprod_transfer for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pers_accf.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERS_ACCF
-- Source table: landing_pershing.default.pers_accf
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pers_accf AS
SELECT
    `TRANSCODE`,
    `RECORDIND`,
    `RECORDSEQUENCEID`,
    `ACCTNUMBER`,
    `BROKERDEALERNUMBER`,
    `INVESTMENTPRONUMBER`,
    `ACCOUNTSHORTNAME`,
    `TRANSACTIONTYPE`,
    `AUTOTITLEDACCT`,
    `ACCTTYPECODE`,
    `REGISTRATIONTYPE`,
    `NUMBERACCTTITLELINES`,
    `ACCTREGISLINE1`,
    `ACCTREGISLINE2`,
    `ACCTREGISLINE3`,
    `ACCTREGISLINE4`,
    `ACCTREGISLINE5`,
    `ACCTREGISLINE6`,
    `USTENANCYINDICATOR`,
    `MARRIEDINDICATOR`,
    `TENANCYSTATE`,
    `JOINTTENANCYCLAUSE`,
    `AGREEMENTEXEDATE`,
    `NUMBEROFTENANTS`,
    `DATEACCTOPENED`,
    `DATEACCTINFOUPDATED`,
    `ACCTSTATUSINDICATOR`,
    `PENDINGCLOSEDDATE`,
    `DATEACCOUNTCLOSED`,
    `ACCTREACTIVATEDDATE`,
    `DATEACCOUNTREOPENED`,
    `PROCEEDS`,
    `TRANSINSTRUC`,
    `INCOMEINSTRUC`,
    `NUMBCONFIRMS`,
    `NUMBSTATEMENTS`,
    `INVESOBJTRANSCODE`,
    `COMMENTS`,
    `EMPLOYERSHORTNAME`,
    `EMPLOYERCUSIP`,
    `EMPLOYERSYMBOL`,
    `MARPRIVREVOKED`,
    `STATEREVIEWDATE`,
    `MARPAPERSFILE`,
    `OPTPAPERSFILE`,
    `GOODFAITHMARGIN`,
    `INVESTPRODISCRGRANTED`,
    `INVESTADVDISCRGRANTED`,
    `THIRDPARTYDISCGRANTED`,
    `THIRDPARTYNAME`,
    `RISKFACTORCODE`,
    `INVESTOBJCODE`,
    `OPTIONEQUITIES`,
    `OPTIONINDEX`,
    `OPTIONDEBT`,
    `OPTIONCURRENCY`,
    `OPTIONLEVEL1`,
    `OPTIONLEVEL2`,
    `OPTIONLEVEL3`,
    `OPTIONLEVEL4`,
    `OPTIONCALLLIMITS`,
    `OPTIONPUTLIMITS`,
    `OPTIONLIMITSPUTSCALLS`,
    `NONUSDOLLARTRADING`,
    `NONCUSTOMERINDICATOR`,
    `THIRDPARTYFEEINDICATOR`,
    `THIRDPARTYFEEAPPRDATE`,
    `INTERMEDIARYACCTIND`,
    `COMMISSIONSCHEDULE`,
    `GROUPINDEX`,
    `MONEYMANAGERID`,
    `MONEYMANAGEROBJID`,
    `DTCIDCONFIRMNUMBER`,
    `CAPSMASTERMNEMONIC`,
    `EMPLOYEEID`,
    `PRIMEBROKERFREEFUNDIND`,
    `FEEBASEDACCTIND`,
    `BILLINGTYPE`,
    `FEEBASEDTERMDATE`,
    `PLANNAME`,
    `SELFDIRECTED`,
    `PLANTYPE`,
    `PLANNUMBER`,
    `EMPLOYEERELAIND`,
    `COMMISSPERCDISC`,
    `BLOCKMUTFUNDFEES`,
    `NAMEINVESTPRO`,
    `DATEINVESTPRO`,
    `NAMEPRINCIPALSIGNED`,
    `DATEPRINCIPALSIGNED`,
    `POLITEXPOSEDPERSON`,
    `PRIVATEBANKACCTIND`,
    `FOREIGNBANKACCTIND`,
    `INITIALSOURCEFUNDS`,
    `USAPATACTEXEMPTREASON`,
    `PRIMARYCOUNTRYCTZ`,
    `COUNTRYRESIDENCE`,
    `BIRTHDATE`,
    `AGEBASEDFUNDROLLEXEMPTIND`,
    `MONEYFUNDREFORMRETAIL`,
    `TRUSTEDCONTACTSTATUS`,
    `FULFILLMENTMETHOD`,
    `CREDITINTERESTIND`,
    `AMAIND`,
    `DATEOFDATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pers_accf;

COMMENT ON TABLE bronze_pershing.default.bronze_pers_accf IS
'Bronze Pershing table bronze_pers_accf contains account, registration, client, status, and relationship records sourced from landing_pershing.default.pers_accf for warehouse parity, validation, reconciliation, and downstream reporting.';
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
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_aca2_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ACA2_REC_A
-- Source table: landing_pershing.default.pershing_aca2_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_aca2_a AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_TRANSFER_TYPE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `INVESTMENT_PROFESSIONAL`,
    `RECORD_TYPE`,
    `TRANSFER_TYPE`,
    `TRANSFER_STATUS`,
    `NUMBER_OF_DAYS_IN_PERSHING_STATUS`,
    `CONTRA_BROKER_NUMBER`,
    `CONTRA_BROKER_NAME`,
    `CONTRA_ACCOUNT_NUMBER`,
    `RETIREMENT_ACCOUNT_CLASS_INDICATOR`,
    `REQUEST_CREATION_DATE`,
    `REQUEST_CREATION_USER_ID`,
    `LAST_UPDATE_DATE`,
    `LAST_UPDATE_USER_ID`,
    `TOTAL_MARKET_VALUE_OF_TRANSFER`,
    `TOTAL_MARKET_VALUE_SIGN`,
    `SOURCE_CODE`,
    `SPECIAL_MEMORANDUM_ACCOUNT`,
    `SPECIAL_MEMORANDUM_ACCOUNT_SIGN`,
    `CUSTOMER_NAME`,
    `PRIMARY_TAX_IDENTIFICATION_NUMBER`,
    `NSCC_ACCOUNT_TYPE`,
    `NSCC_STATUS`,
    `NUMBER_OF_DAYS_IN_NSCC_STATUS`,
    `NSCC_CONTROL_NUMBER`,
    `REASON_CODE_FOR_REJECT`,
    `REASON_COMMENTS`,
    `REQUEST_ID`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_aca2_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_aca2_a IS
'Bronze Pershing table bronze_pershing_aca2_a contains transfer, ACATS, contra broker, status, and exception records sourced from landing_pershing.default.pershing_aca2_a for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_aca2_rec_d.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ACA2_REC_D
-- Source table: landing_pershing.default.pershing_aca2_d
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_aca2_d AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_TRANSFER_TYPE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `INVESTMENT_PROFESSIONAL`,
    `RECORD_TYPE`,
    `TRANSFER_TYPE`,
    `TRANSFER_STATUS`,
    `NUMBER_OF_DAYS_IN_PERSHING_STATUS`,
    `CONTRA_BROKER_NUMBER`,
    `CONTRA_BROKER_NAME`,
    `CONTRA_ACCOUNT_NUMBER`,
    `RETIREMENT_ACCOUNT_CLASS_INDICATOR`,
    `REQUEST_CREATION_DATE`,
    `REQUEST_CREATION_USER_ID`,
    `LAST_UPDATE_DATE`,
    `LAST_UPDATE_USER_ID`,
    `TOTAL_MARKET_VALUE_OF_TRANSFER`,
    `TOTAL_MARKET_VALUE_SIGN`,
    `SOURCE_CODE`,
    `SPECIAL_MEMORANDUM_ACCOUNT`,
    `SPECIAL_MEMORANDUM_ACCOUNT_SIGN`,
    `CUSTOMER_NAME`,
    `PRIMARY_TAX_IDENTIFICATION_NUMBER`,
    `NSCC_ACCOUNT_TYPE`,
    `NSCC_STATUS`,
    `NUMBER_OF_DAYS_IN_NSCC_STATUS`,
    `NSCC_CONTROL_NUMBER`,
    `REASON_CODE_FOR_REJECT`,
    `REASON_COMMENTS`,
    `REQUEST_ID`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_aca2_d;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_aca2_d IS
'Bronze Pershing table bronze_pershing_aca2_d contains transfer, ACATS, contra broker, status, and exception records sourced from landing_pershing.default.pershing_aca2_d for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_accf_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ACCF_REC_A
-- Source table: landing_pershing.default.pershing_accf_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_accf_a AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `ACCOUNT_SHORT_NAME`,
    `TRANSACTION_TYPE`,
    `AUTO_TITLED_OR_USER_TITLED_ACCOUNT`,
    `ACCOUNT_TYPE_CODE`,
    `REGISTRATION_TYPE`,
    `NUMBER_OF_ACCOUNT_TITLE_LINES_IN_REGISTRATION_LINES`,
    `ACCOUNT_REGISTRATION_LINE_1`,
    `ACCOUNT_REGISTRATION_LINE_2`,
    `ACCOUNT_REGISTRATION_LINE_3`,
    `ACCOUNT_REGISTRATION_LINE_4`,
    `ACCOUNT_REGISTRATION_LINE_5`,
    `ACCOUNT_REGISTRATION_LINE_6`,
    `US_TENANCY_INDICATOR`,
    `MARRIED_INDICATOR`,
    `TENANCY_STATE`,
    `JOINT_TENANCY_CLAUSE`,
    `AGREEMENT_EXECUTION_DATE`,
    `NUMBER_OF_TENANTS`,
    `STATE_GIFT_GIVEN`,
    `DATE_GIFT_GIVEN`,
    `AGE_TO_TERMINATE`,
    `MINORS_BIRTHDATE`,
    `MANNER_OF_GIFT`,
    `TYPE_OF_TRUST`,
    `DATE_TRUST_ESTABLISHED`,
    `AMENDED_DATE`,
    `TRUSTEE_INDEPENDENT_ACTION`,
    `PLAN_ESTABLISHED_DATE`,
    `PLAN_AMENDMENT_DATE`,
    `DATE_ACCOUNT_OPENED`,
    `DATE_ACCOUNT_INFORMATION_UPDATED`,
    `ACCOUNT_STATUS_INDICATOR`,
    `PENDING_CLOSED_DATE`,
    `DATE_ACCOUNT_CLOSED`,
    `CLOSING_NOTICE_DATE`,
    `ACCOUNT_REACTIVATED_DATE`,
    `DATE_ACCOUNT_REOPENED`,
    `PROCEEDS`,
    `TRANSFER_INSTRUCTIONS`,
    `INCOME_INSTRUCTIONS`,
    `NUMBER_OF_CONFIRMS_FOR_THIS_ACCOUNT`,
    `NUMBER_OF_STATEMENTS_FOR_THIS_ACCOUNT`,
    `INVESTMENT_OBJECTIVE_TRANSACTION_CODE`,
    `COMMENTS`,
    `EMPLOYER_SHORTNAME`,
    `EMPLOYERS_CUSIP`,
    `EMPLOYERS_SYMBOL`,
    `MARGIN_PRIVILEGES_REVOKED`,
    `STATEMENT_REVIEW_DATE`,
    `MARGIN_PAPERS_ON_FILE`,
    `OPTION_PAPERS_ON_FILE`,
    `GOOD_FAITH_MARGIN`,
    `INVESTMENT_PROFESSIONAL_DISCRETION_GRANTED`,
    `INVESTMENT_ADVISOR_DISCRETION_GRANTED`,
    `THIRD_PARTY_DISCRETION_GRANTED`,
    `THIRD_PARTY_NAME`,
    `RISK_FACTOR_CODE`,
    `INVESTMENT_OBJECTIVE_CODE`,
    `OPTION_EQUITIES`,
    `OPTION_INDEX`,
    `OPTION_DEBT`,
    `OPTION_CURRENCY`,
    `OPTION_LEVEL_1`,
    `OPTION_LEVEL_2`,
    `OPTION_LEVEL_3`,
    `OPTION_LEVEL_4`,
    `OPTION_CALL_LIMITS`,
    `OPTION_PUT_LIMITS`,
    `OPTION_TOTAL_LIMITS_OF_PUTS_AND_CALLS`,
    `NON_US_DOLLAR_TRADING`,
    `NON_CUSTOMER_INDICATOR`,
    `THIRD_PARTY_FEE_INDICATOR`,
    `THIRD_PARTY_FEE_APPROVAL_DATE`,
    `INTERMEDIARY_ACCOUNT_INDICATOR`,
    `COMMISSION_SCHEDULE`,
    `GROUP_INDEX`,
    `MONEY_MANAGER_ID`,
    `MONEY_MANAGER_OBJECTIVE`,
    `DTC_ID_CONFIRM_NUMBER_FOR_NON_COD_ACCOUNT`,
    `CAPS_MASTER_MNEMONIC`,
    `EMPLOYEE_ID`,
    `PRIME_BROKER_FREE_FUND_INDICATOR`,
    `FEE_BASED_ACCOUNT_INDICATOR`,
    `FEE_BASED_TERMINATION_DATE`,
    `PLAN_NAME`,
    `SELFDIRECTED_401_k_ACCOUNT_TYPE`,
    `PLAN_TYPE`,
    `PLAN_NUMBER`,
    `EMPLOYEE_RELATIVE_INDICATOR`,
    `BLOCK_MUTUAL_FUND_FEES`,
    `NAME_OF_INVESTMENT_PROFESSIONAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    `DATE_INVESTMENT_PROFESSIONAL_SIGNED_NEW_ACCOUNT_FORM`,
    `NAME_OF_PRINCIPAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    `DATE_PRINCIPAL_SIGNED_NEW_ACCOUNT_FORM`,
    `POLITICALLY_EXPOSED_PERSON_INDICATOR`,
    `PRIVATE_BANKING_ACCOUNT_INDICATOR`,
    `FOREIGN_BANK_ACCOUNT_INDICATOR`,
    `INITIAL_SOURCE_OF_FUNDS`,
    `USA_PATRIOT_ACT_EXEMPT_REASON`,
    `PRIMARY_COUNTRY_OF_CITIZENSHIP`,
    `COUNTRY_OF_RESIDENCE`,
    `BIRTH_DATE`,
    `AGEBASED_FUND_ROLL_EXEMPT_INDICATOR`,
    `MONEY_FUND_REFORM_RETAIL`,
    `TRUSTED_CONTACT_STATUS`,
    `REGULATORY_ACCOUNT_TYPE_CATEGORY`,
    `ACCOUNT_MANAGED_BY_TRUST_COMPANY_INDICATOR`,
    `VOTING_AUTHORITY`,
    `Internal_Use_IMS_Prime_Broker_Code`,
    `Internal_Use_Payout_Code`,
    `Internal_Use_Trader_Number`,
    `Internal_Use_Product_Code`,
    `CUSTOMER_TYPE`,
    `Internal_Use_Account_Plan_Type`,
    `Internal_Use_Promotion_Type`,
    `Internal_Use_Investment_Objective_1`,
    `Internal_Use_Investment_Objective_2`,
    `Internal_Use_Investment_Objective_3`,
    `FULFILLMENT_METHOD`,
    `CREDIT_INTEREST_INDICATOR`,
    `AMA_INDICATOR`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_accf_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_accf_a IS
'Bronze Pershing table bronze_pershing_accf_a contains account, registration, client, status, and relationship records sourced from landing_pershing.default.pershing_accf_a for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_accf_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ACCF_REC_B
-- Source table: landing_pershing.default.pershing_accf_b
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_accf_b AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `ACCOUNT_SHORT_NAME`,
    `TAX_ID_TYPE`,
    `TAX_ID_NUMBER`,
    `DATE_TAX_ID_APPLIED_FOR`,
    `W_8_W_9_INDICATOR`,
    `W8_W_9_DATE_SIGNED`,
    `W_8_W_9_EFFECTIVE_RECEIVED_DATE`,
    `W_8_W_9_DOCUMENT_TYPE`,
    `TAX_STATUS`,
    `B_NOTICE_REASON_CODE`,
    `FIRST_B_NOTICE_STATUS`,
    `DATE_FIRST_B_NOTICE_STATUS_ISSUED_ENFORCED`,
    `DATE_FIRST_B_NOTICE_STATUS_SATISFIED`,
    `SECOND_B_NOTICE_STATUS`,
    `DATE_SECOND_B_NOTICE_STATUS_ISSUED_ENFORCED`,
    `DATE_SECOND_B_NOTICE_STATUS_SATISFIED`,
    `C_NOTICE_STATUS`,
    `DATE_C_NOTICE_STATUS_ISSUED_ENFORCED`,
    `DATE_C_NOTICE_STATUS_SATISFIED`,
    `OLD_ACCOUNT_NUMBER`,
    `ORIGINAL_ACCOUNT_OPEN_DATE`,
    `UNIDENTIFIED_LARGE_TRADER_ID`,
    `LARGE_TRADER_TYPE_CODE`,
    `LARGE_TRADER_TYPE_LAST_CHANGE_DATE`,
    `INITIAL_SOURCE_OF_FUNDS`,
    `ACCOUNT_FUNDING_DATE`,
    `REGULATORY_BLOCK_INDICATOR`,
    `STATEMENT_CURRENCY_CODE`,
    `FUTURE_STATEMENT_CURRENCY_CODE`,
    `FUTURE_STATEMENT_CURRENCY_CODE_DATE`,
    `ACCOUNT_LEVEL_ROUTING_CODE`,
    `SELF_DIRECTED_INDICATOR`,
    `DIGITAL_ADVICE_INDICATOR`,
    `PROHIBITED_TRANSACTON_EXEMPTION_PTE_86_128_ACCOUNT_INDICATOR`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_1`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_2`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_3`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_4`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_5`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_6`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_7`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_8`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_9`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_10`,
    `ALERT_IM_ACRONYM`,
    `ALERT_IM_ACCESS_CODE`,
    `BROKER_ACRONYM`,
    `CROSS_REFERENCED_INDICATOR`,
    `BNY_TRUST_INDICATOR`,
    `SOURCE_OF_ASSETS_AT_ACCOUNT_OPENING`,
    `COMMISSION_DISCOUNT_CODE`,
    `EXTERNAL_ACCOUNT_NUMBER`,
    `CONFIRMATION_SUPPRESSION_INDICATOR`,
    `DATE_LAST_BOOKS_RECORDS_MAILING_SENT_TO`,
    `DATE_LAST_BOOKS_AND_RECORDS_MAILING_SENT_TO_CUSTOMER_OUTSIDE_PERSHING_SYSTEM`,
    `FULLY_PAID_LENDING_AGREEMENT_INDICATOR`,
    `FULLY_PAID_LENDING_AGREEMENT_DATE`,
    `CUSTODIAN_ACCOUNT_TYPE`,
    `MARKETS_IN_FINANCIAL_INSTRUMENTS_DIRECTIVE_MIFID_CUSTOMER_CATEGORIZATION`,
    `CASH_MANAGEMENT_TRANSACTION_CODE`,
    `SWEEP_STATUS_INDICATOR`,
    `DATE_SWEEP_ACTIVATED`,
    `DATE_SWEEP_DETAILS_CHANGED`,
    `COVER_MARGIN_DEBIT_INDICATOR`,
    `FIRST_FUND_SWEEP_ACCOUNT_ID`,
    `FIRST_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`,
    `SECOND_FUND_SWEEP_ACCOUNT_ID`,
    `SECOND_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`,
    `TYPE_OF_BANK_ACCOUNT`,
    `BANKLINK_ABA_NUMBER`,
    `BANKLINK_DDA_NUMBER`,
    `FUND_BANK_INDICATOR`,
    `W_9_CORPORATION_TAX_CLASSIFICATION_CODE`,
    `COMBINED_MARGIN_ACCOUNT_INDICATOR`,
    `PLEDGE_COLLATERAL_ACCOUNT_INDICATOR`,
    `FINRA_INSTITUTIONAL_ACCOUNT_CODE`,
    `PROPOSED_ACCOUNT_REFERENCE_ID`,
    `ADVISOR_MODEL_ID`,
    `FIRM_MODEL_STYLE_ID`,
    `THIRD_PARTY_LENDER_INDICATOR`,
    `RESERVED_FOR_FUTURE_THIRD_PARTY_LENDER_GROWTH`,
    `DVP_RESTRICTION_CODE`,
    `DVP_RESTRICTION_EXPIRATION_DATE`,
    `ESCHEATMENT_WITHHOLDING_INDICATOR`,
    `SOURCE_OF_ORIGINATION`,
    `SOURCE_OF_PERSONA`,
    `CLIENT_ON_BOARDING_METHOD`,
    `TAX_FILING_CODE`,
    `NON_PURPOSE_COLLATERAL_ACCOUNT_INDICATOR`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_accf_b;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_accf_b IS
'Bronze Pershing table bronze_pershing_accf_b contains account, registration, client, status, and relationship records sourced from landing_pershing.default.pershing_accf_b for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_acct_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ACCT_REC_A
-- Source table: landing_pershing.default.pershing_acct_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_acct_a AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `ACCOUNT_SHORT_NAME`,
    `TRANSACTION_TYPE`,
    `AUTO_TITLED_OR_USER_TITLED_ACCOUNT`,
    `ACCOUNT_TYPE_CODE`,
    `REGISTRATION_TYPE`,
    `NUMBER_OF_ACCOUNT_TITLE_LINES_IN_REGISTRATION_LINES`,
    `ACCOUNT_REGISTRATION_LINE_1`,
    `ACCOUNT_REGISTRATION_LINE_2`,
    `ACCOUNT_REGISTRATION_LINE_3`,
    `ACCOUNT_REGISTRATION_LINE_4`,
    `ACCOUNT_REGISTRATION_LINE_5`,
    `ACCOUNT_REGISTRATION_LINE_6`,
    `US_TENANCY_INDICATOR`,
    `MARRIED_INDICATOR`,
    `TENANCY_STATE`,
    `JOINT_TENANCY_CLAUSE`,
    `AGREEMENT_EXECUTION_DATE`,
    `NUMBER_OF_TENANTS`,
    `STATE_GIFT_GIVEN`,
    `DATE_GIFT_GIVEN`,
    `AGE_TO_TERMINATE`,
    `MINORS_BIRTHDATE`,
    `MANNER_OF_GIFT`,
    `TYPE_OF_TRUST`,
    `DATE_TRUST_ESTABLISHED`,
    `AMENDED_DATE`,
    `TRUSTEE_INDEPENDENT_ACTION`,
    `PLAN_ESTABLISHED_DATE`,
    `PLAN_AMENDMENT_DATE`,
    `DATE_ACCOUNT_OPENED`,
    `DATE_ACCOUNT_INFORMATION_UPDATED`,
    `ACCOUNT_STATUS_INDICATOR`,
    `PENDING_CLOSED_DATE`,
    `DATE_ACCOUNT_CLOSED`,
    `CLOSING_NOTICE_DATE`,
    `ACCOUNT_REACTIVATED_DATE`,
    `DATE_ACCOUNT_REOPENED`,
    `PROCEEDS`,
    `TRANSFER_INSTRUCTIONS`,
    `INCOME_INSTRUCTIONS`,
    `NUMBER_OF_CONFIRMS_FOR_THIS_ACCOUNT`,
    `NUMBER_OF_STATEMENTS_FOR_THIS_ACCOUNT`,
    `INVESTMENT_OBJECTIVE_TRANSACTION_CODE`,
    `COMMENTS`,
    `EMPLOYER_SHORTNAME`,
    `EMPLOYERS_CUSIP`,
    `EMPLOYERS_SYMBOL`,
    `MARGIN_PRIVILEGES_REVOKED`,
    `STATEMENT_REVIEW_DATE`,
    `MARGIN_PAPERS_ON_FILE`,
    `OPTION_PAPERS_ON_FILE`,
    `GOOD_FAITH_MARGIN`,
    `INVESTMENT_PROFESSIONAL_DISCRETION_GRANTED`,
    `INVESTMENT_ADVISOR_DISCRETION_GRANTED`,
    `THIRD_PARTY_DISCRETION_GRANTED`,
    `THIRD_PARTY_NAME`,
    `RISK_FACTOR_CODE`,
    `INVESTMENT_OBJECTIVE_CODE`,
    `OPTION_EQUITIES`,
    `OPTION_INDEX`,
    `OPTION_DEBT`,
    `OPTION_CURRENCY`,
    `OPTION_LEVEL_1`,
    `OPTION_LEVEL_2`,
    `OPTION_LEVEL_3`,
    `OPTION_LEVEL_4`,
    `OPTION_CALL_LIMITS`,
    `OPTION_PUT_LIMITS`,
    `OPTION_TOTAL_LIMITS_OF_PUTS_AND_CALLS`,
    `NON_US_DOLLAR_TRADING`,
    `NON_CUSTOMER_INDICATOR`,
    `THIRD_PARTY_FEE_INDICATOR`,
    `THIRD_PARTY_FEE_APPROVAL_DATE`,
    `INTERMEDIARY_ACCOUNT_INDICATOR`,
    `COMMISSION_SCHEDULE`,
    `GROUP_INDEX`,
    `MONEY_MANAGER_ID`,
    `MONEY_MANAGER_OBJECTIVE`,
    `DTC_ID_CONFIRM_NUMBER_FOR_NON_COD_ACCOUNT`,
    `CAPS_MASTER_MNEMONIC`,
    `EMPLOYEE_ID`,
    `PRIME_BROKER_FREE_FUND_INDICATOR`,
    `FEE_BASED_ACCOUNT_INDICATOR`,
    `FEE_BASED_TERMINATION_DATE`,
    `PLAN_NAME`,
    `SELFDIRECTED_401_k_ACCOUNT_TYPE`,
    `PLAN_TYPE`,
    `PLAN_NUMBER`,
    `EMPLOYEE_RELATIVE_INDICATOR`,
    `BLOCK_MUTUAL_FUND_FEES`,
    `NAME_OF_INVESTMENT_PROFESSIONAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    `DATE_INVESTMENT_PROFESSIONAL_SIGNED_NEW_ACCOUNT_FORM`,
    `NAME_OF_PRINCIPAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    `DATE_PRINCIPAL_SIGNED_NEW_ACCOUNT_FORM`,
    `POLITICALLY_EXPOSED_PERSON_INDICATOR`,
    `PRIVATE_BANKING_ACCOUNT_INDICATOR`,
    `FOREIGN_BANK_ACCOUNT_INDICATOR`,
    `INITIAL_SOURCE_OF_FUNDS`,
    `USA_PATRIOT_ACT_EXEMPT_REASON`,
    `PRIMARY_COUNTRY_OF_CITIZENSHIP`,
    `COUNTRY_OF_RESIDENCE`,
    `BIRTH_DATE`,
    `AGEBASED_FUND_ROLL_EXEMPT_INDICATOR`,
    `MONEY_FUND_REFORM_RETAIL`,
    `TRUSTED_CONTACT_STATUS`,
    `REGULATORY_ACCOUNT_TYPE_CATEGORY`,
    `ACCOUNT_MANAGED_BY_TRUST_COMPANY_INDICATOR`,
    `VOTING_AUTHORITY`,
    `Internal_Use_IMS_Prime_Broker_Code`,
    `Internal_Use_Payout_Code`,
    `Internal_Use_Trader_Number`,
    `Internal_Use_Product_Code`,
    `CUSTOMER_TYPE`,
    `Internal_Use_Account_Plan_Type`,
    `Internal_Use_Promotion_Type`,
    `Internal_Use_Investment_Objective_1`,
    `Internal_Use_Investment_Objective_2`,
    `Internal_Use_Investment_Objective_3`,
    `FULFILLMENT_METHOD`,
    `CREDIT_INTEREST_INDICATOR`,
    `AMA_INDICATOR`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_acct_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_acct_a IS
'Bronze Pershing table bronze_pershing_acct_a contains account, registration, client, status, and relationship records sourced from landing_pershing.default.pershing_acct_a for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_acct_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ACCT_REC_B
-- Source table: landing_pershing.default.pershing_acct_b
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_acct_b AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `ACCOUNT_SHORT_NAME`,
    `TAX_ID_TYPE`,
    `TAX_ID_NUMBER`,
    `DATE_TAX_ID_APPLIED_FOR`,
    `W_8_W_9_INDICATOR`,
    `W8_W_9_DATE_SIGNED`,
    `W_8_W_9_EFFECTIVE_RECEIVED_DATE`,
    `W_8_W_9_DOCUMENT_TYPE`,
    `TAX_STATUS`,
    `B_NOTICE_REASON_CODE`,
    `FIRST_B_NOTICE_STATUS`,
    `DATE_FIRST_B_NOTICE_STATUS_ISSUED_ENFORCED`,
    `DATE_FIRST_B_NOTICE_STATUS_SATISFIED`,
    `SECOND_B_NOTICE_STATUS`,
    `DATE_SECOND_B_NOTICE_STATUS_ISSUED_ENFORCED`,
    `DATE_SECOND_B_NOTICE_STATUS_SATISFIED`,
    `C_NOTICE_STATUS`,
    `DATE_C_NOTICE_STATUS_ISSUED_ENFORCED`,
    `DATE_C_NOTICE_STATUS_SATISFIED`,
    `OLD_ACCOUNT_NUMBER`,
    `ORIGINAL_ACCOUNT_OPEN_DATE`,
    `UNIDENTIFIED_LARGE_TRADER_ID`,
    `LARGE_TRADER_TYPE_CODE`,
    `LARGE_TRADER_TYPE_LAST_CHANGE_DATE`,
    `INITIAL_SOURCE_OF_FUNDS`,
    `ACCOUNT_FUNDING_DATE`,
    `REGULATORY_BLOCK_INDICATOR`,
    `STATEMENT_CURRENCY_CODE`,
    `FUTURE_STATEMENT_CURRENCY_CODE`,
    `FUTURE_STATEMENT_CURRENCY_CODE_DATE`,
    `ACCOUNT_LEVEL_ROUTING_CODE`,
    `SELF_DIRECTED_INDICATOR`,
    `DIGITAL_ADVICE_INDICATOR`,
    `PROHIBITED_TRANSACTON_EXEMPTION_PTE_86_128_ACCOUNT_INDICATOR`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_1`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_2`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_3`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_4`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_5`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_6`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_7`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_8`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_9`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_10`,
    `ALERT_IM_ACRONYM`,
    `ALERT_IM_ACCESS_CODE`,
    `BROKER_ACRONYM`,
    `CROSS_REFERENCED_INDICATOR`,
    `BNY_TRUST_INDICATOR`,
    `SOURCE_OF_ASSETS_AT_ACCOUNT_OPENING`,
    `COMMISSION_DISCOUNT_CODE`,
    `EXTERNAL_ACCOUNT_NUMBER`,
    `CONFIRMATION_SUPPRESSION_INDICATOR`,
    `DATE_LAST_BOOKS_RECORDS_MAILING_SENT_TO`,
    `DATE_LAST_BOOKS_AND_RECORDS_MAILING_SENT_TO_CUSTOMER_OUTSIDE_PERSHING_SYSTEM`,
    `FULLY_PAID_LENDING_AGREEMENT_INDICATOR`,
    `FULLY_PAID_LENDING_AGREEMENT_DATE`,
    `CUSTODIAN_ACCOUNT_TYPE`,
    `MARKETS_IN_FINANCIAL_INSTRUMENTS_DIRECTIVE_MIFID_CUSTOMER_CATEGORIZATION`,
    `CASH_MANAGEMENT_TRANSACTION_CODE`,
    `SWEEP_STATUS_INDICATOR`,
    `DATE_SWEEP_ACTIVATED`,
    `DATE_SWEEP_DETAILS_CHANGED`,
    `COVER_MARGIN_DEBIT_INDICATOR`,
    `FIRST_FUND_SWEEP_ACCOUNT_ID`,
    `FIRST_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`,
    `SECOND_FUND_SWEEP_ACCOUNT_ID`,
    `SECOND_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`,
    `TYPE_OF_BANK_ACCOUNT`,
    `BANKLINK_ABA_NUMBER`,
    `BANKLINK_DDA_NUMBER`,
    `FUND_BANK_INDICATOR`,
    `W_9_CORPORATION_TAX_CLASSIFICATION_CODE`,
    `COMBINED_MARGIN_ACCOUNT_INDICATOR`,
    `PLEDGE_COLLATERAL_ACCOUNT_INDICATOR`,
    `FINRA_INSTITUTIONAL_ACCOUNT_CODE`,
    `PROPOSED_ACCOUNT_REFERENCE_ID`,
    `ADVISOR_MODEL_ID`,
    `FIRM_MODEL_STYLE_ID`,
    `THIRD_PARTY_LENDER_INDICATOR`,
    `RESERVED_FOR_FUTURE_THIRD_PARTY_LENDER_GROWTH`,
    `DVP_RESTRICTION_CODE`,
    `DVP_RESTRICTION_EXPIRATION_DATE`,
    `ESCHEATMENT_WITHHOLDING_INDICATOR`,
    `SOURCE_OF_ORIGINATION`,
    `SOURCE_OF_PERSONA`,
    `CLIENT_ON_BOARDING_METHOD`,
    `TAX_FILING_CODE`,
    `NON_PURPOSE_COLLATERAL_ACCOUNT_INDICATOR`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_acct_b;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_acct_b IS
'Bronze Pershing table bronze_pershing_acct_b contains account, registration, client, status, and relationship records sourced from landing_pershing.default.pershing_acct_b for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_caps_rec_1.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPS_REC_1
-- Source table: landing_pershing.default.pershing_caps_1
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_caps_1 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `TRADE_DATE`,
    `TRADE_REFERENCE_NUMBER`,
    `PERSHING_OFFICE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `ACCOUNT_NAME`,
    `BUY_SELL_INDICATOR`,
    `CANCEL_INDICATOR`,
    `CAPS_SOURCE`,
    `TRADE_QUANTITY`,
    `PRICE`,
    `PRODUCT_CODE`,
    `CUSIP_NUMBER_OF_SECURITY_TRADED`,
    `ACCOUNT_SHORT_NAME`,
    `ORDER_TYPE`,
    `MISCELLANEOUS_FEE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_caps_1;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_caps_1 IS
'Bronze Pershing table bronze_pershing_caps_1 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_caps_1 for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_caps_rec_2.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPS_REC_2
-- Source table: landing_pershing.default.pershing_caps_2
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_caps_2 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `MARKET_CODE`,
    `BLOTTER_CODE`,
    `SECURITY_TYPE`,
    `STOCK_SYMBOL`,
    `SECURITY_DESCRIPTION`,
    `CENTS_PER_SHARE`,
    `DISCOUNT_PERCENT`,
    `PAYCODE`,
    `MASTER_CLIENT_MNEMONIC`,
    `INSTITUTIONAL_RETAIL_INDICATOR`,
    `STATE_CODE`,
    `COMISSION_INDICATOR`,
    `FIRM_TRADING_ACCOUNT`,
    `POSTED_DATE`,
    `SETTLEMENT_DATE`,
    `RECYCLE_INDICATOR`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_caps_2;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_caps_2 IS
'Bronze Pershing table bronze_pershing_caps_2 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_caps_2 for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_caps_rec_3.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPS_REC_3
-- Source table: landing_pershing.default.pershing_caps_3
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_caps_3 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `AS_OF_TRADE_INDICATOR`,
    `DISTRIBUTION_INDICATOR`,
    `EXPLODE_INDICATOR`,
    `REVENUE_TYPE`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `INVESTMENT_PROFESSIONAL_CAPS_REVENUE_CENTER`,
    `INVESTMENT_PROFESSIONAL_CAPS_OFFICE_NUMBER`,
    `INVESTMENT_PROFESSIONAL_SPLIT_PERCENT`,
    `TOTAL_AMOUNT_OF_REVENUE_GENERATED_AND_CREDITED_TO_IP`,
    `PERSHING_CHARGE`,
    `LEGACY_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    `CAPS_REVENUE_CENTER_ASSOCIATED_WITH_IP`,
    `CAPS_OFFICE_NUMBER_ASSOCIATED_WITH_IP`,
    `TOTAL_ORDER_COMMISSION`,
    `SPREAD_STRADDLE_MUTUAL_FUND_VALUES`,
    `CORRECTION_CODE`,
    `SECURITY_MODIFIER`,
    `SECURITY_CALCULATION_CODE`,
    `PRINCIPAL`,
    `CRD_NUMBER`,
    `SOURCE_OF_INPUT`,
    `SERVICE_CHARGE_OTHER_FEE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_caps_3;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_caps_3 IS
'Bronze Pershing table bronze_pershing_caps_3 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_caps_3 for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_caps_rec_4.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPS_REC_4
-- Source table: landing_pershing.default.pershing_caps_4
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_caps_4 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `CURRENCY_CODE`,
    `CURRENCY_AMOUNT_OF_REVENUE`,
    `FOREIGN_EXCHANGE_RATE`,
    `CURRENCY_MULTI_DIV_INDICATOR`,
    `IBD_SETTLEMENT_FEE_USD`,
    `CUSTOMER_SETTLEMENT_FEE_USD`,
    `GLOSS_REFERENCE_NUMBER`,
    `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_caps_4;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_caps_4 IS
'Bronze Pershing table bronze_pershing_caps_4 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_caps_4 for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_caps_rec_5.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPS_REC_5
-- Source table: landing_pershing.default.pershing_caps_5
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_caps_5 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `OPTION_ROOT_ID`,
    `EXPIRATION_DATE`,
    `CALL_PUT_INDICATOR`,
    `STRIKE_PRICE`,
    `MASTER_CLIENT_NAME`,
    `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_caps_5;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_caps_5 IS
'Bronze Pershing table bronze_pershing_caps_5 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_caps_5 for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_capt_rec_1.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPT_REC_1
-- Source table: landing_pershing.default.pershing_capt_1
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_capt_1 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `TRADE_DATE`,
    `TRADE_REFERENCE_NUMBER`,
    `PERSHING_OFFICE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `ACCOUNT_NAME`,
    `BUY_SELL_INDICATOR`,
    `CANCEL_INDICATOR`,
    `CAPS_SOURCE`,
    `TRADE_QUANTITY`,
    `PRICE`,
    `PRODUCT_CODE`,
    `CUSIP_NUMBER_OF_SECURITY_TRADED`,
    `ACCOUNT_SHORT_NAME`,
    `ORDER_TYPE`,
    `MISCELLANEOUS_FEE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_capt_1;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_capt_1 IS
'Bronze Pershing table bronze_pershing_capt_1 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_capt_1 for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_capt_rec_2.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPT_REC_2
-- Source table: landing_pershing.default.pershing_capt_2
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_capt_2 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `MARKET_CODE`,
    `BLOTTER_CODE`,
    `SECURITY_TYPE`,
    `STOCK_SYMBOL`,
    `SECURITY_DESCRIPTION`,
    `CENTS_PER_SHARE`,
    `DISCOUNT_PERCENT`,
    `PAYCODE`,
    `MASTER_CLIENT_MNEMONIC`,
    `INSTITUTIONAL_RETAIL_INDICATOR`,
    `STATE_CODE`,
    `COMISSION_INDICATOR`,
    `FIRM_TRADING_ACCOUNT`,
    `POSTED_DATE`,
    `SETTLEMENT_DATE`,
    `RECYCLE_INDICATOR`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_capt_2;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_capt_2 IS
'Bronze Pershing table bronze_pershing_capt_2 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_capt_2 for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_capt_rec_3.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPT_REC_3
-- Source table: landing_pershing.default.pershing_capt_3
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_capt_3 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `AS_OF_TRADE_INDICATOR`,
    `DISTRIBUTION_INDICATOR`,
    `EXPLODE_INDICATOR`,
    `REVENUE_TYPE`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `INVESTMENT_PROFESSIONAL_CAPS_REVENUE_CENTER`,
    `INVESTMENT_PROFESSIONAL_CAPS_OFFICE_NUMBER`,
    `INVESTMENT_PROFESSIONAL_SPLIT_PERCENT`,
    `TOTAL_AMOUNT_OF_REVENUE_GENERATED_AND_CREDITED_TO_IP`,
    `PERSHING_CHARGE`,
    `LEGACY_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    `CAPS_REVENUE_CENTER_ASSOCIATED_WITH_IP`,
    `CAPS_OFFICE_NUMBER_ASSOCIATED_WITH_IP`,
    `TOTAL_ORDER_COMMISSION`,
    `SPREAD_STRADDLE_MUTUAL_FUND_VALUES`,
    `CORRECTION_CODE`,
    `SECURITY_MODIFIER`,
    `SECURITY_CALCULATION_CODE`,
    `PRINCIPAL`,
    `CRD_NUMBER`,
    `SOURCE_OF_INPUT`,
    `SERVICE_CHARGE_OTHER_FEE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_capt_3;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_capt_3 IS
'Bronze Pershing table bronze_pershing_capt_3 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_capt_3 for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_capt_rec_4.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPT_REC_4
-- Source table: landing_pershing.default.pershing_capt_4
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_capt_4 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `CURRENCY_CODE`,
    `CURRENCY_AMOUNT_OF_REVENUE`,
    `FOREIGN_EXCHANGE_RATE`,
    `CURRENCY_MULTI_DIV_INDICATOR`,
    `IBD_SETTLEMENT_FEE_USD`,
    `CUSTOMER_SETTLEMENT_FEE_USD`,
    `GLOSS_REFERENCE_NUMBER`,
    `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_capt_4;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_capt_4 IS
'Bronze Pershing table bronze_pershing_capt_4 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_capt_4 for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_capt_rec_5.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CAPT_REC_5
-- Source table: landing_pershing.default.pershing_capt_5
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_capt_5 AS
SELECT
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `RECORD_ID`,
    `OPTION_ROOT_ID`,
    `EXPIRATION_DATE`,
    `CALL_PUT_INDICATOR`,
    `STRIKE_PRICE`,
    `MASTER_CLIENT_NAME`,
    `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_capt_5;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_capt_5 IS
'Bronze Pershing table bronze_pershing_capt_5 contains trade, commission, revenue, security, and settlement records sourced from landing_pershing.default.pershing_capt_5 for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_ckff_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CKFF_REC_A
-- Source table: landing_pershing.default.pershing_ckff_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_ckff_a AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_TYPE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `TRANSACTION_AMOUNT`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `INTERMEDIARY_DESCRIPTION_LINE_1`,
    `INTERMEDIARY_DESCRIPTION_LINE_2`,
    `ACCOUNT_WITH_INSTITUTION`,
    `BENEFICIARY_CUSTOMER_1`,
    `BENEFICIARY_CUSTOMER_2`,
    `BENEFICIARY_CUSTOMER_3`,
    `BENEFICIARY_CUSTOMER_4`,
    `OUTGOING_WIRES_ADD_INFO1_OR_DESC_TRANSACT`,
    `OUTGOING_WIRES_ADD_INFO2_OR_ABA_NUMBER`,
    `OUTGOING_WIRES_ADD_INFO3_OR_DDA_NUMBER`,
    `OUTGOING_WIRES_ACH_ADD_INFO4`,
    `OUTGOING_WIRES_ACH_ADD_INFO5`,
    `OUTGOING_WIRES_ACH_ADD_INFO6`,
    `OUTGOING_WIRES_ACH_ADD_INFO7`,
    `OUTGOING_WIRES_ACH_ADD_INFO8`,
    `OUTGOING_WIRES_ACH_ADD_INFO9`,
    `DUPLICATE_RECORD_INDICATOR`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_ckff_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_ckff_a IS
'Bronze Pershing table bronze_pershing_ckff_a contains transaction, cash, financial activity, and reconciliation records sourced from landing_pershing.default.pershing_ckff_a for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_ckff_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CKFF_REC_B
-- Source table: landing_pershing.default.pershing_ckff_b
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_ckff_b AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_TYPE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `TRANSACTION_AMOUNT`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `PAYEE_INFORMATION_LINE_1`,
    `PAYEE_INFORMATION_LINE_2`,
    `PAYEE_INFORMATION_LINE_3`,
    `CHECK_NUMBER_OR_CHECK_DIS_ADD_INFO_LINE_1`,
    `CHECK_DIS_ADD_INFO_LINE_2`,
    `CHECK_DIS_ADD_INFO_LINE_3`,
    `CHECK_DIS_ADD_INFO_LINE_4`,
    `CHECK_DIS_ADD_INFO_LINE_5`,
    `CHECK_DIS_ADD_INFO_LINE_6`,
    `CHECK_DIS_ADD_INFO_LINE_7`,
    `CHECK_DIS_ADD_INFO_LINE_8`,
    `CHECK_DIS_ADD_INFO_LINE_9`,
    `THIRD_PARTY_INDICATOR`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_ckff_b;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_ckff_b IS
'Bronze Pershing table bronze_pershing_ckff_b contains transaction, cash, financial activity, and reconciliation records sourced from landing_pershing.default.pershing_ckff_b for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_ckff_rec_c.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CKFF_REC_C
-- Source table: landing_pershing.default.pershing_ckff_c
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_ckff_c AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_TYPE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `TRANSACTION_AMOUNT`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `DESCRIPTION_CODE`,
    `DESCRIPTION`,
    `ADDITIONAL_DESCRIPTION_OR_CHECK_DEPO_ADD_INFO_LINE_1`,
    `CHECK_DEPO_ADD_INFO_LINE_2`,
    `CHECK_DEPO_ADD_INFO_LINE_3`,
    `CHECK_DEPO_ADD_INFO_LINE_4`,
    `CHECK_DEPO_ADD_INFO_LINE_5`,
    `CHECK_DEPO_ADD_INFO_LINE_6`,
    `CHECK_DEPO_ADD_INFO_LINE_7`,
    `CHECK_DEPO_ADD_INFO_LINE_8`,
    `CHECK_DEPO_ADD_INFO_LINE_9`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_ckff_c;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_ckff_c IS
'Bronze Pershing table bronze_pershing_ckff_c contains transaction, cash, financial activity, and reconciliation records sourced from landing_pershing.default.pershing_ckff_c for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_ckff_rec_d.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_CKFF_REC_D
-- Source table: landing_pershing.default.pershing_ckff_d
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_ckff_d AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_TYPE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `TRANSACTION_AMOUNT`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_1`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_2`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_3`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_4`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_5`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_6`,
    `BANK_NAME`,
    `ORD_INST_INFO_1_OR_DESC_TRAN_ADD_INFO_1`,
    `ORD_INST_INFO_2_OR_ABA_NUMBER_ADD_INFO_2`,
    `ORD_INST_INFO_3_OR_DDA_NUMBER_ADD_INFO_3`,
    `ORD_INST_INFO_4_OR_ADD_INFO_4`,
    `ORD_INST_INFO_5_OR_ADD_INFO_5`,
    `ORD_INST_INFO_6_OR_ADD_INFO_6`,
    `ORD_INST_INFO_7_OR_ADD_INFO_7`,
    `ORD_INST_INFO_8_OR_ADD_INFO_8`,
    `ORD_INST_INFO_9_OR_ADD_INFO_9`,
    `INCOMING_WIRE_INDICATOR`,
    `TRANSACTION_IDENTIFIER`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_ckff_d;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_ckff_d IS
'Bronze Pershing table bronze_pershing_ckff_d contains transaction, cash, financial activity, and reconciliation records sourced from landing_pershing.default.pershing_ckff_d for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_fund_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_FUND_REC_A
-- Source table: landing_pershing.default.pershing_fund_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_fund_a AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `IP`,
    `FUND_MNEMONIC`,
    `ACCOUNT_NUMBER_AT_FUND`,
    `FUND_MANAGER`,
    `LAST_SWEEP_DATE`,
    `LAST_UPDATE_DATE`,
    `PRINCIPAL`,
    `ACCRUED_DIVIDEND`,
    `GROUP_NUMBER`,
    `OMNIBUS_ACCOUNT_INDICATOR`,
    `SWEEP_ACCOUNT_INDICATOR`,
    `MARGIN_DEBIT_AUTO_SWEEP_INDICATOR`,
    `CUSIP_NUMBER`,
    `PRICING_GROUP`,
    `IBDNUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_fund_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_fund_a IS
'Bronze Pershing table bronze_pershing_fund_a contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_fund_a for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_gact_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_GACT_REC_A
-- Source table: landing_pershing.default.pershing_gact_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_gact_a AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `CUSIP_NUMBER`,
    `UNDERLYING_CUSIP`,
    `SECURITY_SYMBOL`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_OF_RECORD`,
    `LEGACY_EXECUTING_INVESTMENT_PROFESSIONAL_IP`,
    `TRANSACTION_TYPE`,
    `BUY_SELL_CODE`,
    `OPEN_CLOSE_INDICATOR`,
    `PAR_KEY_CODE`,
    `SOURCE_CODE`,
    `MAXX_KEY_CODE`,
    `PROCESS_DATE`,
    `TRADE_DATE`,
    `SETTLEMENT_ENTRY_DATE`,
    `SOURCE_OF_INPUT`,
    `REFERENCE_NUMBER`,
    `BATCH_CODE`,
    `SAME_DAY_SETTLEMENT`,
    `CONTRA_ACCOUNT`,
    `MARKET_CODE`,
    `BLOTTER_CODE`,
    `CANCEL_CODE`,
    `CORRECTION_CODE`,
    `MARKET_LIMIT_INDICATOR`,
    `LEGEND_CODE_1`,
    `LEGEND_CODE_2`,
    `QUANTITY`,
    `PRICE_IN_SETTLEMENT_CURRENCY`,
    `CURRENCY_INDICATOR_FOR_PRICE`,
    `NET_AMOUNT_OF_TRANSACTION_USD_USDE`,
    `PRINCIPAL_USD_USDE`,
    `INTEREST_USD_USDE`,
    `COMMISSION_USD_USDE`,
    `TAX_USD_USDE`,
    `TRANSACTION_USD_USDE`,
    `MISC_FEE_USD_USDE`,
    `OTHER_FEE_USD_USDE`,
    `TEFRA_WITHHOLDING_AMOUNT_USD`,
    `PERSHING_CHARGE_USD`,
    `BROKERAGE_CHARGE_USD`,
    `SALES_CREDIT_USD_USDE`,
    `SETTLEMENT_FEE_USD_USDE`,
    `SERVICE_CHARGE_USD_USDE`,
    `MARKUP_MARKDOWN_AMOUNT_USD_USDE`,
    `DIVIDEND_PAYABLE_DATE`,
    `DIVIDEND_RECORD_DATE`,
    `DIVIDEND_TYPE`,
    `SHARES_OF_RECORD_QUANTITY_FOR_DIVIDENDS`,
    `ORDER_SIZE_QUANTITY`,
    `POOL_FACTOR`,
    `PARSED_CUSTOMER_ACCOUNT_NUMBER_ASSOC_FIRM_ACCOUNT`,
    `IBD_NUMBER`,
    `SECURITY_TYPE_CODE`,
    `SECURITY_MODIFIER_CODE`,
    `SECURITY_CALCULATION_CODE`,
    `MINOR_PRODUCT_CODE`,
    `FOREIGN_PRODUCT_INDICATOR`,
    `WITH_DUE_BILL_INDICATOR`,
    `TAXABLE_MUNICIPAL_BOND_INDICATOR`,
    `OMNIBUS_INDICATOR`,
    `EXTERNAL_ORDER_ID`,
    `MARKET_VALUE_OF_TRANSACTION`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_GMAR_FIRM_ACCOUNT`,
    `REPORTED_PRICE`,
    `PREVIOUS_DAY_MARKET_VALUE_TRANSACTION`,
    `PRICE_IN_USDE`,
    `OPTION_ROOT_ID`,
    `EXPIRATION_DATE`,
    `PUT_CALL_CODE`,
    `STRIKE_PRICE`,
    `REPO_IDENTIFIER`,
    `TAXABLE`,
    `QUALIFIED`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER_OF_RECORD`,
    `EXPANDED_EXECUTING_INVESTMENT_IP`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_GMAR_FIRM_ACCOUNT`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_gact_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_gact_a IS
'Bronze Pershing table bronze_pershing_gact_a contains transfer, ACATS, contra broker, status, and exception records sourced from landing_pershing.default.pershing_gact_a for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_gact_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_GACT_REC_B
-- Source table: landing_pershing.default.pershing_gact_b
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_gact_b AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `SECURITY_CURRENCY_OF_ISSUANCE`,
    `TRADE_CURRENCY_CODE`,
    `SETTLEMENT_CURRENCY_CODE`,
    `SETTLEMENT_USD_CURRENCY_FX_RATE`,
    `SETTLEMENT_USD_MULTIPLY_DIVIDE_CODE`,
    `CROSS_CURRENCY_FX_RATE`,
    `CURRENCY_MULTIPLY_DIVIDE_CODE`,
    `ACCRUED_INTEREST_IN_SETTLEMENT_CURRENCY`,
    `MARKET_CODE`,
    `INTERNAL_REFERENCE_FOR_GLOSS`,
    `INTRODUCING_BROKER_DEALER_IBD_VERSION`,
    `NET_AMOUNT_IN_SETTLEMENT_CURRENCY`,
    `PRINCIPAL_AMOUNT_IN_SETTLEMENT_CURRENCY`,
    `INTEREST_IN_SETTLEMENT_CURRENCY`,
    `COMISSION_IN_SETTLEMENT_CURRENCY`,
    `TAX_IN_SETTLEMENT_CURRENCY`,
    `TRANSACTION_FEE_IN_SETTLEMENT_CURRENCY`,
    `MISCELLANEOUS_FEE_IN_SETTLEMENT_CURRENCY`,
    `OTHER_FEE_IN_SETTLEMENT_CURRENCY`,
    `SALES_CREDIT_IN_SETTLEMENT_CURRENCY`,
    `SETTLEMENT_FEE_IN_SETTLEMENT_CURRENCY`,
    `SERVICE_CHARGE_IN_SETTLEMENT_CURRENCY`,
    `MARKUP_MARKDOWN_IN_SETTLEMENT_CURRENCY`,
    `GLOBAL_EXCHANGE`,
    `NUMBER_OF_DESCRIPTION_LINES`,
    `LAST_DESCRIPTION_LINE`,
    `DESCRIPTION_LINE_1`,
    `DESCRIPTION_LINE_2`,
    `DESCRIPTION_LINE_3`,
    `DESCRIPTION_LINE_4`,
    `DESCRIPTION_LINE_5`,
    `DESCRIPTION_LINE_6`,
    `DESCRIPTION_LINE_7`,
    `DESCRIPTION_LINE_8`,
    `DESCRIPTION_LINE_9`,
    `DESCRIPTION_LINE_10`,
    `DESCRIPTION_LINE_11`,
    `DESCRIPTION_LINE_12`,
    `SECURITY_CURRENCY_INDICATOR`,
    `MARKET_MNEMONIC_CODE`,
    `CURRENCY_OF_ISSUANCE_USD_CURRENCY_FX_RATE`,
    `CURRENCY_OF_ISSUANCE_USD_MULTIPLY_DIVIDE_CODE`,
    `ALTERNATE_SECURITY_ID_TYPE_1`,
    `ALTERNATE_SECURITY_ID_1`,
    `ALTERNATE_SECURITY_ID_TYPE_2`,
    `ALTERNATE_SECURITY_ID_2`,
    `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    `CONFIRMATION_CODE_ONE`,
    `CONFIRMATION_CODE_TWO`,
    `CONFIRMATION_CODE_THREE`,
    `CONFIRMATION_CODE_FOUR`,
    `PREVAILING_MARKET_PRICE_PMP`,
    `TOTAL_AMOUNT_OF_MARK_UP_DOWN`,
    `PMP_PERCENT`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_gact_b;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_gact_b IS
'Bronze Pershing table bronze_pershing_gact_b contains transfer, ACATS, contra broker, status, and exception records sourced from landing_pershing.default.pershing_gact_b for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_gcus_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_GCUS_REC_A
-- Source table: landing_pershing.default.pershing_gcus_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_gcus_a AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `CUSIP_NUMBER`,
    `PORTFOLIO_CURRENCY`,
    `UNDERLYING_CUSIP_NUMBER`,
    `COUNTRY_CODE_SEC_ISSUANCE`,
    `IP`,
    `IBDNUMBER`,
    `CURRENCY_SECURITY_IND`,
    `ISSUE_CURRENCY`,
    `DATE_STAMP_TRADE_DATE`,
    `DATE_STAMP_SETTLEMENT_DATE`,
    `SAFEKEEPING_QTY_MEMO`,
    `TRANSFER_QTY_MEMO`,
    `PENDING_TRANSFER_QTY`,
    `LEGAL_TRANSFER_QTY`,
    `TRADE_DATE_QTY`,
    `SETTLEMENT_DATE_QTY`,
    `SEG_QTY_MEMO`,
    `TENDERED_REORG_QTY_MEMO`,
    `PENDING_PAPERS_MEMO`,
    `SHORT_AGAINST_THE_BOX_QTY_MEMO`,
    `NETWORKED_QTY_MEMO`,
    `PENDING_SPLIT_QTY_MEMO`,
    `QTY_COVERING_OPTIONS_OR_COVERED_QTY`,
    `TRADE_DATE_QTY_BOUGHT`,
    `TRADE_DATE_QTY_SOLD`,
    `FED_REG_T_REQUIREMENT`,
    `HOUSE_PERSHING_MARGIN_REQUIREMENT`,
    `EXCHANGE_NYSE_REQUIREMENT`,
    `EQUITY_REQUIREMENT`,
    `SECURITY_SYMBOL`,
    `SECURITY_TYPE`,
    `SECURITY_MOD`,
    `SECURITY_CALC`,
    `MINOR_PRODUCT_CODE`,
    `NETWORK_ELIGIBILITY_INDICATOR`,
    `STRIKE_PRICE_A`,
    `EXPIRATION_MATURITY_DATE`,
    `CONTRACT_SIZE`,
    `CONVERSION_RATIO`,
    `ACCOUNT_SHORT_NAME`,
    `STATE_CODE`,
    `COUNTRY_CODE_ACCT_LVL_CITIZENSHIP`,
    `NUMBER_OF_SECURITY_DESC_LINES`,
    `SECURITY_DESC_LINE_1`,
    `SECURITY_DESC_LINE_2`,
    `SECURITY_DESC_LINE_3`,
    `SECURITY_DESC_LINE_4`,
    `SECURITY_DESC_LINE_5`,
    `SECURITY_DESC_LINE_6`,
    `DIVIDEND_OPTION`,
    `LONG_TERM_CAPITAL_GAINS_OPTION`,
    `SHORT_TERM_CAPITAL_GAINS_OPTION`,
    `FIRM_TRADING_INDICATOR`,
    `POSITION_CURRENCY`,
    `TRADE_DATE_LIQUIDATING_VALUE`,
    `POOL_FACTOR`,
    `EXCHANGE_RATE`,
    `SETTLEMENT_DATE_LIQUIDATING_VALUE`,
    `ALTERNATE_SECURITY_ID_TYPE`,
    `ALTERNATE_SECURITY_ID`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_gcus_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_gcus_a IS
'Bronze Pershing table bronze_pershing_gcus_a contains custody, position, margin, collateral, and security records sourced from landing_pershing.default.pershing_gcus_a for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_gcus_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_GCUS_REC_B
-- Source table: landing_pershing.default.pershing_gcus_b
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_gcus_b AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `CUSIP_NUMBER`,
    `PORTFOLIO_CURRENCY`,
    `UNDERLYING_CUSIP_NUMBER`,
    `COUNTRY_CODE`,
    `IP`,
    `IBDNUMBER`,
    `FULLY_PAID_LENDING_QTY`,
    `FULLY_PAID_LENDING_QTY_COLLAT_AMT`,
    `OPTION_ROOT_ID`,
    `EXPIRATION_DATE`,
    `CALL_PUT_INDICATOR`,
    `STRIKE_PRICE_B`,
    `TRADE_DATE_REPO_QTY`,
    `SETTLEMENT_DATE_REPO_QTY`,
    `TRADE_DATE_REVERSE_REPO_QTY`,
    `SETTLEMENT_DATE_REVERSE_REPO_QTY`,
    `COLLAT_PLEDGE_QTY`,
    `CORP_EXEC_SERVICES_COLLAT_PLEDGE_QTY`,
    `TRADE_DATE_REPO_LIQUIDATING_VALUE`,
    `SETTLEMENT_DATE_REPO_LIQUIDATING_VALUE`,
    `TRADE_DATE_REVERSE_REPO_LIQUIDATING_VALUE`,
    `SETTLEMENT_DATE_REVERSE_REPO_LIQUIDATING_VALUE`,
    `COLLAT_PLEDGE_LIQUIDATING_VALUE`,
    `CORP_EXEC_SERVICES_COLLAT_PLEDGE_LIQUIDATING_VALUE`,
    `TRADE_DATE_REPO_LOAN_AMOUNT`,
    `SETTLEMENT_DATE_REPO_LOAN_AMOUNT`,
    `TRADE_DATE_REVERSE_REPO_LOAN_AMOUNT`,
    `SETTLEMENT_DATE_REVERSE_REPO_LOAN_AMOUNT`,
    `ACCRUED_INTEREST_VALUE_FROM_LAST_PAYABLE`,
    `DIVIDEND_or_COUPON_RATE`,
    `PENDING_SPLIT_QTY_LIQUIDATING_VALUE`,
    `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    `PLEDGED_QTY_MEMO`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_gcus_b;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_gcus_b IS
'Bronze Pershing table bronze_pershing_gcus_b contains custody, position, margin, collateral, and security records sourced from landing_pershing.default.pershing_gcus_b for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_gtde_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_GTDE_REC_A
-- Source table: landing_pershing.default.pershing_gtde_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_gtde_a AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `IBD_NUMBER`,
    `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`,
    `PERSHING_INTERNAL_TRADE_REFERENCE_NUMBER`,
    `PERSHING_INTERNAL_VERSION`,
    `IBD_ID`,
    `UNIQUE_ORDER_ID`,
    `ALLOCATION_BLOCK_ID`,
    `EXTERNAL_REFERENCE_NUMBER`,
    `BLOCK_TRADE_ID`,
    `PS_REFERENCE_NUMBER`,
    `TRADE_AREA_ID`,
    `TRADE_DATE`,
    `EXECUTION_TIME`,
    `SETTLEMENT_DATE`,
    `PROCESS_DATE`,
    `BUY_SELL_CODE`,
    `CUSIP_NUMBER`,
    `INTERNATIONAL_SECURITY_IDENTIFIER_TYPE`,
    `INTERNATIONAL_SECURITY_IDENTIFIER_ENTERED_ON_TRANSACTION`,
    `SECURITY_SYMBOL`,
    `ORDER_QUANTITY`,
    `PRICING_GROUP_QUANTITY`,
    `MARKET_CODE`,
    `MARKET_MNEMONIC_CODE`,
    `BLOTTER_CODE`,
    `SETTLEMENT_LOCATION_CODE`,
    `COUNTER_PARTY`,
    `CANCEL_CODE`,
    `CORRECTION_CODE`,
    `OPEN_CLOSE_INDICATOR_FOR_OPTIONS`,
    `TYPE_OF_ORDER`,
    `DISCRETION_EXERCISED`,
    `SOLICITED_INDICATOR`,
    `FX_FORWARD`,
    `USER_ID`,
    `SOURCE_OF_INPUT`,
    `NTF`,
    `ORDER_TERMINAL_ID`,
    `ORDER_SEQUENCE_NUMBER`,
    `CAPACITY_CODE`,
    `ACCOUNT_TYPE_INDICATOR`,
    `RISKLESS_PRINCIPAL_INDICATOR`,
    `TRACE_TREASURE_ISSUED_INDICATOR`,
    `SHORT_TRADE`,
    `SYNDICATE_INDICATOR`,
    `ODD_LOT_CODE`,
    `MUTUAL_FUND_VALUES`,
    `SPREAD_STRADDLE_INDICATOR`,
    `BATCH_CODE`,
    `INVESTMENT_MANAGER_CODE`,
    `DOLLAR_ROLL_INDICATOR`,
    `HEDGED_TRANSACTION_INDICATOR`,
    `OFFSET_ACCOUNT`,
    `EXECUTING_BROKER`,
    `MAJOR_BROKERAGE_BADGE_NUMBER`,
    `CONTRA_BROKER`,
    `MINOR_BROKERAGE_BADGE_NUMBER`,
    `TRADER_INITIALS`,
    `STEP_IN_OUT_INDICATOR`,
    `EXECUTION_TERMINAL`,
    `EXECUTION_SEQUENCE_NUMBER`,
    `PRIME_BROKER_INDICATOR`,
    `COUNTRY_OF_CITIZENSHIP`,
    `COUNTRY_STATE_OF_RESIDENCE`,
    `WITHHOLDING_CODE_TAX_EXEMPT_INDICATOR`,
    `BASE_CURRENCY`,
    `BASE_CURRENCY_EXCHANGE_RATE`,
    `BASE_CURRENCY_MULTIPLE_DIVIDE_CODE`,
    `PRIMARY_EXECUTION_IP`,
    `IP_2_OVERRIDE`,
    `IP_2_PERCENTAGE`,
    `IP_3_OVERRIDE`,
    `IP_3_PERCENTAGE`,
    `SECURITY_TYPE_CODE`,
    `SECURITY_MODIFIER_CODE`,
    `SECURITY_CALCULATION_CODE`,
    `MINOR_PRODUCT_CODE`,
    `ASSET_TYPE`,
    `ASSET_SUBTYPE`,
    `ASSET_SUB_SUBTYPE`,
    `INTERNATIONAL_EXCHANGE_CODE`,
    `UNDERLYING_CUSIP`,
    `STRIKE_PRICE_01`,
    `POOL_FACTOR`,
    `NON_US_SECURITY_INDICATOR`,
    `CNS_ELIGIBILITY`,
    `DTC_ELIGIBILITY`,
    `BUY_IN_TRADE_EXECUTION_INDICATOR`,
    `EX_DIVIDEND_DATE`,
    `RECORD_DATE`,
    `NUMBER_OF_DESCRIPTION_LINES`,
    `DESCRIPTION_LINE_1`,
    `DESCRIPTION_LINE_2`,
    `DESCRIPTION_LINE_3`,
    `DESCRIPTION_LINE_4`,
    `DESCRIPTION_LINE_5`,
    `DESCRIPTION_LINE_6`,
    `LEGEND_CODE_1`,
    `LEGEND_CODE_2`,
    `LEGEND_CODE_ONE`,
    `LEGEND_CODE_TWO`,
    `LEGEND_CODE_THREE`,
    `LEGEND_CODE_FOUR`,
    `LEGEND_CODE_FIVE`,
    `LEGEND_CODE_SIX`,
    `TRAILER_LINE_ONE`,
    `TRAILER_LINE_TWO`,
    `TRAILER_LINE_THREE`,
    `TRAILER_LINE_FOUR`,
    `TRAILER_LINE_FIVE`,
    `TRAILER_LINE_SIX`,
    `TRAILER_LINE_SEVEN`,
    `TRAILER_LINE_EIGHT`,
    `TRAILER_LINE_NINE`,
    `MIPS_COMMENT_1`,
    `MIPS_COMMENT_2`,
    `SOURCE_INITIAL_FUNDS_PURCHASE_ID`,
    `MIPS_SOURCE_OF_FUNDS`,
    `MIPS_COMMENT_3`,
    `OPTION_ROOT_ID`,
    `EXPIRATION_DATE`,
    `CALL_PUT_INDICATOR`,
    `STRIKE_PRICE_02`,
    `MBS_MPID`,
    `BUNCHED_TRADE_INDICATOR`,
    `CONFIRM_PRINT_INDICATOR`,
    `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    `CMTA_INDICATOR`,
    `CMTA_BROKER_NUMBER`,
    `CONFIRMATION_CODE_ONE`,
    `CONFIRMATION_CODE_TWO`,
    `CONFIRMATION_CODE_THREE`,
    `CONFIRMATION_CODE_FOUR`,
    `PMP`,
    `TOTAL_AMOUNT_OF_MARK`,
    `PREVAILING_MARKET_PRICE_PERCENT`,
    `EXPANDED_EXECUTION_TIME`,
    `ERROR_ACCOUNT_NUMBER`,
    `TRADE_PROCESSING_TIME_STAMP`,
    `SOURCE_OF_FUNDS`,
    `M2I_INDICATOR`,
    `M2I_CONFIRM_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_gtde_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_gtde_a IS
'Bronze Pershing table bronze_pershing_gtde_a contains transaction, cash, financial activity, and reconciliation records sourced from landing_pershing.default.pershing_gtde_a for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_gtde_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_GTDE_REC_B
-- Source table: landing_pershing.default.pershing_gtde_b
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_gtde_b AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `ACCOUNT_NUMBER`,
    substring(`ACCOUNT_NUMBER`, 1, 3) AS `ACCOUNT_NUMBER_OFFICE`,
    substring(`ACCOUNT_NUMBER`, 4, 6) AS `ACCOUNT_NUMBER_BASE`,
    CAST(NULL AS STRING) AS `ACCOUNT_NUMBER_TYPE`,
    `IBD_NUMBER`,
    `QUANTITY`,
    `PRICE`,
    `TRADE_CURRENCY`,
    `BASIS_PRICE_INDICATOR`,
    `YIELD`,
    `YIELD_TO_WORST`,
    `YIELD_TO_WORST_CODE`,
    `PERSHING_CHARGE`,
    `TRANSACTION_FEE`,
    `REBATE_AMOUNT`,
    `NET_AMOUNT`,
    `SETTLEMENT_CURRENCY`,
    `SETTLEMENT_CURRENCY_EXCHANGE_RATE`,
    `SETTLEMENT_CURRENCY_MULTIPLY_DIVIDE_CODE`,
    `ACCRUED_INTEREST`,
    `SERVICE_CHARGE_FOR_IBD`,
    `POSTAGE`,
    `COMMISSION_SALES_CREDIT_TYPE`,
    `COMMISSION`,
    `COMMISSION_PERCENT_DISCOUNT`,
    `SALES_CREDIT`,
    `CDSC`,
    `BASE_COMMISSION`,
    `EQUITY_MARK_UP_MARK_DOWN`,
    `PRINCIPAL`,
    `EXECUTION_CHARGE`,
    `EXECUTION_ONLY_INDICATOR`,
    `SETTLEMENT_FEE_CUSTOMER`,
    `CLEARANCE_ONLY_INDICATOR`,
    `FGN_RECEIVE_DELIVER_CHARGE`,
    `NTF_REDEMPTION_FEE`,
    `NTF_REDEMPTION_ADD_ON_FEE`,
    `MUTUAL_FUND_EXCHANGE_FEE`,
    `SRS_FUND_EXCHANGE_FEE`,
    `HANDLING_FEE`,
    `STAMP_DUTY`,
    `PRIME_BROKER_FEE`,
    `IBD_MISCELLANEOUS_CHARGE_LABEL`,
    `IBD_MISCELLANEOUS_CHARGE`,
    `STREETSIDE_MISCELLANEOUS_CHARGE_LABEL`,
    `STREETSIDE_MISCELLANEOUS_CHARGE`,
    `TRANSACTION_LEVY`,
    `TRANSFER_STAMP_FEE`,
    `TRANSFER_TAX`,
    `CUSTOMER_CONFIRM_FEE`,
    `IBD_CONFIRM_FEE`,
    `FOREIGN_FIN_TRANSACTION_TAX`,
    `REPORTED_PRICE`,
    `ADDITIONAL_TRAILER_LINE_ONE`,
    `ADDITIONAL_TRAILER_LINE_TWO`,
    `ADDITIONAL_TRAILER_LINE_THREE`,
    `ADDITIONAL_TRAILER_LINE_FOUR`,
    `ADDITIONAL_TRAILER_LINE_FIVE`,
    `ADDITIONAL_TRAILER_LINE_SIX`,
    `FREEFORM_LOT_INFORMATION_1`,
    `FREEFORM_LOT_INFORMATION_2`,
    `FREEFORM_LOT_INFORMATION_3`,
    `SEC`,
    `OPTION_REGULATORY_FEE`,
    `ALTERNATE_SECURITY_ID_1_TYPE`,
    `ALTERNATE_SECURITY_ID_1`,
    `ALTERNATE_SECURITY_ID_2_TYPE`,
    `ALTERNATE_SECURITY_ID_2`,
    `NET_AMOUNT_IN_USDE`,
    `INTERNATIONAL_FOREIGN_TRADING_FEE`,
    `ATS_INDICATOR`,
    `ATS_MPID`,
    `PERSHING_INTERNAL_VERSION_NUMBER`,
    `PERSHING_INTERNAL_TRADE_REFERENCE_NUMBER`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_gtde_b;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_gtde_b IS
'Bronze Pershing table bronze_pershing_gtde_b contains transaction, cash, financial activity, and reconciliation records sourced from landing_pershing.default.pershing_gtde_b for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isca_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISCA_REC_A
-- Source table: landing_pershing.default.pershing_isca_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isca_a AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CUSIP_NUMBER`,
    `SECURITY_TYPE`,
    `SECURITY_MODIFIER`,
    `SECURITY_CALCULATION_CODE`,
    `PRIMARY_EXCHANGE`,
    `COUPON_RATE_OR_INDICATED_DIVIDEND`,
    `UNDERLYING_SECURITY_CUSIP`,
    `FIRST_CALL_PRICE_OR_STRIKE_PRICE`,
    `FIRST_PAR_CALL_PRICE_OR_UNITS`,
    `PRIMARY_SYMBOL`,
    `INTEREST_FREQUENCY`,
    `BOND_CLASS`,
    `FIRST_COUPON_DAY`,
    `CALL_INDICATOR`,
    `PUT_INDICATOR`,
    `FEDERAL_MARGINABLE_INDICATOR`,
    `CNS_ELIGIBLE_CODE`,
    `DTCC_ELIGIBLE_CODE`,
    `NSCC_ELIGIBLE_CODE`,
    `FOREIGN_SECURITY`,
    `SECOND_COUPON_DAY`,
    `DIVIDEND_INTEREST_PAYMENT_METHOD`,
    `MINOR_PRODUCT_CODE`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isca_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isca_a IS
'Bronze Pershing table bronze_pershing_isca_a contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_isca_a for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isca_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISCA_REC_B
-- Source table: landing_pershing.default.pershing_isca_b
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isca_b AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CUSIP_NUMBER`,
    `NOT_USED`,
    `ETF_INDICATOR`,
    `BID_PRICE`,
    `ASK_PRICE`,
    `PREVIOUS_DAY_PRICE`,
    `LATEST_PRICE`,
    `END_OF_MONTH_PRICE`,
    `ROUND_LOT_QUANTITY`,
    `DIVIDEND_REINVESTMENT_ELIGIBILITY_INDICATOR`,
    `PREVIOUS_PRICE_DATE`,
    `LATEST_PRICE_DATE`,
    `END_OF_MONTH_PRICE_DATE`,
    `RECORD_DATE`,
    `FUNDVEST_INDICATOR`,
    `COUNTRY_CODE`,
    `STANDARD_AND_POORS_RATING`,
    `MOODYS_RATING`,
    `BOND_SUB_CLASS`,
    `RESTRICTION_INDICATOR`,
    `TRACE_INDICATOR`,
    `NEW_INTEREST_CALCULATION_CODE`,
    `SIC_CODE`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isca_b;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isca_b IS
'Bronze Pershing table bronze_pershing_isca_b contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_isca_b for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isca_rec_c.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISCA_REC_C
-- Source table: landing_pershing.default.pershing_isca_c
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isca_c AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CUSIP_NUMBER`,
    `STATE_TAX_INDICATOR`,
    `FEDERAL_TAXABLE_STATUS_INDICATOR`,
    `AMT_INDICATOR`,
    `RIC_INDICATOR`,
    `NUMBER_OF_DESCRIPTION_LINES`,
    `SECURITY_DESCRIPTION_LINE_1`,
    `SECURITY_DESCRIPTION_LINE_2`,
    `SECURITY_DESCRIPTION_LINE_3`,
    `SECURITY_DESCRIPTION_LINE_4`,
    `SECURITY_DESCRIPTION_LINE_5`,
    `USER_CUSIP_IDENTIFIER`,
    `TAXABLE_INDICATOR`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isca_c;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isca_c IS
'Bronze Pershing table bronze_pershing_isca_c contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_isca_c for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isca_rec_g.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISCA_REC_G
-- Source table: landing_pershing.default.pershing_isca_g
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isca_g AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CUSIP_NUMBER`,
    `NOT_USED_1`,
    `DELTA`,
    `DELTA_VALUE_PRESENCE_INDICATOR`,
    `NOT_USED_2`,
    `ISIN_CODE`,
    `ISSUER_IDENTIFIER`,
    `PIUO`,
    `NOT_USED_3`,
    `SYMBOL_OF_THE_UNDERLYING_SECURITY`,
    `ASSET_TYPE`,
    `ASSET_SUBTYPE`,
    `ASSET_SUB_SUBTYPE`,
    `PAYMENT_DAY_DELAYS`,
    `RESERVED_FOR_FUTURE_RATING`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isca_g;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isca_g IS
'Bronze Pershing table bronze_pershing_isca_g contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_isca_g for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isca_rec_j.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISCA_REC_J
-- Source table: landing_pershing.default.pershing_isca_j
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isca_j AS
SELECT
    `RECORD_INDICATOR_VALUE`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CUSIP_NUMBER`,
    `NOT_USED_1`,
    `LATEST_PRICE`,
    `LATEST_PRICE_DATE`,
    `FACTORED_MARKET_VALUE_MULTIPLIER`,
    `CURRENT_YIELD`,
    `YIELD`,
    `PRICE_SOURCE`,
    `COUNTRY_OF_ORIGIN`,
    `RESTRICTED_SECURITY_CODE`,
    `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    `INTERNATIONAL_EXCHANGE`,
    `VARIABLE_RATE_CATEGORY_CODE`,
    `INTEREST_RATE_COMPLETION_INDICATOR`,
    `NOT_USED_2`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isca_j;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isca_j IS
'Bronze Pershing table bronze_pershing_isca_j contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_isca_j for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_isrc_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_ISRC_REC_A
-- Source table: landing_pershing.default.pershing_isrc_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_isrc_a AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_SEQUENCE_IDENTIFIER`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CHANGE_INDICATOR`,
    `SOURCE_CODE`,
    `SOURCE_CODE_DESCRIPTION_LINE_ONE`,
    `SOURCE_CODE_DESCRIPTION_LINE_TWO`,
    `SOURCE_CODE_DESCRIPTION_LINE_THREE`,
    `TAX_STATUS`,
    `USERID_OF_PERSON_WHO_LAST_ADDED_UPDATED_RECORD`,
    `DATE_ADDED`,
    `DATE_UPDATED`,
    `IRA_INCOME_ELEGIBLE`,
    `RETAIL_INCOME_ELEGIBLE`,
    `CUSTOMER_FIRM`,
    `CREDIT_DEBIT`,
    `STATEMENT_INDICATOR`,
    `STATEMENT_ACTIVITY_SUMMARY_INDICATOR`,
    `STATEMENT_ACTIVITY_SUMMARY_NUMBER`,
    `STATEMENT_TRANSACTION_SUMMARY_INDICATOR`,
    `STATEMENT_TRANSACTION_NUMBER`,
    `STATEMENT_DISTRIBUTION_INDICATOR`,
    `STATEMENT_DISTRIBUTION_NUMBER`,
    `STATEMENT_DISTRIBUTION_TAXABLE_INDICATOR`,
    `STATEMENT_DIVIDEND_INDICATOR`,
    `STATEMENT_DIVIDEND_NUMBER`,
    `STATEMENT_DIVIDEND_TAXABLE_INDICATOR`,
    `PERSHING_DEPARTMENT`,
    `PERSHING_GROUP_THAT_MANAGES_THE_SOURCE_CODE`,
    `USERID_OF_PERSON_WHO_ADDED_CODE`,
    `USERID_OF_PERSON_WHO_UPDATED_CODE`,
    `PORTFOLIO_ELIGIBLE_INDICATOR`,
    `REINVEST_INDICATOR`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_isrc_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_isrc_a IS
'Bronze Pershing table bronze_pershing_isrc_a contains brokerage records sourced from landing_pershing.default.pershing_isrc_a for warehouse parity, validation, reconciliation, and downstream reporting.';
-- Databricks SQL for Pershing bronze model
-- Generated from sqlserver_brz_dbt/brz-pershing_mfds_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS bronze_pershing;
USE CATALOG bronze_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source model: BRONZE_PERSHING_MFDS_REC_A
-- Source table: landing_pershing.default.pershing_mfds_a
CREATE OR REPLACE TABLE bronze_pershing.default.bronze_pershing_mfds_a AS
SELECT
    `TRANSACTION_CODE`,
    `RECORD_ID`,
    `RECORD_ID_SEQUENCE_NUMBER`,
    `CUSIP_NUMBER`,
    `FUND_FAMILY_CODE`,
    `SECURITY_SYMBOL`,
    `DIVIDEND_REINVEST_INDICATOR`,
    `CAPITAL_GAIN_REINVEST_INDICATOR`,
    `FUNDSERV_INDICATOR`,
    `GRANDFATHER_INDICATOR`,
    `LOAD_NO_LOAD_INDICATOR`,
    `NETWORKING_INDICATOR`,
    `NO_TRANSACTION_FEE_ELIGIBILITY_INDICATOR`,
    `SHORT_SETTLEMENT_ELIGIBILITY_INDICATOR`,
    `SYSTEMATIC_REINVESTMENT_SYSTEM_ELIGIBILITY_INDICATOR`,
    `DIVIDEND_FREQUENCY`,
    `CLOSED_TO_BUYS_INDICATOR`,
    `CLOSED_TO_SELLS_INDICATOR`,
    `NEW_INVESTMENT_CLOSED_INDICATOR`,
    `SETTLE_PURCHASE_DAYS_NON_FUNDSERV`,
    `SETTLE_REDEMPTION_DAYS_NON_FUNDSERV`,
    `SETTLE_PURCHASE_DAYS_FUNDSERV`,
    `SETTLE_REDEMPTION_DAYS_FUNDSERV`,
    `EXCHANGE_CUT_OFF_TIME`,
    `PURCHASE_CUT_OFF_TIME`,
    `REDEMPTION_CUT_OFF_TIME`,
    `LAST_PRICE`,
    `LAST_PRICE_DATE`,
    `FUND_FAMILY_NAME`,
    `SHARE_CLASS`,
    `MUTUAL_FUND_DESCRIPTION_LINE_1`,
    `MUTUAL_FUND_DESCRIPTION_LINE_2`,
    `MUTUAL_FUND_DESCRIPTION_LINE_3`,
    `MUTUAL_FUND_DESCRIPTION_LINE_4`,
    `MUTUAL_FUND_DESCRIPTION_LINE_5`,
    `MUTUAL_FUND_DESCRIPTION_LINE_6`,
    `EXCHANGE_ELIGIBLE_INDICATOR`,
    `TRADE_STATUS`,
    `CUSTOMER_COMMENTS`,
    `OFFSHORE_INDICATOR`,
    `OFFSHORE_PROCESSING_INDICATOR`,
    `DEALER_AGREEMENT_REQUIRED_FOR_LOAD_TRADES`,
    `DEALER_AGREEMENT_REQUIRED_FOR_NO_LOAD_TRADES`,
    `DEALER_AGREEMENT_REQUIRED_FOR_LOAD_TRANSFERS`,
    `DEALER_AGREEMENT_REQUIRED_FOR_NO_LOAD_TRANFERS`,
    `AS_OF_INDICATOR`,
    `AS_OF_DAYS`,
    `POST_SETTLE_CANCEL_INDICATOR`,
    `POST_SETTLE_CANCEL_DAYS`,
    `POST_SETTLE_MAXIMUM_DOLLAR_AMOUNT`,
    `MINIMUM_INITIAL_PURCHASE_AMOUNT`,
    `MINIMUM_SUBSEQUENCE_PURCHASE_AMOUNT`,
    `MAXIMUM_INITIAL_PURCHASE_AMOUNT`,
    `MAXIMUM_SUBSEQUENCE_PURCHASE_AMOUNT`,
    `OMNIBUS_INDICATOR`,
    `TENDER_INDICATOR`,
    `FUNDVEST_200_ELIGIBLE`,
    `SURCHARGE`,
    `CURRENCY`,
    `RETIREMENT_PLAN_NETWORK_RPN_ELIGIBLE_INDICATOR`,
    `TRADING_RESTRICTED_BY_BOOKING_ENTITIES`,
    `BNY_MELLON_BNYM`,
    `PERSHING_LLC_PLLC`,
    `PERSHING_AUSTRALIA_PSAL`,
    `PERSHING_CANADA_PSCL`,
    `PERSHING_LONDON_PSLL`,
    `FUND_SHARE_CLASS`,
    `_12B_1_INDICATOR`,
    `DATE_OF_DATA`,
    `YEARMONTH`,
    current_timestamp() AS `LOADED_AT`
FROM landing_pershing.default.pershing_mfds_a;

COMMENT ON TABLE bronze_pershing.default.bronze_pershing_mfds_a IS
'Bronze Pershing table bronze_pershing_mfds_a contains security, fund, pricing, income, and product reference records sourced from landing_pershing.default.pershing_mfds_a for warehouse parity, validation, reconciliation, and downstream reporting.';
