-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_apex_monthly_accounts
CREATE OR REPLACE TABLE bronze.default.bronze_file_apex_monthly_accounts AS
-- NAME: BRONZE_FILE_APEX_MONTHLY_ACCOUNTS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: October 07, 2025



WITH landing_data AS (
	SELECT
        CLIENT_CODE
        ,CORRESPONDENT_CODE
        ,ACCOUNT_GROUP_CODE
        ,ACCOUNT_NUMBER
        ,BILLING_CALENDAR_MONTH
        ,BILLING_CALENDAR_YEAR
        ,BILLING_TRANSACTION_ID
        ,BILLING_SECTION
        ,BILLING_CATEGORY
        ,BILLING_SUB_CATEGORY
        ,BILLING_NAME_RATE
        ,TRY_CAST(BILLING_RATE AS DECIMAL(4,2)) AS BILLING_RATE
        ,PROCESS_START_DATE
        ,PROCESS_END_DATE
        ,FUNDED_START_DATE
        ,FUNDED_END_DATE
        ,TRY_CAST(AVG_MONTHLY_EQUITY AS DECIMAL(30,14)) AS AVG_MONTHLY_EQUITY
        ,DATE_OF_DATA
		,YEARMONTH
		,LOADED_AT
	FROM
		manual.default.file_apex_monthly_accounts
),

bronze_data AS (
	SELECT
        CLIENT_CODE
        ,CORRESPONDENT_CODE
        ,ACCOUNT_GROUP_CODE
        ,ACCOUNT_NUMBER
        ,BILLING_CALENDAR_MONTH
        ,BILLING_CALENDAR_YEAR
        ,BILLING_TRANSACTION_ID
        ,BILLING_SECTION
        ,BILLING_CATEGORY
        ,BILLING_SUB_CATEGORY
        ,BILLING_NAME_RATE
        ,BILLING_RATE
        ,PROCESS_START_DATE
        ,PROCESS_END_DATE
        ,FUNDED_START_DATE
        ,FUNDED_END_DATE
        ,AVG_MONTHLY_EQUITY
        ,DATE_OF_DATA
		,YEARMONTH
		,current_timestamp() AS LOADED_AT
	FROM landing_data A
    
    
)





SELECT * FROM bronze_data;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_apex_monthly_credit
CREATE OR REPLACE TABLE bronze.default.bronze_file_apex_monthly_credit AS
-- NAME: BRONZE_FILE_APEX_MONTHLY_CREDIT
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: October 07, 2025



WITH landing_data AS (
	SELECT
        CLIENT_CODE
        ,CORRESPONDENT_CODE
        ,ACCOUNT_GROUP_CODE
        ,ACCOUNT_NUMBER
        ,BILLING_CALENDAR_MONTH
        ,BILLING_CALENDAR_YEAR
        ,BILLING_TRANSACTION_ID
        ,BILLING_SECTION
        ,BILLING_CATEGORY
        ,BILLING_SUB_CATEGORY
        ,BILLING_NAME_RATE
        ,TRY_CAST(TRY_CAST(RATE_PERCENT AS DOUBLE) AS NUMERIC(30,25)) AS RATE_PERCENT
        ,CASH_SETTLE_BALANCE
        ,CASE
            WHEN RTRIM(LTRIM(BILLING_RATE)) LIKE '%E%'
                THEN TRY_CAST(TRY_CAST(BILLING_RATE AS DOUBLE) AS DECIMAL(30,25))
    	    ELSE TRY_CAST(BILLING_RATE AS DECIMAL(30,25))
    	END AS BILLING_RATE
        ,PROCESS_START_DATE
        ,PROCESS_END_DATE
        ,DATE_OF_DATA
		,YEARMONTH
		,LOADED_AT
	FROM
		manual.default.file_apex_monthly_credit
),

