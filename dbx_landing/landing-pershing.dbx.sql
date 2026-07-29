
-- Databricks SQL for source: pershingdataprod
-- Generated from sqlserver_desc/landing-pershingdataprod_caps_hist-desc.txt

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHINGDATAPROD_CAPS_HIST"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershingdataprod_caps_hist (
    `id` INT,
    `IBD_1` STRING,
    `RECORD_ID_1` STRING,
    `TRADE_DATE` STRING,
    `TRADE_REFERENCE_NUMBER` STRING,
    `PERSHING_OFFICE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `ACCOUNT_NAME` STRING,
    `BUY_SELL_INDICATOR` STRING,
    `CANCEL_INDICATOR` STRING,
    `CAPS_SOURCE` STRING,
    `TRADE_QUANTITY` DECIMAL(38,10),
    `PRICE` DECIMAL(38,10),
    `PRODUCT_CODE` STRING,
    `CUSIP_NUMBER_OF_SECURITY_TRADED` STRING,
    `ACCOUNT_SHORT_NAME` STRING,
    `ORDER_TYPE` STRING,
    `MISCELLANEOUS_FEE` DECIMAL(38,10),
    `NOT_USED_1` STRING,
    `IBD_2` STRING,
    `RECORD_ID_2` STRING,
    `MARKET_CODE` STRING,
    `BLOTTER_CODE` STRING,
    `SECURITY_TYPE` STRING,
    `STOCK_SYMBOL` STRING,
    `SECURITY_DESCRIPTION` STRING,
    `CENTS_PER_SHARE` DECIMAL(38,10),
    `DISCOUNT_PERCENT` DECIMAL(38,10),
    `PAYCODE` STRING,
    `MASTER_CLIENT_MNEMONIC` STRING,
    `INSTITUTIONAL_RETAIL_INDICATOR` STRING,
    `STATE_CODE` STRING,
    `COMMISSION_INDICATOR` STRING,
    `FIRM_TRADING_ACCOUNT` STRING,
    `POSTED_DATE` STRING,
    `SETTLEMENT_DATE` STRING,
    `NOT_USED_2` STRING,
    `RECYCLE_INDICATOR` STRING,
    `IBD_3` STRING,
    `RECORD_ID_3` STRING,
    `AS_OF_TRADE_INDICATOR` STRING,
    `DISTRIBUTION_INDICATOR` STRING,
    `EXPLODE_INDICATOR` STRING,
    `REVENUE_TYPE` STRING,
    `IP` STRING,
    `IP_CAPS_REVENUE_CENTER` STRING,
    `IP_CAPS_OFFICE_NUMBER` STRING,
    `IP_SPLIT_PERCENT` DECIMAL(38,10),
    `TOTAL_AMT_OF_REV_GEN_BY_TR_AND_CRED_TO_IP` DECIMAL(38,10),
    `PERSHING_CHARGE` DECIMAL(38,10),
    `FROM_IP_NUMBER` STRING,
    `CAPS_REV_CENTER_ASSOC_W_THE_FROM_IP` STRING,
    `CAPS_OFFICE_NO_ASSOC_W_THE_FROM_IP` STRING,
    `TOTAL_ORDER_COMMISSION` DECIMAL(38,10),
    `SPREAD_STRADDLE` STRING,
    `CORRECTION_CODE` STRING,
    `SECURITY_MODIFIER` STRING,
    `SECURITY_CALCULATION_CODE` STRING,
    `PRINCIPAL` DECIMAL(38,10),
    `CRD_NUMBER` STRING,
    `SOURCE_OF_INPUT` STRING,
    `FOR_PERS_INT_USE_ONLY_3` STRING,
    `SERVICE_CHARGE_OTHER_FEE` DECIMAL(38,10),
    `IBD_4` STRING,
    `RECORD_ID_4` STRING,
    `CURRENCY_CODE` STRING,
    `CURRENCY_AMOUNT_OF_REVENUE` DECIMAL(38,10),
    `FOREIGN_EXCHANGE_RATE` DECIMAL(38,10),
    `CURRENCY_MULTI_DIV_INDICATOR` STRING,
    `IBD_SETTLEMENT_FEE` DECIMAL(38,10),
    `CUSTOMER_SETTLEMENT_FEE` DECIMAL(38,10),
    `GLOSS_REFERENCE_NUMBER` STRING,
    `CURRENCY_AMOUNT_OF_PERSHING_CHARGE` DECIMAL(38,10),
    `NOT_USED_4` STRING,
    `IBD_5` STRING,
    `RECORD_ID_5` STRING,
    `OPTION_ROOT_ID` STRING,
    `EXPIRATION_DATE` STRING,
    `CALL_PUT_INDICATOR` STRING,
    `STRIKE_PRICE` DECIMAL(38,10),
    `MASTER_CLIENT_NAME` STRING,
    `FOR_PERS_INT_USE_ONLY_5` STRING,
    `PERS_INT_ORDER_REF_NO` STRING,
    `NOT_USED_5` STRING,
    `AS_OF_DATE` DATE,
    `IMPORTED_DATE` TIMESTAMP,
    `LOADED_AT` TIMESTAMP,
    `YEARMONTH` INT
);
COMMENT ON TABLE landing_pershing.default.pershingdataprod_caps_hist IS
'The table contains Pershing CAPS historical trade and commission activity, including trade references, account identifiers, security details, quantities, prices, revenue amounts, fees, currency values, and settlement attributes. It supports landing-layer validation for trading activity, revenue allocation, commission review, and downstream Pershing reporting.';

TRUNCATE TABLE landing_pershing.default.pershingdataprod_caps_hist;

INSERT INTO landing_pershing.default.pershingdataprod_caps_hist (
    `id`, `IBD_1`, `RECORD_ID_1`, `TRADE_DATE`, `TRADE_REFERENCE_NUMBER`, `PERSHING_OFFICE_NUMBER`,
    `ACCOUNT_NUMBER`, `ACCOUNT_NAME`, `BUY_SELL_INDICATOR`, `CANCEL_INDICATOR`, `CAPS_SOURCE`, `TRADE_QUANTITY`,
    `PRICE`, `PRODUCT_CODE`, `CUSIP_NUMBER_OF_SECURITY_TRADED`, `ACCOUNT_SHORT_NAME`, `ORDER_TYPE`, `MISCELLANEOUS_FEE`,
    `NOT_USED_1`, `IBD_2`, `RECORD_ID_2`, `MARKET_CODE`, `BLOTTER_CODE`, `SECURITY_TYPE`,
    `STOCK_SYMBOL`, `SECURITY_DESCRIPTION`, `CENTS_PER_SHARE`, `DISCOUNT_PERCENT`, `PAYCODE`, `MASTER_CLIENT_MNEMONIC`,
    `INSTITUTIONAL_RETAIL_INDICATOR`, `STATE_CODE`, `COMMISSION_INDICATOR`, `FIRM_TRADING_ACCOUNT`, `POSTED_DATE`, `SETTLEMENT_DATE`,
    `NOT_USED_2`, `RECYCLE_INDICATOR`, `IBD_3`, `RECORD_ID_3`, `AS_OF_TRADE_INDICATOR`, `DISTRIBUTION_INDICATOR`,
    `EXPLODE_INDICATOR`, `REVENUE_TYPE`, `IP`, `IP_CAPS_REVENUE_CENTER`, `IP_CAPS_OFFICE_NUMBER`, `IP_SPLIT_PERCENT`,
    `TOTAL_AMT_OF_REV_GEN_BY_TR_AND_CRED_TO_IP`, `PERSHING_CHARGE`, `FROM_IP_NUMBER`, `CAPS_REV_CENTER_ASSOC_W_THE_FROM_IP`, `CAPS_OFFICE_NO_ASSOC_W_THE_FROM_IP`, `TOTAL_ORDER_COMMISSION`,
    `SPREAD_STRADDLE`, `CORRECTION_CODE`, `SECURITY_MODIFIER`, `SECURITY_CALCULATION_CODE`, `PRINCIPAL`, `CRD_NUMBER`,
    `SOURCE_OF_INPUT`, `FOR_PERS_INT_USE_ONLY_3`, `SERVICE_CHARGE_OTHER_FEE`, `IBD_4`, `RECORD_ID_4`, `CURRENCY_CODE`,
    `CURRENCY_AMOUNT_OF_REVENUE`, `FOREIGN_EXCHANGE_RATE`, `CURRENCY_MULTI_DIV_INDICATOR`, `IBD_SETTLEMENT_FEE`, `CUSTOMER_SETTLEMENT_FEE`, `GLOSS_REFERENCE_NUMBER`,
    `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`, `NOT_USED_4`, `IBD_5`, `RECORD_ID_5`, `OPTION_ROOT_ID`, `EXPIRATION_DATE`,
    `CALL_PUT_INDICATOR`, `STRIKE_PRICE`, `MASTER_CLIENT_NAME`, `FOR_PERS_INT_USE_ONLY_5`, `PERS_INT_ORDER_REF_NO`, `NOT_USED_5`,
    `AS_OF_DATE`, `IMPORTED_DATE`, `LOADED_AT`, `YEARMONTH`
)
SELECT
    idx AS `id`,
    concat('IBD_1_', format_string('%02d', idx)) AS `IBD_1`,
    concat('RECORD_ID_1_', format_string('%02d', idx)) AS `RECORD_ID_1`,
    concat('TRADE_DATE_', format_string('%02d', idx)) AS `TRADE_DATE`,
    concat('TRADE_REFERENCE_NUMBER_', format_string('%02d', idx)) AS `TRADE_REFERENCE_NUMBER`,
    concat('PERSHING_OFFICE_NUMBER_', format_string('%02d', idx)) AS `PERSHING_OFFICE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('ACCOUNT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_NAME`,
    concat('BUY_SELL_INDICATOR_', format_string('%02d', idx)) AS `BUY_SELL_INDICATOR`,
    concat('CANCEL_INDICATOR_', format_string('%02d', idx)) AS `CANCEL_INDICATOR`,
    concat('CAPS_SOURCE_', format_string('%02d', idx)) AS `CAPS_SOURCE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `TRADE_QUANTITY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PRICE`,
    concat('PRODUCT_CODE_', format_string('%02d', idx)) AS `PRODUCT_CODE`,
    concat('CUSIP_NUMBER_OF_SECURITY_', format_string('%02d', idx)) AS `CUSIP_NUMBER_OF_SECURITY_TRADED`,
    concat('ACCOUNT_SHORT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_SHORT_NAME`,
    concat('ORDER_TYPE_', format_string('%02d', idx)) AS `ORDER_TYPE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `MISCELLANEOUS_FEE`,
    concat('NOT_USED_1_', format_string('%02d', idx)) AS `NOT_USED_1`,
    concat('IBD_2_', format_string('%02d', idx)) AS `IBD_2`,
    concat('RECORD_ID_2_', format_string('%02d', idx)) AS `RECORD_ID_2`,
    concat('MARKET_CODE_', format_string('%02d', idx)) AS `MARKET_CODE`,
    concat('BLOTTER_CODE_', format_string('%02d', idx)) AS `BLOTTER_CODE`,
    concat('SECURITY_TYPE_', format_string('%02d', idx)) AS `SECURITY_TYPE`,
    concat('STOCK_SYMBOL_', format_string('%02d', idx)) AS `STOCK_SYMBOL`,
    concat('SECURITY_DESCRIPTION_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CENTS_PER_SHARE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `DISCOUNT_PERCENT`,
    concat('PAYCODE_', format_string('%02d', idx)) AS `PAYCODE`,
    concat('MASTER_CLIENT_MNEMONIC_', format_string('%02d', idx)) AS `MASTER_CLIENT_MNEMONIC`,
    concat('INSTITUTIONAL_RETAIL_IND_', format_string('%02d', idx)) AS `INSTITUTIONAL_RETAIL_INDICATOR`,
    concat('STATE_CODE_', format_string('%02d', idx)) AS `STATE_CODE`,
    concat('COMMISSION_INDICATOR_', format_string('%02d', idx)) AS `COMMISSION_INDICATOR`,
    concat('FIRM_TRADING_ACCOUNT_', format_string('%02d', idx)) AS `FIRM_TRADING_ACCOUNT`,
    concat('POSTED_DATE_', format_string('%02d', idx)) AS `POSTED_DATE`,
    concat('SETTLEMENT_DATE_', format_string('%02d', idx)) AS `SETTLEMENT_DATE`,
    concat('NOT_USED_2_', format_string('%02d', idx)) AS `NOT_USED_2`,
    concat('RECYCLE_INDICATOR_', format_string('%02d', idx)) AS `RECYCLE_INDICATOR`,
    concat('IBD_3_', format_string('%02d', idx)) AS `IBD_3`,
    concat('RECORD_ID_3_', format_string('%02d', idx)) AS `RECORD_ID_3`,
    concat('AS_OF_TRADE_INDICATOR_', format_string('%02d', idx)) AS `AS_OF_TRADE_INDICATOR`,
    concat('DISTRIBUTION_INDICATOR_', format_string('%02d', idx)) AS `DISTRIBUTION_INDICATOR`,
    concat('EXPLODE_INDICATOR_', format_string('%02d', idx)) AS `EXPLODE_INDICATOR`,
    concat('REVENUE_TYPE_', format_string('%02d', idx)) AS `REVENUE_TYPE`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('IP_CAPS_REVENUE_CENTER_', format_string('%02d', idx)) AS `IP_CAPS_REVENUE_CENTER`,
    concat('IP_CAPS_OFFICE_NUMBER_', format_string('%02d', idx)) AS `IP_CAPS_OFFICE_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `IP_SPLIT_PERCENT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `TOTAL_AMT_OF_REV_GEN_BY_TR_AND_CRED_TO_IP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PERSHING_CHARGE`,
    concat('FROM_IP_NUMBER_', format_string('%02d', idx)) AS `FROM_IP_NUMBER`,
    concat('CAPS_REV_CENTER_ASSOC_W__', format_string('%02d', idx)) AS `CAPS_REV_CENTER_ASSOC_W_THE_FROM_IP`,
    concat('CAPS_OFFICE_NO_ASSOC_W_T_', format_string('%02d', idx)) AS `CAPS_OFFICE_NO_ASSOC_W_THE_FROM_IP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `TOTAL_ORDER_COMMISSION`,
    concat('SPREAD_STRADDLE_', format_string('%02d', idx)) AS `SPREAD_STRADDLE`,
    concat('CORRECTION_CODE_', format_string('%02d', idx)) AS `CORRECTION_CODE`,
    concat('SECURITY_MODIFIER_', format_string('%02d', idx)) AS `SECURITY_MODIFIER`,
    concat('SECURITY_CALCULATION_COD_', format_string('%02d', idx)) AS `SECURITY_CALCULATION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PRINCIPAL`,
    concat('CRD_NUMBER_', format_string('%02d', idx)) AS `CRD_NUMBER`,
    concat('SOURCE_OF_INPUT_', format_string('%02d', idx)) AS `SOURCE_OF_INPUT`,
    concat('FOR_PERS_INT_USE_ONLY_3_', format_string('%02d', idx)) AS `FOR_PERS_INT_USE_ONLY_3`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `SERVICE_CHARGE_OTHER_FEE`,
    concat('IBD_4_', format_string('%02d', idx)) AS `IBD_4`,
    concat('RECORD_ID_4_', format_string('%02d', idx)) AS `RECORD_ID_4`,
    concat('CURRENCY_CODE_', format_string('%02d', idx)) AS `CURRENCY_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CURRENCY_AMOUNT_OF_REVENUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `FOREIGN_EXCHANGE_RATE`,
    concat('CURRENCY_MULTI_DIV_INDIC_', format_string('%02d', idx)) AS `CURRENCY_MULTI_DIV_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `IBD_SETTLEMENT_FEE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CUSTOMER_SETTLEMENT_FEE`,
    concat('GLOSS_REFERENCE_NUMBER_', format_string('%02d', idx)) AS `GLOSS_REFERENCE_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`,
    concat('NOT_USED_4_', format_string('%02d', idx)) AS `NOT_USED_4`,
    concat('IBD_5_', format_string('%02d', idx)) AS `IBD_5`,
    concat('RECORD_ID_5_', format_string('%02d', idx)) AS `RECORD_ID_5`,
    concat('OPTION_ROOT_ID_', format_string('%02d', idx)) AS `OPTION_ROOT_ID`,
    concat('EXPIRATION_DATE_', format_string('%02d', idx)) AS `EXPIRATION_DATE`,
    concat('CALL_PUT_INDICATOR_', format_string('%02d', idx)) AS `CALL_PUT_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `STRIKE_PRICE`,
    concat('MASTER_CLIENT_NAME_', format_string('%02d', idx)) AS `MASTER_CLIENT_NAME`,
    concat('FOR_PERS_INT_USE_ONLY_5_', format_string('%02d', idx)) AS `FOR_PERS_INT_USE_ONLY_5`,
    concat('PERS_INT_ORDER_REF_NO_', format_string('%02d', idx)) AS `PERS_INT_ORDER_REF_NO`,
    concat('NOT_USED_5_', format_string('%02d', idx)) AS `NOT_USED_5`,
    date_add(DATE '2026-01-01', idx - 1) AS `AS_OF_DATE`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `IMPORTED_DATE`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`,
    202601 AS `YEARMONTH`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershingdataprod_caps_hist' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershingdataprod_caps_hist;
-- Databricks SQL for source: pershingdataprod
-- Generated from sqlserver_desc/landing-pershingdataprod_master_asset-desc.txt

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHINGDATAPROD_MASTER_ASSET"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershingdataprod_master_asset (
    `ID` INT,
    `TRANSFER_ID` INT,
    `DATA_DT` DATE,
    `RUN_DT` TIMESTAMP,
    `TRANSFER_TYPE` STRING,
    `SEQUENCE` INT,
    `ACCOUNT` STRING,
    `IP` STRING,
    `ASSET_TYPE` STRING,
    `ASSET_TYPE_ID` STRING,
    `NUMBER` STRING,
    `DESCRIPTION` STRING,
    `STATUS` STRING,
    `QUANTITY` DECIMAL(38,10),
    `VALUE` DECIMAL(38,10),
    `CASH_MARGIN` STRING,
    `DELIVERY` STRING,
    `JSON_DATA` STRING,
    `REQUEST_ID` STRING,
    `LOADED_AT` TIMESTAMP,
    `YEARMONTH` INT
);
COMMENT ON TABLE landing_pershing.default.pershingdataprod_master_asset IS
'The table contains Pershing transfer master asset records with transfer identifiers, account references, asset classification, security number and description, status, quantity, value, delivery details, request identifiers, and load timestamps. It supports landing-layer validation for asset transfers, holdings movement, and transfer exception analysis.';

