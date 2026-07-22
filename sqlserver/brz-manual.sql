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
        ,CONVERT(DECIMAL(4,2),BILLING_RATE) AS BILLING_RATE
        ,PROCESS_START_DATE
        ,PROCESS_END_DATE
        ,FUNDED_START_DATE
        ,FUNDED_END_DATE
        ,CONVERT(DECIMAL(30,14),AVG_MONTHLY_EQUITY) AS AVG_MONTHLY_EQUITY
        ,DATE_OF_DATA
        ,YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."FILE_APEX_MONTHLY_ACCOUNTS"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data A
    
        WHERE A.LOADED_AT > (SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_apex_monthly_accounts")
    
)





SELECT * FROM bronze_data



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
        ,CONVERT(NUMERIC(30,25),CAST(RATE_PERCENT AS REAL)) AS RATE_PERCENT
        ,CASH_SETTLE_BALANCE
        ,CASE
            WHEN RTRIM(LTRIM(BILLING_RATE)) LIKE '%E%'
                THEN CONVERT(DECIMAL(30,25), CONVERT(FLOAT, BILLING_RATE))
            ELSE CONVERT(DECIMAL(30,25), BILLING_RATE)
        END AS BILLING_RATE
        ,PROCESS_START_DATE
        ,PROCESS_END_DATE
        ,DATE_OF_DATA
        ,YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."FILE_APEX_MONTHLY_CREDIT"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data A
    
        WHERE A.LOADED_AT > (SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_apex_monthly_credit")
    
)





SELECT * FROM bronze_data



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
        ,[DESCRIPTION]
        ,EXCH
        ,ORDERS
        ,FILLS
        ,CONVERT(NUMERIC(30,25),CAST(NOTIONAL AS REAL)) AS NOTIONAL
        ,QUANTITY
        ,CUSTOMERPASSTHRUFEE
        ,EXECUTION_FEE
        ,CONVERT(NUMERIC(30,25),CAST(CUSTOMER_PFOF AS REAL)) AS CUSTOMER_PFOF
        ,CUSTOMER_INDEX_SURCHARGE
        ,CONVERT(NUMERIC(30,25),CAST(CATHISTORICALFEE AS REAL)) AS CATHISTORICALFEE
        ,CONVERT(NUMERIC(30,25),CAST(CATONGOINGFEE AS REAL)) AS CATONGOINGFEE
        ,DATE_OF_DATA
        ,YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."FILE_APEX_MONTHLY_EXECUTION"
),

bronze_data AS (
    SELECT
        BILLINGPERIOD
        ,CLEARINGACCOUNT
        ,INSTRUMENTTYPE
        ,CUSTOMER_VENUE
        ,APEXROUTE
        ,[DESCRIPTION]
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data A
    
        WHERE A.LOADED_AT > (SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_apex_monthly_execution")
    
)





SELECT * FROM bronze_data



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
        ,CONVERT(DECIMAL(10,4), PRINCIPAL_BALANCE) AS PRINCIPAL_BALANCE
        ,CONVERT(DECIMAL(5,3), ACCRUED_INTEREST) AS ACCRUED_INTEREST
        ,CONVERT(NUMERIC(30,25),CAST(EFF AS REAL)) AS EFF
        ,CONVERT(NUMERIC(30,25),CAST(CORRESPONDENT_REBATE AS REAL)) AS CORRESPONDENT_REBATE
        ,DATE_OF_DATA
        ,YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."FILE_APEX_MONTHLY_FDIC"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data A
    
        WHERE A.LOADED_AT > (SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_apex_monthly_fdic")
    
)





SELECT * FROM bronze_data



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
        ,CONVERT(DECIMAL(4,2),BILLING_RATE)  AS BILLING_RATE
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
        ,CONVERT(DECIMAL(30,17),QUANTITY) AS QUANTITY
        ,CONVERT(DECIMAL(30,17),PRICE) AS PRICE
        ,GROSS_AMOUNT
        ,NET_AMOUNT
        ,FEES
        ,COMMISSION
        ,MARKDOWN
        ,MARKUP
        ,[BROKER]
        ,[ROUTE]
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
        "DQP_LANDING"."dbo"."FILE_APEX_MONTHLY_TRADES"
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
        ,[BROKER]
        ,[ROUTE]
        ,EXCHANGE_TYPE
        ,BROKER_CAPACITY
        ,ALGO
        ,EXTERNAL_ID
        ,CLIENT_ORDER_ID
        ,ORDER_ID
        ,EXECUTION_ID
        ,DATE_OF_DATA
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data A
    
        WHERE A.LOADED_AT > (SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_apex_monthly_trades")
    
)





SELECT * FROM bronze_data



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
        ,convert(decimal(16,2),AMT) as AMT
        ,PFGLAC
        ,BATCH
        ,DDSD1
        ,DDSD2
        ,LCMACC
        ,CIFNO
        ,BRANCH
        ,GLCOST
        ,GLPROD
        ,[GROUP]
        ,TRACCT
        ,YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."FILE_BFLCRTRAN"
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
        ,[GROUP]
        ,TRACCT
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_bflcrtran"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data



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
        "DQP_LANDING"."dbo"."FILE_BIU_ACTIVITY"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_biu_activity"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data



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
        ,DATETIME
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
        ,[FOREIGN]
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
        "DQP_LANDING"."dbo"."FILE_FEDLINK_INC"
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
        ,DATETIME
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
        ,[FOREIGN]
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_fedlink_inc"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data



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
        ,DATETIME
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
        ,[FOREIGN]
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
        "DQP_LANDING"."dbo"."FILE_FEDLINK_OUT"
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
        ,DATETIME
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
        ,[FOREIGN]
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_fedlink_out"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data



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
        "DQP_LANDING"."dbo"."FILE_RDCI"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_rdci"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data



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
        "DQP_LANDING"."dbo"."FILE_TRAILER_FEES"
),