bronze_data AS (
	SELECT
        CLIENT_CODE
        ,CORRESPONDENT_CODE
        ,ACCOUNT_GROUP_CODE
        ,ACCOUNT_NUMBER
        ,BILLING_CALENDAR_MONTH
        ,BILLING_CALENDAR_YEAR
        ,BILLING_TRANSACTION_ID
        ,BILLING_SECTION
        ,BILLING_CATEGORY
        ,BILLING_SUB_CATEGORY
        ,BILLING_NAME_RATE
        ,RATE_PERCENT
        ,CASH_SETTLE_BALANCE
        ,BILLING_RATE
        ,PROCESS_START_DATE
        ,PROCESS_END_DATE
        ,DATE_OF_DATA
		,YEARMONTH
		,current_timestamp() AS LOADED_AT
	FROM landing_data A
    
    
)





SELECT * FROM bronze_data;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_apex_monthly_execution
CREATE OR REPLACE TABLE bronze.default.bronze_file_apex_monthly_execution AS
-- NAME: BRONZE_FILE_APEX_MONTHLY_EXECUTION
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: October 08, 2025



WITH landing_data AS (
	SELECT
        BILLINGPERIOD
        ,CLEARINGACCOUNT
        ,INSTRUMENTTYPE
        ,CUSTOMER_VENUE
        ,APEXROUTE
        ,`DESCRIPTION`
        ,EXCH
        ,ORDERS
        ,FILLS
        ,TRY_CAST(TRY_CAST(NOTIONAL AS DOUBLE) AS NUMERIC(30,25)) AS NOTIONAL
        ,QUANTITY
        ,CUSTOMERPASSTHRUFEE
        ,EXECUTION_FEE
        ,TRY_CAST(TRY_CAST(CUSTOMER_PFOF AS DOUBLE) AS NUMERIC(30,25)) AS CUSTOMER_PFOF
        ,CUSTOMER_INDEX_SURCHARGE
        ,TRY_CAST(TRY_CAST(CATHISTORICALFEE AS DOUBLE) AS NUMERIC(30,25)) AS CATHISTORICALFEE
        ,TRY_CAST(TRY_CAST(CATONGOINGFEE AS DOUBLE) AS NUMERIC(30,25)) AS CATONGOINGFEE
        ,DATE_OF_DATA
		,YEARMONTH
		,LOADED_AT
	FROM
		manual.default.file_apex_monthly_execution
),

bronze_data AS (
	SELECT
        BILLINGPERIOD
        ,CLEARINGACCOUNT
        ,INSTRUMENTTYPE
        ,CUSTOMER_VENUE
        ,APEXROUTE
        ,`DESCRIPTION`
        ,EXCH
        ,ORDERS
        ,FILLS
        ,NOTIONAL
        ,QUANTITY
        ,CUSTOMERPASSTHRUFEE
        ,EXECUTION_FEE
        ,CUSTOMER_PFOF
        ,CUSTOMER_INDEX_SURCHARGE
        ,CATHISTORICALFEE
        ,CATONGOINGFEE
        ,DATE_OF_DATA
		,YEARMONTH
		,current_timestamp() AS LOADED_AT
	FROM landing_data A
    
    
)





SELECT * FROM bronze_data;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_apex_monthly_fdic
CREATE OR REPLACE TABLE bronze.default.bronze_file_apex_monthly_fdic AS
-- NAME: BRONZE_FILE_APEX_MONTHLY_FDIC
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: October 08, 2025



WITH landing_data AS (
	SELECT
        CORRESPONDENT_CODE
        ,ACCOUNT_NUMBER
        ,ACCOUNT_ID
        ,FDIC_ASSET_SYMBOL
        ,BALANCE_DATE
        ,TRY_CAST(PRINCIPAL_BALANCE AS DECIMAL(10,4)) AS PRINCIPAL_BALANCE
        ,TRY_CAST(ACCRUED_INTEREST AS DECIMAL(5,3)) AS ACCRUED_INTEREST
        ,TRY_CAST(TRY_CAST(EFF AS DOUBLE) AS NUMERIC(30,25)) AS EFF
        ,TRY_CAST(TRY_CAST(CORRESPONDENT_REBATE AS DOUBLE) AS NUMERIC(30,25)) AS CORRESPONDENT_REBATE
        ,DATE_OF_DATA
		,YEARMONTH
		,LOADED_AT
	FROM
		manual.default.file_apex_monthly_fdic
),