TRUNCATE TABLE landing_pershing.default.pershingdataprod_master_asset;

INSERT INTO landing_pershing.default.pershingdataprod_master_asset (
    `ID`, `TRANSFER_ID`, `DATA_DT`, `RUN_DT`, `TRANSFER_TYPE`, `SEQUENCE`,
    `ACCOUNT`, `IP`, `ASSET_TYPE`, `ASSET_TYPE_ID`, `NUMBER`, `DESCRIPTION`,
    `STATUS`, `QUANTITY`, `VALUE`, `CASH_MARGIN`, `DELIVERY`, `JSON_DATA`,
    `REQUEST_ID`, `LOADED_AT`, `YEARMONTH`
)
SELECT
    idx AS `ID`,
    idx AS `TRANSFER_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATA_DT`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `RUN_DT`,
    concat('TRANSFER_TYPE_', format_string('%02d', idx)) AS `TRANSFER_TYPE`,
    idx AS `SEQUENCE`,
    concat('ACCOUNT_', format_string('%02d', idx)) AS `ACCOUNT`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('ASSET_TYPE_', format_string('%02d', idx)) AS `ASSET_TYPE`,
    concat('ASSET_TYPE_ID_', format_string('%02d', idx)) AS `ASSET_TYPE_ID`,
    concat('NUMBER_', format_string('%02d', idx)) AS `NUMBER`,
    concat('DESCRIPTION_', format_string('%02d', idx)) AS `DESCRIPTION`,
    concat('STATUS_', format_string('%02d', idx)) AS `STATUS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `QUANTITY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `VALUE`,
    concat('CASH_MARGIN_', format_string('%02d', idx)) AS `CASH_MARGIN`,
    concat('DELIVERY_', format_string('%02d', idx)) AS `DELIVERY`,
    concat('JSON_DATA_', format_string('%02d', idx)) AS `JSON_DATA`,
    concat('REQUEST_ID_', format_string('%02d', idx)) AS `REQUEST_ID`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`,
    202601 AS `YEARMONTH`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershingdataprod_master_asset' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershingdataprod_master_asset;
-- Databricks SQL for source: pershingdataprod
-- Generated from sqlserver_desc/landing-pershingdataprod_pershing-desc.txt

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHINGDATAPROD_PERSHING"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershingdataprod_pershing (
    `PERSHINGID` INT,
    `ACCTNO` STRING,
    `INVACC` STRING,
    `INVACT` STRING,
    `BRANCH` STRING,
    `GLPROD` STRING,
    `CFNA1` STRING,
    `CFNATITLE` STRING,
    `CFNA2` STRING,
    `CFNA3` STRING,
    `CFNA4` STRING,
    `CFCITY` STRING,
    `CFSTAT` STRING,
    `CFZIP` STRING,
    `CFCOUNTRY` STRING,
    `INVAMT` DECIMAL(38,10),
    `TEST1` STRING,
    `TEST2` STRING,
    `INVCIF` STRING,
    `INVTAXID` STRING,
    `OFFICR` STRING,
    `CBAL` DECIMAL(38,10),
    `INVDT6` TIMESTAMP,
    `CFHPHO` STRING,
    `CFBPHO` STRING,
    `CFFAX` STRING,
    `CLASS` STRING,
    `MMAMOUNT` DECIMAL(38,10),
    `CREATEDATE` TIMESTAMP,
    `ACCTSTATUS` STRING,
    `ACCTDATECLOSED` STRING,
    `IP` STRING,
    `RISKFACTORCODE` STRING,
    `INVESTOBJCODE` STRING,
    `NAMEINVESTPRO` STRING,
    `LOADED_AT` TIMESTAMP,
    `YEARMONTH` INT
);
COMMENT ON TABLE landing_pershing.default.pershingdataprod_pershing IS
'The table contains PershingDataProd account master records with Pershing identifiers, account numbers, branch and product codes, client names, investor identifiers, officer assignments, balances, status fields, contact details, and load timestamps. It supports landing-layer validation for Pershing account reference data and downstream account reporting.';

TRUNCATE TABLE landing_pershing.default.pershingdataprod_pershing;

INSERT INTO landing_pershing.default.pershingdataprod_pershing (
    `PERSHINGID`, `ACCTNO`, `INVACC`, `INVACT`, `BRANCH`, `GLPROD`,
    `CFNA1`, `CFNATITLE`, `CFNA2`, `CFNA3`, `CFNA4`, `CFCITY`,
    `CFSTAT`, `CFZIP`, `CFCOUNTRY`, `INVAMT`, `TEST1`, `TEST2`,
    `INVCIF`, `INVTAXID`, `OFFICR`, `CBAL`, `INVDT6`, `CFHPHO`,
    `CFBPHO`, `CFFAX`, `CLASS`, `MMAMOUNT`, `CREATEDATE`, `ACCTSTATUS`,
    `ACCTDATECLOSED`, `IP`, `RISKFACTORCODE`, `INVESTOBJCODE`, `NAMEINVESTPRO`, `LOADED_AT`,
    `YEARMONTH`
)
SELECT
    idx AS `PERSHINGID`,
    concat('ACCTNO_', format_string('%02d', idx)) AS `ACCTNO`,
    concat('INVACC_', format_string('%02d', idx)) AS `INVACC`,
    concat('INVACT_', format_string('%02d', idx)) AS `INVACT`,
    concat('BRANCH_', format_string('%02d', idx)) AS `BRANCH`,
    concat('GLPROD_', format_string('%02d', idx)) AS `GLPROD`,
    concat('CFNA1_', format_string('%02d', idx)) AS `CFNA1`,
    concat('CFNATITLE_', format_string('%02d', idx)) AS `CFNATITLE`,
    concat('CFNA2_', format_string('%02d', idx)) AS `CFNA2`,
    concat('CFNA3_', format_string('%02d', idx)) AS `CFNA3`,
    concat('CFNA4_', format_string('%02d', idx)) AS `CFNA4`,
    concat('CFCITY_', format_string('%02d', idx)) AS `CFCITY`,
    concat('CFSTAT_', format_string('%02d', idx)) AS `CFSTAT`,
    concat('CFZIP_', format_string('%02d', idx)) AS `CFZIP`,
    concat('CFCOUNTRY_', format_string('%02d', idx)) AS `CFCOUNTRY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `INVAMT`,
    concat('TEST1_', format_string('%02d', idx)) AS `TEST1`,
    concat('TEST2_', format_string('%02d', idx)) AS `TEST2`,
    concat('INVCIF_', format_string('%02d', idx)) AS `INVCIF`,
    concat('INVTAXID_', format_string('%02d', idx)) AS `INVTAXID`,
    concat('OFFICR_', format_string('%02d', idx)) AS `OFFICR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CBAL`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `INVDT6`,
    concat('CFHPHO_', format_string('%02d', idx)) AS `CFHPHO`,
    concat('CFBPHO_', format_string('%02d', idx)) AS `CFBPHO`,
    concat('CFFAX_', format_string('%02d', idx)) AS `CFFAX`,
    concat('CLASS_', format_string('%02d', idx)) AS `CLASS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `MMAMOUNT`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `CREATEDATE`,
    concat('ACCTSTATUS_', format_string('%02d', idx)) AS `ACCTSTATUS`,
    concat('ACCTDATECLOSED_', format_string('%02d', idx)) AS `ACCTDATECLOSED`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('RISKFACTORCODE_', format_string('%02d', idx)) AS `RISKFACTORCODE`,
    concat('INVESTOBJCODE_', format_string('%02d', idx)) AS `INVESTOBJCODE`,
    concat('NAMEINVESTPRO_', format_string('%02d', idx)) AS `NAMEINVESTPRO`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`,
    202601 AS `YEARMONTH`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershingdataprod_pershing' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershingdataprod_pershing;