bronze_data AS (
    SELECT
         PERSHING_ACCOUNT
        ,CUSIP
        ,ISIN
        ,AMOUNT
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_trailer_fees"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data



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
        "DQP_LANDING"."dbo"."FILE_TRAILER_FEES_ACCRUALS"
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
        ,TRY_CONVERT(DECIMAL(38, 10),REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(TRADE_DATE_QUANTITY)), ''), 'NULL'), ' - '), '"', ''), ',', '')) AS TRADE_DATE_QUANTITY
        ,TRY_CONVERT(DECIMAL(38, 10),REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(TRADE_DATE_MARKET_VALUE)), ''), 'NULL'), ' - '), '"', ''), ',', '')) AS TRADE_DATE_MARKET_VALUE
        ,TRY_CONVERT(DECIMAL(38, 10),REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(PERCENTAGE_OF_GRAND_TOTAL_TRADE_DATE_MARKET_VALUE)), ''), 'NULL'), ' - '), '"', ''), ',', '')) AS PERCENTAGE_OF_GRAND_TOTAL_TRADE_DATE_MARKET_VALUE
        ,TRY_CONVERT(DECIMAL(38, 10),REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(TOTAL_SETTLEMENT_DATE_MARKET_VALUE)), ''), 'NULL'), ' - '), '"', ''), ',', '')) AS TOTAL_SETTLEMENT_DATE_MARKET_VALUE
        ,TRY_CONVERT(DECIMAL(38, 10),REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(SETTLEMENT_DATE_QUANTITY)), ''), 'NULL'), ' - '), '"', ''), ',', '')) AS SETTLEMENT_DATE_QUANTITY
        ,ACCOUNT_STATUS
        ,TRY_CONVERT(DECIMAL(38, 10),REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(ACCRUED_AMOUNT)), ''), 'NULL'), ' - '), '"', ''), ',', '')) AS ACCRUED_AMOUNT
        ,TRY_CONVERT(DECIMAL(38, 10),REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(CLOSING_BALANCE)), ''), 'NULL'), ' - '), '"', ''), ',', '')) AS CLOSING_BALANCE
        ,REFERENCE
        ,TRY_CONVERT(DECIMAL(38, 10),REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(MANAGEMENT_FEES_PERCENTAGE)), ''), 'NULL'), ' - '), '"', ''), ',', '')) AS MANAGEMENT_FEES_PERCENTAGE
        ,TRY_CONVERT(DECIMAL(38, 10),REPLACE(REPLACE(NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(MANAGEMENT_FEES_AMOUNT)), ''), 'NULL'), ' - '), '"', ''), ',', '')) AS MANAGEMENT_FEES_AMOUNT
        ,FUND_FAMILY_NAME
        ,COST_CENTER
        ,TEAM
        ,TRY_CONVERT(DATE,NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(MONTH_YEAR)), ''), 'NULL'), ' - '),101) AS MONTH_YEAR
        ,YEARMONTH
        ,TRY_CONVERT(INT,NULLIF(NULLIF(NULLIF(LTRIM(RTRIM(GL_ACCOUNT)), ''), 'NULL'), ' - ')) AS GL_ACCOUNT
    FROM landing_data A
    
        WHERE A.LOADED_AT > (SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_file_trailer_fees_accruals" )
    
)





SELECT *, GETUTCDATE() AS LOADED_AT FROM BRONZE_DATA