bronze_data AS (
	SELECT
        CORRESPONDENT_CODE
        ,ACCOUNT_NUMBER
        ,ACCOUNT_ID
        ,FDIC_ASSET_SYMBOL
        ,BALANCE_DATE
        ,PRINCIPAL_BALANCE
        ,ACCRUED_INTEREST
        ,EFF
        ,CORRESPONDENT_REBATE
        ,DATE_OF_DATA
		,YEARMONTH
		,current_timestamp() AS LOADED_AT
	FROM landing_data A
    
    
)





SELECT * FROM bronze_data;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_apex_monthly_trades
CREATE OR REPLACE TABLE bronze.default.bronze_file_apex_monthly_trades AS
-- NAME: BRONZE_FILE_APEX_MONTHLY_TRADES
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: October 07, 2025



WITH landing_data AS (
	SELECT
        CLIENT_CODE
        ,CORRESPONDENT_CODE
        ,ACCOUNT_GROUP_CODE
        ,ACCOUNT_NUMBER
        ,BILLING_CALENDAR_MONTH
        ,BILLING_CALENDAR_YEAR
        ,BILLING_TRANSACTION_ID
        ,BILLING_SECTION
        ,BILLING_CATEGORY
        ,BILLING_SUB_CATEGORY
        ,BILLING_NAME_RATE
        ,TRY_CAST(BILLING_RATE AS DECIMAL(4,2))  AS BILLING_RATE
        ,FUNDING_TYPE
        ,ACTIVITY_DATE
        ,PROCESS_DATE
        ,SETTLE_DATE
        ,ACTIVITY_ID
        ,SYMBOL
        ,CUSIP
        ,ACTIVITY_DESCRIPTION
        ,SIDE
        ,EXCHANGE
        ,ASSET_TYPE
        ,INSTRUMENT_TYPE
        ,INSTRUMENT_SUBTYPE
        ,REGION_CODE
        ,CURRENCY_CODE
        ,TRY_CAST(QUANTITY AS DECIMAL(30,17)) AS QUANTITY
        ,TRY_CAST(PRICE AS DECIMAL(30,17)) AS PRICE
        ,GROSS_AMOUNT
        ,NET_AMOUNT
        ,FEES
        ,COMMISSION
        ,MARKDOWN
        ,MARKUP
        ,`BROKER`
        ,`ROUTE`
        ,EXCHANGE_TYPE
        ,BROKER_CAPACITY
        ,ALGO
        ,EXTERNAL_ID
        ,CLIENT_ORDER_ID
        ,ORDER_ID
        ,EXECUTION_ID
        ,DATE_OF_DATA
		,YEARMONTH
		,LOADED_AT
	FROM
		manual.default.file_apex_monthly_trades
),

bronze_data AS (
	SELECT
        CLIENT_CODE
        ,CORRESPONDENT_CODE
        ,ACCOUNT_GROUP_CODE
        ,ACCOUNT_NUMBER
        ,BILLING_CALENDAR_MONTH
        ,BILLING_CALENDAR_YEAR
        ,BILLING_TRANSACTION_ID
        ,BILLING_SECTION
        ,BILLING_CATEGORY
        ,BILLING_SUB_CATEGORY
        ,BILLING_NAME_RATE
        ,BILLING_RATE
        ,FUNDING_TYPE
        ,ACTIVITY_DATE
        ,PROCESS_DATE
        ,SETTLE_DATE
        ,ACTIVITY_ID
        ,SYMBOL
        ,CUSIP
        ,ACTIVITY_DESCRIPTION
        ,SIDE
        ,EXCHANGE
        ,ASSET_TYPE
        ,INSTRUMENT_TYPE
        ,INSTRUMENT_SUBTYPE
        ,REGION_CODE
        ,CURRENCY_CODE
        ,QUANTITY
        ,PRICE
        ,GROSS_AMOUNT
        ,NET_AMOUNT
        ,FEES
        ,COMMISSION
        ,MARKDOWN
        ,MARKUP
        ,`BROKER`
        ,`ROUTE`
        ,EXCHANGE_TYPE
        ,BROKER_CAPACITY
        ,ALGO
        ,EXTERNAL_ID
        ,CLIENT_ORDER_ID
        ,ORDER_ID
        ,EXECUTION_ID
        ,DATE_OF_DATA
		,YEARMONTH
		,current_timestamp() AS LOADED_AT
	FROM landing_data A
    
    
)