-- Databricks SQL for source: pershingdataprod
-- Generated from sqlserver_desc/landing-pershingdataprod_transfer-desc.txt

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHINGDATAPROD_TRANSFER"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershingdataprod_transfer (
    `ID` INT,
    `DATA_DT` DATE,
    `RUN_DT` TIMESTAMP,
    `TYPE` STRING,
    `SEQUENCE` INT,
    `ACCOUNT` STRING,
    `IP` STRING,
    `TYPE2` STRING,
    `STATUS` STRING,
    `DAYS` SMALLINT,
    `CB_NUMBER` STRING,
    `CB_NAME` STRING,
    `CA_NUMBER` STRING,
    `RETIREMENT` STRING,
    `CREATION_DT` TIMESTAMP,
    `CREATION_USER` STRING,
    `UPDATE_DT` TIMESTAMP,
    `UPDATE_USER` STRING,
    `AMOUNT` DECIMAL(38,10),
    `SOURCE` STRING,
    `SMA` DECIMAL(38,10),
    `CUSTOMER` STRING,
    `TAX_ID` STRING,
    `JSON_DATA` STRING,
    `REJECT` STRING,
    `COMMENTS` STRING,
    `REQUEST_ID` STRING,
    `LOADED_AT` TIMESTAMP,
    `YEARMONTH` INT
);
COMMENT ON TABLE landing_pershing.default.pershingdataprod_transfer IS
'The table contains Pershing transfer records with data and run dates, transfer type, account and IP references, transfer status, aging, contra broker details, creation and update metadata, amounts, source, SMA, customer, tax identifier, reject reason, comments, request identifier, and load timestamp. It supports landing-layer validation for ACATS transfer operations and exception tracking.';

TRUNCATE TABLE landing_pershing.default.pershingdataprod_transfer;

INSERT INTO landing_pershing.default.pershingdataprod_transfer (
    `ID`, `DATA_DT`, `RUN_DT`, `TYPE`, `SEQUENCE`, `ACCOUNT`,
    `IP`, `TYPE2`, `STATUS`, `DAYS`, `CB_NUMBER`, `CB_NAME`,
    `CA_NUMBER`, `RETIREMENT`, `CREATION_DT`, `CREATION_USER`, `UPDATE_DT`, `UPDATE_USER`,
    `AMOUNT`, `SOURCE`, `SMA`, `CUSTOMER`, `TAX_ID`, `JSON_DATA`,
    `REJECT`, `COMMENTS`, `REQUEST_ID`, `LOADED_AT`, `YEARMONTH`
)
SELECT
    idx AS `ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATA_DT`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `RUN_DT`,
    concat('TYPE_', format_string('%02d', idx)) AS `TYPE`,
    idx AS `SEQUENCE`,
    concat('ACCOUNT_', format_string('%02d', idx)) AS `ACCOUNT`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('TYPE2_', format_string('%02d', idx)) AS `TYPE2`,
    concat('STATUS_', format_string('%02d', idx)) AS `STATUS`,
    idx AS `DAYS`,
    concat('CB_NUMBER_', format_string('%02d', idx)) AS `CB_NUMBER`,
    concat('CB_NAME_', format_string('%02d', idx)) AS `CB_NAME`,
    concat('CA_NUMBER_', format_string('%02d', idx)) AS `CA_NUMBER`,
    concat('RETIREMENT_', format_string('%02d', idx)) AS `RETIREMENT`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `CREATION_DT`,
    concat('CREATION_USER_', format_string('%02d', idx)) AS `CREATION_USER`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `UPDATE_DT`,
    concat('UPDATE_USER_', format_string('%02d', idx)) AS `UPDATE_USER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AMOUNT`,
    concat('SOURCE_', format_string('%02d', idx)) AS `SOURCE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `SMA`,
    concat('CUSTOMER_', format_string('%02d', idx)) AS `CUSTOMER`,
    concat('TAX_ID_', format_string('%02d', idx)) AS `TAX_ID`,
    concat('JSON_DATA_', format_string('%02d', idx)) AS `JSON_DATA`,
    concat('REJECT_', format_string('%02d', idx)) AS `REJECT`,
    concat('COMMENTS_', format_string('%02d', idx)) AS `COMMENTS`,
    concat('REQUEST_ID_', format_string('%02d', idx)) AS `REQUEST_ID`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`,
    202601 AS `YEARMONTH`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershingdataprod_transfer' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershingdataprod_transfer;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_dbt/landing-pers_accf.dbt.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERS_ACCF"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pers_accf (
    `TRANSCODE` STRING,
    `RECORDIND` STRING,
    `RECORDSEQUENCEID` STRING,
    `ACCTNUMBER` STRING,
    `BROKERDEALERNUMBER` STRING,
    `INVESTMENTPRONUMBER` STRING,
    `ACCOUNTSHORTNAME` STRING,
    `TRANSACTIONTYPE` STRING,
    `AUTOTITLEDACCT` STRING,
    `ACCTTYPECODE` STRING,
    `REGISTRATIONTYPE` STRING,
    `NUMBERACCTTITLELINES` STRING,
    `ACCTREGISLINE1` STRING,
    `ACCTREGISLINE2` STRING,
    `ACCTREGISLINE3` STRING,
    `ACCTREGISLINE4` STRING,
    `ACCTREGISLINE5` STRING,
    `ACCTREGISLINE6` STRING,
    `USTENANCYINDICATOR` STRING,
    `MARRIEDINDICATOR` STRING,
    `TENANCYSTATE` STRING,
    `JOINTTENANCYCLAUSE` STRING,
    `AGREEMENTEXEDATE` TIMESTAMP,
    `NUMBEROFTENANTS` STRING,
    `DATEACCTOPENED` TIMESTAMP,
    `DATEACCTINFOUPDATED` TIMESTAMP,
    `ACCTSTATUSINDICATOR` STRING,
    `PENDINGCLOSEDDATE` TIMESTAMP,
    `DATEACCOUNTCLOSED` TIMESTAMP,
    `ACCTREACTIVATEDDATE` TIMESTAMP,
    `DATEACCOUNTREOPENED` TIMESTAMP,
    `PROCEEDS` STRING,
    `TRANSINSTRUC` STRING,
    `INCOMEINSTRUC` STRING,
    `NUMBCONFIRMS` STRING,
    `NUMBSTATEMENTS` STRING,
    `INVESOBJTRANSCODE` STRING,
    `COMMENTS` STRING,
    `EMPLOYERSHORTNAME` STRING,
    `EMPLOYERCUSIP` STRING,
    `EMPLOYERSYMBOL` STRING,
    `MARPRIVREVOKED` STRING,
    `STATEREVIEWDATE` TIMESTAMP,
    `MARPAPERSFILE` STRING,
    `OPTPAPERSFILE` STRING,
    `GOODFAITHMARGIN` STRING,
    `INVESTPRODISCRGRANTED` STRING,
    `INVESTADVDISCRGRANTED` STRING,
    `THIRDPARTYDISCGRANTED` STRING,
    `THIRDPARTYNAME` STRING,
    `RISKFACTORCODE` STRING,
    `INVESTOBJCODE` STRING,
    `OPTIONEQUITIES` STRING,
    `OPTIONINDEX` STRING,
    `OPTIONDEBT` STRING,
    `OPTIONCURRENCY` STRING,
    `OPTIONLEVEL1` STRING,
    `OPTIONLEVEL2` STRING,
    `OPTIONLEVEL3` STRING,
    `OPTIONLEVEL4` STRING,
    `OPTIONCALLLIMITS` DECIMAL(38,10),
    `OPTIONPUTLIMITS` DECIMAL(38,10),
    `OPTIONLIMITSPUTSCALLS` DECIMAL(38,10),
    `NONUSDOLLARTRADING` STRING,
    `NONCUSTOMERINDICATOR` STRING,
    `THIRDPARTYFEEINDICATOR` DECIMAL(38,10),
    `THIRDPARTYFEEAPPRDATE` DECIMAL(38,10),
    `INTERMEDIARYACCTIND` STRING,
    `COMMISSIONSCHEDULE` STRING,
    `GROUPINDEX` STRING,
    `MONEYMANAGERID` STRING,
    `MONEYMANAGEROBJID` STRING,
    `DTCIDCONFIRMNUMBER` STRING,
    `CAPSMASTERMNEMONIC` STRING,
    `EMPLOYEEID` STRING,
    `PRIMEBROKERFREEFUNDIND` STRING,
    `FEEBASEDACCTIND` DECIMAL(38,10),
    `BILLINGTYPE` STRING,
    `FEEBASEDTERMDATE` DECIMAL(38,10),
    `PLANNAME` STRING,
    `SELFDIRECTED` STRING,
    `PLANTYPE` STRING,
    `PLANNUMBER` STRING,
    `EMPLOYEERELAIND` STRING,
    `COMMISSPERCDISC` STRING,
    `BLOCKMUTFUNDFEES` DECIMAL(38,10),
    `NAMEINVESTPRO` STRING,
    `DATEINVESTPRO` TIMESTAMP,
    `NAMEPRINCIPALSIGNED` STRING,
    `DATEPRINCIPALSIGNED` TIMESTAMP,
    `POLITEXPOSEDPERSON` STRING,
    `PRIVATEBANKACCTIND` STRING,
    `FOREIGNBANKACCTIND` STRING,
    `INITIALSOURCEFUNDS` STRING,
    `USAPATACTEXEMPTREASON` STRING,
    `PRIMARYCOUNTRYCTZ` STRING,
    `COUNTRYRESIDENCE` STRING,
    `BIRTHDATE` TIMESTAMP,
    `AGEBASEDFUNDROLLEXEMPTIND` STRING,
    `MONEYFUNDREFORMRETAIL` STRING,
    `TRUSTEDCONTACTSTATUS` STRING,
    `FULFILLMENTMETHOD` STRING,
    `CREDITINTERESTIND` STRING,
    `AMAIND` STRING,
    `DATEOFDATA` TIMESTAMP,
    `LOADED_AT` TIMESTAMP,
    `YEARMONTH` INT
);
COMMENT ON TABLE landing_pershing.default.pers_accf IS
'The table contains Pershing account file profile data, including registration details, account lifecycle dates, investment objective settings, option permissions, fee indicators, plan attributes, compliance markers, and trusted-contact status. It supports landing-layer validation for account maintenance, compliance review, and downstream Pershing account analytics.';