SELECT * FROM bronze_data;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_bflcrtran
CREATE OR REPLACE TABLE bronze.default.bronze_file_bflcrtran AS
-- NAME: BRONZE_FILE_BFLCRTRAN
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
	SELECT
		 TREFF6
		,TRDAT6
		,TRANCD
		,DORC
		,TRY_CAST(AMT AS decimal(16,2)) as AMT
		,PFGLAC
		,BATCH
		,DDSD1
		,DDSD2
		,LCMACC
		,CIFNO
		,BRANCH
		,GLCOST
		,GLPROD
		,`GROUP`
		,TRACCT
		,YEARMONTH
		,LOADED_AT
	FROM
		manual.default.file_bflcrtran
),

bronze_data AS (
	SELECT
		TREFF6
		,TRDAT6
		,TRANCD
		,DORC
    	,AMT
    	,PFGLAC
		,BATCH
		,DDSD1
		,DDSD2
		,LCMACC
		,CIFNO
		,BRANCH
		,GLCOST
		,GLPROD
		,`GROUP`
		,TRACCT
		,YEARMONTH
		,current_timestamp() AS LOADED_AT
	FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_biu_activity
CREATE OR REPLACE TABLE bronze.default.bronze_file_biu_activity AS
-- NAME: BRONZE_FILE_BIU_ACTIVITY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024




WITH landing_data AS (
	SELECT
		 ACCOUNT_NUMBER
		,END_AUMS
		,MGMT_FEES
		,IB_FEES
		,NET_MGMT_FEE
		,SUB_ADVISOR_FEE
		,OUTSTANDING
		,YEARMONTH
		,LOADED_AT
	FROM
		manual.default.file_biu_activity
),

bronze_data AS (
	SELECT
	     ACCOUNT_NUMBER
		,END_AUMS
		,MGMT_FEES
		,IB_FEES
		,NET_MGMT_FEE
		,SUB_ADVISOR_FEE
		,OUTSTANDING
		,YEARMONTH
	    ,current_timestamp() AS LOADED_AT
	FROM landing_data
	
    
)





SELECT * FROM bronze_data;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_fedlink_inc
CREATE OR REPLACE TABLE bronze.default.bronze_file_fedlink_inc AS
-- NAME: BRONZE_FILE_FEDLINK_INC
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024





WITH landing_data AS (
    SELECT
        'INCOMING' as PAY_VIA
        ,TYPE
        ,TRACEKEY
        ,REF
        ,ACCOUNT
        ,NAME
        ,PRODCODE
        ,SUBTYPE
        ,LOADDATE
        ,TIMESTAMP
        ,SENDERABA
        ,SENDERNAME
        ,RECEIVERABA
        ,RECEIVERNAME
        ,ORG
        ,ORGCDE
        ,ORGACC
        ,ORG1
        ,ORG2
        ,ORG3
        ,ORGCTRY
        ,OGB
        ,OGBCDE
        ,OGBACC
        ,OGB1
        ,OGB2
        ,OGB3
        ,OGBCTRY
        ,IBK
        ,IBKCDE
        ,IBKACC
        ,IBK1
        ,IBK2
        ,IBK3
        ,IBKCTRY
        ,BBK
        ,BBKCDE
        ,BBKACC
        ,BBK1
        ,BBK2
        ,BBK3
        ,BBKCTRY
        ,BNF
        ,BNFCDE
        ,BNFACC
        ,BNF1
        ,BNF2
        ,BNF3
        ,BNFCTRY
        ,OBI
        ,OBI1
        ,OBI2
        ,OBI3
        ,BBI
        ,BBI1
        ,BBI2
        ,BBI3
        ,BBI4
        ,BBI5
        ,INS
        ,INSCDE
        ,INSACC
        ,INS1
        ,INS2
        ,INS3
        ,INSCTRY
        ,VERBIAGE
        ,ORIGREF
        ,SENDERREF
        ,AMOUNT
        ,FEE
        ,DEDUCT_FEE
        ,DEDUCT_FEE1
        ,CHARGEBNF
        ,OFFICER
        ,CENTER
        ,`FOREIGN`
        ,BANKNUMBER
        ,COMMENT
        ,OFFSETACC
        ,PROCESSOR
        ,CURRCODE
        ,CURRAMOUNT
        ,OMAD
        ,SOURCE
        ,ORGCENTER
        ,FXPROVIDER
        ,CRDCURRCODE
        ,CRDCURRAMT
        ,FXRATE
        ,FXCUSTRATE
        ,FXVALDATE
        ,FXCONTRACT
        ,SOURCEPREP
        ,SOURCEAUTH1
        ,SOURCEAUTH2
        ,EXP_96
        ,EXP_97
        ,EXP_98
        ,EXP_99
        ,EXP_100
        ,EXP_101
        ,EXPDATE
        ,LOADTIME
        ,PREPARER
        ,PREPDATE
        ,PREPTIME
        ,AUTHOR1
        ,AUTHOR2
        ,AUTHDATE
        ,AUTHTIME
        ,COR
        ,CORCDE
        ,CORACC
        ,COR1
        ,COR2
        ,COR3
        ,CORCTRY
        ,MTMSG
        ,RFB
        ,PRODCODE1
        ,LOCALINSCD
        ,OFACAUTH
        ,OFACCOMM
        ,YEARMONTH
        ,LOADED_AT
    FROM
	    manual.default.file_fedlink_inc
),

bronze_data AS (
    SELECT
        PAY_VIA
        ,TYPE
        ,TRACEKEY
        ,REF
        ,ACCOUNT
        ,NAME
        ,PRODCODE
        ,SUBTYPE
        ,LOADDATE
        ,TIMESTAMP
        ,SENDERABA
        ,SENDERNAME
        ,RECEIVERABA
        ,RECEIVERNAME
        ,ORG
        ,ORGCDE
        ,ORGACC
        ,ORG1
        ,ORG2
        ,ORG3
        ,ORGCTRY
        ,OGB
        ,OGBCDE
        ,OGBACC
        ,OGB1
        ,OGB2
        ,OGB3
        ,OGBCTRY
        ,IBK
        ,IBKCDE
        ,IBKACC
        ,IBK1
        ,IBK2
        ,IBK3
        ,IBKCTRY
        ,BBK
        ,BBKCDE
        ,BBKACC
        ,BBK1
        ,BBK2
        ,BBK3
        ,BBKCTRY
        ,BNF
        ,BNFCDE
        ,BNFACC
        ,BNF1
        ,BNF2
        ,BNF3
        ,BNFCTRY
        ,OBI
        ,OBI1
        ,OBI2
        ,OBI3
        ,BBI
        ,BBI1
        ,BBI2
        ,BBI3
        ,BBI4
        ,BBI5
        ,INS
        ,INSCDE
        ,INSACC
        ,INS1
        ,INS2
        ,INS3
        ,INSCTRY
        ,VERBIAGE
        ,ORIGREF
        ,SENDERREF
        ,AMOUNT
        ,FEE
        ,DEDUCT_FEE
        ,DEDUCT_FEE1
        ,CHARGEBNF
        ,OFFICER
        ,CENTER
        ,`FOREIGN`
        ,BANKNUMBER
        ,COMMENT
        ,OFFSETACC
        ,PROCESSOR
        ,CURRCODE
        ,CURRAMOUNT
        ,OMAD
        ,SOURCE
        ,ORGCENTER
        ,FXPROVIDER
        ,CRDCURRCODE
        ,CRDCURRAMT
        ,FXRATE
        ,FXCUSTRATE
        ,FXVALDATE
        ,FXCONTRACT
        ,SOURCEPREP
        ,SOURCEAUTH1
        ,SOURCEAUTH2
        ,EXP_96
        ,EXP_97
        ,EXP_98
        ,EXP_99
        ,EXP_100
        ,EXP_101
        ,EXPDATE
        ,LOADTIME
        ,PREPARER
        ,PREPDATE
        ,PREPTIME
        ,AUTHOR1
        ,AUTHOR2
        ,AUTHDATE
        ,AUTHTIME
        ,COR
        ,CORCDE
        ,CORACC
        ,COR1
        ,COR2
        ,COR3
        ,CORCTRY
        ,MTMSG
        ,RFB
        ,PRODCODE1
        ,LOCALINSCD
        ,OFACAUTH
        ,OFACCOMM
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_fedlink_out
CREATE OR REPLACE TABLE bronze.default.bronze_file_fedlink_out AS
-- NAME: BRONZE_FILE_FEDLINK_OUT
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024





WITH landing_data AS (
    SELECT
        'OUTGOING' as PAY_VIA
        ,TYPE
        ,TRACEKEY
        ,REF
        ,ACCOUNT
        ,NAME
        ,PRODCODE
        ,SUBTYPE
        ,LOADDATE
        ,TIMESTAMP
        ,SENDERABA
        ,SENDERNAME
        ,RECEIVERABA
        ,RECEIVERNAME
        ,ORG
        ,ORGCDE
        ,ORGACC
        ,ORG1
        ,ORG2
        ,ORG3
        ,ORGCTRY
        ,OGB
        ,OGBCDE
        ,OGBACC
        ,OGB1
        ,OGB2
        ,OGB3
        ,OGBCTRY
        ,IBK
        ,IBKCDE
        ,IBKACC
        ,IBK1
        ,IBK2
        ,IBK3
        ,IBKCTRY
        ,BBK
        ,BBKCDE
        ,BBKACC
        ,BBK1
        ,BBK2
        ,BBK3
        ,BBKCTRY
        ,BNF
        ,BNFCDE
        ,BNFACC
        ,BNF1
        ,BNF2
        ,BNF3
        ,BNFCTRY
        ,OBI
        ,OBI1
        ,OBI2
        ,OBI3
        ,BBI
        ,BBI1
        ,BBI2
        ,BBI3
        ,BBI4
        ,BBI5
        ,INS
        ,INSCDE
        ,INSACC
        ,INS1
        ,INS2
        ,INS3
        ,INSCTRY
        ,VERBIAGE
        ,ORIGREF
        ,SENDERREF
        ,AMOUNT
        ,FEE
        ,DEDUCT_FEE
        ,DEDUCT_FEE1
        ,CHARGEBNF
        ,OFFICER
        ,CENTER
        ,`FOREIGN`
        ,BANKNUMBER
        ,COMMENT
        ,OFFSETACC
        ,PROCESSOR
        ,CURRCODE
        ,CURRAMOUNT
        ,OMAD
        ,SOURCE
        ,ORGCENTER
        ,FXPROVIDER
        ,CRDCURRCODE
        ,CRDCURRAMT
        ,FXRATE
        ,FXCUSTRATE
        ,FXVALDATE
        ,FXCONTRACT
        ,SOURCEPREP
        ,SOURCEAUTH1
        ,SOURCEAUTH2
        ,EXP_96
        ,EXP_97
        ,EXP_98
        ,EXP_99
        ,EXP_100
        ,EXP_101
        ,EXPDATE
        ,LOADTIME
        ,PREPARER
        ,PREPDATE
        ,PREPTIME
        ,AUTHOR1
        ,AUTHOR2
        ,AUTHDATE
        ,AUTHTIME
        ,COR
        ,CORCDE
        ,CORACC
        ,COR1
        ,COR2
        ,COR3
        ,CORCTRY
        ,MTMSG
        ,RFB
        ,PRODCODE1
        ,LOCALINSCD
        ,OFACAUTH
        ,OFACCOMM
        ,YEARMONTH
        ,LOADED_AT
    FROM
    	manual.default.file_fedlink_out
),

bronze_data AS (
    SELECT
        PAY_VIA
        ,TYPE
        ,TRACEKEY
        ,REF
        ,ACCOUNT
        ,NAME
        ,PRODCODE
        ,SUBTYPE
        ,LOADDATE
        ,TIMESTAMP
        ,SENDERABA
        ,SENDERNAME
        ,RECEIVERABA
        ,RECEIVERNAME
        ,ORG
        ,ORGCDE
        ,ORGACC
        ,ORG1
        ,ORG2
        ,ORG3
        ,ORGCTRY
        ,OGB
        ,OGBCDE
        ,OGBACC
        ,OGB1
        ,OGB2
        ,OGB3
        ,OGBCTRY
        ,IBK
        ,IBKCDE
        ,IBKACC
        ,IBK1
        ,IBK2
        ,IBK3
        ,IBKCTRY
        ,BBK
        ,BBKCDE
        ,BBKACC
        ,BBK1
        ,BBK2
        ,BBK3
        ,BBKCTRY
        ,BNF
        ,BNFCDE
        ,BNFACC
        ,BNF1
        ,BNF2
        ,BNF3
        ,BNFCTRY
        ,OBI
        ,OBI1
        ,OBI2
        ,OBI3
        ,BBI
        ,BBI1
        ,BBI2
        ,BBI3
        ,BBI4
        ,BBI5
        ,INS
        ,INSCDE
        ,INSACC
        ,INS1
        ,INS2
        ,INS3
        ,INSCTRY
        ,VERBIAGE
        ,ORIGREF
        ,SENDERREF
        ,AMOUNT
        ,FEE
        ,DEDUCT_FEE
        ,DEDUCT_FEE1
        ,CHARGEBNF
        ,OFFICER
        ,CENTER
        ,`FOREIGN`
        ,BANKNUMBER
        ,COMMENT
        ,OFFSETACC
        ,PROCESSOR
        ,CURRCODE
        ,CURRAMOUNT
        ,OMAD
        ,SOURCE
        ,ORGCENTER
        ,FXPROVIDER
        ,CRDCURRCODE
        ,CRDCURRAMT
        ,FXRATE
        ,FXCUSTRATE
        ,FXVALDATE
        ,FXCONTRACT
        ,SOURCEPREP
        ,SOURCEAUTH1
        ,SOURCEAUTH2
        ,EXP_96
        ,EXP_97
        ,EXP_98
        ,EXP_99
        ,EXP_100
        ,EXP_101
        ,EXPDATE
        ,LOADTIME
        ,PREPARER
        ,PREPDATE
        ,PREPTIME
        ,AUTHOR1
        ,AUTHOR2
        ,AUTHDATE
        ,AUTHTIME
        ,COR
        ,CORCDE
        ,CORACC
        ,COR1
        ,COR2
        ,COR3
        ,CORCTRY
        ,MTMSG
        ,RFB
        ,PRODCODE1
        ,LOCALINSCD
        ,OFACAUTH
        ,OFACCOMM
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_rdci
CREATE OR REPLACE TABLE bronze.default.bronze_file_rdci AS
-- NAME: BRONZE_FILE_RDCI
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024




WITH landing_data AS (
    SELECT
         INSTRUMENT_ID
        ,ADJUSTED_AX_INTEREST
        ,ADJUSTED_FTP_AMOUNT
        ,NET_INTEREST_INCOME
        ,NON_INTEREST_INCOME
        ,TOTAL_REVENUE
        ,TOTAL_NONINTEREST_EXPENSE
        ,YEARMONTH
        ,LOADED_AT
    FROM
    	manual.default.file_rdci
),

bronze_data AS (
    SELECT
         INSTRUMENT_ID
        ,ADJUSTED_AX_INTEREST
        ,ADJUSTED_FTP_AMOUNT
        ,NET_INTEREST_INCOME
        ,NON_INTEREST_INCOME
        ,TOTAL_REVENUE
        ,TOTAL_NONINTEREST_EXPENSE
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_trailer_fees
CREATE OR REPLACE TABLE bronze.default.bronze_file_trailer_fees AS
-- NAME: BRONZE_FILE_TRAILER_FEES
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024




WITH landing_data AS (
    SELECT
        PERSHING_ACCOUNT
        ,CUSIP
        ,ISIN
        ,AMOUNT
        ,YEARMONTH
        ,LOADED_AT
    FROM
	    manual.default.file_trailer_fees
),

bronze_data AS (
    SELECT
         PERSHING_ACCOUNT
        ,CUSIP
        ,ISIN
        ,AMOUNT
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-manual.dbx.sql
-- Source model: bronze_file_trailer_fees_accruals
CREATE OR REPLACE TABLE bronze.default.bronze_file_trailer_fees_accruals AS
-- NAME: BRONZE_FILE_TRAILER_FEES_ACCRUALS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: MARCH 05, 2026



WITH landing_data AS (
    SELECT
	    ACCOUNT_NO
	    ,SHORT_NAME
	    ,OFFICE
	    ,IP
	    ,SYMBOL
	    ,CUSIP
	    ,SEC_REGISTERED
	    ,SECURITY_DESCRIPTION
	    ,TRADE_DATE_QUANTITY
	    ,TRADE_DATE_MARKET_VALUE
	    ,PERCENTAGE_OF_GRAND_TOTAL_TRADE_DATE_MARKET_VALUE
	    ,TOTAL_SETTLEMENT_DATE_MARKET_VALUE
	    ,SETTLEMENT_DATE_QUANTITY
	    ,ACCOUNT_STATUS
	    ,ACCRUED_AMOUNT
	    ,CLOSING_BALANCE
	    ,REFERENCE
	    ,MANAGEMENT_FEES_PERCENTAGE
	    ,MANAGEMENT_FEES_AMOUNT
	    ,FUND_FAMILY_NAME
	    ,COST_CENTER
	    ,TEAM
	    ,MONTH_YEAR
	    ,GL_ACCOUNT
	    ,YEARMONTH
	    ,LOADED_AT
    FROM
        manual.default.file_trailer_fees_accruals
),

bronze_data AS (
    SELECT
        ACCOUNT_NO
        ,SHORT_NAME
        ,OFFICE
        ,IP
        ,SYMBOL
        ,CUSIP
        ,SEC_REGISTERED
        ,SECURITY_DESCRIPTION
        ,try_cast(REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(TRADE_DATE_QUANTITY)), ''), 'NULL'), ' - '), '"', ''), ',', '') AS DECIMAL(38, 10)) AS TRADE_DATE_QUANTITY
        ,try_cast(REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(TRADE_DATE_MARKET_VALUE)), ''), 'NULL'), ' - '), '"', ''), ',', '') AS DECIMAL(38, 10)) AS TRADE_DATE_MARKET_VALUE
        ,try_cast(REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(PERCENTAGE_OF_GRAND_TOTAL_TRADE_DATE_MARKET_VALUE)), ''), 'NULL'), ' - '), '"', ''), ',', '') AS DECIMAL(38, 10)) AS PERCENTAGE_OF_GRAND_TOTAL_TRADE_DATE_MARKET_VALUE
        ,try_cast(REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(TOTAL_SETTLEMENT_DATE_MARKET_VALUE)), ''), 'NULL'), ' - '), '"', ''), ',', '') AS DECIMAL(38, 10)) AS TOTAL_SETTLEMENT_DATE_MARKET_VALUE
        ,try_cast(REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(SETTLEMENT_DATE_QUANTITY)), ''), 'NULL'), ' - '), '"', ''), ',', '') AS DECIMAL(38, 10)) AS SETTLEMENT_DATE_QUANTITY
        ,ACCOUNT_STATUS
        ,try_cast(REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(ACCRUED_AMOUNT)), ''), 'NULL'), ' - '), '"', ''), ',', '') AS DECIMAL(38, 10)) AS ACCRUED_AMOUNT
        ,try_cast(REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(CLOSING_BALANCE)), ''), 'NULL'), ' - '), '"', ''), ',', '') AS DECIMAL(38, 10)) AS CLOSING_BALANCE
        ,REFERENCE
        ,try_cast(REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(MANAGEMENT_FEES_PERCENTAGE)), ''), 'NULL'), ' - '), '"', ''), ',', '') AS DECIMAL(38, 10)) AS MANAGEMENT_FEES_PERCENTAGE
        ,try_cast(REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(MANAGEMENT_FEES_AMOUNT)), ''), 'NULL'), ' - '), '"', ''), ',', '') AS DECIMAL(38, 10)) AS MANAGEMENT_FEES_AMOUNT
        ,FUND_FAMILY_NAME
        ,COST_CENTER
        ,TEAM
        ,to_date(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(MONTH_YEAR)), ''), 'NULL'), ' - '), 'MM/dd/yyyy') AS MONTH_YEAR
        ,YEARMONTH
        ,try_cast(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(GL_ACCOUNT)), ''), 'NULL'), ' - ') AS INT) AS GL_ACCOUNT
    FROM landing_data A
    
    
)





SELECT *, current_timestamp() AS LOADED_AT FROM BRONZE_DATA;