TRUNCATE TABLE landing_pershing.default.pers_accf;

INSERT INTO landing_pershing.default.pers_accf (
    `TRANSCODE`, `RECORDIND`, `RECORDSEQUENCEID`, `ACCTNUMBER`, `BROKERDEALERNUMBER`, `INVESTMENTPRONUMBER`,
    `ACCOUNTSHORTNAME`, `TRANSACTIONTYPE`, `AUTOTITLEDACCT`, `ACCTTYPECODE`, `REGISTRATIONTYPE`, `NUMBERACCTTITLELINES`,
    `ACCTREGISLINE1`, `ACCTREGISLINE2`, `ACCTREGISLINE3`, `ACCTREGISLINE4`, `ACCTREGISLINE5`, `ACCTREGISLINE6`,
    `USTENANCYINDICATOR`, `MARRIEDINDICATOR`, `TENANCYSTATE`, `JOINTTENANCYCLAUSE`, `AGREEMENTEXEDATE`, `NUMBEROFTENANTS`,
    `DATEACCTOPENED`, `DATEACCTINFOUPDATED`, `ACCTSTATUSINDICATOR`, `PENDINGCLOSEDDATE`, `DATEACCOUNTCLOSED`, `ACCTREACTIVATEDDATE`,
    `DATEACCOUNTREOPENED`, `PROCEEDS`, `TRANSINSTRUC`, `INCOMEINSTRUC`, `NUMBCONFIRMS`, `NUMBSTATEMENTS`,
    `INVESOBJTRANSCODE`, `COMMENTS`, `EMPLOYERSHORTNAME`, `EMPLOYERCUSIP`, `EMPLOYERSYMBOL`, `MARPRIVREVOKED`,
    `STATEREVIEWDATE`, `MARPAPERSFILE`, `OPTPAPERSFILE`, `GOODFAITHMARGIN`, `INVESTPRODISCRGRANTED`, `INVESTADVDISCRGRANTED`,
    `THIRDPARTYDISCGRANTED`, `THIRDPARTYNAME`, `RISKFACTORCODE`, `INVESTOBJCODE`, `OPTIONEQUITIES`, `OPTIONINDEX`,
    `OPTIONDEBT`, `OPTIONCURRENCY`, `OPTIONLEVEL1`, `OPTIONLEVEL2`, `OPTIONLEVEL3`, `OPTIONLEVEL4`,
    `OPTIONCALLLIMITS`, `OPTIONPUTLIMITS`, `OPTIONLIMITSPUTSCALLS`, `NONUSDOLLARTRADING`, `NONCUSTOMERINDICATOR`, `THIRDPARTYFEEINDICATOR`,
    `THIRDPARTYFEEAPPRDATE`, `INTERMEDIARYACCTIND`, `COMMISSIONSCHEDULE`, `GROUPINDEX`, `MONEYMANAGERID`, `MONEYMANAGEROBJID`,
    `DTCIDCONFIRMNUMBER`, `CAPSMASTERMNEMONIC`, `EMPLOYEEID`, `PRIMEBROKERFREEFUNDIND`, `FEEBASEDACCTIND`, `BILLINGTYPE`,
    `FEEBASEDTERMDATE`, `PLANNAME`, `SELFDIRECTED`, `PLANTYPE`, `PLANNUMBER`, `EMPLOYEERELAIND`,
    `COMMISSPERCDISC`, `BLOCKMUTFUNDFEES`, `NAMEINVESTPRO`, `DATEINVESTPRO`, `NAMEPRINCIPALSIGNED`, `DATEPRINCIPALSIGNED`,
    `POLITEXPOSEDPERSON`, `PRIVATEBANKACCTIND`, `FOREIGNBANKACCTIND`, `INITIALSOURCEFUNDS`, `USAPATACTEXEMPTREASON`, `PRIMARYCOUNTRYCTZ`,
    `COUNTRYRESIDENCE`, `BIRTHDATE`, `AGEBASEDFUNDROLLEXEMPTIND`, `MONEYFUNDREFORMRETAIL`, `TRUSTEDCONTACTSTATUS`, `FULFILLMENTMETHOD`,
    `CREDITINTERESTIND`, `AMAIND`, `DATEOFDATA`, `LOADED_AT`, `YEARMONTH`
)
SELECT
    concat('TRANSCODE_', format_string('%02d', idx)) AS `TRANSCODE`,
    concat('RECORDIND_', format_string('%02d', idx)) AS `RECORDIND`,
    concat('RECORDSEQUENCEID_', format_string('%02d', idx)) AS `RECORDSEQUENCEID`,
    concat('ACCTNUMBER_', format_string('%02d', idx)) AS `ACCTNUMBER`,
    concat('BROKERDEALERNUMBER_', format_string('%02d', idx)) AS `BROKERDEALERNUMBER`,
    concat('INVESTMENTPRONUMBER_', format_string('%02d', idx)) AS `INVESTMENTPRONUMBER`,
    concat('ACCOUNTSHORTNAME_', format_string('%02d', idx)) AS `ACCOUNTSHORTNAME`,
    concat('TRANSACTIONTYPE_', format_string('%02d', idx)) AS `TRANSACTIONTYPE`,
    concat('AUTOTITLEDACCT_', format_string('%02d', idx)) AS `AUTOTITLEDACCT`,
    concat('ACCTTYPECODE_', format_string('%02d', idx)) AS `ACCTTYPECODE`,
    concat('REGISTRATIONTYPE_', format_string('%02d', idx)) AS `REGISTRATIONTYPE`,
    concat('NUMBERACCTTITLELINES_', format_string('%02d', idx)) AS `NUMBERACCTTITLELINES`,
    concat('ACCTREGISLINE1_', format_string('%02d', idx)) AS `ACCTREGISLINE1`,
    concat('ACCTREGISLINE2_', format_string('%02d', idx)) AS `ACCTREGISLINE2`,
    concat('ACCTREGISLINE3_', format_string('%02d', idx)) AS `ACCTREGISLINE3`,
    concat('ACCTREGISLINE4_', format_string('%02d', idx)) AS `ACCTREGISLINE4`,
    concat('ACCTREGISLINE5_', format_string('%02d', idx)) AS `ACCTREGISLINE5`,
    concat('ACCTREGISLINE6_', format_string('%02d', idx)) AS `ACCTREGISLINE6`,
    concat('USTENANCYINDICATOR_', format_string('%02d', idx)) AS `USTENANCYINDICATOR`,
    concat('MARRIEDINDICATOR_', format_string('%02d', idx)) AS `MARRIEDINDICATOR`,
    concat('TENANCYSTATE_', format_string('%02d', idx)) AS `TENANCYSTATE`,
    concat('JOINTTENANCYCLAUSE_', format_string('%02d', idx)) AS `JOINTTENANCYCLAUSE`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `AGREEMENTEXEDATE`,
    concat('NUMBEROFTENANTS_', format_string('%02d', idx)) AS `NUMBEROFTENANTS`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `DATEACCTOPENED`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `DATEACCTINFOUPDATED`,
    concat('ACCTSTATUSINDICATOR_', format_string('%02d', idx)) AS `ACCTSTATUSINDICATOR`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `PENDINGCLOSEDDATE`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `DATEACCOUNTCLOSED`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `ACCTREACTIVATEDDATE`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `DATEACCOUNTREOPENED`,
    concat('PROCEEDS_', format_string('%02d', idx)) AS `PROCEEDS`,
    concat('TRANSINSTRUC_', format_string('%02d', idx)) AS `TRANSINSTRUC`,
    concat('INCOMEINSTRUC_', format_string('%02d', idx)) AS `INCOMEINSTRUC`,
    concat('NUMBCONFIRMS_', format_string('%02d', idx)) AS `NUMBCONFIRMS`,
    concat('NUMBSTATEMENTS_', format_string('%02d', idx)) AS `NUMBSTATEMENTS`,
    concat('INVESOBJTRANSCODE_', format_string('%02d', idx)) AS `INVESOBJTRANSCODE`,
    concat('COMMENTS_', format_string('%02d', idx)) AS `COMMENTS`,
    concat('EMPLOYERSHORTNAME_', format_string('%02d', idx)) AS `EMPLOYERSHORTNAME`,
    concat('EMPLOYERCUSIP_', format_string('%02d', idx)) AS `EMPLOYERCUSIP`,
    concat('EMPLOYERSYMBOL_', format_string('%02d', idx)) AS `EMPLOYERSYMBOL`,
    concat('MARPRIVREVOKED_', format_string('%02d', idx)) AS `MARPRIVREVOKED`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `STATEREVIEWDATE`,
    concat('MARPAPERSFILE_', format_string('%02d', idx)) AS `MARPAPERSFILE`,
    concat('OPTPAPERSFILE_', format_string('%02d', idx)) AS `OPTPAPERSFILE`,
    concat('GOODFAITHMARGIN_', format_string('%02d', idx)) AS `GOODFAITHMARGIN`,
    concat('INVESTPRODISCRGRANTED_', format_string('%02d', idx)) AS `INVESTPRODISCRGRANTED`,
    concat('INVESTADVDISCRGRANTED_', format_string('%02d', idx)) AS `INVESTADVDISCRGRANTED`,
    concat('THIRDPARTYDISCGRANTED_', format_string('%02d', idx)) AS `THIRDPARTYDISCGRANTED`,
    concat('THIRDPARTYNAME_', format_string('%02d', idx)) AS `THIRDPARTYNAME`,
    concat('RISKFACTORCODE_', format_string('%02d', idx)) AS `RISKFACTORCODE`,
    concat('INVESTOBJCODE_', format_string('%02d', idx)) AS `INVESTOBJCODE`,
    concat('OPTIONEQUITIES_', format_string('%02d', idx)) AS `OPTIONEQUITIES`,
    concat('OPTIONINDEX_', format_string('%02d', idx)) AS `OPTIONINDEX`,
    concat('OPTIONDEBT_', format_string('%02d', idx)) AS `OPTIONDEBT`,
    concat('OPTIONCURRENCY_', format_string('%02d', idx)) AS `OPTIONCURRENCY`,
    concat('OPTIONLEVEL1_', format_string('%02d', idx)) AS `OPTIONLEVEL1`,
    concat('OPTIONLEVEL2_', format_string('%02d', idx)) AS `OPTIONLEVEL2`,
    concat('OPTIONLEVEL3_', format_string('%02d', idx)) AS `OPTIONLEVEL3`,
    concat('OPTIONLEVEL4_', format_string('%02d', idx)) AS `OPTIONLEVEL4`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `OPTIONCALLLIMITS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `OPTIONPUTLIMITS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `OPTIONLIMITSPUTSCALLS`,
    concat('NONUSDOLLARTRADING_', format_string('%02d', idx)) AS `NONUSDOLLARTRADING`,
    concat('NONCUSTOMERINDICATOR_', format_string('%02d', idx)) AS `NONCUSTOMERINDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `THIRDPARTYFEEINDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `THIRDPARTYFEEAPPRDATE`,
    concat('INTERMEDIARYACCTIND_', format_string('%02d', idx)) AS `INTERMEDIARYACCTIND`,
    concat('COMMISSIONSCHEDULE_', format_string('%02d', idx)) AS `COMMISSIONSCHEDULE`,
    concat('GROUPINDEX_', format_string('%02d', idx)) AS `GROUPINDEX`,
    concat('MONEYMANAGERID_', format_string('%02d', idx)) AS `MONEYMANAGERID`,
    concat('MONEYMANAGEROBJID_', format_string('%02d', idx)) AS `MONEYMANAGEROBJID`,
    concat('DTCIDCONFIRMNUMBER_', format_string('%02d', idx)) AS `DTCIDCONFIRMNUMBER`,
    concat('CAPSMASTERMNEMONIC_', format_string('%02d', idx)) AS `CAPSMASTERMNEMONIC`,
    concat('EMPLOYEEID_', format_string('%02d', idx)) AS `EMPLOYEEID`,
    concat('PRIMEBROKERFREEFUNDIND_', format_string('%02d', idx)) AS `PRIMEBROKERFREEFUNDIND`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `FEEBASEDACCTIND`,
    concat('BILLINGTYPE_', format_string('%02d', idx)) AS `BILLINGTYPE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `FEEBASEDTERMDATE`,
    concat('PLANNAME_', format_string('%02d', idx)) AS `PLANNAME`,
    concat('SELFDIRECTED_', format_string('%02d', idx)) AS `SELFDIRECTED`,
    concat('PLANTYPE_', format_string('%02d', idx)) AS `PLANTYPE`,
    concat('PLANNUMBER_', format_string('%02d', idx)) AS `PLANNUMBER`,
    concat('EMPLOYEERELAIND_', format_string('%02d', idx)) AS `EMPLOYEERELAIND`,
    concat('COMMISSPERCDISC_', format_string('%02d', idx)) AS `COMMISSPERCDISC`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `BLOCKMUTFUNDFEES`,
    concat('NAMEINVESTPRO_', format_string('%02d', idx)) AS `NAMEINVESTPRO`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `DATEINVESTPRO`,
    concat('NAMEPRINCIPALSIGNED_', format_string('%02d', idx)) AS `NAMEPRINCIPALSIGNED`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `DATEPRINCIPALSIGNED`,
    concat('POLITEXPOSEDPERSON_', format_string('%02d', idx)) AS `POLITEXPOSEDPERSON`,
    concat('PRIVATEBANKACCTIND_', format_string('%02d', idx)) AS `PRIVATEBANKACCTIND`,
    concat('FOREIGNBANKACCTIND_', format_string('%02d', idx)) AS `FOREIGNBANKACCTIND`,
    concat('INITIALSOURCEFUNDS_', format_string('%02d', idx)) AS `INITIALSOURCEFUNDS`,
    concat('USAPATACTEXEMPTREASON_', format_string('%02d', idx)) AS `USAPATACTEXEMPTREASON`,
    concat('PRIMARYCOUNTRYCTZ_', format_string('%02d', idx)) AS `PRIMARYCOUNTRYCTZ`,
    concat('COUNTRYRESIDENCE_', format_string('%02d', idx)) AS `COUNTRYRESIDENCE`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `BIRTHDATE`,
    concat('AGEBASEDFUNDROLLEXEMPTIN_', format_string('%02d', idx)) AS `AGEBASEDFUNDROLLEXEMPTIND`,
    concat('MONEYFUNDREFORMRETAIL_', format_string('%02d', idx)) AS `MONEYFUNDREFORMRETAIL`,
    concat('TRUSTEDCONTACTSTATUS_', format_string('%02d', idx)) AS `TRUSTEDCONTACTSTATUS`,
    concat('FULFILLMENTMETHOD_', format_string('%02d', idx)) AS `FULFILLMENTMETHOD`,
    concat('CREDITINTERESTIND_', format_string('%02d', idx)) AS `CREDITINTERESTIND`,
    concat('AMAIND_', format_string('%02d', idx)) AS `AMAIND`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `DATEOFDATA`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`,
    202601 AS `YEARMONTH`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pers_accf' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pers_accf;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_dbt/landing-pers_pershing.dbt.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERS_PERSHING"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pers_pershing (
    `PershingID` INT,
    `ACCTNO` STRING,
    `INVACC` STRING,
    `INVACT` STRING,
    `BRANCH` STRING,
    `GLPROD` STRING,
    `CFNA1` STRING,
    `CFNATITLE` STRING,
    `CFNA2` STRING,
    `CFNA3` STRING,
    `CFNA4` STRING,
    `CFCITY` STRING,
    `CFSTAT` STRING,
    `CFZIP` STRING,
    `CFCOUNTRY` STRING,
    `INVAMT` DECIMAL(38,10),
    `TEST1` STRING,
    `TEST2` STRING,
    `INVCIF` STRING,
    `INVTAXID` STRING,
    `OFFICR` STRING,
    `CBAL` DECIMAL(38,10),
    `INVDT6` TIMESTAMP,
    `CFHPHO` STRING,
    `CFBPHO` STRING,
    `CFFAX` STRING,
    `CLASS` STRING,
    `MMAMOUNT` DECIMAL(38,10),
    `CREATEDATE` TIMESTAMP,
    `ACCTSTATUS` STRING,
    `ACCTDATECLOSED` STRING,
    `IP` STRING,
    `RISKFACTORCODE` STRING,
    `INVESTOBJCODE` STRING,
    `NAMEINVESTPRO` STRING,
    `ACCTDATEOPEN` TIMESTAMP,
    `LASTREFRESHDATE` TIMESTAMP,
    `LOADED_AT` TIMESTAMP,
    `YEARMONTH` INT
);
COMMENT ON TABLE landing_pershing.default.pers_pershing IS
'The table contains Pershing account master records with account numbers, investor identifiers, branch and officer attributes, balances, status dates, and contact fields. It supports landing-layer validation for Pershing account onboarding, relationship maintenance, and downstream account reporting.';

TRUNCATE TABLE landing_pershing.default.pers_pershing;

INSERT INTO landing_pershing.default.pers_pershing (
    `PershingID`, `ACCTNO`, `INVACC`, `INVACT`, `BRANCH`, `GLPROD`,
    `CFNA1`, `CFNATITLE`, `CFNA2`, `CFNA3`, `CFNA4`, `CFCITY`,
    `CFSTAT`, `CFZIP`, `CFCOUNTRY`, `INVAMT`, `TEST1`, `TEST2`,
    `INVCIF`, `INVTAXID`, `OFFICR`, `CBAL`, `INVDT6`, `CFHPHO`,
    `CFBPHO`, `CFFAX`, `CLASS`, `MMAMOUNT`, `CREATEDATE`, `ACCTSTATUS`,
    `ACCTDATECLOSED`, `IP`, `RISKFACTORCODE`, `INVESTOBJCODE`, `NAMEINVESTPRO`, `ACCTDATEOPEN`,
    `LASTREFRESHDATE`, `LOADED_AT`, `YEARMONTH`
)
SELECT
    idx AS `PershingID`,
    concat('ACCTNO_', format_string('%02d', idx)) AS `ACCTNO`,
    concat('INVACC_', format_string('%02d', idx)) AS `INVACC`,
    concat('INVACT_', format_string('%02d', idx)) AS `INVACT`,
    concat('BRANCH_', format_string('%02d', idx)) AS `BRANCH`,
    concat('GLPROD_', format_string('%02d', idx)) AS `GLPROD`,
    concat('CFNA1_', format_string('%02d', idx)) AS `CFNA1`,
    concat('CFNATITLE_', format_string('%02d', idx)) AS `CFNATITLE`,
    concat('CFNA2_', format_string('%02d', idx)) AS `CFNA2`,
    concat('CFNA3_', format_string('%02d', idx)) AS `CFNA3`,
    concat('CFNA4_', format_string('%02d', idx)) AS `CFNA4`,
    concat('CFCITY_', format_string('%02d', idx)) AS `CFCITY`,
    concat('CFSTAT_', format_string('%02d', idx)) AS `CFSTAT`,
    concat('CFZIP_', format_string('%02d', idx)) AS `CFZIP`,
    concat('CFCOUNTRY_', format_string('%02d', idx)) AS `CFCOUNTRY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `INVAMT`,
    concat('TEST1_', format_string('%02d', idx)) AS `TEST1`,
    concat('TEST2_', format_string('%02d', idx)) AS `TEST2`,
    concat('INVCIF_', format_string('%02d', idx)) AS `INVCIF`,
    concat('INVTAXID_', format_string('%02d', idx)) AS `INVTAXID`,
    concat('OFFICR_', format_string('%02d', idx)) AS `OFFICR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CBAL`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `INVDT6`,
    concat('CFHPHO_', format_string('%02d', idx)) AS `CFHPHO`,
    concat('CFBPHO_', format_string('%02d', idx)) AS `CFBPHO`,
    concat('CFFAX_', format_string('%02d', idx)) AS `CFFAX`,
    concat('CLASS_', format_string('%02d', idx)) AS `CLASS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `MMAMOUNT`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `CREATEDATE`,
    concat('ACCTSTATUS_', format_string('%02d', idx)) AS `ACCTSTATUS`,
    concat('ACCTDATECLOSED_', format_string('%02d', idx)) AS `ACCTDATECLOSED`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('RISKFACTORCODE_', format_string('%02d', idx)) AS `RISKFACTORCODE`,
    concat('INVESTOBJCODE_', format_string('%02d', idx)) AS `INVESTOBJCODE`,
    concat('NAMEINVESTPRO_', format_string('%02d', idx)) AS `NAMEINVESTPRO`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `ACCTDATEOPEN`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LASTREFRESHDATE`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`,
    202601 AS `YEARMONTH`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pers_pershing' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pers_pershing;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_dbt/landing-pershing_aca2_a.dbt.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ACA2_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_aca2_a (
    `TRANSACTION_CODE` STRING,
    `RECORD_INDICATOR_TRANSFER_TYPE` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `INVESTMENT_PROFESSIONAL` STRING,
    `RECORD_TYPE` STRING,
    `TRANSFER_TYPE` STRING,
    `TRANSFER_STATUS` STRING,
    `NUMBER_OF_DAYS_IN_PERSHING_STATUS` STRING,
    `CONTRA_BROKER_NUMBER` STRING,
    `CONTRA_BROKER_NAME` STRING,
    `CONTRA_ACCOUNT_NUMBER` STRING,
    `RETIREMENT_ACCOUNT_CLASS_INDICATOR` STRING,
    `REQUEST_CREATION_DATE` INT,
    `REQUEST_CREATION_USER_ID` STRING,
    `LAST_UPDATE_DATE` INT,
    `LAST_UPDATE_USER_ID` STRING,
    `TOTAL_MARKET_VALUE_OF_TRANSFER` DECIMAL(16,2),
    `TOTAL_MARKET_VALUE_SIGN` STRING,
    `SOURCE_CODE` STRING,
    `SPECIAL_MEMORANDUM_ACCOUNT` DECIMAL(16,2),
    `SPECIAL_MEMORANDUM_ACCOUNT_SIGN` STRING,
    `CUSTOMER_NAME` STRING,
    `PRIMARY_TAX_IDENTIFICATION_NUMBER` STRING,
    `NSCC_ACCOUNT_TYPE` STRING,
    `NSCC_STATUS` STRING,
    `NUMBER_OF_DAYS_IN_NSCC_STATUS` STRING,
    `NSCC_CONTROL_NUMBER` STRING,
    `REASON_CODE_FOR_REJECT` STRING,
    `REASON_COMMENTS` STRING,
    `REQUEST_ID` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_aca2_a IS
'The table contains Pershing ACATS transfer record A data with account identifiers, transfer status, contra broker details, request metadata, market values, NSCC status, reject reasons, and data-date controls. It supports landing-layer validation for transfer monitoring, exception review, and downstream brokerage operations reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_aca2_a;

INSERT INTO landing_pershing.default.pershing_aca2_a (
    `TRANSACTION_CODE`, `RECORD_INDICATOR_TRANSFER_TYPE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `INVESTMENT_PROFESSIONAL`, `RECORD_TYPE`,
    `TRANSFER_TYPE`, `TRANSFER_STATUS`, `NUMBER_OF_DAYS_IN_PERSHING_STATUS`, `CONTRA_BROKER_NUMBER`, `CONTRA_BROKER_NAME`, `CONTRA_ACCOUNT_NUMBER`,
    `RETIREMENT_ACCOUNT_CLASS_INDICATOR`, `REQUEST_CREATION_DATE`, `REQUEST_CREATION_USER_ID`, `LAST_UPDATE_DATE`, `LAST_UPDATE_USER_ID`, `TOTAL_MARKET_VALUE_OF_TRANSFER`,
    `TOTAL_MARKET_VALUE_SIGN`, `SOURCE_CODE`, `SPECIAL_MEMORANDUM_ACCOUNT`, `SPECIAL_MEMORANDUM_ACCOUNT_SIGN`, `CUSTOMER_NAME`, `PRIMARY_TAX_IDENTIFICATION_NUMBER`,
    `NSCC_ACCOUNT_TYPE`, `NSCC_STATUS`, `NUMBER_OF_DAYS_IN_NSCC_STATUS`, `NSCC_CONTROL_NUMBER`, `REASON_CODE_FOR_REJECT`, `REASON_COMMENTS`,
    `REQUEST_ID`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    concat('RECORD_INDICATOR_TRANSFE_', format_string('%02d', idx)) AS `RECORD_INDICATOR_TRANSFER_TYPE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('INVESTMENT_PROFESSIONAL_', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL`,
    concat('RECORD_TYPE_', format_string('%02d', idx)) AS `RECORD_TYPE`,
    concat('TRANSFER_TYPE_', format_string('%02d', idx)) AS `TRANSFER_TYPE`,
    concat('TRANSFER_STATUS_', format_string('%02d', idx)) AS `TRANSFER_STATUS`,
    concat('NUMBER_OF_DAYS_IN_PERSHI_', format_string('%02d', idx)) AS `NUMBER_OF_DAYS_IN_PERSHING_STATUS`,
    concat('CONTRA_BROKER_NUMBER_', format_string('%02d', idx)) AS `CONTRA_BROKER_NUMBER`,
    concat('CONTRA_BROKER_NAME_', format_string('%02d', idx)) AS `CONTRA_BROKER_NAME`,
    concat('CONTRA_ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `CONTRA_ACCOUNT_NUMBER`,
    concat('RETIREMENT_ACCOUNT_CLASS_', format_string('%02d', idx)) AS `RETIREMENT_ACCOUNT_CLASS_INDICATOR`,
    idx AS `REQUEST_CREATION_DATE`,
    concat('REQUEST_CREATION_USER_ID_', format_string('%02d', idx)) AS `REQUEST_CREATION_USER_ID`,
    idx AS `LAST_UPDATE_DATE`,
    concat('LAST_UPDATE_USER_ID_', format_string('%02d', idx)) AS `LAST_UPDATE_USER_ID`,
    TRY_CAST(idx * 100.25 AS DECIMAL(16,2)) AS `TOTAL_MARKET_VALUE_OF_TRANSFER`,
    concat('TOTAL_MARKET_VALUE_SIGN_', format_string('%02d', idx)) AS `TOTAL_MARKET_VALUE_SIGN`,
    concat('SOURCE_CODE_', format_string('%02d', idx)) AS `SOURCE_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(16,2)) AS `SPECIAL_MEMORANDUM_ACCOUNT`,
    concat('SPECIAL_MEMORANDUM_ACCOU_', format_string('%02d', idx)) AS `SPECIAL_MEMORANDUM_ACCOUNT_SIGN`,
    concat('CUSTOMER_NAME_', format_string('%02d', idx)) AS `CUSTOMER_NAME`,
    concat('PRIMARY_TAX_IDENTIFICATI_', format_string('%02d', idx)) AS `PRIMARY_TAX_IDENTIFICATION_NUMBER`,
    concat('NSCC_ACCOUNT_TYPE_', format_string('%02d', idx)) AS `NSCC_ACCOUNT_TYPE`,
    concat('NSCC_STATUS_', format_string('%02d', idx)) AS `NSCC_STATUS`,
    concat('NUMBER_OF_DAYS_IN_NSCC_S_', format_string('%02d', idx)) AS `NUMBER_OF_DAYS_IN_NSCC_STATUS`,
    concat('NSCC_CONTROL_NUMBER_', format_string('%02d', idx)) AS `NSCC_CONTROL_NUMBER`,
    concat('REASON_CODE_FOR_REJECT_', format_string('%02d', idx)) AS `REASON_CODE_FOR_REJECT`,
    concat('REASON_COMMENTS_', format_string('%02d', idx)) AS `REASON_COMMENTS`,
    concat('REQUEST_ID_', format_string('%02d', idx)) AS `REQUEST_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_aca2_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_aca2_a;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_dbt/landing-pershing_aca2_d.dbt.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ACA2_D"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_aca2_d (
    `TRANSACTION_CODE` STRING,
    `RECORD_INDICATOR_TRANSFER_TYPE` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `INVESTMENT_PROFESSIONAL` STRING,
    `RECORD_TYPE` STRING,
    `TRANSFER_TYPE` STRING,
    `TRANSFER_STATUS` STRING,
    `NUMBER_OF_DAYS_IN_PERSHING_STATUS` STRING,
    `CONTRA_BROKER_NUMBER` STRING,
    `CONTRA_BROKER_NAME` STRING,
    `CONTRA_ACCOUNT_NUMBER` STRING,
    `RETIREMENT_ACCOUNT_CLASS_INDICATOR` STRING,
    `REQUEST_CREATION_DATE` INT,
    `REQUEST_CREATION_USER_ID` STRING,
    `LAST_UPDATE_DATE` INT,
    `LAST_UPDATE_USER_ID` STRING,
    `TOTAL_MARKET_VALUE_OF_TRANSFER` DECIMAL(16,2),
    `TOTAL_MARKET_VALUE_SIGN` STRING,
    `SOURCE_CODE` STRING,
    `SPECIAL_MEMORANDUM_ACCOUNT` DECIMAL(16,2),
    `SPECIAL_MEMORANDUM_ACCOUNT_SIGN` STRING,
    `CUSTOMER_NAME` STRING,
    `PRIMARY_TAX_IDENTIFICATION_NUMBER` STRING,
    `NSCC_ACCOUNT_TYPE` STRING,
    `NSCC_STATUS` STRING,
    `NUMBER_OF_DAYS_IN_NSCC_STATUS` STRING,
    `NSCC_CONTROL_NUMBER` STRING,
    `REASON_CODE_FOR_REJECT` STRING,
    `REASON_COMMENTS` STRING,
    `REQUEST_ID` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_aca2_d IS
'The table contains Pershing ACATS transfer record D data with account identifiers, transfer status, contra broker details, request metadata, market values, NSCC status, reject reasons, and data-date controls. It supports landing-layer validation for transfer monitoring, exception review, and downstream brokerage operations reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_aca2_d;

INSERT INTO landing_pershing.default.pershing_aca2_d (
    `TRANSACTION_CODE`, `RECORD_INDICATOR_TRANSFER_TYPE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `INVESTMENT_PROFESSIONAL`, `RECORD_TYPE`,
    `TRANSFER_TYPE`, `TRANSFER_STATUS`, `NUMBER_OF_DAYS_IN_PERSHING_STATUS`, `CONTRA_BROKER_NUMBER`, `CONTRA_BROKER_NAME`, `CONTRA_ACCOUNT_NUMBER`,
    `RETIREMENT_ACCOUNT_CLASS_INDICATOR`, `REQUEST_CREATION_DATE`, `REQUEST_CREATION_USER_ID`, `LAST_UPDATE_DATE`, `LAST_UPDATE_USER_ID`, `TOTAL_MARKET_VALUE_OF_TRANSFER`,
    `TOTAL_MARKET_VALUE_SIGN`, `SOURCE_CODE`, `SPECIAL_MEMORANDUM_ACCOUNT`, `SPECIAL_MEMORANDUM_ACCOUNT_SIGN`, `CUSTOMER_NAME`, `PRIMARY_TAX_IDENTIFICATION_NUMBER`,
    `NSCC_ACCOUNT_TYPE`, `NSCC_STATUS`, `NUMBER_OF_DAYS_IN_NSCC_STATUS`, `NSCC_CONTROL_NUMBER`, `REASON_CODE_FOR_REJECT`, `REASON_COMMENTS`,
    `REQUEST_ID`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    concat('RECORD_INDICATOR_TRANSFE_', format_string('%02d', idx)) AS `RECORD_INDICATOR_TRANSFER_TYPE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('INVESTMENT_PROFESSIONAL_', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL`,
    concat('RECORD_TYPE_', format_string('%02d', idx)) AS `RECORD_TYPE`,
    concat('TRANSFER_TYPE_', format_string('%02d', idx)) AS `TRANSFER_TYPE`,
    concat('TRANSFER_STATUS_', format_string('%02d', idx)) AS `TRANSFER_STATUS`,
    concat('NUMBER_OF_DAYS_IN_PERSHI_', format_string('%02d', idx)) AS `NUMBER_OF_DAYS_IN_PERSHING_STATUS`,
    concat('CONTRA_BROKER_NUMBER_', format_string('%02d', idx)) AS `CONTRA_BROKER_NUMBER`,
    concat('CONTRA_BROKER_NAME_', format_string('%02d', idx)) AS `CONTRA_BROKER_NAME`,
    concat('CONTRA_ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `CONTRA_ACCOUNT_NUMBER`,
    concat('RETIREMENT_ACCOUNT_CLASS_', format_string('%02d', idx)) AS `RETIREMENT_ACCOUNT_CLASS_INDICATOR`,
    idx AS `REQUEST_CREATION_DATE`,
    concat('REQUEST_CREATION_USER_ID_', format_string('%02d', idx)) AS `REQUEST_CREATION_USER_ID`,
    idx AS `LAST_UPDATE_DATE`,
    concat('LAST_UPDATE_USER_ID_', format_string('%02d', idx)) AS `LAST_UPDATE_USER_ID`,
    TRY_CAST(idx * 100.25 AS DECIMAL(16,2)) AS `TOTAL_MARKET_VALUE_OF_TRANSFER`,
    concat('TOTAL_MARKET_VALUE_SIGN_', format_string('%02d', idx)) AS `TOTAL_MARKET_VALUE_SIGN`,
    concat('SOURCE_CODE_', format_string('%02d', idx)) AS `SOURCE_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(16,2)) AS `SPECIAL_MEMORANDUM_ACCOUNT`,
    concat('SPECIAL_MEMORANDUM_ACCOU_', format_string('%02d', idx)) AS `SPECIAL_MEMORANDUM_ACCOUNT_SIGN`,
    concat('CUSTOMER_NAME_', format_string('%02d', idx)) AS `CUSTOMER_NAME`,
    concat('PRIMARY_TAX_IDENTIFICATI_', format_string('%02d', idx)) AS `PRIMARY_TAX_IDENTIFICATION_NUMBER`,
    concat('NSCC_ACCOUNT_TYPE_', format_string('%02d', idx)) AS `NSCC_ACCOUNT_TYPE`,
    concat('NSCC_STATUS_', format_string('%02d', idx)) AS `NSCC_STATUS`,
    concat('NUMBER_OF_DAYS_IN_NSCC_S_', format_string('%02d', idx)) AS `NUMBER_OF_DAYS_IN_NSCC_STATUS`,
    concat('NSCC_CONTROL_NUMBER_', format_string('%02d', idx)) AS `NSCC_CONTROL_NUMBER`,
    concat('REASON_CODE_FOR_REJECT_', format_string('%02d', idx)) AS `REASON_CODE_FOR_REJECT`,
    concat('REASON_COMMENTS_', format_string('%02d', idx)) AS `REASON_COMMENTS`,
    concat('REQUEST_ID_', format_string('%02d', idx)) AS `REQUEST_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_aca2_d' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_aca2_d;
