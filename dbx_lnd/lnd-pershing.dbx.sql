
-- Databricks SQL for source: pershingdataprod
-- Generated from sqlserver_landing_desc/landing-pershingdataprod_caps_rec_hist-desc.ms.txt

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
-- Generated from sqlserver_landing_desc/landing-pershingdataprod_master_asset-desc.ms.txt

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
-- Generated from sqlserver_landing_desc/landing-pershingdataprod_pershing-desc.ms.txt

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
-- Generated from sqlserver_landing_desc/landing-pershingdataprod_transfer-desc.ms.txt

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
-- Generated from sqlserver_landing_dbt/landing-pers_accf.dbt.ms.sql

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
-- Generated from sqlserver_landing_dbt/landing-pers_pershing.dbt.ms.sql

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
-- Generated from sqlserver_landing_dbt/landing-pershing_aca2_a.dbt.ms.sql

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
-- Generated from sqlserver_landing_dbt/landing-pershing_aca2_d.dbt.ms.sql

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
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_accf_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ACCF_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_accf_a (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `ACCOUNT_NUMBER` STRING,
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `ACCOUNT_SHORT_NAME` STRING,
    `TRANSACTION_TYPE` STRING,
    `AUTO_TITLED_OR_USER_TITLED_ACCOUNT` STRING,
    `ACCOUNT_TYPE_CODE` STRING,
    `REGISTRATION_TYPE` STRING,
    `NUMBER_OF_ACCOUNT_TITLE_LINES_IN_REGISTRATION_LINES` INT,
    `ACCOUNT_REGISTRATION_LINE_1` STRING,
    `ACCOUNT_REGISTRATION_LINE_2` STRING,
    `ACCOUNT_REGISTRATION_LINE_3` STRING,
    `ACCOUNT_REGISTRATION_LINE_4` STRING,
    `ACCOUNT_REGISTRATION_LINE_5` STRING,
    `ACCOUNT_REGISTRATION_LINE_6` STRING,
    `US_TENANCY_INDICATOR` STRING,
    `MARRIED_INDICATOR` STRING,
    `TENANCY_STATE` STRING,
    `JOINT_TENANCY_CLAUSE` STRING,
    `AGREEMENT_EXECUTION_DATE` DATE,
    `NUMBER_OF_TENANTS` INT,
    `STATE_GIFT_GIVEN` STRING,
    `DATE_GIFT_GIVEN` DATE,
    `AGE_TO_TERMINATE` INT,
    `MINORS_BIRTHDATE` DATE,
    `MANNER_OF_GIFT` STRING,
    `TYPE_OF_TRUST` STRING,
    `DATE_TRUST_ESTABLISHED` DATE,
    `AMENDED_DATE` DATE,
    `TRUSTEE_INDEPENDENT_ACTION` STRING,
    `PLAN_ESTABLISHED_DATE` DATE,
    `PLAN_AMENDMENT_DATE` DATE,
    `DATE_ACCOUNT_OPENED` DATE,
    `DATE_ACCOUNT_INFORMATION_UPDATED` DATE,
    `ACCOUNT_STATUS_INDICATOR` STRING,
    `PENDING_CLOSED_DATE` DATE,
    `DATE_ACCOUNT_CLOSED` DATE,
    `CLOSING_NOTICE_DATE` DATE,
    `ACCOUNT_REACTIVATED_DATE` DATE,
    `DATE_ACCOUNT_REOPENED` DATE,
    `PROCEEDS` STRING,
    `TRANSFER_INSTRUCTIONS` STRING,
    `INCOME_INSTRUCTIONS` STRING,
    `NUMBER_OF_CONFIRMS_FOR_THIS_ACCOUNT` INT,
    `NUMBER_OF_STATEMENTS_FOR_THIS_ACCOUNT` INT,
    `INVESTMENT_OBJECTIVE_TRANSACTION_CODE` STRING,
    `COMMENTS` STRING,
    `EMPLOYER_SHORTNAME` STRING,
    `EMPLOYERS_CUSIP` STRING,
    `EMPLOYERS_SYMBOL` STRING,
    `MARGIN_PRIVILEGES_REVOKED` STRING,
    `STATEMENT_REVIEW_DATE` DATE,
    `MARGIN_PAPERS_ON_FILE` STRING,
    `OPTION_PAPERS_ON_FILE` STRING,
    `GOOD_FAITH_MARGIN` STRING,
    `INVESTMENT_PROFESSIONAL_DISCRETION_GRANTED` STRING,
    `INVESTMENT_ADVISOR_DISCRETION_GRANTED` STRING,
    `THIRD_PARTY_DISCRETION_GRANTED` STRING,
    `THIRD_PARTY_NAME` STRING,
    `RISK_FACTOR_CODE` DECIMAL(38,10),
    `INVESTMENT_OBJECTIVE_CODE` STRING,
    `OPTION_EQUITIES` STRING,
    `OPTION_INDEX` STRING,
    `OPTION_DEBT` STRING,
    `OPTION_CURRENCY` STRING,
    `OPTION_LEVEL_1` STRING,
    `OPTION_LEVEL_2` STRING,
    `OPTION_LEVEL_3` STRING,
    `OPTION_LEVEL_4` STRING,
    `OPTION_CALL_LIMITS` DECIMAL(10,0),
    `OPTION_PUT_LIMITS` DECIMAL(10,0),
    `OPTION_TOTAL_LIMITS_OF_PUTS_AND_CALLS` DECIMAL(10,0),
    `NON_US_DOLLAR_TRADING` DECIMAL(38,10),
    `NON_CUSTOMER_INDICATOR` STRING,
    `THIRD_PARTY_FEE_INDICATOR` DECIMAL(38,10),
    `THIRD_PARTY_FEE_APPROVAL_DATE` DATE,
    `INTERMEDIARY_ACCOUNT_INDICATOR` STRING,
    `COMMISSION_SCHEDULE` STRING,
    `GROUP_INDEX` STRING,
    `MONEY_MANAGER_ID` STRING,
    `MONEY_MANAGER_OBJECTIVE` STRING,
    `DTC_ID_CONFIRM_NUMBER_FOR_NON_COD_ACCOUNT` STRING,
    `CAPS_MASTER_MNEMONIC` STRING,
    `EMPLOYEE_ID` STRING,
    `PRIME_BROKER_FREE_FUND_INDICATOR` STRING,
    `FEE_BASED_ACCOUNT_INDICATOR` DECIMAL(38,10),
    `FEE_BASED_TERMINATION_DATE` DATE,
    `PLAN_NAME` STRING,
    `SELFDIRECTED_401_k_ACCOUNT_TYPE` STRING,
    `PLAN_TYPE` STRING,
    `PLAN_NUMBER` STRING,
    `EMPLOYEE_RELATIVE_INDICATOR` STRING,
    `BLOCK_MUTUAL_FUND_FEES` DECIMAL(38,10),
    `NAME_OF_INVESTMENT_PROFESSIONAL_WHO_SIGNED_NEW_ACCOUNT_FORM` STRING,
    `DATE_INVESTMENT_PROFESSIONAL_SIGNED_NEW_ACCOUNT_FORM` DATE,
    `NAME_OF_PRINCIPAL_WHO_SIGNED_NEW_ACCOUNT_FORM` STRING,
    `DATE_PRINCIPAL_SIGNED_NEW_ACCOUNT_FORM` DATE,
    `POLITICALLY_EXPOSED_PERSON_INDICATOR` STRING,
    `PRIVATE_BANKING_ACCOUNT_INDICATOR` STRING,
    `FOREIGN_BANK_ACCOUNT_INDICATOR` STRING,
    `INITIAL_SOURCE_OF_FUNDS` STRING,
    `USA_PATRIOT_ACT_EXEMPT_REASON` STRING,
    `PRIMARY_COUNTRY_OF_CITIZENSHIP` STRING,
    `COUNTRY_OF_RESIDENCE` STRING,
    `BIRTH_DATE` DATE,
    `AGEBASED_FUND_ROLL_EXEMPT_INDICATOR` STRING,
    `MONEY_FUND_REFORM_RETAIL` STRING,
    `TRUSTED_CONTACT_STATUS` STRING,
    `REGULATORY_ACCOUNT_TYPE_CATEGORY` STRING,
    `ACCOUNT_MANAGED_BY_TRUST_COMPANY_INDICATOR` STRING,
    `VOTING_AUTHORITY` STRING,
    `Internal_Use_IMS_Prime_Broker_Code` STRING,
    `Internal_Use_Payout_Code` STRING,
    `Internal_Use_Trader_Number` STRING,
    `Internal_Use_Product_Code` STRING,
    `CUSTOMER_TYPE` STRING,
    `Internal_Use_Account_Plan_Type` STRING,
    `Internal_Use_Promotion_Type` STRING,
    `Internal_Use_Investment_Objective_1` STRING,
    `Internal_Use_Investment_Objective_2` STRING,
    `Internal_Use_Investment_Objective_3` STRING,
    `FULFILLMENT_METHOD` STRING,
    `CREDIT_INTEREST_INDICATOR` DECIMAL(38,10),
    `AMA_INDICATOR` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_accf_a IS
'Pershing landing table containing account, registration, transfer, status, and control attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_accf_a;

INSERT INTO landing_pershing.default.pershing_accf_a (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `INVESTMENT_PROFESSIONAL_IP_NUMBER`, `ACCOUNT_SHORT_NAME`, `TRANSACTION_TYPE`, `AUTO_TITLED_OR_USER_TITLED_ACCOUNT`,
    `ACCOUNT_TYPE_CODE`, `REGISTRATION_TYPE`, `NUMBER_OF_ACCOUNT_TITLE_LINES_IN_REGISTRATION_LINES`,
    `ACCOUNT_REGISTRATION_LINE_1`, `ACCOUNT_REGISTRATION_LINE_2`, `ACCOUNT_REGISTRATION_LINE_3`,
    `ACCOUNT_REGISTRATION_LINE_4`, `ACCOUNT_REGISTRATION_LINE_5`, `ACCOUNT_REGISTRATION_LINE_6`, `US_TENANCY_INDICATOR`,
    `MARRIED_INDICATOR`, `TENANCY_STATE`, `JOINT_TENANCY_CLAUSE`, `AGREEMENT_EXECUTION_DATE`, `NUMBER_OF_TENANTS`,
    `STATE_GIFT_GIVEN`, `DATE_GIFT_GIVEN`, `AGE_TO_TERMINATE`, `MINORS_BIRTHDATE`, `MANNER_OF_GIFT`, `TYPE_OF_TRUST`,
    `DATE_TRUST_ESTABLISHED`, `AMENDED_DATE`, `TRUSTEE_INDEPENDENT_ACTION`, `PLAN_ESTABLISHED_DATE`,
    `PLAN_AMENDMENT_DATE`, `DATE_ACCOUNT_OPENED`, `DATE_ACCOUNT_INFORMATION_UPDATED`, `ACCOUNT_STATUS_INDICATOR`,
    `PENDING_CLOSED_DATE`, `DATE_ACCOUNT_CLOSED`, `CLOSING_NOTICE_DATE`, `ACCOUNT_REACTIVATED_DATE`,
    `DATE_ACCOUNT_REOPENED`, `PROCEEDS`, `TRANSFER_INSTRUCTIONS`, `INCOME_INSTRUCTIONS`,
    `NUMBER_OF_CONFIRMS_FOR_THIS_ACCOUNT`, `NUMBER_OF_STATEMENTS_FOR_THIS_ACCOUNT`,
    `INVESTMENT_OBJECTIVE_TRANSACTION_CODE`, `COMMENTS`, `EMPLOYER_SHORTNAME`, `EMPLOYERS_CUSIP`, `EMPLOYERS_SYMBOL`,
    `MARGIN_PRIVILEGES_REVOKED`, `STATEMENT_REVIEW_DATE`, `MARGIN_PAPERS_ON_FILE`, `OPTION_PAPERS_ON_FILE`,
    `GOOD_FAITH_MARGIN`, `INVESTMENT_PROFESSIONAL_DISCRETION_GRANTED`, `INVESTMENT_ADVISOR_DISCRETION_GRANTED`,
    `THIRD_PARTY_DISCRETION_GRANTED`, `THIRD_PARTY_NAME`, `RISK_FACTOR_CODE`, `INVESTMENT_OBJECTIVE_CODE`,
    `OPTION_EQUITIES`, `OPTION_INDEX`, `OPTION_DEBT`, `OPTION_CURRENCY`, `OPTION_LEVEL_1`, `OPTION_LEVEL_2`,
    `OPTION_LEVEL_3`, `OPTION_LEVEL_4`, `OPTION_CALL_LIMITS`, `OPTION_PUT_LIMITS`,
    `OPTION_TOTAL_LIMITS_OF_PUTS_AND_CALLS`, `NON_US_DOLLAR_TRADING`, `NON_CUSTOMER_INDICATOR`,
    `THIRD_PARTY_FEE_INDICATOR`, `THIRD_PARTY_FEE_APPROVAL_DATE`, `INTERMEDIARY_ACCOUNT_INDICATOR`,
    `COMMISSION_SCHEDULE`, `GROUP_INDEX`, `MONEY_MANAGER_ID`, `MONEY_MANAGER_OBJECTIVE`,
    `DTC_ID_CONFIRM_NUMBER_FOR_NON_COD_ACCOUNT`, `CAPS_MASTER_MNEMONIC`, `EMPLOYEE_ID`,
    `PRIME_BROKER_FREE_FUND_INDICATOR`, `FEE_BASED_ACCOUNT_INDICATOR`, `FEE_BASED_TERMINATION_DATE`, `PLAN_NAME`,
    `SELFDIRECTED_401_k_ACCOUNT_TYPE`, `PLAN_TYPE`, `PLAN_NUMBER`, `EMPLOYEE_RELATIVE_INDICATOR`,
    `BLOCK_MUTUAL_FUND_FEES`, `NAME_OF_INVESTMENT_PROFESSIONAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    `DATE_INVESTMENT_PROFESSIONAL_SIGNED_NEW_ACCOUNT_FORM`, `NAME_OF_PRINCIPAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    `DATE_PRINCIPAL_SIGNED_NEW_ACCOUNT_FORM`, `POLITICALLY_EXPOSED_PERSON_INDICATOR`,
    `PRIVATE_BANKING_ACCOUNT_INDICATOR`, `FOREIGN_BANK_ACCOUNT_INDICATOR`, `INITIAL_SOURCE_OF_FUNDS`,
    `USA_PATRIOT_ACT_EXEMPT_REASON`, `PRIMARY_COUNTRY_OF_CITIZENSHIP`, `COUNTRY_OF_RESIDENCE`, `BIRTH_DATE`,
    `AGEBASED_FUND_ROLL_EXEMPT_INDICATOR`, `MONEY_FUND_REFORM_RETAIL`, `TRUSTED_CONTACT_STATUS`,
    `REGULATORY_ACCOUNT_TYPE_CATEGORY`, `ACCOUNT_MANAGED_BY_TRUST_COMPANY_INDICATOR`, `VOTING_AUTHORITY`,
    `Internal_Use_IMS_Prime_Broker_Code`, `Internal_Use_Payout_Code`, `Internal_Use_Trader_Number`,
    `Internal_Use_Product_Code`, `CUSTOMER_TYPE`, `Internal_Use_Account_Plan_Type`, `Internal_Use_Promotion_Type`,
    `Internal_Use_Investment_Objective_1`, `Internal_Use_Investment_Objective_2`, `Internal_Use_Investment_Objective_3`,
    `FULFILLMENT_METHOD`, `CREDIT_INTEREST_INDICATOR`, `AMA_INDICATOR`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('INVESTMENT_PROFESSIONAL__', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('ACCOUNT_SHORT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_SHORT_NAME`,
    concat('TRANSACTION_TYPE_', format_string('%02d', idx)) AS `TRANSACTION_TYPE`,
    concat('AUTO_TITLED_OR_USER_TITL_', format_string('%02d', idx)) AS `AUTO_TITLED_OR_USER_TITLED_ACCOUNT`,
    concat('ACCOUNT_TYPE_CODE_', format_string('%02d', idx)) AS `ACCOUNT_TYPE_CODE`,
    concat('REGISTRATION_TYPE_', format_string('%02d', idx)) AS `REGISTRATION_TYPE`,
    idx AS `NUMBER_OF_ACCOUNT_TITLE_LINES_IN_REGISTRATION_LINES`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_1`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_2`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_3`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_4`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_5`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_6`,
    concat('US_TENANCY_INDICATOR_', format_string('%02d', idx)) AS `US_TENANCY_INDICATOR`,
    concat('MARRIED_INDICATOR_', format_string('%02d', idx)) AS `MARRIED_INDICATOR`,
    concat('TENANCY_STATE_', format_string('%02d', idx)) AS `TENANCY_STATE`,
    concat('JOINT_TENANCY_CLAUSE_', format_string('%02d', idx)) AS `JOINT_TENANCY_CLAUSE`,
    date_add(DATE '2026-01-01', idx - 1) AS `AGREEMENT_EXECUTION_DATE`,
    idx AS `NUMBER_OF_TENANTS`,
    concat('STATE_GIFT_GIVEN_', format_string('%02d', idx)) AS `STATE_GIFT_GIVEN`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_GIFT_GIVEN`,
    idx AS `AGE_TO_TERMINATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `MINORS_BIRTHDATE`,
    concat('MANNER_OF_GIFT_', format_string('%02d', idx)) AS `MANNER_OF_GIFT`,
    concat('TYPE_OF_TRUST_', format_string('%02d', idx)) AS `TYPE_OF_TRUST`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_TRUST_ESTABLISHED`,
    date_add(DATE '2026-01-01', idx - 1) AS `AMENDED_DATE`,
    concat('TRUSTEE_INDEPENDENT_ACTI_', format_string('%02d', idx)) AS `TRUSTEE_INDEPENDENT_ACTION`,
    date_add(DATE '2026-01-01', idx - 1) AS `PLAN_ESTABLISHED_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `PLAN_AMENDMENT_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_ACCOUNT_OPENED`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_ACCOUNT_INFORMATION_UPDATED`,
    concat('ACCOUNT_STATUS_INDICATOR_', format_string('%02d', idx)) AS `ACCOUNT_STATUS_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `PENDING_CLOSED_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_ACCOUNT_CLOSED`,
    date_add(DATE '2026-01-01', idx - 1) AS `CLOSING_NOTICE_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `ACCOUNT_REACTIVATED_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_ACCOUNT_REOPENED`,
    concat('PROCEEDS_', format_string('%02d', idx)) AS `PROCEEDS`,
    concat('TRANSFER_INSTRUCTIONS_', format_string('%02d', idx)) AS `TRANSFER_INSTRUCTIONS`,
    concat('INCOME_INSTRUCTIONS_', format_string('%02d', idx)) AS `INCOME_INSTRUCTIONS`,
    idx AS `NUMBER_OF_CONFIRMS_FOR_THIS_ACCOUNT`,
    idx AS `NUMBER_OF_STATEMENTS_FOR_THIS_ACCOUNT`,
    concat('INVESTMENT_OBJECTIVE_TRA_', format_string('%02d', idx)) AS `INVESTMENT_OBJECTIVE_TRANSACTION_CODE`,
    concat('COMMENTS_', format_string('%02d', idx)) AS `COMMENTS`,
    concat('EMPLOYER_SHORTNAME_', format_string('%02d', idx)) AS `EMPLOYER_SHORTNAME`,
    concat('EMPLOYERS_CUSIP_', format_string('%02d', idx)) AS `EMPLOYERS_CUSIP`,
    concat('EMPLOYERS_SYMBOL_', format_string('%02d', idx)) AS `EMPLOYERS_SYMBOL`,
    concat('MARGIN_PRIVILEGES_REVOKE_', format_string('%02d', idx)) AS `MARGIN_PRIVILEGES_REVOKED`,
    date_add(DATE '2026-01-01', idx - 1) AS `STATEMENT_REVIEW_DATE`,
    concat('MARGIN_PAPERS_ON_FILE_', format_string('%02d', idx)) AS `MARGIN_PAPERS_ON_FILE`,
    concat('OPTION_PAPERS_ON_FILE_', format_string('%02d', idx)) AS `OPTION_PAPERS_ON_FILE`,
    concat('GOOD_FAITH_MARGIN_', format_string('%02d', idx)) AS `GOOD_FAITH_MARGIN`,
    concat('INVESTMENT_PROFESSIONAL__', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL_DISCRETION_GRANTED`,
    concat('INVESTMENT_ADVISOR_DISCR_', format_string('%02d', idx)) AS `INVESTMENT_ADVISOR_DISCRETION_GRANTED`,
    concat('THIRD_PARTY_DISCRETION_G_', format_string('%02d', idx)) AS `THIRD_PARTY_DISCRETION_GRANTED`,
    concat('THIRD_PARTY_NAME_', format_string('%02d', idx)) AS `THIRD_PARTY_NAME`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RISK_FACTOR_CODE`,
    concat('INVESTMENT_OBJECTIVE_COD_', format_string('%02d', idx)) AS `INVESTMENT_OBJECTIVE_CODE`,
    concat('OPTION_EQUITIES_', format_string('%02d', idx)) AS `OPTION_EQUITIES`,
    concat('OPTION_INDEX_', format_string('%02d', idx)) AS `OPTION_INDEX`,
    concat('OPTION_DEBT_', format_string('%02d', idx)) AS `OPTION_DEBT`,
    concat('OPTION_CURRENCY_', format_string('%02d', idx)) AS `OPTION_CURRENCY`,
    concat('OPTION_LEVEL_1_', format_string('%02d', idx)) AS `OPTION_LEVEL_1`,
    concat('OPTION_LEVEL_2_', format_string('%02d', idx)) AS `OPTION_LEVEL_2`,
    concat('OPTION_LEVEL_3_', format_string('%02d', idx)) AS `OPTION_LEVEL_3`,
    concat('OPTION_LEVEL_4_', format_string('%02d', idx)) AS `OPTION_LEVEL_4`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,0)) AS `OPTION_CALL_LIMITS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,0)) AS `OPTION_PUT_LIMITS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,0)) AS `OPTION_TOTAL_LIMITS_OF_PUTS_AND_CALLS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `NON_US_DOLLAR_TRADING`,
    concat('NON_CUSTOMER_INDICATOR_', format_string('%02d', idx)) AS `NON_CUSTOMER_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `THIRD_PARTY_FEE_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `THIRD_PARTY_FEE_APPROVAL_DATE`,
    concat('INTERMEDIARY_ACCOUNT_IND_', format_string('%02d', idx)) AS `INTERMEDIARY_ACCOUNT_INDICATOR`,
    concat('COMMISSION_SCHEDULE_', format_string('%02d', idx)) AS `COMMISSION_SCHEDULE`,
    concat('GROUP_INDEX_', format_string('%02d', idx)) AS `GROUP_INDEX`,
    concat('MONEY_MANAGER_ID_', format_string('%02d', idx)) AS `MONEY_MANAGER_ID`,
    concat('MONEY_MANAGER_OBJECTIVE_', format_string('%02d', idx)) AS `MONEY_MANAGER_OBJECTIVE`,
    concat('DTC_ID_CONFIRM_NUMBER_FO_', format_string('%02d', idx)) AS `DTC_ID_CONFIRM_NUMBER_FOR_NON_COD_ACCOUNT`,
    concat('CAPS_MASTER_MNEMONIC_', format_string('%02d', idx)) AS `CAPS_MASTER_MNEMONIC`,
    concat('EMPLOYEE_ID_', format_string('%02d', idx)) AS `EMPLOYEE_ID`,
    concat('PRIME_BROKER_FREE_FUND_I_', format_string('%02d', idx)) AS `PRIME_BROKER_FREE_FUND_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `FEE_BASED_ACCOUNT_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `FEE_BASED_TERMINATION_DATE`,
    concat('PLAN_NAME_', format_string('%02d', idx)) AS `PLAN_NAME`,
    concat('SELFDIRECTED_401_k_ACCOU_', format_string('%02d', idx)) AS `SELFDIRECTED_401_k_ACCOUNT_TYPE`,
    concat('PLAN_TYPE_', format_string('%02d', idx)) AS `PLAN_TYPE`,
    concat('PLAN_NUMBER_', format_string('%02d', idx)) AS `PLAN_NUMBER`,
    concat('EMPLOYEE_RELATIVE_INDICA_', format_string('%02d', idx)) AS `EMPLOYEE_RELATIVE_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `BLOCK_MUTUAL_FUND_FEES`,
    concat('NAME_OF_INVESTMENT_PROFE_', format_string('%02d', idx)) AS `NAME_OF_INVESTMENT_PROFESSIONAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_INVESTMENT_PROFESSIONAL_SIGNED_NEW_ACCOUNT_FORM`,
    concat('NAME_OF_PRINCIPAL_WHO_SI_', format_string('%02d', idx)) AS `NAME_OF_PRINCIPAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_PRINCIPAL_SIGNED_NEW_ACCOUNT_FORM`,
    concat('POLITICALLY_EXPOSED_PERS_', format_string('%02d', idx)) AS `POLITICALLY_EXPOSED_PERSON_INDICATOR`,
    concat('PRIVATE_BANKING_ACCOUNT__', format_string('%02d', idx)) AS `PRIVATE_BANKING_ACCOUNT_INDICATOR`,
    concat('FOREIGN_BANK_ACCOUNT_IND_', format_string('%02d', idx)) AS `FOREIGN_BANK_ACCOUNT_INDICATOR`,
    concat('INITIAL_SOURCE_OF_FUNDS_', format_string('%02d', idx)) AS `INITIAL_SOURCE_OF_FUNDS`,
    concat('USA_PATRIOT_ACT_EXEMPT_R_', format_string('%02d', idx)) AS `USA_PATRIOT_ACT_EXEMPT_REASON`,
    concat('PRIMARY_COUNTRY_OF_CITIZ_', format_string('%02d', idx)) AS `PRIMARY_COUNTRY_OF_CITIZENSHIP`,
    concat('COUNTRY_OF_RESIDENCE_', format_string('%02d', idx)) AS `COUNTRY_OF_RESIDENCE`,
    date_add(DATE '2026-01-01', idx - 1) AS `BIRTH_DATE`,
    concat('AGEBASED_FUND_ROLL_EXEMP_', format_string('%02d', idx)) AS `AGEBASED_FUND_ROLL_EXEMPT_INDICATOR`,
    concat('MONEY_FUND_REFORM_RETAIL_', format_string('%02d', idx)) AS `MONEY_FUND_REFORM_RETAIL`,
    concat('TRUSTED_CONTACT_STATUS_', format_string('%02d', idx)) AS `TRUSTED_CONTACT_STATUS`,
    concat('REGULATORY_ACCOUNT_TYPE__', format_string('%02d', idx)) AS `REGULATORY_ACCOUNT_TYPE_CATEGORY`,
    concat('ACCOUNT_MANAGED_BY_TRUST_', format_string('%02d', idx)) AS `ACCOUNT_MANAGED_BY_TRUST_COMPANY_INDICATOR`,
    concat('VOTING_AUTHORITY_', format_string('%02d', idx)) AS `VOTING_AUTHORITY`,
    concat('Internal_Use_IMS_Prime_B_', format_string('%02d', idx)) AS `Internal_Use_IMS_Prime_Broker_Code`,
    concat('Internal_Use_Payout_Code_', format_string('%02d', idx)) AS `Internal_Use_Payout_Code`,
    concat('Internal_Use_Trader_Numb_', format_string('%02d', idx)) AS `Internal_Use_Trader_Number`,
    concat('Internal_Use_Product_Cod_', format_string('%02d', idx)) AS `Internal_Use_Product_Code`,
    concat('CUSTOMER_TYPE_', format_string('%02d', idx)) AS `CUSTOMER_TYPE`,
    concat('Internal_Use_Account_Pla_', format_string('%02d', idx)) AS `Internal_Use_Account_Plan_Type`,
    concat('Internal_Use_Promotion_T_', format_string('%02d', idx)) AS `Internal_Use_Promotion_Type`,
    concat('Internal_Use_Investment__', format_string('%02d', idx)) AS `Internal_Use_Investment_Objective_1`,
    concat('Internal_Use_Investment__', format_string('%02d', idx)) AS `Internal_Use_Investment_Objective_2`,
    concat('Internal_Use_Investment__', format_string('%02d', idx)) AS `Internal_Use_Investment_Objective_3`,
    concat('FULFILLMENT_METHOD_', format_string('%02d', idx)) AS `FULFILLMENT_METHOD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CREDIT_INTEREST_INDICATOR`,
    concat('AMA_INDICATOR_', format_string('%02d', idx)) AS `AMA_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_accf_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_accf_a;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_accf_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ACCF_B"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_accf_b (
    `TRANSACTION_CODE` STRING,
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `ACCOUNT_NUMBER` STRING,
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `ACCOUNT_SHORT_NAME` STRING,
    `TAX_ID_TYPE` STRING,
    `TAX_ID_NUMBER` STRING,
    `DATE_TAX_ID_APPLIED_FOR` DATE,
    `W_8_W_9_INDICATOR` STRING,
    `W8_W_9_DATE_SIGNED` DATE,
    `W_8_W_9_EFFECTIVE_RECEIVED_DATE` DATE,
    `W_8_W_9_DOCUMENT_TYPE` STRING,
    `TAX_STATUS` STRING,
    `B_NOTICE_REASON_CODE` STRING,
    `FIRST_B_NOTICE_STATUS` STRING,
    `DATE_FIRST_B_NOTICE_STATUS_ISSUED_ENFORCED` DATE,
    `DATE_FIRST_B_NOTICE_STATUS_SATISFIED` DATE,
    `SECOND_B_NOTICE_STATUS` STRING,
    `DATE_SECOND_B_NOTICE_STATUS_ISSUED_ENFORCED` DATE,
    `DATE_SECOND_B_NOTICE_STATUS_SATISFIED` DATE,
    `C_NOTICE_STATUS` STRING,
    `DATE_C_NOTICE_STATUS_ISSUED_ENFORCED` DATE,
    `DATE_C_NOTICE_STATUS_SATISFIED` DATE,
    `OLD_ACCOUNT_NUMBER` STRING,
    `ORIGINAL_ACCOUNT_OPEN_DATE` DATE,
    `UNIDENTIFIED_LARGE_TRADER_ID` STRING,
    `LARGE_TRADER_TYPE_CODE` STRING,
    `LARGE_TRADER_TYPE_LAST_CHANGE_DATE` DATE,
    `INITIAL_SOURCE_OF_FUNDS` STRING,
    `ACCOUNT_FUNDING_DATE` DATE,
    `REGULATORY_BLOCK_INDICATOR` STRING,
    `STATEMENT_CURRENCY_CODE` STRING,
    `FUTURE_STATEMENT_CURRENCY_CODE` STRING,
    `FUTURE_STATEMENT_CURRENCY_CODE_DATE` DATE,
    `ACCOUNT_LEVEL_ROUTING_CODE` STRING,
    `SELF_DIRECTED_INDICATOR` STRING,
    `DIGITAL_ADVICE_INDICATOR` STRING,
    `PROHIBITED_TRANSACTON_EXEMPTION_PTE_86_128_ACCOUNT_INDICATOR` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_1` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_2` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_3` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_4` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_5` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_6` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_7` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_8` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_9` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_10` STRING,
    `ALERT_IM_ACRONYM` STRING,
    `ALERT_IM_ACCESS_CODE` STRING,
    `BROKER_ACRONYM` STRING,
    `CROSS_REFERENCED_INDICATOR` STRING,
    `BNY_TRUST_INDICATOR` STRING,
    `SOURCE_OF_ASSETS_AT_ACCOUNT_OPENING` STRING,
    `COMMISSION_DISCOUNT_CODE` STRING,
    `EXTERNAL_ACCOUNT_NUMBER` STRING,
    `CONFIRMATION_SUPPRESSION_INDICATOR` STRING,
    `DATE_LAST_BOOKS_RECORDS_MAILING_SENT_TO` DATE,
    `DATE_LAST_BOOKS_AND_RECORDS_MAILING_SENT_TO_CUSTOMER_OUTSIDE_PERSHING_SYSTEM` DATE,
    `FULLY_PAID_LENDING_AGREEMENT_INDICATOR` STRING,
    `FULLY_PAID_LENDING_AGREEMENT_DATE` DATE,
    `CUSTODIAN_ACCOUNT_TYPE` STRING,
    `MARKETS_IN_FINANCIAL_INSTRUMENTS_DIRECTIVE_MIFID_CUSTOMER_CATEGORIZATION` STRING,
    `CASH_MANAGEMENT_TRANSACTION_CODE` STRING,
    `SWEEP_STATUS_INDICATOR` STRING,
    `DATE_SWEEP_ACTIVATED` DATE,
    `DATE_SWEEP_DETAILS_CHANGED` DATE,
    `COVER_MARGIN_DEBIT_INDICATOR` DECIMAL(38,10),
    `FIRST_FUND_SWEEP_ACCOUNT_ID` STRING,
    `FIRST_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY` STRING,
    `SECOND_FUND_SWEEP_ACCOUNT_ID` STRING,
    `SECOND_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY` STRING,
    `TYPE_OF_BANK_ACCOUNT` STRING,
    `BANKLINK_ABA_NUMBER` STRING,
    `BANKLINK_DDA_NUMBER` STRING,
    `FUND_BANK_INDICATOR` STRING,
    `W_9_CORPORATION_TAX_CLASSIFICATION_CODE` STRING,
    `COMBINED_MARGIN_ACCOUNT_INDICATOR` STRING,
    `PLEDGE_COLLATERAL_ACCOUNT_INDICATOR` STRING,
    `FINRA_INSTITUTIONAL_ACCOUNT_CODE` STRING,
    `PROPOSED_ACCOUNT_REFERENCE_ID` STRING,
    `ADVISOR_MODEL_ID` STRING,
    `FIRM_MODEL_STYLE_ID` STRING,
    `THIRD_PARTY_LENDER_INDICATOR` STRING,
    `RESERVED_FOR_FUTURE_THIRD_PARTY_LENDER_GROWTH` STRING,
    `DVP_RESTRICTION_CODE` STRING,
    `DVP_RESTRICTION_EXPIRATION_DATE` DATE,
    `ESCHEATMENT_WITHHOLDING_INDICATOR` STRING,
    `SOURCE_OF_ORIGINATION` STRING,
    `SOURCE_OF_PERSONA` STRING,
    `CLIENT_ON_BOARDING_METHOD` STRING,
    `TAX_FILING_CODE` STRING,
    `NON_PURPOSE_COLLATERAL_ACCOUNT_INDICATOR` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_accf_b IS
'Pershing landing table containing account, registration, transfer, status, and control attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_accf_b;

INSERT INTO landing_pershing.default.pershing_accf_b (
    `TRANSACTION_CODE`, `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`,
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `INVESTMENT_PROFESSIONAL_IP_NUMBER`, `ACCOUNT_SHORT_NAME`, `TAX_ID_TYPE`,
    `TAX_ID_NUMBER`, `DATE_TAX_ID_APPLIED_FOR`, `W_8_W_9_INDICATOR`, `W8_W_9_DATE_SIGNED`,
    `W_8_W_9_EFFECTIVE_RECEIVED_DATE`, `W_8_W_9_DOCUMENT_TYPE`, `TAX_STATUS`, `B_NOTICE_REASON_CODE`,
    `FIRST_B_NOTICE_STATUS`, `DATE_FIRST_B_NOTICE_STATUS_ISSUED_ENFORCED`, `DATE_FIRST_B_NOTICE_STATUS_SATISFIED`,
    `SECOND_B_NOTICE_STATUS`, `DATE_SECOND_B_NOTICE_STATUS_ISSUED_ENFORCED`, `DATE_SECOND_B_NOTICE_STATUS_SATISFIED`,
    `C_NOTICE_STATUS`, `DATE_C_NOTICE_STATUS_ISSUED_ENFORCED`, `DATE_C_NOTICE_STATUS_SATISFIED`, `OLD_ACCOUNT_NUMBER`,
    `ORIGINAL_ACCOUNT_OPEN_DATE`, `UNIDENTIFIED_LARGE_TRADER_ID`, `LARGE_TRADER_TYPE_CODE`,
    `LARGE_TRADER_TYPE_LAST_CHANGE_DATE`, `INITIAL_SOURCE_OF_FUNDS`, `ACCOUNT_FUNDING_DATE`,
    `REGULATORY_BLOCK_INDICATOR`, `STATEMENT_CURRENCY_CODE`, `FUTURE_STATEMENT_CURRENCY_CODE`,
    `FUTURE_STATEMENT_CURRENCY_CODE_DATE`, `ACCOUNT_LEVEL_ROUTING_CODE`, `SELF_DIRECTED_INDICATOR`,
    `DIGITAL_ADVICE_INDICATOR`, `PROHIBITED_TRANSACTON_EXEMPTION_PTE_86_128_ACCOUNT_INDICATOR`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_1`, `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_2`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_3`, `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_4`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_5`, `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_6`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_7`, `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_8`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_9`, `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_10`,
    `ALERT_IM_ACRONYM`, `ALERT_IM_ACCESS_CODE`, `BROKER_ACRONYM`, `CROSS_REFERENCED_INDICATOR`, `BNY_TRUST_INDICATOR`,
    `SOURCE_OF_ASSETS_AT_ACCOUNT_OPENING`, `COMMISSION_DISCOUNT_CODE`, `EXTERNAL_ACCOUNT_NUMBER`,
    `CONFIRMATION_SUPPRESSION_INDICATOR`, `DATE_LAST_BOOKS_RECORDS_MAILING_SENT_TO`,
    `DATE_LAST_BOOKS_AND_RECORDS_MAILING_SENT_TO_CUSTOMER_OUTSIDE_PERSHING_SYSTEM`,
    `FULLY_PAID_LENDING_AGREEMENT_INDICATOR`, `FULLY_PAID_LENDING_AGREEMENT_DATE`, `CUSTODIAN_ACCOUNT_TYPE`,
    `MARKETS_IN_FINANCIAL_INSTRUMENTS_DIRECTIVE_MIFID_CUSTOMER_CATEGORIZATION`, `CASH_MANAGEMENT_TRANSACTION_CODE`,
    `SWEEP_STATUS_INDICATOR`, `DATE_SWEEP_ACTIVATED`, `DATE_SWEEP_DETAILS_CHANGED`, `COVER_MARGIN_DEBIT_INDICATOR`,
    `FIRST_FUND_SWEEP_ACCOUNT_ID`, `FIRST_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`, `SECOND_FUND_SWEEP_ACCOUNT_ID`,
    `SECOND_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`, `TYPE_OF_BANK_ACCOUNT`, `BANKLINK_ABA_NUMBER`,
    `BANKLINK_DDA_NUMBER`, `FUND_BANK_INDICATOR`, `W_9_CORPORATION_TAX_CLASSIFICATION_CODE`,
    `COMBINED_MARGIN_ACCOUNT_INDICATOR`, `PLEDGE_COLLATERAL_ACCOUNT_INDICATOR`, `FINRA_INSTITUTIONAL_ACCOUNT_CODE`,
    `PROPOSED_ACCOUNT_REFERENCE_ID`, `ADVISOR_MODEL_ID`, `FIRM_MODEL_STYLE_ID`, `THIRD_PARTY_LENDER_INDICATOR`,
    `RESERVED_FOR_FUTURE_THIRD_PARTY_LENDER_GROWTH`, `DVP_RESTRICTION_CODE`, `DVP_RESTRICTION_EXPIRATION_DATE`,
    `ESCHEATMENT_WITHHOLDING_INDICATOR`, `SOURCE_OF_ORIGINATION`, `SOURCE_OF_PERSONA`, `CLIENT_ON_BOARDING_METHOD`,
    `TAX_FILING_CODE`, `NON_PURPOSE_COLLATERAL_ACCOUNT_INDICATOR`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('INVESTMENT_PROFESSIONAL__', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('ACCOUNT_SHORT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_SHORT_NAME`,
    concat('TAX_ID_TYPE_', format_string('%02d', idx)) AS `TAX_ID_TYPE`,
    concat('TAX_ID_NUMBER_', format_string('%02d', idx)) AS `TAX_ID_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_TAX_ID_APPLIED_FOR`,
    concat('W_8_W_9_INDICATOR_', format_string('%02d', idx)) AS `W_8_W_9_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `W8_W_9_DATE_SIGNED`,
    date_add(DATE '2026-01-01', idx - 1) AS `W_8_W_9_EFFECTIVE_RECEIVED_DATE`,
    concat('W_8_W_9_DOCUMENT_TYPE_', format_string('%02d', idx)) AS `W_8_W_9_DOCUMENT_TYPE`,
    concat('TAX_STATUS_', format_string('%02d', idx)) AS `TAX_STATUS`,
    concat('B_NOTICE_REASON_CODE_', format_string('%02d', idx)) AS `B_NOTICE_REASON_CODE`,
    concat('FIRST_B_NOTICE_STATUS_', format_string('%02d', idx)) AS `FIRST_B_NOTICE_STATUS`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_FIRST_B_NOTICE_STATUS_ISSUED_ENFORCED`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_FIRST_B_NOTICE_STATUS_SATISFIED`,
    concat('SECOND_B_NOTICE_STATUS_', format_string('%02d', idx)) AS `SECOND_B_NOTICE_STATUS`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_SECOND_B_NOTICE_STATUS_ISSUED_ENFORCED`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_SECOND_B_NOTICE_STATUS_SATISFIED`,
    concat('C_NOTICE_STATUS_', format_string('%02d', idx)) AS `C_NOTICE_STATUS`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_C_NOTICE_STATUS_ISSUED_ENFORCED`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_C_NOTICE_STATUS_SATISFIED`,
    concat('OLD_ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `OLD_ACCOUNT_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `ORIGINAL_ACCOUNT_OPEN_DATE`,
    concat('UNIDENTIFIED_LARGE_TRADE_', format_string('%02d', idx)) AS `UNIDENTIFIED_LARGE_TRADER_ID`,
    concat('LARGE_TRADER_TYPE_CODE_', format_string('%02d', idx)) AS `LARGE_TRADER_TYPE_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `LARGE_TRADER_TYPE_LAST_CHANGE_DATE`,
    concat('INITIAL_SOURCE_OF_FUNDS_', format_string('%02d', idx)) AS `INITIAL_SOURCE_OF_FUNDS`,
    date_add(DATE '2026-01-01', idx - 1) AS `ACCOUNT_FUNDING_DATE`,
    concat('REGULATORY_BLOCK_INDICAT_', format_string('%02d', idx)) AS `REGULATORY_BLOCK_INDICATOR`,
    concat('STATEMENT_CURRENCY_CODE_', format_string('%02d', idx)) AS `STATEMENT_CURRENCY_CODE`,
    concat('FUTURE_STATEMENT_CURRENC_', format_string('%02d', idx)) AS `FUTURE_STATEMENT_CURRENCY_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `FUTURE_STATEMENT_CURRENCY_CODE_DATE`,
    concat('ACCOUNT_LEVEL_ROUTING_CO_', format_string('%02d', idx)) AS `ACCOUNT_LEVEL_ROUTING_CODE`,
    concat('SELF_DIRECTED_INDICATOR_', format_string('%02d', idx)) AS `SELF_DIRECTED_INDICATOR`,
    concat('DIGITAL_ADVICE_INDICATOR_', format_string('%02d', idx)) AS `DIGITAL_ADVICE_INDICATOR`,
    concat('PROHIBITED_TRANSACTON_EX_', format_string('%02d', idx)) AS `PROHIBITED_TRANSACTON_EXEMPTION_PTE_86_128_ACCOUNT_INDICATOR`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_1`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_2`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_3`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_4`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_5`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_6`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_7`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_8`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_9`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_10`,
    concat('ALERT_IM_ACRONYM_', format_string('%02d', idx)) AS `ALERT_IM_ACRONYM`,
    concat('ALERT_IM_ACCESS_CODE_', format_string('%02d', idx)) AS `ALERT_IM_ACCESS_CODE`,
    concat('BROKER_ACRONYM_', format_string('%02d', idx)) AS `BROKER_ACRONYM`,
    concat('CROSS_REFERENCED_INDICAT_', format_string('%02d', idx)) AS `CROSS_REFERENCED_INDICATOR`,
    concat('BNY_TRUST_INDICATOR_', format_string('%02d', idx)) AS `BNY_TRUST_INDICATOR`,
    concat('SOURCE_OF_ASSETS_AT_ACCO_', format_string('%02d', idx)) AS `SOURCE_OF_ASSETS_AT_ACCOUNT_OPENING`,
    concat('COMMISSION_DISCOUNT_CODE_', format_string('%02d', idx)) AS `COMMISSION_DISCOUNT_CODE`,
    concat('EXTERNAL_ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `EXTERNAL_ACCOUNT_NUMBER`,
    concat('CONFIRMATION_SUPPRESSION_', format_string('%02d', idx)) AS `CONFIRMATION_SUPPRESSION_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_LAST_BOOKS_RECORDS_MAILING_SENT_TO`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_LAST_BOOKS_AND_RECORDS_MAILING_SENT_TO_CUSTOMER_OUTSIDE_PERSHING_SYSTEM`,
    concat('FULLY_PAID_LENDING_AGREE_', format_string('%02d', idx)) AS `FULLY_PAID_LENDING_AGREEMENT_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `FULLY_PAID_LENDING_AGREEMENT_DATE`,
    concat('CUSTODIAN_ACCOUNT_TYPE_', format_string('%02d', idx)) AS `CUSTODIAN_ACCOUNT_TYPE`,
    concat('MARKETS_IN_FINANCIAL_INS_', format_string('%02d', idx)) AS `MARKETS_IN_FINANCIAL_INSTRUMENTS_DIRECTIVE_MIFID_CUSTOMER_CATEGORIZATION`,
    concat('CASH_MANAGEMENT_TRANSACT_', format_string('%02d', idx)) AS `CASH_MANAGEMENT_TRANSACTION_CODE`,
    concat('SWEEP_STATUS_INDICATOR_', format_string('%02d', idx)) AS `SWEEP_STATUS_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_SWEEP_ACTIVATED`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_SWEEP_DETAILS_CHANGED`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `COVER_MARGIN_DEBIT_INDICATOR`,
    concat('FIRST_FUND_SWEEP_ACCOUNT_', format_string('%02d', idx)) AS `FIRST_FUND_SWEEP_ACCOUNT_ID`,
    concat('FIRST_FUND_SWEEP_ACCOUNT_', format_string('%02d', idx)) AS `FIRST_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`,
    concat('SECOND_FUND_SWEEP_ACCOUN_', format_string('%02d', idx)) AS `SECOND_FUND_SWEEP_ACCOUNT_ID`,
    concat('SECOND_FUND_SWEEP_ACCOUN_', format_string('%02d', idx)) AS `SECOND_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`,
    concat('TYPE_OF_BANK_ACCOUNT_', format_string('%02d', idx)) AS `TYPE_OF_BANK_ACCOUNT`,
    concat('BANKLINK_ABA_NUMBER_', format_string('%02d', idx)) AS `BANKLINK_ABA_NUMBER`,
    concat('BANKLINK_DDA_NUMBER_', format_string('%02d', idx)) AS `BANKLINK_DDA_NUMBER`,
    concat('FUND_BANK_INDICATOR_', format_string('%02d', idx)) AS `FUND_BANK_INDICATOR`,
    concat('W_9_CORPORATION_TAX_CLAS_', format_string('%02d', idx)) AS `W_9_CORPORATION_TAX_CLASSIFICATION_CODE`,
    concat('COMBINED_MARGIN_ACCOUNT__', format_string('%02d', idx)) AS `COMBINED_MARGIN_ACCOUNT_INDICATOR`,
    concat('PLEDGE_COLLATERAL_ACCOUN_', format_string('%02d', idx)) AS `PLEDGE_COLLATERAL_ACCOUNT_INDICATOR`,
    concat('FINRA_INSTITUTIONAL_ACCO_', format_string('%02d', idx)) AS `FINRA_INSTITUTIONAL_ACCOUNT_CODE`,
    concat('PROPOSED_ACCOUNT_REFEREN_', format_string('%02d', idx)) AS `PROPOSED_ACCOUNT_REFERENCE_ID`,
    concat('ADVISOR_MODEL_ID_', format_string('%02d', idx)) AS `ADVISOR_MODEL_ID`,
    concat('FIRM_MODEL_STYLE_ID_', format_string('%02d', idx)) AS `FIRM_MODEL_STYLE_ID`,
    concat('THIRD_PARTY_LENDER_INDIC_', format_string('%02d', idx)) AS `THIRD_PARTY_LENDER_INDICATOR`,
    concat('RESERVED_FOR_FUTURE_THIR_', format_string('%02d', idx)) AS `RESERVED_FOR_FUTURE_THIRD_PARTY_LENDER_GROWTH`,
    concat('DVP_RESTRICTION_CODE_', format_string('%02d', idx)) AS `DVP_RESTRICTION_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DVP_RESTRICTION_EXPIRATION_DATE`,
    concat('ESCHEATMENT_WITHHOLDING__', format_string('%02d', idx)) AS `ESCHEATMENT_WITHHOLDING_INDICATOR`,
    concat('SOURCE_OF_ORIGINATION_', format_string('%02d', idx)) AS `SOURCE_OF_ORIGINATION`,
    concat('SOURCE_OF_PERSONA_', format_string('%02d', idx)) AS `SOURCE_OF_PERSONA`,
    concat('CLIENT_ON_BOARDING_METHO_', format_string('%02d', idx)) AS `CLIENT_ON_BOARDING_METHOD`,
    concat('TAX_FILING_CODE_', format_string('%02d', idx)) AS `TAX_FILING_CODE`,
    concat('NON_PURPOSE_COLLATERAL_A_', format_string('%02d', idx)) AS `NON_PURPOSE_COLLATERAL_ACCOUNT_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_accf_b' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_accf_b;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_acct_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ACCT_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_acct_a (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `ACCOUNT_NUMBER` STRING,
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `ACCOUNT_SHORT_NAME` STRING,
    `TRANSACTION_TYPE` STRING,
    `AUTO_TITLED_OR_USER_TITLED_ACCOUNT` STRING,
    `ACCOUNT_TYPE_CODE` STRING,
    `REGISTRATION_TYPE` STRING,
    `NUMBER_OF_ACCOUNT_TITLE_LINES_IN_REGISTRATION_LINES` INT,
    `ACCOUNT_REGISTRATION_LINE_1` STRING,
    `ACCOUNT_REGISTRATION_LINE_2` STRING,
    `ACCOUNT_REGISTRATION_LINE_3` STRING,
    `ACCOUNT_REGISTRATION_LINE_4` STRING,
    `ACCOUNT_REGISTRATION_LINE_5` STRING,
    `ACCOUNT_REGISTRATION_LINE_6` STRING,
    `US_TENANCY_INDICATOR` STRING,
    `MARRIED_INDICATOR` STRING,
    `TENANCY_STATE` STRING,
    `JOINT_TENANCY_CLAUSE` STRING,
    `AGREEMENT_EXECUTION_DATE` DATE,
    `NUMBER_OF_TENANTS` INT,
    `STATE_GIFT_GIVEN` STRING,
    `DATE_GIFT_GIVEN` DATE,
    `AGE_TO_TERMINATE` INT,
    `MINORS_BIRTHDATE` DATE,
    `MANNER_OF_GIFT` STRING,
    `TYPE_OF_TRUST` STRING,
    `DATE_TRUST_ESTABLISHED` DATE,
    `AMENDED_DATE` DATE,
    `TRUSTEE_INDEPENDENT_ACTION` STRING,
    `PLAN_ESTABLISHED_DATE` DATE,
    `PLAN_AMENDMENT_DATE` DATE,
    `DATE_ACCOUNT_OPENED` DATE,
    `DATE_ACCOUNT_INFORMATION_UPDATED` DATE,
    `ACCOUNT_STATUS_INDICATOR` STRING,
    `PENDING_CLOSED_DATE` DATE,
    `DATE_ACCOUNT_CLOSED` DATE,
    `CLOSING_NOTICE_DATE` DATE,
    `ACCOUNT_REACTIVATED_DATE` DATE,
    `DATE_ACCOUNT_REOPENED` DATE,
    `PROCEEDS` STRING,
    `TRANSFER_INSTRUCTIONS` STRING,
    `INCOME_INSTRUCTIONS` STRING,
    `NUMBER_OF_CONFIRMS_FOR_THIS_ACCOUNT` INT,
    `NUMBER_OF_STATEMENTS_FOR_THIS_ACCOUNT` INT,
    `INVESTMENT_OBJECTIVE_TRANSACTION_CODE` STRING,
    `COMMENTS` STRING,
    `EMPLOYER_SHORTNAME` STRING,
    `EMPLOYERS_CUSIP` STRING,
    `EMPLOYERS_SYMBOL` STRING,
    `MARGIN_PRIVILEGES_REVOKED` STRING,
    `STATEMENT_REVIEW_DATE` DATE,
    `MARGIN_PAPERS_ON_FILE` STRING,
    `OPTION_PAPERS_ON_FILE` STRING,
    `GOOD_FAITH_MARGIN` STRING,
    `INVESTMENT_PROFESSIONAL_DISCRETION_GRANTED` STRING,
    `INVESTMENT_ADVISOR_DISCRETION_GRANTED` STRING,
    `THIRD_PARTY_DISCRETION_GRANTED` STRING,
    `THIRD_PARTY_NAME` STRING,
    `RISK_FACTOR_CODE` DECIMAL(38,10),
    `INVESTMENT_OBJECTIVE_CODE` STRING,
    `OPTION_EQUITIES` STRING,
    `OPTION_INDEX` STRING,
    `OPTION_DEBT` STRING,
    `OPTION_CURRENCY` STRING,
    `OPTION_LEVEL_1` STRING,
    `OPTION_LEVEL_2` STRING,
    `OPTION_LEVEL_3` STRING,
    `OPTION_LEVEL_4` STRING,
    `OPTION_CALL_LIMITS` DECIMAL(10,0),
    `OPTION_PUT_LIMITS` DECIMAL(10,0),
    `OPTION_TOTAL_LIMITS_OF_PUTS_AND_CALLS` DECIMAL(10,0),
    `NON_US_DOLLAR_TRADING` DECIMAL(38,10),
    `NON_CUSTOMER_INDICATOR` STRING,
    `THIRD_PARTY_FEE_INDICATOR` DECIMAL(38,10),
    `THIRD_PARTY_FEE_APPROVAL_DATE` DATE,
    `INTERMEDIARY_ACCOUNT_INDICATOR` STRING,
    `COMMISSION_SCHEDULE` STRING,
    `GROUP_INDEX` STRING,
    `MONEY_MANAGER_ID` STRING,
    `MONEY_MANAGER_OBJECTIVE` STRING,
    `DTC_ID_CONFIRM_NUMBER_FOR_NON_COD_ACCOUNT` STRING,
    `CAPS_MASTER_MNEMONIC` STRING,
    `EMPLOYEE_ID` STRING,
    `PRIME_BROKER_FREE_FUND_INDICATOR` STRING,
    `FEE_BASED_ACCOUNT_INDICATOR` DECIMAL(38,10),
    `FEE_BASED_TERMINATION_DATE` DATE,
    `PLAN_NAME` STRING,
    `SELFDIRECTED_401_k_ACCOUNT_TYPE` STRING,
    `PLAN_TYPE` STRING,
    `PLAN_NUMBER` STRING,
    `EMPLOYEE_RELATIVE_INDICATOR` STRING,
    `BLOCK_MUTUAL_FUND_FEES` DECIMAL(38,10),
    `NAME_OF_INVESTMENT_PROFESSIONAL_WHO_SIGNED_NEW_ACCOUNT_FORM` STRING,
    `DATE_INVESTMENT_PROFESSIONAL_SIGNED_NEW_ACCOUNT_FORM` DATE,
    `NAME_OF_PRINCIPAL_WHO_SIGNED_NEW_ACCOUNT_FORM` STRING,
    `DATE_PRINCIPAL_SIGNED_NEW_ACCOUNT_FORM` DATE,
    `POLITICALLY_EXPOSED_PERSON_INDICATOR` STRING,
    `PRIVATE_BANKING_ACCOUNT_INDICATOR` STRING,
    `FOREIGN_BANK_ACCOUNT_INDICATOR` STRING,
    `INITIAL_SOURCE_OF_FUNDS` STRING,
    `USA_PATRIOT_ACT_EXEMPT_REASON` STRING,
    `PRIMARY_COUNTRY_OF_CITIZENSHIP` STRING,
    `COUNTRY_OF_RESIDENCE` STRING,
    `BIRTH_DATE` DATE,
    `AGEBASED_FUND_ROLL_EXEMPT_INDICATOR` STRING,
    `MONEY_FUND_REFORM_RETAIL` STRING,
    `TRUSTED_CONTACT_STATUS` STRING,
    `REGULATORY_ACCOUNT_TYPE_CATEGORY` STRING,
    `ACCOUNT_MANAGED_BY_TRUST_COMPANY_INDICATOR` STRING,
    `VOTING_AUTHORITY` STRING,
    `Internal_Use_IMS_Prime_Broker_Code` STRING,
    `Internal_Use_Payout_Code` STRING,
    `Internal_Use_Trader_Number` STRING,
    `Internal_Use_Product_Code` STRING,
    `CUSTOMER_TYPE` STRING,
    `Internal_Use_Account_Plan_Type` STRING,
    `Internal_Use_Promotion_Type` STRING,
    `Internal_Use_Investment_Objective_1` STRING,
    `Internal_Use_Investment_Objective_2` STRING,
    `Internal_Use_Investment_Objective_3` STRING,
    `FULFILLMENT_METHOD` STRING,
    `CREDIT_INTEREST_INDICATOR` DECIMAL(38,10),
    `AMA_INDICATOR` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_acct_a IS
'Pershing landing table containing account, registration, transfer, status, and control attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_acct_a;

INSERT INTO landing_pershing.default.pershing_acct_a (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    `INVESTMENT_PROFESSIONAL_IP_NUMBER`, `ACCOUNT_SHORT_NAME`, `TRANSACTION_TYPE`, `AUTO_TITLED_OR_USER_TITLED_ACCOUNT`,
    `ACCOUNT_TYPE_CODE`, `REGISTRATION_TYPE`, `NUMBER_OF_ACCOUNT_TITLE_LINES_IN_REGISTRATION_LINES`,
    `ACCOUNT_REGISTRATION_LINE_1`, `ACCOUNT_REGISTRATION_LINE_2`, `ACCOUNT_REGISTRATION_LINE_3`,
    `ACCOUNT_REGISTRATION_LINE_4`, `ACCOUNT_REGISTRATION_LINE_5`, `ACCOUNT_REGISTRATION_LINE_6`, `US_TENANCY_INDICATOR`,
    `MARRIED_INDICATOR`, `TENANCY_STATE`, `JOINT_TENANCY_CLAUSE`, `AGREEMENT_EXECUTION_DATE`, `NUMBER_OF_TENANTS`,
    `STATE_GIFT_GIVEN`, `DATE_GIFT_GIVEN`, `AGE_TO_TERMINATE`, `MINORS_BIRTHDATE`, `MANNER_OF_GIFT`, `TYPE_OF_TRUST`,
    `DATE_TRUST_ESTABLISHED`, `AMENDED_DATE`, `TRUSTEE_INDEPENDENT_ACTION`, `PLAN_ESTABLISHED_DATE`,
    `PLAN_AMENDMENT_DATE`, `DATE_ACCOUNT_OPENED`, `DATE_ACCOUNT_INFORMATION_UPDATED`, `ACCOUNT_STATUS_INDICATOR`,
    `PENDING_CLOSED_DATE`, `DATE_ACCOUNT_CLOSED`, `CLOSING_NOTICE_DATE`, `ACCOUNT_REACTIVATED_DATE`,
    `DATE_ACCOUNT_REOPENED`, `PROCEEDS`, `TRANSFER_INSTRUCTIONS`, `INCOME_INSTRUCTIONS`,
    `NUMBER_OF_CONFIRMS_FOR_THIS_ACCOUNT`, `NUMBER_OF_STATEMENTS_FOR_THIS_ACCOUNT`,
    `INVESTMENT_OBJECTIVE_TRANSACTION_CODE`, `COMMENTS`, `EMPLOYER_SHORTNAME`, `EMPLOYERS_CUSIP`, `EMPLOYERS_SYMBOL`,
    `MARGIN_PRIVILEGES_REVOKED`, `STATEMENT_REVIEW_DATE`, `MARGIN_PAPERS_ON_FILE`, `OPTION_PAPERS_ON_FILE`,
    `GOOD_FAITH_MARGIN`, `INVESTMENT_PROFESSIONAL_DISCRETION_GRANTED`, `INVESTMENT_ADVISOR_DISCRETION_GRANTED`,
    `THIRD_PARTY_DISCRETION_GRANTED`, `THIRD_PARTY_NAME`, `RISK_FACTOR_CODE`, `INVESTMENT_OBJECTIVE_CODE`,
    `OPTION_EQUITIES`, `OPTION_INDEX`, `OPTION_DEBT`, `OPTION_CURRENCY`, `OPTION_LEVEL_1`, `OPTION_LEVEL_2`,
    `OPTION_LEVEL_3`, `OPTION_LEVEL_4`, `OPTION_CALL_LIMITS`, `OPTION_PUT_LIMITS`,
    `OPTION_TOTAL_LIMITS_OF_PUTS_AND_CALLS`, `NON_US_DOLLAR_TRADING`, `NON_CUSTOMER_INDICATOR`,
    `THIRD_PARTY_FEE_INDICATOR`, `THIRD_PARTY_FEE_APPROVAL_DATE`, `INTERMEDIARY_ACCOUNT_INDICATOR`,
    `COMMISSION_SCHEDULE`, `GROUP_INDEX`, `MONEY_MANAGER_ID`, `MONEY_MANAGER_OBJECTIVE`,
    `DTC_ID_CONFIRM_NUMBER_FOR_NON_COD_ACCOUNT`, `CAPS_MASTER_MNEMONIC`, `EMPLOYEE_ID`,
    `PRIME_BROKER_FREE_FUND_INDICATOR`, `FEE_BASED_ACCOUNT_INDICATOR`, `FEE_BASED_TERMINATION_DATE`, `PLAN_NAME`,
    `SELFDIRECTED_401_k_ACCOUNT_TYPE`, `PLAN_TYPE`, `PLAN_NUMBER`, `EMPLOYEE_RELATIVE_INDICATOR`,
    `BLOCK_MUTUAL_FUND_FEES`, `NAME_OF_INVESTMENT_PROFESSIONAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    `DATE_INVESTMENT_PROFESSIONAL_SIGNED_NEW_ACCOUNT_FORM`, `NAME_OF_PRINCIPAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    `DATE_PRINCIPAL_SIGNED_NEW_ACCOUNT_FORM`, `POLITICALLY_EXPOSED_PERSON_INDICATOR`,
    `PRIVATE_BANKING_ACCOUNT_INDICATOR`, `FOREIGN_BANK_ACCOUNT_INDICATOR`, `INITIAL_SOURCE_OF_FUNDS`,
    `USA_PATRIOT_ACT_EXEMPT_REASON`, `PRIMARY_COUNTRY_OF_CITIZENSHIP`, `COUNTRY_OF_RESIDENCE`, `BIRTH_DATE`,
    `AGEBASED_FUND_ROLL_EXEMPT_INDICATOR`, `MONEY_FUND_REFORM_RETAIL`, `TRUSTED_CONTACT_STATUS`,
    `REGULATORY_ACCOUNT_TYPE_CATEGORY`, `ACCOUNT_MANAGED_BY_TRUST_COMPANY_INDICATOR`, `VOTING_AUTHORITY`,
    `Internal_Use_IMS_Prime_Broker_Code`, `Internal_Use_Payout_Code`, `Internal_Use_Trader_Number`,
    `Internal_Use_Product_Code`, `CUSTOMER_TYPE`, `Internal_Use_Account_Plan_Type`, `Internal_Use_Promotion_Type`,
    `Internal_Use_Investment_Objective_1`, `Internal_Use_Investment_Objective_2`, `Internal_Use_Investment_Objective_3`,
    `FULFILLMENT_METHOD`, `CREDIT_INTEREST_INDICATOR`, `AMA_INDICATOR`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('INVESTMENT_PROFESSIONAL__', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('ACCOUNT_SHORT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_SHORT_NAME`,
    concat('TRANSACTION_TYPE_', format_string('%02d', idx)) AS `TRANSACTION_TYPE`,
    concat('AUTO_TITLED_OR_USER_TITL_', format_string('%02d', idx)) AS `AUTO_TITLED_OR_USER_TITLED_ACCOUNT`,
    concat('ACCOUNT_TYPE_CODE_', format_string('%02d', idx)) AS `ACCOUNT_TYPE_CODE`,
    concat('REGISTRATION_TYPE_', format_string('%02d', idx)) AS `REGISTRATION_TYPE`,
    idx AS `NUMBER_OF_ACCOUNT_TITLE_LINES_IN_REGISTRATION_LINES`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_1`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_2`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_3`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_4`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_5`,
    concat('ACCOUNT_REGISTRATION_LIN_', format_string('%02d', idx)) AS `ACCOUNT_REGISTRATION_LINE_6`,
    concat('US_TENANCY_INDICATOR_', format_string('%02d', idx)) AS `US_TENANCY_INDICATOR`,
    concat('MARRIED_INDICATOR_', format_string('%02d', idx)) AS `MARRIED_INDICATOR`,
    concat('TENANCY_STATE_', format_string('%02d', idx)) AS `TENANCY_STATE`,
    concat('JOINT_TENANCY_CLAUSE_', format_string('%02d', idx)) AS `JOINT_TENANCY_CLAUSE`,
    date_add(DATE '2026-01-01', idx - 1) AS `AGREEMENT_EXECUTION_DATE`,
    idx AS `NUMBER_OF_TENANTS`,
    concat('STATE_GIFT_GIVEN_', format_string('%02d', idx)) AS `STATE_GIFT_GIVEN`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_GIFT_GIVEN`,
    idx AS `AGE_TO_TERMINATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `MINORS_BIRTHDATE`,
    concat('MANNER_OF_GIFT_', format_string('%02d', idx)) AS `MANNER_OF_GIFT`,
    concat('TYPE_OF_TRUST_', format_string('%02d', idx)) AS `TYPE_OF_TRUST`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_TRUST_ESTABLISHED`,
    date_add(DATE '2026-01-01', idx - 1) AS `AMENDED_DATE`,
    concat('TRUSTEE_INDEPENDENT_ACTI_', format_string('%02d', idx)) AS `TRUSTEE_INDEPENDENT_ACTION`,
    date_add(DATE '2026-01-01', idx - 1) AS `PLAN_ESTABLISHED_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `PLAN_AMENDMENT_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_ACCOUNT_OPENED`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_ACCOUNT_INFORMATION_UPDATED`,
    concat('ACCOUNT_STATUS_INDICATOR_', format_string('%02d', idx)) AS `ACCOUNT_STATUS_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `PENDING_CLOSED_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_ACCOUNT_CLOSED`,
    date_add(DATE '2026-01-01', idx - 1) AS `CLOSING_NOTICE_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `ACCOUNT_REACTIVATED_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_ACCOUNT_REOPENED`,
    concat('PROCEEDS_', format_string('%02d', idx)) AS `PROCEEDS`,
    concat('TRANSFER_INSTRUCTIONS_', format_string('%02d', idx)) AS `TRANSFER_INSTRUCTIONS`,
    concat('INCOME_INSTRUCTIONS_', format_string('%02d', idx)) AS `INCOME_INSTRUCTIONS`,
    idx AS `NUMBER_OF_CONFIRMS_FOR_THIS_ACCOUNT`,
    idx AS `NUMBER_OF_STATEMENTS_FOR_THIS_ACCOUNT`,
    concat('INVESTMENT_OBJECTIVE_TRA_', format_string('%02d', idx)) AS `INVESTMENT_OBJECTIVE_TRANSACTION_CODE`,
    concat('COMMENTS_', format_string('%02d', idx)) AS `COMMENTS`,
    concat('EMPLOYER_SHORTNAME_', format_string('%02d', idx)) AS `EMPLOYER_SHORTNAME`,
    concat('EMPLOYERS_CUSIP_', format_string('%02d', idx)) AS `EMPLOYERS_CUSIP`,
    concat('EMPLOYERS_SYMBOL_', format_string('%02d', idx)) AS `EMPLOYERS_SYMBOL`,
    concat('MARGIN_PRIVILEGES_REVOKE_', format_string('%02d', idx)) AS `MARGIN_PRIVILEGES_REVOKED`,
    date_add(DATE '2026-01-01', idx - 1) AS `STATEMENT_REVIEW_DATE`,
    concat('MARGIN_PAPERS_ON_FILE_', format_string('%02d', idx)) AS `MARGIN_PAPERS_ON_FILE`,
    concat('OPTION_PAPERS_ON_FILE_', format_string('%02d', idx)) AS `OPTION_PAPERS_ON_FILE`,
    concat('GOOD_FAITH_MARGIN_', format_string('%02d', idx)) AS `GOOD_FAITH_MARGIN`,
    concat('INVESTMENT_PROFESSIONAL__', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL_DISCRETION_GRANTED`,
    concat('INVESTMENT_ADVISOR_DISCR_', format_string('%02d', idx)) AS `INVESTMENT_ADVISOR_DISCRETION_GRANTED`,
    concat('THIRD_PARTY_DISCRETION_G_', format_string('%02d', idx)) AS `THIRD_PARTY_DISCRETION_GRANTED`,
    concat('THIRD_PARTY_NAME_', format_string('%02d', idx)) AS `THIRD_PARTY_NAME`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RISK_FACTOR_CODE`,
    concat('INVESTMENT_OBJECTIVE_COD_', format_string('%02d', idx)) AS `INVESTMENT_OBJECTIVE_CODE`,
    concat('OPTION_EQUITIES_', format_string('%02d', idx)) AS `OPTION_EQUITIES`,
    concat('OPTION_INDEX_', format_string('%02d', idx)) AS `OPTION_INDEX`,
    concat('OPTION_DEBT_', format_string('%02d', idx)) AS `OPTION_DEBT`,
    concat('OPTION_CURRENCY_', format_string('%02d', idx)) AS `OPTION_CURRENCY`,
    concat('OPTION_LEVEL_1_', format_string('%02d', idx)) AS `OPTION_LEVEL_1`,
    concat('OPTION_LEVEL_2_', format_string('%02d', idx)) AS `OPTION_LEVEL_2`,
    concat('OPTION_LEVEL_3_', format_string('%02d', idx)) AS `OPTION_LEVEL_3`,
    concat('OPTION_LEVEL_4_', format_string('%02d', idx)) AS `OPTION_LEVEL_4`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,0)) AS `OPTION_CALL_LIMITS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,0)) AS `OPTION_PUT_LIMITS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,0)) AS `OPTION_TOTAL_LIMITS_OF_PUTS_AND_CALLS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `NON_US_DOLLAR_TRADING`,
    concat('NON_CUSTOMER_INDICATOR_', format_string('%02d', idx)) AS `NON_CUSTOMER_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `THIRD_PARTY_FEE_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `THIRD_PARTY_FEE_APPROVAL_DATE`,
    concat('INTERMEDIARY_ACCOUNT_IND_', format_string('%02d', idx)) AS `INTERMEDIARY_ACCOUNT_INDICATOR`,
    concat('COMMISSION_SCHEDULE_', format_string('%02d', idx)) AS `COMMISSION_SCHEDULE`,
    concat('GROUP_INDEX_', format_string('%02d', idx)) AS `GROUP_INDEX`,
    concat('MONEY_MANAGER_ID_', format_string('%02d', idx)) AS `MONEY_MANAGER_ID`,
    concat('MONEY_MANAGER_OBJECTIVE_', format_string('%02d', idx)) AS `MONEY_MANAGER_OBJECTIVE`,
    concat('DTC_ID_CONFIRM_NUMBER_FO_', format_string('%02d', idx)) AS `DTC_ID_CONFIRM_NUMBER_FOR_NON_COD_ACCOUNT`,
    concat('CAPS_MASTER_MNEMONIC_', format_string('%02d', idx)) AS `CAPS_MASTER_MNEMONIC`,
    concat('EMPLOYEE_ID_', format_string('%02d', idx)) AS `EMPLOYEE_ID`,
    concat('PRIME_BROKER_FREE_FUND_I_', format_string('%02d', idx)) AS `PRIME_BROKER_FREE_FUND_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `FEE_BASED_ACCOUNT_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `FEE_BASED_TERMINATION_DATE`,
    concat('PLAN_NAME_', format_string('%02d', idx)) AS `PLAN_NAME`,
    concat('SELFDIRECTED_401_k_ACCOU_', format_string('%02d', idx)) AS `SELFDIRECTED_401_k_ACCOUNT_TYPE`,
    concat('PLAN_TYPE_', format_string('%02d', idx)) AS `PLAN_TYPE`,
    concat('PLAN_NUMBER_', format_string('%02d', idx)) AS `PLAN_NUMBER`,
    concat('EMPLOYEE_RELATIVE_INDICA_', format_string('%02d', idx)) AS `EMPLOYEE_RELATIVE_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `BLOCK_MUTUAL_FUND_FEES`,
    concat('NAME_OF_INVESTMENT_PROFE_', format_string('%02d', idx)) AS `NAME_OF_INVESTMENT_PROFESSIONAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_INVESTMENT_PROFESSIONAL_SIGNED_NEW_ACCOUNT_FORM`,
    concat('NAME_OF_PRINCIPAL_WHO_SI_', format_string('%02d', idx)) AS `NAME_OF_PRINCIPAL_WHO_SIGNED_NEW_ACCOUNT_FORM`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_PRINCIPAL_SIGNED_NEW_ACCOUNT_FORM`,
    concat('POLITICALLY_EXPOSED_PERS_', format_string('%02d', idx)) AS `POLITICALLY_EXPOSED_PERSON_INDICATOR`,
    concat('PRIVATE_BANKING_ACCOUNT__', format_string('%02d', idx)) AS `PRIVATE_BANKING_ACCOUNT_INDICATOR`,
    concat('FOREIGN_BANK_ACCOUNT_IND_', format_string('%02d', idx)) AS `FOREIGN_BANK_ACCOUNT_INDICATOR`,
    concat('INITIAL_SOURCE_OF_FUNDS_', format_string('%02d', idx)) AS `INITIAL_SOURCE_OF_FUNDS`,
    concat('USA_PATRIOT_ACT_EXEMPT_R_', format_string('%02d', idx)) AS `USA_PATRIOT_ACT_EXEMPT_REASON`,
    concat('PRIMARY_COUNTRY_OF_CITIZ_', format_string('%02d', idx)) AS `PRIMARY_COUNTRY_OF_CITIZENSHIP`,
    concat('COUNTRY_OF_RESIDENCE_', format_string('%02d', idx)) AS `COUNTRY_OF_RESIDENCE`,
    date_add(DATE '2026-01-01', idx - 1) AS `BIRTH_DATE`,
    concat('AGEBASED_FUND_ROLL_EXEMP_', format_string('%02d', idx)) AS `AGEBASED_FUND_ROLL_EXEMPT_INDICATOR`,
    concat('MONEY_FUND_REFORM_RETAIL_', format_string('%02d', idx)) AS `MONEY_FUND_REFORM_RETAIL`,
    concat('TRUSTED_CONTACT_STATUS_', format_string('%02d', idx)) AS `TRUSTED_CONTACT_STATUS`,
    concat('REGULATORY_ACCOUNT_TYPE__', format_string('%02d', idx)) AS `REGULATORY_ACCOUNT_TYPE_CATEGORY`,
    concat('ACCOUNT_MANAGED_BY_TRUST_', format_string('%02d', idx)) AS `ACCOUNT_MANAGED_BY_TRUST_COMPANY_INDICATOR`,
    concat('VOTING_AUTHORITY_', format_string('%02d', idx)) AS `VOTING_AUTHORITY`,
    concat('Internal_Use_IMS_Prime_B_', format_string('%02d', idx)) AS `Internal_Use_IMS_Prime_Broker_Code`,
    concat('Internal_Use_Payout_Code_', format_string('%02d', idx)) AS `Internal_Use_Payout_Code`,
    concat('Internal_Use_Trader_Numb_', format_string('%02d', idx)) AS `Internal_Use_Trader_Number`,
    concat('Internal_Use_Product_Cod_', format_string('%02d', idx)) AS `Internal_Use_Product_Code`,
    concat('CUSTOMER_TYPE_', format_string('%02d', idx)) AS `CUSTOMER_TYPE`,
    concat('Internal_Use_Account_Pla_', format_string('%02d', idx)) AS `Internal_Use_Account_Plan_Type`,
    concat('Internal_Use_Promotion_T_', format_string('%02d', idx)) AS `Internal_Use_Promotion_Type`,
    concat('Internal_Use_Investment__', format_string('%02d', idx)) AS `Internal_Use_Investment_Objective_1`,
    concat('Internal_Use_Investment__', format_string('%02d', idx)) AS `Internal_Use_Investment_Objective_2`,
    concat('Internal_Use_Investment__', format_string('%02d', idx)) AS `Internal_Use_Investment_Objective_3`,
    concat('FULFILLMENT_METHOD_', format_string('%02d', idx)) AS `FULFILLMENT_METHOD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CREDIT_INTEREST_INDICATOR`,
    concat('AMA_INDICATOR_', format_string('%02d', idx)) AS `AMA_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_acct_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_acct_a;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_acct_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ACCT_B"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_acct_b (
    `TRANSACTION_CODE` STRING,
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `ACCOUNT_NUMBER` STRING,
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `ACCOUNT_SHORT_NAME` STRING,
    `TAX_ID_TYPE` STRING,
    `TAX_ID_NUMBER` STRING,
    `DATE_TAX_ID_APPLIED_FOR` DATE,
    `W_8_W_9_INDICATOR` STRING,
    `W8_W_9_DATE_SIGNED` DATE,
    `W_8_W_9_EFFECTIVE_RECEIVED_DATE` DATE,
    `W_8_W_9_DOCUMENT_TYPE` STRING,
    `TAX_STATUS` STRING,
    `B_NOTICE_REASON_CODE` STRING,
    `FIRST_B_NOTICE_STATUS` STRING,
    `DATE_FIRST_B_NOTICE_STATUS_ISSUED_ENFORCED` DATE,
    `DATE_FIRST_B_NOTICE_STATUS_SATISFIED` DATE,
    `SECOND_B_NOTICE_STATUS` STRING,
    `DATE_SECOND_B_NOTICE_STATUS_ISSUED_ENFORCED` DATE,
    `DATE_SECOND_B_NOTICE_STATUS_SATISFIED` DATE,
    `C_NOTICE_STATUS` STRING,
    `DATE_C_NOTICE_STATUS_ISSUED_ENFORCED` DATE,
    `DATE_C_NOTICE_STATUS_SATISFIED` DATE,
    `OLD_ACCOUNT_NUMBER` STRING,
    `ORIGINAL_ACCOUNT_OPEN_DATE` DATE,
    `UNIDENTIFIED_LARGE_TRADER_ID` STRING,
    `LARGE_TRADER_TYPE_CODE` STRING,
    `LARGE_TRADER_TYPE_LAST_CHANGE_DATE` DATE,
    `INITIAL_SOURCE_OF_FUNDS` STRING,
    `ACCOUNT_FUNDING_DATE` DATE,
    `REGULATORY_BLOCK_INDICATOR` STRING,
    `STATEMENT_CURRENCY_CODE` STRING,
    `FUTURE_STATEMENT_CURRENCY_CODE` STRING,
    `FUTURE_STATEMENT_CURRENCY_CODE_DATE` DATE,
    `ACCOUNT_LEVEL_ROUTING_CODE` STRING,
    `SELF_DIRECTED_INDICATOR` STRING,
    `DIGITAL_ADVICE_INDICATOR` STRING,
    `PROHIBITED_TRANSACTON_EXEMPTION_PTE_86_128_ACCOUNT_INDICATOR` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_1` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_2` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_3` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_4` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_5` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_6` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_7` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_8` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_9` STRING,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_10` STRING,
    `ALERT_IM_ACRONYM` STRING,
    `ALERT_IM_ACCESS_CODE` STRING,
    `BROKER_ACRONYM` STRING,
    `CROSS_REFERENCED_INDICATOR` STRING,
    `BNY_TRUST_INDICATOR` STRING,
    `SOURCE_OF_ASSETS_AT_ACCOUNT_OPENING` STRING,
    `COMMISSION_DISCOUNT_CODE` STRING,
    `EXTERNAL_ACCOUNT_NUMBER` STRING,
    `CONFIRMATION_SUPPRESSION_INDICATOR` STRING,
    `DATE_LAST_BOOKS_RECORDS_MAILING_SENT_TO` DATE,
    `DATE_LAST_BOOKS_AND_RECORDS_MAILING_SENT_TO_CUSTOMER_OUTSIDE_PERSHING_SYSTEM` DATE,
    `FULLY_PAID_LENDING_AGREEMENT_INDICATOR` STRING,
    `FULLY_PAID_LENDING_AGREEMENT_DATE` DATE,
    `CUSTODIAN_ACCOUNT_TYPE` STRING,
    `MARKETS_IN_FINANCIAL_INSTRUMENTS_DIRECTIVE_MIFID_CUSTOMER_CATEGORIZATION` STRING,
    `CASH_MANAGEMENT_TRANSACTION_CODE` STRING,
    `SWEEP_STATUS_INDICATOR` STRING,
    `DATE_SWEEP_ACTIVATED` DATE,
    `DATE_SWEEP_DETAILS_CHANGED` DATE,
    `COVER_MARGIN_DEBIT_INDICATOR` DECIMAL(38,10),
    `FIRST_FUND_SWEEP_ACCOUNT_ID` STRING,
    `FIRST_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY` STRING,
    `SECOND_FUND_SWEEP_ACCOUNT_ID` STRING,
    `SECOND_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY` STRING,
    `TYPE_OF_BANK_ACCOUNT` STRING,
    `BANKLINK_ABA_NUMBER` STRING,
    `BANKLINK_DDA_NUMBER` STRING,
    `FUND_BANK_INDICATOR` STRING,
    `W_9_CORPORATION_TAX_CLASSIFICATION_CODE` STRING,
    `COMBINED_MARGIN_ACCOUNT_INDICATOR` STRING,
    `PLEDGE_COLLATERAL_ACCOUNT_INDICATOR` STRING,
    `FINRA_INSTITUTIONAL_ACCOUNT_CODE` STRING,
    `PROPOSED_ACCOUNT_REFERENCE_ID` STRING,
    `ADVISOR_MODEL_ID` STRING,
    `FIRM_MODEL_STYLE_ID` STRING,
    `THIRD_PARTY_LENDER_INDICATOR` STRING,
    `RESERVED_FOR_FUTURE_THIRD_PARTY_LENDER_GROWTH` STRING,
    `DVP_RESTRICTION_CODE` STRING,
    `DVP_RESTRICTION_EXPIRATION_DATE` DATE,
    `ESCHEATMENT_WITHHOLDING_INDICATOR` STRING,
    `SOURCE_OF_ORIGINATION` STRING,
    `SOURCE_OF_PERSONA` STRING,
    `CLIENT_ON_BOARDING_METHOD` STRING,
    `TAX_FILING_CODE` STRING,
    `NON_PURPOSE_COLLATERAL_ACCOUNT_INDICATOR` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_acct_b IS
'Pershing landing table containing account, registration, transfer, status, and control attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_acct_b;

INSERT INTO landing_pershing.default.pershing_acct_b (
    `TRANSACTION_CODE`, `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`,
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `INVESTMENT_PROFESSIONAL_IP_NUMBER`, `ACCOUNT_SHORT_NAME`, `TAX_ID_TYPE`,
    `TAX_ID_NUMBER`, `DATE_TAX_ID_APPLIED_FOR`, `W_8_W_9_INDICATOR`, `W8_W_9_DATE_SIGNED`,
    `W_8_W_9_EFFECTIVE_RECEIVED_DATE`, `W_8_W_9_DOCUMENT_TYPE`, `TAX_STATUS`, `B_NOTICE_REASON_CODE`,
    `FIRST_B_NOTICE_STATUS`, `DATE_FIRST_B_NOTICE_STATUS_ISSUED_ENFORCED`, `DATE_FIRST_B_NOTICE_STATUS_SATISFIED`,
    `SECOND_B_NOTICE_STATUS`, `DATE_SECOND_B_NOTICE_STATUS_ISSUED_ENFORCED`, `DATE_SECOND_B_NOTICE_STATUS_SATISFIED`,
    `C_NOTICE_STATUS`, `DATE_C_NOTICE_STATUS_ISSUED_ENFORCED`, `DATE_C_NOTICE_STATUS_SATISFIED`, `OLD_ACCOUNT_NUMBER`,
    `ORIGINAL_ACCOUNT_OPEN_DATE`, `UNIDENTIFIED_LARGE_TRADER_ID`, `LARGE_TRADER_TYPE_CODE`,
    `LARGE_TRADER_TYPE_LAST_CHANGE_DATE`, `INITIAL_SOURCE_OF_FUNDS`, `ACCOUNT_FUNDING_DATE`,
    `REGULATORY_BLOCK_INDICATOR`, `STATEMENT_CURRENCY_CODE`, `FUTURE_STATEMENT_CURRENCY_CODE`,
    `FUTURE_STATEMENT_CURRENCY_CODE_DATE`, `ACCOUNT_LEVEL_ROUTING_CODE`, `SELF_DIRECTED_INDICATOR`,
    `DIGITAL_ADVICE_INDICATOR`, `PROHIBITED_TRANSACTON_EXEMPTION_PTE_86_128_ACCOUNT_INDICATOR`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_1`, `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_2`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_3`, `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_4`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_5`, `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_6`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_7`, `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_8`,
    `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_9`, `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_10`,
    `ALERT_IM_ACRONYM`, `ALERT_IM_ACCESS_CODE`, `BROKER_ACRONYM`, `CROSS_REFERENCED_INDICATOR`, `BNY_TRUST_INDICATOR`,
    `SOURCE_OF_ASSETS_AT_ACCOUNT_OPENING`, `COMMISSION_DISCOUNT_CODE`, `EXTERNAL_ACCOUNT_NUMBER`,
    `CONFIRMATION_SUPPRESSION_INDICATOR`, `DATE_LAST_BOOKS_RECORDS_MAILING_SENT_TO`,
    `DATE_LAST_BOOKS_AND_RECORDS_MAILING_SENT_TO_CUSTOMER_OUTSIDE_PERSHING_SYSTEM`,
    `FULLY_PAID_LENDING_AGREEMENT_INDICATOR`, `FULLY_PAID_LENDING_AGREEMENT_DATE`, `CUSTODIAN_ACCOUNT_TYPE`,
    `MARKETS_IN_FINANCIAL_INSTRUMENTS_DIRECTIVE_MIFID_CUSTOMER_CATEGORIZATION`, `CASH_MANAGEMENT_TRANSACTION_CODE`,
    `SWEEP_STATUS_INDICATOR`, `DATE_SWEEP_ACTIVATED`, `DATE_SWEEP_DETAILS_CHANGED`, `COVER_MARGIN_DEBIT_INDICATOR`,
    `FIRST_FUND_SWEEP_ACCOUNT_ID`, `FIRST_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`, `SECOND_FUND_SWEEP_ACCOUNT_ID`,
    `SECOND_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`, `TYPE_OF_BANK_ACCOUNT`, `BANKLINK_ABA_NUMBER`,
    `BANKLINK_DDA_NUMBER`, `FUND_BANK_INDICATOR`, `W_9_CORPORATION_TAX_CLASSIFICATION_CODE`,
    `COMBINED_MARGIN_ACCOUNT_INDICATOR`, `PLEDGE_COLLATERAL_ACCOUNT_INDICATOR`, `FINRA_INSTITUTIONAL_ACCOUNT_CODE`,
    `PROPOSED_ACCOUNT_REFERENCE_ID`, `ADVISOR_MODEL_ID`, `FIRM_MODEL_STYLE_ID`, `THIRD_PARTY_LENDER_INDICATOR`,
    `RESERVED_FOR_FUTURE_THIRD_PARTY_LENDER_GROWTH`, `DVP_RESTRICTION_CODE`, `DVP_RESTRICTION_EXPIRATION_DATE`,
    `ESCHEATMENT_WITHHOLDING_INDICATOR`, `SOURCE_OF_ORIGINATION`, `SOURCE_OF_PERSONA`, `CLIENT_ON_BOARDING_METHOD`,
    `TAX_FILING_CODE`, `NON_PURPOSE_COLLATERAL_ACCOUNT_INDICATOR`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('INVESTMENT_PROFESSIONAL__', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('ACCOUNT_SHORT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_SHORT_NAME`,
    concat('TAX_ID_TYPE_', format_string('%02d', idx)) AS `TAX_ID_TYPE`,
    concat('TAX_ID_NUMBER_', format_string('%02d', idx)) AS `TAX_ID_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_TAX_ID_APPLIED_FOR`,
    concat('W_8_W_9_INDICATOR_', format_string('%02d', idx)) AS `W_8_W_9_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `W8_W_9_DATE_SIGNED`,
    date_add(DATE '2026-01-01', idx - 1) AS `W_8_W_9_EFFECTIVE_RECEIVED_DATE`,
    concat('W_8_W_9_DOCUMENT_TYPE_', format_string('%02d', idx)) AS `W_8_W_9_DOCUMENT_TYPE`,
    concat('TAX_STATUS_', format_string('%02d', idx)) AS `TAX_STATUS`,
    concat('B_NOTICE_REASON_CODE_', format_string('%02d', idx)) AS `B_NOTICE_REASON_CODE`,
    concat('FIRST_B_NOTICE_STATUS_', format_string('%02d', idx)) AS `FIRST_B_NOTICE_STATUS`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_FIRST_B_NOTICE_STATUS_ISSUED_ENFORCED`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_FIRST_B_NOTICE_STATUS_SATISFIED`,
    concat('SECOND_B_NOTICE_STATUS_', format_string('%02d', idx)) AS `SECOND_B_NOTICE_STATUS`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_SECOND_B_NOTICE_STATUS_ISSUED_ENFORCED`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_SECOND_B_NOTICE_STATUS_SATISFIED`,
    concat('C_NOTICE_STATUS_', format_string('%02d', idx)) AS `C_NOTICE_STATUS`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_C_NOTICE_STATUS_ISSUED_ENFORCED`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_C_NOTICE_STATUS_SATISFIED`,
    concat('OLD_ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `OLD_ACCOUNT_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `ORIGINAL_ACCOUNT_OPEN_DATE`,
    concat('UNIDENTIFIED_LARGE_TRADE_', format_string('%02d', idx)) AS `UNIDENTIFIED_LARGE_TRADER_ID`,
    concat('LARGE_TRADER_TYPE_CODE_', format_string('%02d', idx)) AS `LARGE_TRADER_TYPE_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `LARGE_TRADER_TYPE_LAST_CHANGE_DATE`,
    concat('INITIAL_SOURCE_OF_FUNDS_', format_string('%02d', idx)) AS `INITIAL_SOURCE_OF_FUNDS`,
    date_add(DATE '2026-01-01', idx - 1) AS `ACCOUNT_FUNDING_DATE`,
    concat('REGULATORY_BLOCK_INDICAT_', format_string('%02d', idx)) AS `REGULATORY_BLOCK_INDICATOR`,
    concat('STATEMENT_CURRENCY_CODE_', format_string('%02d', idx)) AS `STATEMENT_CURRENCY_CODE`,
    concat('FUTURE_STATEMENT_CURRENC_', format_string('%02d', idx)) AS `FUTURE_STATEMENT_CURRENCY_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `FUTURE_STATEMENT_CURRENCY_CODE_DATE`,
    concat('ACCOUNT_LEVEL_ROUTING_CO_', format_string('%02d', idx)) AS `ACCOUNT_LEVEL_ROUTING_CODE`,
    concat('SELF_DIRECTED_INDICATOR_', format_string('%02d', idx)) AS `SELF_DIRECTED_INDICATOR`,
    concat('DIGITAL_ADVICE_INDICATOR_', format_string('%02d', idx)) AS `DIGITAL_ADVICE_INDICATOR`,
    concat('PROHIBITED_TRANSACTON_EX_', format_string('%02d', idx)) AS `PROHIBITED_TRANSACTON_EXEMPTION_PTE_86_128_ACCOUNT_INDICATOR`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_1`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_2`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_3`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_4`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_5`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_6`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_7`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_8`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_9`,
    concat('LEGACY_FIRST_INVESTMENT__', format_string('%02d', idx)) AS `LEGACY_FIRST_INVESTMENT_PROFESSIONAL_IP_NUMBER_10`,
    concat('ALERT_IM_ACRONYM_', format_string('%02d', idx)) AS `ALERT_IM_ACRONYM`,
    concat('ALERT_IM_ACCESS_CODE_', format_string('%02d', idx)) AS `ALERT_IM_ACCESS_CODE`,
    concat('BROKER_ACRONYM_', format_string('%02d', idx)) AS `BROKER_ACRONYM`,
    concat('CROSS_REFERENCED_INDICAT_', format_string('%02d', idx)) AS `CROSS_REFERENCED_INDICATOR`,
    concat('BNY_TRUST_INDICATOR_', format_string('%02d', idx)) AS `BNY_TRUST_INDICATOR`,
    concat('SOURCE_OF_ASSETS_AT_ACCO_', format_string('%02d', idx)) AS `SOURCE_OF_ASSETS_AT_ACCOUNT_OPENING`,
    concat('COMMISSION_DISCOUNT_CODE_', format_string('%02d', idx)) AS `COMMISSION_DISCOUNT_CODE`,
    concat('EXTERNAL_ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `EXTERNAL_ACCOUNT_NUMBER`,
    concat('CONFIRMATION_SUPPRESSION_', format_string('%02d', idx)) AS `CONFIRMATION_SUPPRESSION_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_LAST_BOOKS_RECORDS_MAILING_SENT_TO`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_LAST_BOOKS_AND_RECORDS_MAILING_SENT_TO_CUSTOMER_OUTSIDE_PERSHING_SYSTEM`,
    concat('FULLY_PAID_LENDING_AGREE_', format_string('%02d', idx)) AS `FULLY_PAID_LENDING_AGREEMENT_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `FULLY_PAID_LENDING_AGREEMENT_DATE`,
    concat('CUSTODIAN_ACCOUNT_TYPE_', format_string('%02d', idx)) AS `CUSTODIAN_ACCOUNT_TYPE`,
    concat('MARKETS_IN_FINANCIAL_INS_', format_string('%02d', idx)) AS `MARKETS_IN_FINANCIAL_INSTRUMENTS_DIRECTIVE_MIFID_CUSTOMER_CATEGORIZATION`,
    concat('CASH_MANAGEMENT_TRANSACT_', format_string('%02d', idx)) AS `CASH_MANAGEMENT_TRANSACTION_CODE`,
    concat('SWEEP_STATUS_INDICATOR_', format_string('%02d', idx)) AS `SWEEP_STATUS_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_SWEEP_ACTIVATED`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_SWEEP_DETAILS_CHANGED`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `COVER_MARGIN_DEBIT_INDICATOR`,
    concat('FIRST_FUND_SWEEP_ACCOUNT_', format_string('%02d', idx)) AS `FIRST_FUND_SWEEP_ACCOUNT_ID`,
    concat('FIRST_FUND_SWEEP_ACCOUNT_', format_string('%02d', idx)) AS `FIRST_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`,
    concat('SECOND_FUND_SWEEP_ACCOUN_', format_string('%02d', idx)) AS `SECOND_FUND_SWEEP_ACCOUNT_ID`,
    concat('SECOND_FUND_SWEEP_ACCOUN_', format_string('%02d', idx)) AS `SECOND_FUND_SWEEP_ACCOUNT_REDEMPTION_PRIORITY`,
    concat('TYPE_OF_BANK_ACCOUNT_', format_string('%02d', idx)) AS `TYPE_OF_BANK_ACCOUNT`,
    concat('BANKLINK_ABA_NUMBER_', format_string('%02d', idx)) AS `BANKLINK_ABA_NUMBER`,
    concat('BANKLINK_DDA_NUMBER_', format_string('%02d', idx)) AS `BANKLINK_DDA_NUMBER`,
    concat('FUND_BANK_INDICATOR_', format_string('%02d', idx)) AS `FUND_BANK_INDICATOR`,
    concat('W_9_CORPORATION_TAX_CLAS_', format_string('%02d', idx)) AS `W_9_CORPORATION_TAX_CLASSIFICATION_CODE`,
    concat('COMBINED_MARGIN_ACCOUNT__', format_string('%02d', idx)) AS `COMBINED_MARGIN_ACCOUNT_INDICATOR`,
    concat('PLEDGE_COLLATERAL_ACCOUN_', format_string('%02d', idx)) AS `PLEDGE_COLLATERAL_ACCOUNT_INDICATOR`,
    concat('FINRA_INSTITUTIONAL_ACCO_', format_string('%02d', idx)) AS `FINRA_INSTITUTIONAL_ACCOUNT_CODE`,
    concat('PROPOSED_ACCOUNT_REFEREN_', format_string('%02d', idx)) AS `PROPOSED_ACCOUNT_REFERENCE_ID`,
    concat('ADVISOR_MODEL_ID_', format_string('%02d', idx)) AS `ADVISOR_MODEL_ID`,
    concat('FIRM_MODEL_STYLE_ID_', format_string('%02d', idx)) AS `FIRM_MODEL_STYLE_ID`,
    concat('THIRD_PARTY_LENDER_INDIC_', format_string('%02d', idx)) AS `THIRD_PARTY_LENDER_INDICATOR`,
    concat('RESERVED_FOR_FUTURE_THIR_', format_string('%02d', idx)) AS `RESERVED_FOR_FUTURE_THIRD_PARTY_LENDER_GROWTH`,
    concat('DVP_RESTRICTION_CODE_', format_string('%02d', idx)) AS `DVP_RESTRICTION_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DVP_RESTRICTION_EXPIRATION_DATE`,
    concat('ESCHEATMENT_WITHHOLDING__', format_string('%02d', idx)) AS `ESCHEATMENT_WITHHOLDING_INDICATOR`,
    concat('SOURCE_OF_ORIGINATION_', format_string('%02d', idx)) AS `SOURCE_OF_ORIGINATION`,
    concat('SOURCE_OF_PERSONA_', format_string('%02d', idx)) AS `SOURCE_OF_PERSONA`,
    concat('CLIENT_ON_BOARDING_METHO_', format_string('%02d', idx)) AS `CLIENT_ON_BOARDING_METHOD`,
    concat('TAX_FILING_CODE_', format_string('%02d', idx)) AS `TAX_FILING_CODE`,
    concat('NON_PURPOSE_COLLATERAL_A_', format_string('%02d', idx)) AS `NON_PURPOSE_COLLATERAL_ACCOUNT_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_acct_b' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_acct_b;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_caps_rec_1.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPS_1"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_caps_1 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `TRADE_DATE` DATE,
    `TRADE_REFERENCE_NUMBER` STRING,
    `PERSHING_OFFICE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `ACCOUNT_NAME` STRING,
    `BUY_SELL_INDICATOR` STRING,
    `CANCEL_INDICATOR` STRING,
    `CAPS_SOURCE` STRING,
    `TRADE_QUANTITY` DECIMAL(14,4),
    `PRICE` DECIMAL(14,7),
    `PRODUCT_CODE` STRING,
    `CUSIP_NUMBER_OF_SECURITY_TRADED` STRING,
    `ACCOUNT_SHORT_NAME` STRING,
    `ORDER_TYPE` STRING,
    `MISCELLANEOUS_FEE` DECIMAL(14,2),
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_caps_1 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_caps_1;

INSERT INTO landing_pershing.default.pershing_caps_1 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `TRADE_DATE`, `TRADE_REFERENCE_NUMBER`,
    `PERSHING_OFFICE_NUMBER`, `ACCOUNT_NUMBER`, `ACCOUNT_NAME`, `BUY_SELL_INDICATOR`, `CANCEL_INDICATOR`, `CAPS_SOURCE`,
    `TRADE_QUANTITY`, `PRICE`, `PRODUCT_CODE`, `CUSIP_NUMBER_OF_SECURITY_TRADED`, `ACCOUNT_SHORT_NAME`, `ORDER_TYPE`,
    `MISCELLANEOUS_FEE`, `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `TRADE_DATE`,
    concat('TRADE_REFERENCE_NUMBER_', format_string('%02d', idx)) AS `TRADE_REFERENCE_NUMBER`,
    concat('PERSHING_OFFICE_NUMBER_', format_string('%02d', idx)) AS `PERSHING_OFFICE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('ACCOUNT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_NAME`,
    concat('BUY_SELL_INDICATOR_', format_string('%02d', idx)) AS `BUY_SELL_INDICATOR`,
    concat('CANCEL_INDICATOR_', format_string('%02d', idx)) AS `CANCEL_INDICATOR`,
    concat('CAPS_SOURCE_', format_string('%02d', idx)) AS `CAPS_SOURCE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,4)) AS `TRADE_QUANTITY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,7)) AS `PRICE`,
    concat('PRODUCT_CODE_', format_string('%02d', idx)) AS `PRODUCT_CODE`,
    concat('CUSIP_NUMBER_OF_SECURITY_', format_string('%02d', idx)) AS `CUSIP_NUMBER_OF_SECURITY_TRADED`,
    concat('ACCOUNT_SHORT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_SHORT_NAME`,
    concat('ORDER_TYPE_', format_string('%02d', idx)) AS `ORDER_TYPE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,2)) AS `MISCELLANEOUS_FEE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_caps_1' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_caps_1;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_caps_rec_2.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPS_2"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_caps_2 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `MARKET_CODE` STRING,
    `BLOTTER_CODE` STRING,
    `SECURITY_TYPE` STRING,
    `STOCK_SYMBOL` STRING,
    `SECURITY_DESCRIPTION` STRING,
    `CENTS_PER_SHARE` DECIMAL(10,4),
    `DISCOUNT_PERCENT` DECIMAL(8,2),
    `PAYCODE` STRING,
    `MASTER_CLIENT_MNEMONIC` STRING,
    `INSTITUTIONAL_RETAIL_INDICATOR` STRING,
    `STATE_CODE` STRING,
    `COMISSION_INDICATOR` STRING,
    `FIRM_TRADING_ACCOUNT` STRING,
    `POSTED_DATE` DATE,
    `SETTLEMENT_DATE` DATE,
    `RECYCLE_INDICATOR` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_caps_2 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_caps_2;

INSERT INTO landing_pershing.default.pershing_caps_2 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `MARKET_CODE`, `BLOTTER_CODE`, `SECURITY_TYPE`, `STOCK_SYMBOL`,
    `SECURITY_DESCRIPTION`, `CENTS_PER_SHARE`, `DISCOUNT_PERCENT`, `PAYCODE`, `MASTER_CLIENT_MNEMONIC`,
    `INSTITUTIONAL_RETAIL_INDICATOR`, `STATE_CODE`, `COMISSION_INDICATOR`, `FIRM_TRADING_ACCOUNT`, `POSTED_DATE`,
    `SETTLEMENT_DATE`, `RECYCLE_INDICATOR`, `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    concat('MARKET_CODE_', format_string('%02d', idx)) AS `MARKET_CODE`,
    concat('BLOTTER_CODE_', format_string('%02d', idx)) AS `BLOTTER_CODE`,
    concat('SECURITY_TYPE_', format_string('%02d', idx)) AS `SECURITY_TYPE`,
    concat('STOCK_SYMBOL_', format_string('%02d', idx)) AS `STOCK_SYMBOL`,
    concat('SECURITY_DESCRIPTION_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,4)) AS `CENTS_PER_SHARE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(8,2)) AS `DISCOUNT_PERCENT`,
    concat('PAYCODE_', format_string('%02d', idx)) AS `PAYCODE`,
    concat('MASTER_CLIENT_MNEMONIC_', format_string('%02d', idx)) AS `MASTER_CLIENT_MNEMONIC`,
    concat('INSTITUTIONAL_RETAIL_IND_', format_string('%02d', idx)) AS `INSTITUTIONAL_RETAIL_INDICATOR`,
    concat('STATE_CODE_', format_string('%02d', idx)) AS `STATE_CODE`,
    concat('COMISSION_INDICATOR_', format_string('%02d', idx)) AS `COMISSION_INDICATOR`,
    concat('FIRM_TRADING_ACCOUNT_', format_string('%02d', idx)) AS `FIRM_TRADING_ACCOUNT`,
    date_add(DATE '2026-01-01', idx - 1) AS `POSTED_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `SETTLEMENT_DATE`,
    concat('RECYCLE_INDICATOR_', format_string('%02d', idx)) AS `RECYCLE_INDICATOR`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_caps_2' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_caps_2;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_caps_rec_3.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPS_3"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_caps_3 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `AS_OF_TRADE_INDICATOR` STRING,
    `DISTRIBUTION_INDICATOR` STRING,
    `EXPLODE_INDICATOR` STRING,
    `REVENUE_TYPE` STRING,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `INVESTMENT_PROFESSIONAL_CAPS_REVENUE_CENTER` STRING,
    `INVESTMENT_PROFESSIONAL_CAPS_OFFICE_NUMBER` STRING,
    `INVESTMENT_PROFESSIONAL_SPLIT_PERCENT` DECIMAL(7,3),
    `TOTAL_AMOUNT_OF_REVENUE_GENERATED_AND_CREDITED_TO_IP` DECIMAL(14,2),
    `PERSHING_CHARGE` DECIMAL(12,2),
    `LEGACY_FROM_INVESTMENT_PROFESSIONAL_NUMBER` STRING,
    `CAPS_REVENUE_CENTER_ASSOCIATED_WITH_IP` STRING,
    `CAPS_OFFICE_NUMBER_ASSOCIATED_WITH_IP` STRING,
    `TOTAL_ORDER_COMMISSION` DECIMAL(12,2),
    `SPREAD_STRADDLE_MUTUAL_FUND_VALUES` DECIMAL(38,10),
    `CORRECTION_CODE` STRING,
    `SECURITY_MODIFIER` STRING,
    `SECURITY_CALCULATION_CODE` STRING,
    `PRINCIPAL` DECIMAL(12,2),
    `CRD_NUMBER` STRING,
    `SOURCE_OF_INPUT` STRING,
    `SERVICE_CHARGE_OTHER_FEE` DECIMAL(12,2),
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_caps_3 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_caps_3;

INSERT INTO landing_pershing.default.pershing_caps_3 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `AS_OF_TRADE_INDICATOR`, `DISTRIBUTION_INDICATOR`,
    `EXPLODE_INDICATOR`, `REVENUE_TYPE`, `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `INVESTMENT_PROFESSIONAL_CAPS_REVENUE_CENTER`, `INVESTMENT_PROFESSIONAL_CAPS_OFFICE_NUMBER`,
    `INVESTMENT_PROFESSIONAL_SPLIT_PERCENT`, `TOTAL_AMOUNT_OF_REVENUE_GENERATED_AND_CREDITED_TO_IP`, `PERSHING_CHARGE`,
    `LEGACY_FROM_INVESTMENT_PROFESSIONAL_NUMBER`, `CAPS_REVENUE_CENTER_ASSOCIATED_WITH_IP`,
    `CAPS_OFFICE_NUMBER_ASSOCIATED_WITH_IP`, `TOTAL_ORDER_COMMISSION`, `SPREAD_STRADDLE_MUTUAL_FUND_VALUES`,
    `CORRECTION_CODE`, `SECURITY_MODIFIER`, `SECURITY_CALCULATION_CODE`, `PRINCIPAL`, `CRD_NUMBER`, `SOURCE_OF_INPUT`,
    `SERVICE_CHARGE_OTHER_FEE`, `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    concat('AS_OF_TRADE_INDICATOR_', format_string('%02d', idx)) AS `AS_OF_TRADE_INDICATOR`,
    concat('DISTRIBUTION_INDICATOR_', format_string('%02d', idx)) AS `DISTRIBUTION_INDICATOR`,
    concat('EXPLODE_INDICATOR_', format_string('%02d', idx)) AS `EXPLODE_INDICATOR`,
    concat('REVENUE_TYPE_', format_string('%02d', idx)) AS `REVENUE_TYPE`,
    concat('LEGACY_INVESTMENT_PROFES_', format_string('%02d', idx)) AS `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('INVESTMENT_PROFESSIONAL__', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL_CAPS_REVENUE_CENTER`,
    concat('INVESTMENT_PROFESSIONAL__', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL_CAPS_OFFICE_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(7,3)) AS `INVESTMENT_PROFESSIONAL_SPLIT_PERCENT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,2)) AS `TOTAL_AMOUNT_OF_REVENUE_GENERATED_AND_CREDITED_TO_IP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(12,2)) AS `PERSHING_CHARGE`,
    concat('LEGACY_FROM_INVESTMENT_P_', format_string('%02d', idx)) AS `LEGACY_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    concat('CAPS_REVENUE_CENTER_ASSO_', format_string('%02d', idx)) AS `CAPS_REVENUE_CENTER_ASSOCIATED_WITH_IP`,
    concat('CAPS_OFFICE_NUMBER_ASSOC_', format_string('%02d', idx)) AS `CAPS_OFFICE_NUMBER_ASSOCIATED_WITH_IP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(12,2)) AS `TOTAL_ORDER_COMMISSION`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `SPREAD_STRADDLE_MUTUAL_FUND_VALUES`,
    concat('CORRECTION_CODE_', format_string('%02d', idx)) AS `CORRECTION_CODE`,
    concat('SECURITY_MODIFIER_', format_string('%02d', idx)) AS `SECURITY_MODIFIER`,
    concat('SECURITY_CALCULATION_COD_', format_string('%02d', idx)) AS `SECURITY_CALCULATION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(12,2)) AS `PRINCIPAL`,
    concat('CRD_NUMBER_', format_string('%02d', idx)) AS `CRD_NUMBER`,
    concat('SOURCE_OF_INPUT_', format_string('%02d', idx)) AS `SOURCE_OF_INPUT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(12,2)) AS `SERVICE_CHARGE_OTHER_FEE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_caps_3' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_caps_3;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_caps_rec_4.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPS_4"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_caps_4 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `CURRENCY_CODE` STRING,
    `CURRENCY_AMOUNT_OF_REVENUE` DECIMAL(20,3),
    `FOREIGN_EXCHANGE_RATE` DECIMAL(20,10),
    `CURRENCY_MULTI_DIV_INDICATOR` STRING,
    `IBD_SETTLEMENT_FEE_USD` DECIMAL(20,3),
    `CUSTOMER_SETTLEMENT_FEE_USD` DECIMAL(20,3),
    `GLOSS_REFERENCE_NUMBER` STRING,
    `CURRENCY_AMOUNT_OF_PERSHING_CHARGE` DECIMAL(14,2),
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_caps_4 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_caps_4;

INSERT INTO landing_pershing.default.pershing_caps_4 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `CURRENCY_CODE`, `CURRENCY_AMOUNT_OF_REVENUE`,
    `FOREIGN_EXCHANGE_RATE`, `CURRENCY_MULTI_DIV_INDICATOR`, `IBD_SETTLEMENT_FEE_USD`, `CUSTOMER_SETTLEMENT_FEE_USD`,
    `GLOSS_REFERENCE_NUMBER`, `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`, `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    concat('CURRENCY_CODE_', format_string('%02d', idx)) AS `CURRENCY_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,3)) AS `CURRENCY_AMOUNT_OF_REVENUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,10)) AS `FOREIGN_EXCHANGE_RATE`,
    concat('CURRENCY_MULTI_DIV_INDIC_', format_string('%02d', idx)) AS `CURRENCY_MULTI_DIV_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,3)) AS `IBD_SETTLEMENT_FEE_USD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,3)) AS `CUSTOMER_SETTLEMENT_FEE_USD`,
    concat('GLOSS_REFERENCE_NUMBER_', format_string('%02d', idx)) AS `GLOSS_REFERENCE_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,2)) AS `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_caps_4' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_caps_4;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_caps_rec_5.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPS_5"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_caps_5 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `OPTION_ROOT_ID` STRING,
    `EXPIRATION_DATE` DATE,
    `CALL_PUT_INDICATOR` STRING,
    `STRIKE_PRICE` DECIMAL(10,3),
    `MASTER_CLIENT_NAME` STRING,
    `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER` STRING,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_caps_5 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_caps_5;

INSERT INTO landing_pershing.default.pershing_caps_5 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `OPTION_ROOT_ID`, `EXPIRATION_DATE`, `CALL_PUT_INDICATOR`,
    `STRIKE_PRICE`, `MASTER_CLIENT_NAME`, `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    concat('OPTION_ROOT_ID_', format_string('%02d', idx)) AS `OPTION_ROOT_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `EXPIRATION_DATE`,
    concat('CALL_PUT_INDICATOR_', format_string('%02d', idx)) AS `CALL_PUT_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `STRIKE_PRICE`,
    concat('MASTER_CLIENT_NAME_', format_string('%02d', idx)) AS `MASTER_CLIENT_NAME`,
    concat('PERSHING_INTERNAL_ORDER__', format_string('%02d', idx)) AS `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`,
    concat('EXPANDED_INVESTMENT_PROF_', format_string('%02d', idx)) AS `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('EXPANDED_FROM_INVESTMENT_', format_string('%02d', idx)) AS `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_caps_5' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_caps_5;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_capt_rec_1.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPT_1"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_capt_1 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `TRADE_DATE` DATE,
    `TRADE_REFERENCE_NUMBER` STRING,
    `PERSHING_OFFICE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `ACCOUNT_NAME` STRING,
    `BUY_SELL_INDICATOR` STRING,
    `CANCEL_INDICATOR` STRING,
    `CAPS_SOURCE` STRING,
    `TRADE_QUANTITY` DECIMAL(14,4),
    `PRICE` DECIMAL(14,7),
    `PRODUCT_CODE` STRING,
    `CUSIP_NUMBER_OF_SECURITY_TRADED` STRING,
    `ACCOUNT_SHORT_NAME` STRING,
    `ORDER_TYPE` STRING,
    `MISCELLANEOUS_FEE` DECIMAL(14,2),
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_capt_1 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_capt_1;

INSERT INTO landing_pershing.default.pershing_capt_1 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `TRADE_DATE`, `TRADE_REFERENCE_NUMBER`,
    `PERSHING_OFFICE_NUMBER`, `ACCOUNT_NUMBER`, `ACCOUNT_NAME`, `BUY_SELL_INDICATOR`, `CANCEL_INDICATOR`, `CAPS_SOURCE`,
    `TRADE_QUANTITY`, `PRICE`, `PRODUCT_CODE`, `CUSIP_NUMBER_OF_SECURITY_TRADED`, `ACCOUNT_SHORT_NAME`, `ORDER_TYPE`,
    `MISCELLANEOUS_FEE`, `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `TRADE_DATE`,
    concat('TRADE_REFERENCE_NUMBER_', format_string('%02d', idx)) AS `TRADE_REFERENCE_NUMBER`,
    concat('PERSHING_OFFICE_NUMBER_', format_string('%02d', idx)) AS `PERSHING_OFFICE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('ACCOUNT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_NAME`,
    concat('BUY_SELL_INDICATOR_', format_string('%02d', idx)) AS `BUY_SELL_INDICATOR`,
    concat('CANCEL_INDICATOR_', format_string('%02d', idx)) AS `CANCEL_INDICATOR`,
    concat('CAPS_SOURCE_', format_string('%02d', idx)) AS `CAPS_SOURCE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,4)) AS `TRADE_QUANTITY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,7)) AS `PRICE`,
    concat('PRODUCT_CODE_', format_string('%02d', idx)) AS `PRODUCT_CODE`,
    concat('CUSIP_NUMBER_OF_SECURITY_', format_string('%02d', idx)) AS `CUSIP_NUMBER_OF_SECURITY_TRADED`,
    concat('ACCOUNT_SHORT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_SHORT_NAME`,
    concat('ORDER_TYPE_', format_string('%02d', idx)) AS `ORDER_TYPE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,2)) AS `MISCELLANEOUS_FEE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_capt_1' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_capt_1;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_capt_rec_2.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPT_2"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_capt_2 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `MARKET_CODE` STRING,
    `BLOTTER_CODE` STRING,
    `SECURITY_TYPE` STRING,
    `STOCK_SYMBOL` STRING,
    `SECURITY_DESCRIPTION` STRING,
    `CENTS_PER_SHARE` DECIMAL(10,4),
    `DISCOUNT_PERCENT` DECIMAL(8,2),
    `PAYCODE` STRING,
    `MASTER_CLIENT_MNEMONIC` STRING,
    `INSTITUTIONAL_RETAIL_INDICATOR` STRING,
    `STATE_CODE` STRING,
    `COMISSION_INDICATOR` STRING,
    `FIRM_TRADING_ACCOUNT` STRING,
    `POSTED_DATE` DATE,
    `SETTLEMENT_DATE` DATE,
    `RECYCLE_INDICATOR` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_capt_2 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_capt_2;

INSERT INTO landing_pershing.default.pershing_capt_2 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `MARKET_CODE`, `BLOTTER_CODE`, `SECURITY_TYPE`, `STOCK_SYMBOL`,
    `SECURITY_DESCRIPTION`, `CENTS_PER_SHARE`, `DISCOUNT_PERCENT`, `PAYCODE`, `MASTER_CLIENT_MNEMONIC`,
    `INSTITUTIONAL_RETAIL_INDICATOR`, `STATE_CODE`, `COMISSION_INDICATOR`, `FIRM_TRADING_ACCOUNT`, `POSTED_DATE`,
    `SETTLEMENT_DATE`, `RECYCLE_INDICATOR`, `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    concat('MARKET_CODE_', format_string('%02d', idx)) AS `MARKET_CODE`,
    concat('BLOTTER_CODE_', format_string('%02d', idx)) AS `BLOTTER_CODE`,
    concat('SECURITY_TYPE_', format_string('%02d', idx)) AS `SECURITY_TYPE`,
    concat('STOCK_SYMBOL_', format_string('%02d', idx)) AS `STOCK_SYMBOL`,
    concat('SECURITY_DESCRIPTION_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,4)) AS `CENTS_PER_SHARE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(8,2)) AS `DISCOUNT_PERCENT`,
    concat('PAYCODE_', format_string('%02d', idx)) AS `PAYCODE`,
    concat('MASTER_CLIENT_MNEMONIC_', format_string('%02d', idx)) AS `MASTER_CLIENT_MNEMONIC`,
    concat('INSTITUTIONAL_RETAIL_IND_', format_string('%02d', idx)) AS `INSTITUTIONAL_RETAIL_INDICATOR`,
    concat('STATE_CODE_', format_string('%02d', idx)) AS `STATE_CODE`,
    concat('COMISSION_INDICATOR_', format_string('%02d', idx)) AS `COMISSION_INDICATOR`,
    concat('FIRM_TRADING_ACCOUNT_', format_string('%02d', idx)) AS `FIRM_TRADING_ACCOUNT`,
    date_add(DATE '2026-01-01', idx - 1) AS `POSTED_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `SETTLEMENT_DATE`,
    concat('RECYCLE_INDICATOR_', format_string('%02d', idx)) AS `RECYCLE_INDICATOR`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_capt_2' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_capt_2;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_capt_rec_3.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPT_3"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_capt_3 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `AS_OF_TRADE_INDICATOR` STRING,
    `DISTRIBUTION_INDICATOR` STRING,
    `EXPLODE_INDICATOR` STRING,
    `REVENUE_TYPE` STRING,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `INVESTMENT_PROFESSIONAL_CAPS_REVENUE_CENTER` STRING,
    `INVESTMENT_PROFESSIONAL_CAPS_OFFICE_NUMBER` STRING,
    `INVESTMENT_PROFESSIONAL_SPLIT_PERCENT` DECIMAL(7,3),
    `TOTAL_AMOUNT_OF_REVENUE_GENERATED_AND_CREDITED_TO_IP` DECIMAL(14,2),
    `PERSHING_CHARGE` DECIMAL(12,2),
    `LEGACY_FROM_INVESTMENT_PROFESSIONAL_NUMBER` STRING,
    `CAPS_REVENUE_CENTER_ASSOCIATED_WITH_IP` STRING,
    `CAPS_OFFICE_NUMBER_ASSOCIATED_WITH_IP` STRING,
    `TOTAL_ORDER_COMMISSION` DECIMAL(12,2),
    `SPREAD_STRADDLE_MUTUAL_FUND_VALUES` DECIMAL(38,10),
    `CORRECTION_CODE` STRING,
    `SECURITY_MODIFIER` STRING,
    `SECURITY_CALCULATION_CODE` STRING,
    `PRINCIPAL` DECIMAL(12,2),
    `CRD_NUMBER` STRING,
    `SOURCE_OF_INPUT` STRING,
    `SERVICE_CHARGE_OTHER_FEE` DECIMAL(12,2),
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_capt_3 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_capt_3;

INSERT INTO landing_pershing.default.pershing_capt_3 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `AS_OF_TRADE_INDICATOR`, `DISTRIBUTION_INDICATOR`,
    `EXPLODE_INDICATOR`, `REVENUE_TYPE`, `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `INVESTMENT_PROFESSIONAL_CAPS_REVENUE_CENTER`, `INVESTMENT_PROFESSIONAL_CAPS_OFFICE_NUMBER`,
    `INVESTMENT_PROFESSIONAL_SPLIT_PERCENT`, `TOTAL_AMOUNT_OF_REVENUE_GENERATED_AND_CREDITED_TO_IP`, `PERSHING_CHARGE`,
    `LEGACY_FROM_INVESTMENT_PROFESSIONAL_NUMBER`, `CAPS_REVENUE_CENTER_ASSOCIATED_WITH_IP`,
    `CAPS_OFFICE_NUMBER_ASSOCIATED_WITH_IP`, `TOTAL_ORDER_COMMISSION`, `SPREAD_STRADDLE_MUTUAL_FUND_VALUES`,
    `CORRECTION_CODE`, `SECURITY_MODIFIER`, `SECURITY_CALCULATION_CODE`, `PRINCIPAL`, `CRD_NUMBER`, `SOURCE_OF_INPUT`,
    `SERVICE_CHARGE_OTHER_FEE`, `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    concat('AS_OF_TRADE_INDICATOR_', format_string('%02d', idx)) AS `AS_OF_TRADE_INDICATOR`,
    concat('DISTRIBUTION_INDICATOR_', format_string('%02d', idx)) AS `DISTRIBUTION_INDICATOR`,
    concat('EXPLODE_INDICATOR_', format_string('%02d', idx)) AS `EXPLODE_INDICATOR`,
    concat('REVENUE_TYPE_', format_string('%02d', idx)) AS `REVENUE_TYPE`,
    concat('LEGACY_INVESTMENT_PROFES_', format_string('%02d', idx)) AS `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('INVESTMENT_PROFESSIONAL__', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL_CAPS_REVENUE_CENTER`,
    concat('INVESTMENT_PROFESSIONAL__', format_string('%02d', idx)) AS `INVESTMENT_PROFESSIONAL_CAPS_OFFICE_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(7,3)) AS `INVESTMENT_PROFESSIONAL_SPLIT_PERCENT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,2)) AS `TOTAL_AMOUNT_OF_REVENUE_GENERATED_AND_CREDITED_TO_IP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(12,2)) AS `PERSHING_CHARGE`,
    concat('LEGACY_FROM_INVESTMENT_P_', format_string('%02d', idx)) AS `LEGACY_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    concat('CAPS_REVENUE_CENTER_ASSO_', format_string('%02d', idx)) AS `CAPS_REVENUE_CENTER_ASSOCIATED_WITH_IP`,
    concat('CAPS_OFFICE_NUMBER_ASSOC_', format_string('%02d', idx)) AS `CAPS_OFFICE_NUMBER_ASSOCIATED_WITH_IP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(12,2)) AS `TOTAL_ORDER_COMMISSION`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `SPREAD_STRADDLE_MUTUAL_FUND_VALUES`,
    concat('CORRECTION_CODE_', format_string('%02d', idx)) AS `CORRECTION_CODE`,
    concat('SECURITY_MODIFIER_', format_string('%02d', idx)) AS `SECURITY_MODIFIER`,
    concat('SECURITY_CALCULATION_COD_', format_string('%02d', idx)) AS `SECURITY_CALCULATION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(12,2)) AS `PRINCIPAL`,
    concat('CRD_NUMBER_', format_string('%02d', idx)) AS `CRD_NUMBER`,
    concat('SOURCE_OF_INPUT_', format_string('%02d', idx)) AS `SOURCE_OF_INPUT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(12,2)) AS `SERVICE_CHARGE_OTHER_FEE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_capt_3' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_capt_3;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_capt_rec_4.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPT_4"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_capt_4 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `CURRENCY_CODE` STRING,
    `CURRENCY_AMOUNT_OF_REVENUE` DECIMAL(20,3),
    `FOREIGN_EXCHANGE_RATE` DECIMAL(20,10),
    `CURRENCY_MULTI_DIV_INDICATOR` STRING,
    `IBD_SETTLEMENT_FEE_USD` DECIMAL(20,3),
    `CUSTOMER_SETTLEMENT_FEE_USD` DECIMAL(20,3),
    `GLOSS_REFERENCE_NUMBER` STRING,
    `CURRENCY_AMOUNT_OF_PERSHING_CHARGE` DECIMAL(14,2),
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_capt_4 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_capt_4;

INSERT INTO landing_pershing.default.pershing_capt_4 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `CURRENCY_CODE`, `CURRENCY_AMOUNT_OF_REVENUE`,
    `FOREIGN_EXCHANGE_RATE`, `CURRENCY_MULTI_DIV_INDICATOR`, `IBD_SETTLEMENT_FEE_USD`, `CUSTOMER_SETTLEMENT_FEE_USD`,
    `GLOSS_REFERENCE_NUMBER`, `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`, `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    concat('CURRENCY_CODE_', format_string('%02d', idx)) AS `CURRENCY_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,3)) AS `CURRENCY_AMOUNT_OF_REVENUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,10)) AS `FOREIGN_EXCHANGE_RATE`,
    concat('CURRENCY_MULTI_DIV_INDIC_', format_string('%02d', idx)) AS `CURRENCY_MULTI_DIV_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,3)) AS `IBD_SETTLEMENT_FEE_USD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,3)) AS `CUSTOMER_SETTLEMENT_FEE_USD`,
    concat('GLOSS_REFERENCE_NUMBER_', format_string('%02d', idx)) AS `GLOSS_REFERENCE_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,2)) AS `CURRENCY_AMOUNT_OF_PERSHING_CHARGE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_capt_4' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_capt_4;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_capt_rec_5.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CAPT_5"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_capt_5 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER` STRING,
    `RECORD_ID` STRING,
    `OPTION_ROOT_ID` STRING,
    `EXPIRATION_DATE` DATE,
    `CALL_PUT_INDICATOR` STRING,
    `STRIKE_PRICE` DECIMAL(10,3),
    `MASTER_CLIENT_NAME` STRING,
    `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER` STRING,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_capt_5 IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_capt_5;

INSERT INTO landing_pershing.default.pershing_capt_5 (
    `INTRODUCING_BROKER_DEALER_IBD_NUMBER`, `RECORD_ID`, `OPTION_ROOT_ID`, `EXPIRATION_DATE`, `CALL_PUT_INDICATOR`,
    `STRIKE_PRICE`, `MASTER_CLIENT_NAME`, `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    `RECORD_ID_SEQUENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_NUMBER`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    concat('OPTION_ROOT_ID_', format_string('%02d', idx)) AS `OPTION_ROOT_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `EXPIRATION_DATE`,
    concat('CALL_PUT_INDICATOR_', format_string('%02d', idx)) AS `CALL_PUT_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `STRIKE_PRICE`,
    concat('MASTER_CLIENT_NAME_', format_string('%02d', idx)) AS `MASTER_CLIENT_NAME`,
    concat('PERSHING_INTERNAL_ORDER__', format_string('%02d', idx)) AS `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`,
    concat('EXPANDED_INVESTMENT_PROF_', format_string('%02d', idx)) AS `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('EXPANDED_FROM_INVESTMENT_', format_string('%02d', idx)) AS `EXPANDED_FROM_INVESTMENT_PROFESSIONAL_NUMBER`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_capt_5' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_capt_5;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_ckff_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CKFF_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_ckff_a (
    `TRANSACTION_CODE` STRING,
    `RECORD_TYPE` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `TRANSACTION_AMOUNT` DECIMAL(18,2),
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `INTERMEDIARY_DESCRIPTION_LINE_1` STRING,
    `INTERMEDIARY_DESCRIPTION_LINE_2` STRING,
    `ACCOUNT_WITH_INSTITUTION` STRING,
    `BENEFICIARY_CUSTOMER_1` STRING,
    `BENEFICIARY_CUSTOMER_2` STRING,
    `BENEFICIARY_CUSTOMER_3` STRING,
    `BENEFICIARY_CUSTOMER_4` STRING,
    `OUTGOING_WIRES_ADD_INFO1_OR_DESC_TRANSACT` STRING,
    `OUTGOING_WIRES_ADD_INFO2_OR_ABA_NUMBER` STRING,
    `OUTGOING_WIRES_ADD_INFO3_OR_DDA_NUMBER` STRING,
    `OUTGOING_WIRES_ACH_ADD_INFO4` STRING,
    `OUTGOING_WIRES_ACH_ADD_INFO5` STRING,
    `OUTGOING_WIRES_ACH_ADD_INFO6` STRING,
    `OUTGOING_WIRES_ACH_ADD_INFO7` STRING,
    `OUTGOING_WIRES_ACH_ADD_INFO8` STRING,
    `OUTGOING_WIRES_ACH_ADD_INFO9` STRING,
    `DUPLICATE_RECORD_INDICATOR` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_ckff_a IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_ckff_a;

INSERT INTO landing_pershing.default.pershing_ckff_a (
    `TRANSACTION_CODE`, `RECORD_TYPE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `TRANSACTION_AMOUNT`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    `INTERMEDIARY_DESCRIPTION_LINE_1`, `INTERMEDIARY_DESCRIPTION_LINE_2`, `ACCOUNT_WITH_INSTITUTION`,
    `BENEFICIARY_CUSTOMER_1`, `BENEFICIARY_CUSTOMER_2`, `BENEFICIARY_CUSTOMER_3`, `BENEFICIARY_CUSTOMER_4`,
    `OUTGOING_WIRES_ADD_INFO1_OR_DESC_TRANSACT`, `OUTGOING_WIRES_ADD_INFO2_OR_ABA_NUMBER`,
    `OUTGOING_WIRES_ADD_INFO3_OR_DDA_NUMBER`, `OUTGOING_WIRES_ACH_ADD_INFO4`, `OUTGOING_WIRES_ACH_ADD_INFO5`,
    `OUTGOING_WIRES_ACH_ADD_INFO6`, `OUTGOING_WIRES_ACH_ADD_INFO7`, `OUTGOING_WIRES_ACH_ADD_INFO8`,
    `OUTGOING_WIRES_ACH_ADD_INFO9`, `DUPLICATE_RECORD_INDICATOR`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    concat('RECORD_TYPE_', format_string('%02d', idx)) AS `RECORD_TYPE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `TRANSACTION_AMOUNT`,
    concat('LEGACY_INVESTMENT_PROFES_', format_string('%02d', idx)) AS `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('EXPANDED_INVESTMENT_PROF_', format_string('%02d', idx)) AS `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('INTERMEDIARY_DESCRIPTION_', format_string('%02d', idx)) AS `INTERMEDIARY_DESCRIPTION_LINE_1`,
    concat('INTERMEDIARY_DESCRIPTION_', format_string('%02d', idx)) AS `INTERMEDIARY_DESCRIPTION_LINE_2`,
    concat('ACCOUNT_WITH_INSTITUTION_', format_string('%02d', idx)) AS `ACCOUNT_WITH_INSTITUTION`,
    concat('BENEFICIARY_CUSTOMER_1_', format_string('%02d', idx)) AS `BENEFICIARY_CUSTOMER_1`,
    concat('BENEFICIARY_CUSTOMER_2_', format_string('%02d', idx)) AS `BENEFICIARY_CUSTOMER_2`,
    concat('BENEFICIARY_CUSTOMER_3_', format_string('%02d', idx)) AS `BENEFICIARY_CUSTOMER_3`,
    concat('BENEFICIARY_CUSTOMER_4_', format_string('%02d', idx)) AS `BENEFICIARY_CUSTOMER_4`,
    concat('OUTGOING_WIRES_ADD_INFO1_', format_string('%02d', idx)) AS `OUTGOING_WIRES_ADD_INFO1_OR_DESC_TRANSACT`,
    concat('OUTGOING_WIRES_ADD_INFO2_', format_string('%02d', idx)) AS `OUTGOING_WIRES_ADD_INFO2_OR_ABA_NUMBER`,
    concat('OUTGOING_WIRES_ADD_INFO3_', format_string('%02d', idx)) AS `OUTGOING_WIRES_ADD_INFO3_OR_DDA_NUMBER`,
    concat('OUTGOING_WIRES_ACH_ADD_I_', format_string('%02d', idx)) AS `OUTGOING_WIRES_ACH_ADD_INFO4`,
    concat('OUTGOING_WIRES_ACH_ADD_I_', format_string('%02d', idx)) AS `OUTGOING_WIRES_ACH_ADD_INFO5`,
    concat('OUTGOING_WIRES_ACH_ADD_I_', format_string('%02d', idx)) AS `OUTGOING_WIRES_ACH_ADD_INFO6`,
    concat('OUTGOING_WIRES_ACH_ADD_I_', format_string('%02d', idx)) AS `OUTGOING_WIRES_ACH_ADD_INFO7`,
    concat('OUTGOING_WIRES_ACH_ADD_I_', format_string('%02d', idx)) AS `OUTGOING_WIRES_ACH_ADD_INFO8`,
    concat('OUTGOING_WIRES_ACH_ADD_I_', format_string('%02d', idx)) AS `OUTGOING_WIRES_ACH_ADD_INFO9`,
    concat('DUPLICATE_RECORD_INDICAT_', format_string('%02d', idx)) AS `DUPLICATE_RECORD_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_ckff_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_ckff_a;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_ckff_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CKFF_B"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_ckff_b (
    `TRANSACTION_CODE` STRING,
    `RECORD_TYPE` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `TRANSACTION_AMOUNT` DECIMAL(18,2),
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `PAYEE_INFORMATION_LINE_1` STRING,
    `PAYEE_INFORMATION_LINE_2` STRING,
    `PAYEE_INFORMATION_LINE_3` STRING,
    `CHECK_NUMBER_OR_CHECK_DIS_ADD_INFO_LINE_1` STRING,
    `CHECK_DIS_ADD_INFO_LINE_2` STRING,
    `CHECK_DIS_ADD_INFO_LINE_3` STRING,
    `CHECK_DIS_ADD_INFO_LINE_4` STRING,
    `CHECK_DIS_ADD_INFO_LINE_5` STRING,
    `CHECK_DIS_ADD_INFO_LINE_6` STRING,
    `CHECK_DIS_ADD_INFO_LINE_7` STRING,
    `CHECK_DIS_ADD_INFO_LINE_8` STRING,
    `CHECK_DIS_ADD_INFO_LINE_9` STRING,
    `THIRD_PARTY_INDICATOR` STRING,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_ckff_b IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_ckff_b;

INSERT INTO landing_pershing.default.pershing_ckff_b (
    `TRANSACTION_CODE`, `RECORD_TYPE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `TRANSACTION_AMOUNT`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `PAYEE_INFORMATION_LINE_1`, `PAYEE_INFORMATION_LINE_2`,
    `PAYEE_INFORMATION_LINE_3`, `CHECK_NUMBER_OR_CHECK_DIS_ADD_INFO_LINE_1`, `CHECK_DIS_ADD_INFO_LINE_2`,
    `CHECK_DIS_ADD_INFO_LINE_3`, `CHECK_DIS_ADD_INFO_LINE_4`, `CHECK_DIS_ADD_INFO_LINE_5`, `CHECK_DIS_ADD_INFO_LINE_6`,
    `CHECK_DIS_ADD_INFO_LINE_7`, `CHECK_DIS_ADD_INFO_LINE_8`, `CHECK_DIS_ADD_INFO_LINE_9`, `THIRD_PARTY_INDICATOR`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    concat('RECORD_TYPE_', format_string('%02d', idx)) AS `RECORD_TYPE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `TRANSACTION_AMOUNT`,
    concat('LEGACY_INVESTMENT_PROFES_', format_string('%02d', idx)) AS `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('PAYEE_INFORMATION_LINE_1_', format_string('%02d', idx)) AS `PAYEE_INFORMATION_LINE_1`,
    concat('PAYEE_INFORMATION_LINE_2_', format_string('%02d', idx)) AS `PAYEE_INFORMATION_LINE_2`,
    concat('PAYEE_INFORMATION_LINE_3_', format_string('%02d', idx)) AS `PAYEE_INFORMATION_LINE_3`,
    concat('CHECK_NUMBER_OR_CHECK_DI_', format_string('%02d', idx)) AS `CHECK_NUMBER_OR_CHECK_DIS_ADD_INFO_LINE_1`,
    concat('CHECK_DIS_ADD_INFO_LINE__', format_string('%02d', idx)) AS `CHECK_DIS_ADD_INFO_LINE_2`,
    concat('CHECK_DIS_ADD_INFO_LINE__', format_string('%02d', idx)) AS `CHECK_DIS_ADD_INFO_LINE_3`,
    concat('CHECK_DIS_ADD_INFO_LINE__', format_string('%02d', idx)) AS `CHECK_DIS_ADD_INFO_LINE_4`,
    concat('CHECK_DIS_ADD_INFO_LINE__', format_string('%02d', idx)) AS `CHECK_DIS_ADD_INFO_LINE_5`,
    concat('CHECK_DIS_ADD_INFO_LINE__', format_string('%02d', idx)) AS `CHECK_DIS_ADD_INFO_LINE_6`,
    concat('CHECK_DIS_ADD_INFO_LINE__', format_string('%02d', idx)) AS `CHECK_DIS_ADD_INFO_LINE_7`,
    concat('CHECK_DIS_ADD_INFO_LINE__', format_string('%02d', idx)) AS `CHECK_DIS_ADD_INFO_LINE_8`,
    concat('CHECK_DIS_ADD_INFO_LINE__', format_string('%02d', idx)) AS `CHECK_DIS_ADD_INFO_LINE_9`,
    concat('THIRD_PARTY_INDICATOR_', format_string('%02d', idx)) AS `THIRD_PARTY_INDICATOR`,
    concat('EXPANDED_INVESTMENT_PROF_', format_string('%02d', idx)) AS `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_ckff_b' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_ckff_b;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_ckff_rec_c.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CKFF_C"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_ckff_c (
    `TRANSACTION_CODE` STRING,
    `RECORD_TYPE` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `TRANSACTION_AMOUNT` DECIMAL(18,2),
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `DESCRIPTION_CODE` STRING,
    `DESCRIPTION` STRING,
    `ADDITIONAL_DESCRIPTION_OR_CHECK_DEPO_ADD_INFO_LINE_1` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_2` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_3` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_4` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_5` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_6` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_7` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_8` STRING,
    `CHECK_DEPO_ADD_INFO_LINE_9` STRING,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_ckff_c IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_ckff_c;

INSERT INTO landing_pershing.default.pershing_ckff_c (
    `TRANSACTION_CODE`, `RECORD_TYPE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `TRANSACTION_AMOUNT`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `DESCRIPTION_CODE`, `DESCRIPTION`,
    `ADDITIONAL_DESCRIPTION_OR_CHECK_DEPO_ADD_INFO_LINE_1`, `CHECK_DEPO_ADD_INFO_LINE_2`, `CHECK_DEPO_ADD_INFO_LINE_3`,
    `CHECK_DEPO_ADD_INFO_LINE_4`, `CHECK_DEPO_ADD_INFO_LINE_5`, `CHECK_DEPO_ADD_INFO_LINE_6`,
    `CHECK_DEPO_ADD_INFO_LINE_7`, `CHECK_DEPO_ADD_INFO_LINE_8`, `CHECK_DEPO_ADD_INFO_LINE_9`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    concat('RECORD_TYPE_', format_string('%02d', idx)) AS `RECORD_TYPE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `TRANSACTION_AMOUNT`,
    concat('LEGACY_INVESTMENT_PROFES_', format_string('%02d', idx)) AS `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('DESCRIPTION_CODE_', format_string('%02d', idx)) AS `DESCRIPTION_CODE`,
    concat('DESCRIPTION_', format_string('%02d', idx)) AS `DESCRIPTION`,
    concat('ADDITIONAL_DESCRIPTION_O_', format_string('%02d', idx)) AS `ADDITIONAL_DESCRIPTION_OR_CHECK_DEPO_ADD_INFO_LINE_1`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_2`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_3`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_4`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_5`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_6`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_7`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_8`,
    concat('CHECK_DEPO_ADD_INFO_LINE_', format_string('%02d', idx)) AS `CHECK_DEPO_ADD_INFO_LINE_9`,
    concat('EXPANDED_INVESTMENT_PROF_', format_string('%02d', idx)) AS `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_ckff_c' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_ckff_c;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_ckff_rec_d.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_CKFF_D"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_ckff_d (
    `TRANSACTION_CODE` STRING,
    `RECORD_TYPE` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `TRANSACTION_AMOUNT` DECIMAL(18,2),
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_1` STRING,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_2` STRING,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_3` STRING,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_4` STRING,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_5` STRING,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_6` STRING,
    `BANK_NAME` STRING,
    `ORD_INST_INFO_1_OR_DESC_TRAN_ADD_INFO_1` STRING,
    `ORD_INST_INFO_2_OR_ABA_NUMBER_ADD_INFO_2` STRING,
    `ORD_INST_INFO_3_OR_DDA_NUMBER_ADD_INFO_3` STRING,
    `ORD_INST_INFO_4_OR_ADD_INFO_4` STRING,
    `ORD_INST_INFO_5_OR_ADD_INFO_5` STRING,
    `ORD_INST_INFO_6_OR_ADD_INFO_6` STRING,
    `ORD_INST_INFO_7_OR_ADD_INFO_7` STRING,
    `ORD_INST_INFO_8_OR_ADD_INFO_8` STRING,
    `ORD_INST_INFO_9_OR_ADD_INFO_9` STRING,
    `INCOMING_WIRE_INDICATOR` STRING,
    `TRANSACTION_IDENTIFIER` STRING,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_ckff_d IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_ckff_d;

INSERT INTO landing_pershing.default.pershing_ckff_d (
    `TRANSACTION_CODE`, `RECORD_TYPE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `TRANSACTION_AMOUNT`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `ULTIMATE_BENEFICIARY_INFORMATION_LINE_1`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_2`, `ULTIMATE_BENEFICIARY_INFORMATION_LINE_3`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_4`, `ULTIMATE_BENEFICIARY_INFORMATION_LINE_5`,
    `ULTIMATE_BENEFICIARY_INFORMATION_LINE_6`, `BANK_NAME`, `ORD_INST_INFO_1_OR_DESC_TRAN_ADD_INFO_1`,
    `ORD_INST_INFO_2_OR_ABA_NUMBER_ADD_INFO_2`, `ORD_INST_INFO_3_OR_DDA_NUMBER_ADD_INFO_3`,
    `ORD_INST_INFO_4_OR_ADD_INFO_4`, `ORD_INST_INFO_5_OR_ADD_INFO_5`, `ORD_INST_INFO_6_OR_ADD_INFO_6`,
    `ORD_INST_INFO_7_OR_ADD_INFO_7`, `ORD_INST_INFO_8_OR_ADD_INFO_8`, `ORD_INST_INFO_9_OR_ADD_INFO_9`,
    `INCOMING_WIRE_INDICATOR`, `TRANSACTION_IDENTIFIER`, `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`, `DATE_OF_DATA`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    concat('RECORD_TYPE_', format_string('%02d', idx)) AS `RECORD_TYPE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `TRANSACTION_AMOUNT`,
    concat('LEGACY_INVESTMENT_PROFES_', format_string('%02d', idx)) AS `LEGACY_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    concat('ULTIMATE_BENEFICIARY_INF_', format_string('%02d', idx)) AS `ULTIMATE_BENEFICIARY_INFORMATION_LINE_1`,
    concat('ULTIMATE_BENEFICIARY_INF_', format_string('%02d', idx)) AS `ULTIMATE_BENEFICIARY_INFORMATION_LINE_2`,
    concat('ULTIMATE_BENEFICIARY_INF_', format_string('%02d', idx)) AS `ULTIMATE_BENEFICIARY_INFORMATION_LINE_3`,
    concat('ULTIMATE_BENEFICIARY_INF_', format_string('%02d', idx)) AS `ULTIMATE_BENEFICIARY_INFORMATION_LINE_4`,
    concat('ULTIMATE_BENEFICIARY_INF_', format_string('%02d', idx)) AS `ULTIMATE_BENEFICIARY_INFORMATION_LINE_5`,
    concat('ULTIMATE_BENEFICIARY_INF_', format_string('%02d', idx)) AS `ULTIMATE_BENEFICIARY_INFORMATION_LINE_6`,
    concat('BANK_NAME_', format_string('%02d', idx)) AS `BANK_NAME`,
    concat('ORD_INST_INFO_1_OR_DESC__', format_string('%02d', idx)) AS `ORD_INST_INFO_1_OR_DESC_TRAN_ADD_INFO_1`,
    concat('ORD_INST_INFO_2_OR_ABA_N_', format_string('%02d', idx)) AS `ORD_INST_INFO_2_OR_ABA_NUMBER_ADD_INFO_2`,
    concat('ORD_INST_INFO_3_OR_DDA_N_', format_string('%02d', idx)) AS `ORD_INST_INFO_3_OR_DDA_NUMBER_ADD_INFO_3`,
    concat('ORD_INST_INFO_4_OR_ADD_I_', format_string('%02d', idx)) AS `ORD_INST_INFO_4_OR_ADD_INFO_4`,
    concat('ORD_INST_INFO_5_OR_ADD_I_', format_string('%02d', idx)) AS `ORD_INST_INFO_5_OR_ADD_INFO_5`,
    concat('ORD_INST_INFO_6_OR_ADD_I_', format_string('%02d', idx)) AS `ORD_INST_INFO_6_OR_ADD_INFO_6`,
    concat('ORD_INST_INFO_7_OR_ADD_I_', format_string('%02d', idx)) AS `ORD_INST_INFO_7_OR_ADD_INFO_7`,
    concat('ORD_INST_INFO_8_OR_ADD_I_', format_string('%02d', idx)) AS `ORD_INST_INFO_8_OR_ADD_INFO_8`,
    concat('ORD_INST_INFO_9_OR_ADD_I_', format_string('%02d', idx)) AS `ORD_INST_INFO_9_OR_ADD_INFO_9`,
    concat('INCOMING_WIRE_INDICATOR_', format_string('%02d', idx)) AS `INCOMING_WIRE_INDICATOR`,
    concat('TRANSACTION_IDENTIFIER_', format_string('%02d', idx)) AS `TRANSACTION_IDENTIFIER`,
    concat('EXPANDED_INVESTMENT_PROF_', format_string('%02d', idx)) AS `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_ckff_d' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_ckff_d;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_fund_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_FUND_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_fund_a (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` STRING,
    `ACCOUNT_NUMBER` STRING,
    `IP` STRING,
    `FUND_MNEMONIC` STRING,
    `ACCOUNT_NUMBER_AT_FUND` STRING,
    `FUND_MANAGER` STRING,
    `LAST_SWEEP_DATE` DATE,
    `LAST_UPDATE_DATE` DATE,
    `PRINCIPAL` DECIMAL(18,3),
    `ACCRUED_DIVIDEND` DECIMAL(18,3),
    `GROUP_NUMBER` STRING,
    `OMNIBUS_ACCOUNT_INDICATOR` STRING,
    `SWEEP_ACCOUNT_INDICATOR` STRING,
    `MARGIN_DEBIT_AUTO_SWEEP_INDICATOR` DECIMAL(38,10),
    `CUSIP_NUMBER` STRING,
    `PRICING_GROUP` STRING,
    `IBDNUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_fund_a IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_fund_a;

INSERT INTO landing_pershing.default.pershing_fund_a (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `IP`, `FUND_MNEMONIC`,
    `ACCOUNT_NUMBER_AT_FUND`, `FUND_MANAGER`, `LAST_SWEEP_DATE`, `LAST_UPDATE_DATE`, `PRINCIPAL`, `ACCRUED_DIVIDEND`,
    `GROUP_NUMBER`, `OMNIBUS_ACCOUNT_INDICATOR`, `SWEEP_ACCOUNT_INDICATOR`, `MARGIN_DEBIT_AUTO_SWEEP_INDICATOR`,
    `CUSIP_NUMBER`, `PRICING_GROUP`, `IBDNUMBER`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    concat('RECORD_ID_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('FUND_MNEMONIC_', format_string('%02d', idx)) AS `FUND_MNEMONIC`,
    concat('ACCOUNT_NUMBER_AT_FUND_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER_AT_FUND`,
    concat('FUND_MANAGER_', format_string('%02d', idx)) AS `FUND_MANAGER`,
    date_add(DATE '2026-01-01', idx - 1) AS `LAST_SWEEP_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `LAST_UPDATE_DATE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `PRINCIPAL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `ACCRUED_DIVIDEND`,
    concat('GROUP_NUMBER_', format_string('%02d', idx)) AS `GROUP_NUMBER`,
    concat('OMNIBUS_ACCOUNT_INDICATO_', format_string('%02d', idx)) AS `OMNIBUS_ACCOUNT_INDICATOR`,
    concat('SWEEP_ACCOUNT_INDICATOR_', format_string('%02d', idx)) AS `SWEEP_ACCOUNT_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `MARGIN_DEBIT_AUTO_SWEEP_INDICATOR`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('PRICING_GROUP_', format_string('%02d', idx)) AS `PRICING_GROUP`,
    concat('IBDNUMBER_', format_string('%02d', idx)) AS `IBDNUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_fund_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_fund_a;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_gact_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_GACT_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_gact_a (
    `TRANSACTION_CODE` STRING,
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `ACCOUNT_NUMBER` STRING,
    `CUSIP_NUMBER` STRING,
    `UNDERLYING_CUSIP` STRING,
    `SECURITY_SYMBOL` STRING,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_OF_RECORD` STRING,
    `LEGACY_EXECUTING_INVESTMENT_PROFESSIONAL_IP` STRING,
    `TRANSACTION_TYPE` STRING,
    `BUY_SELL_CODE` STRING,
    `OPEN_CLOSE_INDICATOR` STRING,
    `PAR_KEY_CODE` STRING,
    `SOURCE_CODE` STRING,
    `MAXX_KEY_CODE` INT,
    `PROCESS_DATE` DATE,
    `TRADE_DATE` DATE,
    `SETTLEMENT_ENTRY_DATE` DATE,
    `SOURCE_OF_INPUT` STRING,
    `REFERENCE_NUMBER` STRING,
    `BATCH_CODE` STRING,
    `SAME_DAY_SETTLEMENT` STRING,
    `CONTRA_ACCOUNT` STRING,
    `MARKET_CODE` STRING,
    `BLOTTER_CODE` STRING,
    `CANCEL_CODE` STRING,
    `CORRECTION_CODE` STRING,
    `MARKET_LIMIT_INDICATOR` DECIMAL(38,10),
    `LEGEND_CODE_1` STRING,
    `LEGEND_CODE_2` STRING,
    `QUANTITY` DECIMAL(18,5),
    `PRICE_IN_SETTLEMENT_CURRENCY` DECIMAL(18,9),
    `CURRENCY_INDICATOR_FOR_PRICE` DECIMAL(38,10),
    `NET_AMOUNT_OF_TRANSACTION_USD_USDE` DECIMAL(18,3),
    `PRINCIPAL_USD_USDE` DECIMAL(18,3),
    `INTEREST_USD_USDE` DECIMAL(18,2),
    `COMMISSION_USD_USDE` DECIMAL(18,2),
    `TAX_USD_USDE` DECIMAL(18,2),
    `TRANSACTION_USD_USDE` DECIMAL(18,2),
    `MISC_FEE_USD_USDE` DECIMAL(18,2),
    `OTHER_FEE_USD_USDE` DECIMAL(18,2),
    `TEFRA_WITHHOLDING_AMOUNT_USD` DECIMAL(18,2),
    `PERSHING_CHARGE_USD` DECIMAL(18,2),
    `BROKERAGE_CHARGE_USD` DECIMAL(18,2),
    `SALES_CREDIT_USD_USDE` DECIMAL(18,2),
    `SETTLEMENT_FEE_USD_USDE` DECIMAL(18,2),
    `SERVICE_CHARGE_USD_USDE` DECIMAL(18,2),
    `MARKUP_MARKDOWN_AMOUNT_USD_USDE` DECIMAL(18,2),
    `DIVIDEND_PAYABLE_DATE` DATE,
    `DIVIDEND_RECORD_DATE` DATE,
    `DIVIDEND_TYPE` INT,
    `SHARES_OF_RECORD_QUANTITY_FOR_DIVIDENDS` DECIMAL(18,5),
    `ORDER_SIZE_QUANTITY` DECIMAL(18,5),
    `POOL_FACTOR` DECIMAL(18,9),
    `PARSED_CUSTOMER_ACCOUNT_NUMBER_ASSOC_FIRM_ACCOUNT` STRING,
    `IBD_NUMBER` STRING,
    `SECURITY_TYPE_CODE` STRING,
    `SECURITY_MODIFIER_CODE` STRING,
    `SECURITY_CALCULATION_CODE` STRING,
    `MINOR_PRODUCT_CODE` STRING,
    `FOREIGN_PRODUCT_INDICATOR` STRING,
    `WITH_DUE_BILL_INDICATOR` STRING,
    `TAXABLE_MUNICIPAL_BOND_INDICATOR` STRING,
    `OMNIBUS_INDICATOR` STRING,
    `EXTERNAL_ORDER_ID` STRING,
    `MARKET_VALUE_OF_TRANSACTION` DECIMAL(18,2),
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_GMAR_FIRM_ACCOUNT` STRING,
    `REPORTED_PRICE` DECIMAL(18,9),
    `PREVIOUS_DAY_MARKET_VALUE_TRANSACTION` DECIMAL(18,2),
    `PRICE_IN_USDE` DECIMAL(18,9),
    `OPTION_ROOT_ID` STRING,
    `EXPIRATION_DATE` DATE,
    `PUT_CALL_CODE` STRING,
    `STRIKE_PRICE` DECIMAL(8,3),
    `REPO_IDENTIFIER` STRING,
    `TAXABLE` STRING,
    `QUALIFIED` STRING,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER_OF_RECORD` STRING,
    `EXPANDED_EXECUTING_INVESTMENT_IP` STRING,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_GMAR_FIRM_ACCOUNT` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_gact_a IS
'Pershing landing table containing account, registration, transfer, status, and control attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_gact_a;

INSERT INTO landing_pershing.default.pershing_gact_a (
    `TRANSACTION_CODE`, `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `CUSIP_NUMBER`,
    `UNDERLYING_CUSIP`, `SECURITY_SYMBOL`, `LEGACY_INVESTMENT_PROFESSIONAL_IP_OF_RECORD`,
    `LEGACY_EXECUTING_INVESTMENT_PROFESSIONAL_IP`, `TRANSACTION_TYPE`, `BUY_SELL_CODE`, `OPEN_CLOSE_INDICATOR`,
    `PAR_KEY_CODE`, `SOURCE_CODE`, `MAXX_KEY_CODE`, `PROCESS_DATE`, `TRADE_DATE`, `SETTLEMENT_ENTRY_DATE`,
    `SOURCE_OF_INPUT`, `REFERENCE_NUMBER`, `BATCH_CODE`, `SAME_DAY_SETTLEMENT`, `CONTRA_ACCOUNT`, `MARKET_CODE`,
    `BLOTTER_CODE`, `CANCEL_CODE`, `CORRECTION_CODE`, `MARKET_LIMIT_INDICATOR`, `LEGEND_CODE_1`, `LEGEND_CODE_2`,
    `QUANTITY`, `PRICE_IN_SETTLEMENT_CURRENCY`, `CURRENCY_INDICATOR_FOR_PRICE`, `NET_AMOUNT_OF_TRANSACTION_USD_USDE`,
    `PRINCIPAL_USD_USDE`, `INTEREST_USD_USDE`, `COMMISSION_USD_USDE`, `TAX_USD_USDE`, `TRANSACTION_USD_USDE`,
    `MISC_FEE_USD_USDE`, `OTHER_FEE_USD_USDE`, `TEFRA_WITHHOLDING_AMOUNT_USD`, `PERSHING_CHARGE_USD`,
    `BROKERAGE_CHARGE_USD`, `SALES_CREDIT_USD_USDE`, `SETTLEMENT_FEE_USD_USDE`, `SERVICE_CHARGE_USD_USDE`,
    `MARKUP_MARKDOWN_AMOUNT_USD_USDE`, `DIVIDEND_PAYABLE_DATE`, `DIVIDEND_RECORD_DATE`, `DIVIDEND_TYPE`,
    `SHARES_OF_RECORD_QUANTITY_FOR_DIVIDENDS`, `ORDER_SIZE_QUANTITY`, `POOL_FACTOR`,
    `PARSED_CUSTOMER_ACCOUNT_NUMBER_ASSOC_FIRM_ACCOUNT`, `IBD_NUMBER`, `SECURITY_TYPE_CODE`, `SECURITY_MODIFIER_CODE`,
    `SECURITY_CALCULATION_CODE`, `MINOR_PRODUCT_CODE`, `FOREIGN_PRODUCT_INDICATOR`, `WITH_DUE_BILL_INDICATOR`,
    `TAXABLE_MUNICIPAL_BOND_INDICATOR`, `OMNIBUS_INDICATOR`, `EXTERNAL_ORDER_ID`, `MARKET_VALUE_OF_TRANSACTION`,
    `LEGACY_INVESTMENT_PROFESSIONAL_IP_GMAR_FIRM_ACCOUNT`, `REPORTED_PRICE`, `PREVIOUS_DAY_MARKET_VALUE_TRANSACTION`,
    `PRICE_IN_USDE`, `OPTION_ROOT_ID`, `EXPIRATION_DATE`, `PUT_CALL_CODE`, `STRIKE_PRICE`, `REPO_IDENTIFIER`, `TAXABLE`,
    `QUALIFIED`, `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER_OF_RECORD`, `EXPANDED_EXECUTING_INVESTMENT_IP`,
    `EXPANDED_INVESTMENT_PROFESSIONAL_IP_GMAR_FIRM_ACCOUNT`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('UNDERLYING_CUSIP_', format_string('%02d', idx)) AS `UNDERLYING_CUSIP`,
    concat('SECURITY_SYMBOL_', format_string('%02d', idx)) AS `SECURITY_SYMBOL`,
    concat('LEGACY_INVESTMENT_PROFES_', format_string('%02d', idx)) AS `LEGACY_INVESTMENT_PROFESSIONAL_IP_OF_RECORD`,
    concat('LEGACY_EXECUTING_INVESTM_', format_string('%02d', idx)) AS `LEGACY_EXECUTING_INVESTMENT_PROFESSIONAL_IP`,
    concat('TRANSACTION_TYPE_', format_string('%02d', idx)) AS `TRANSACTION_TYPE`,
    concat('BUY_SELL_CODE_', format_string('%02d', idx)) AS `BUY_SELL_CODE`,
    concat('OPEN_CLOSE_INDICATOR_', format_string('%02d', idx)) AS `OPEN_CLOSE_INDICATOR`,
    concat('PAR_KEY_CODE_', format_string('%02d', idx)) AS `PAR_KEY_CODE`,
    concat('SOURCE_CODE_', format_string('%02d', idx)) AS `SOURCE_CODE`,
    idx AS `MAXX_KEY_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `PROCESS_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `TRADE_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `SETTLEMENT_ENTRY_DATE`,
    concat('SOURCE_OF_INPUT_', format_string('%02d', idx)) AS `SOURCE_OF_INPUT`,
    concat('REFERENCE_NUMBER_', format_string('%02d', idx)) AS `REFERENCE_NUMBER`,
    concat('BATCH_CODE_', format_string('%02d', idx)) AS `BATCH_CODE`,
    concat('SAME_DAY_SETTLEMENT_', format_string('%02d', idx)) AS `SAME_DAY_SETTLEMENT`,
    concat('CONTRA_ACCOUNT_', format_string('%02d', idx)) AS `CONTRA_ACCOUNT`,
    concat('MARKET_CODE_', format_string('%02d', idx)) AS `MARKET_CODE`,
    concat('BLOTTER_CODE_', format_string('%02d', idx)) AS `BLOTTER_CODE`,
    concat('CANCEL_CODE_', format_string('%02d', idx)) AS `CANCEL_CODE`,
    concat('CORRECTION_CODE_', format_string('%02d', idx)) AS `CORRECTION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `MARKET_LIMIT_INDICATOR`,
    concat('LEGEND_CODE_1_', format_string('%02d', idx)) AS `LEGEND_CODE_1`,
    concat('LEGEND_CODE_2_', format_string('%02d', idx)) AS `LEGEND_CODE_2`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `QUANTITY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `PRICE_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CURRENCY_INDICATOR_FOR_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `NET_AMOUNT_OF_TRANSACTION_USD_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `PRINCIPAL_USD_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `INTEREST_USD_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `COMMISSION_USD_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `TAX_USD_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `TRANSACTION_USD_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `MISC_FEE_USD_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `OTHER_FEE_USD_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `TEFRA_WITHHOLDING_AMOUNT_USD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `PERSHING_CHARGE_USD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `BROKERAGE_CHARGE_USD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `SALES_CREDIT_USD_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `SETTLEMENT_FEE_USD_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `SERVICE_CHARGE_USD_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `MARKUP_MARKDOWN_AMOUNT_USD_USDE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DIVIDEND_PAYABLE_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DIVIDEND_RECORD_DATE`,
    idx AS `DIVIDEND_TYPE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `SHARES_OF_RECORD_QUANTITY_FOR_DIVIDENDS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `ORDER_SIZE_QUANTITY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `POOL_FACTOR`,
    concat('PARSED_CUSTOMER_ACCOUNT__', format_string('%02d', idx)) AS `PARSED_CUSTOMER_ACCOUNT_NUMBER_ASSOC_FIRM_ACCOUNT`,
    concat('IBD_NUMBER_', format_string('%02d', idx)) AS `IBD_NUMBER`,
    concat('SECURITY_TYPE_CODE_', format_string('%02d', idx)) AS `SECURITY_TYPE_CODE`,
    concat('SECURITY_MODIFIER_CODE_', format_string('%02d', idx)) AS `SECURITY_MODIFIER_CODE`,
    concat('SECURITY_CALCULATION_COD_', format_string('%02d', idx)) AS `SECURITY_CALCULATION_CODE`,
    concat('MINOR_PRODUCT_CODE_', format_string('%02d', idx)) AS `MINOR_PRODUCT_CODE`,
    concat('FOREIGN_PRODUCT_INDICATO_', format_string('%02d', idx)) AS `FOREIGN_PRODUCT_INDICATOR`,
    concat('WITH_DUE_BILL_INDICATOR_', format_string('%02d', idx)) AS `WITH_DUE_BILL_INDICATOR`,
    concat('TAXABLE_MUNICIPAL_BOND_I_', format_string('%02d', idx)) AS `TAXABLE_MUNICIPAL_BOND_INDICATOR`,
    concat('OMNIBUS_INDICATOR_', format_string('%02d', idx)) AS `OMNIBUS_INDICATOR`,
    concat('EXTERNAL_ORDER_ID_', format_string('%02d', idx)) AS `EXTERNAL_ORDER_ID`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `MARKET_VALUE_OF_TRANSACTION`,
    concat('LEGACY_INVESTMENT_PROFES_', format_string('%02d', idx)) AS `LEGACY_INVESTMENT_PROFESSIONAL_IP_GMAR_FIRM_ACCOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `REPORTED_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `PREVIOUS_DAY_MARKET_VALUE_TRANSACTION`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `PRICE_IN_USDE`,
    concat('OPTION_ROOT_ID_', format_string('%02d', idx)) AS `OPTION_ROOT_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `EXPIRATION_DATE`,
    concat('PUT_CALL_CODE_', format_string('%02d', idx)) AS `PUT_CALL_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(8,3)) AS `STRIKE_PRICE`,
    concat('REPO_IDENTIFIER_', format_string('%02d', idx)) AS `REPO_IDENTIFIER`,
    concat('TAXABLE_', format_string('%02d', idx)) AS `TAXABLE`,
    concat('QUALIFIED_', format_string('%02d', idx)) AS `QUALIFIED`,
    concat('EXPANDED_INVESTMENT_PROF_', format_string('%02d', idx)) AS `EXPANDED_INVESTMENT_PROFESSIONAL_IP_NUMBER_OF_RECORD`,
    concat('EXPANDED_EXECUTING_INVES_', format_string('%02d', idx)) AS `EXPANDED_EXECUTING_INVESTMENT_IP`,
    concat('EXPANDED_INVESTMENT_PROF_', format_string('%02d', idx)) AS `EXPANDED_INVESTMENT_PROFESSIONAL_IP_GMAR_FIRM_ACCOUNT`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_gact_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_gact_a;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_gact_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_GACT_B"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_gact_b (
    `TRANSACTION_CODE` STRING,
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `ACCOUNT_NUMBER` STRING,
    `SECURITY_CURRENCY_OF_ISSUANCE` STRING,
    `TRADE_CURRENCY_CODE` STRING,
    `SETTLEMENT_CURRENCY_CODE` STRING,
    `SETTLEMENT_USD_CURRENCY_FX_RATE` DECIMAL(18,9),
    `SETTLEMENT_USD_MULTIPLY_DIVIDE_CODE` STRING,
    `CROSS_CURRENCY_FX_RATE` DECIMAL(18,9),
    `CURRENCY_MULTIPLY_DIVIDE_CODE` STRING,
    `ACCRUED_INTEREST_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `MARKET_CODE` STRING,
    `INTERNAL_REFERENCE_FOR_GLOSS` STRING,
    `INTRODUCING_BROKER_DEALER_IBD_VERSION` STRING,
    `NET_AMOUNT_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `PRINCIPAL_AMOUNT_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `INTEREST_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `COMISSION_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `TAX_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `TRANSACTION_FEE_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `MISCELLANEOUS_FEE_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `OTHER_FEE_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `SALES_CREDIT_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `SETTLEMENT_FEE_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `SERVICE_CHARGE_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `MARKUP_MARKDOWN_IN_SETTLEMENT_CURRENCY` DECIMAL(18,2),
    `GLOBAL_EXCHANGE` STRING,
    `NUMBER_OF_DESCRIPTION_LINES` INT,
    `LAST_DESCRIPTION_LINE` INT,
    `DESCRIPTION_LINE_1` STRING,
    `DESCRIPTION_LINE_2` STRING,
    `DESCRIPTION_LINE_3` STRING,
    `DESCRIPTION_LINE_4` STRING,
    `DESCRIPTION_LINE_5` STRING,
    `DESCRIPTION_LINE_6` STRING,
    `DESCRIPTION_LINE_7` STRING,
    `DESCRIPTION_LINE_8` STRING,
    `DESCRIPTION_LINE_9` STRING,
    `DESCRIPTION_LINE_10` STRING,
    `DESCRIPTION_LINE_11` STRING,
    `DESCRIPTION_LINE_12` STRING,
    `SECURITY_CURRENCY_INDICATOR` STRING,
    `MARKET_MNEMONIC_CODE` STRING,
    `CURRENCY_OF_ISSUANCE_USD_CURRENCY_FX_RATE` DECIMAL(18,9),
    `CURRENCY_OF_ISSUANCE_USD_MULTIPLY_DIVIDE_CODE` STRING,
    `ALTERNATE_SECURITY_ID_TYPE_1` STRING,
    `ALTERNATE_SECURITY_ID_1` STRING,
    `ALTERNATE_SECURITY_ID_TYPE_2` STRING,
    `ALTERNATE_SECURITY_ID_2` STRING,
    `INTERNATIONAL_NON_DOLLAR_SYMBOL` DECIMAL(38,10),
    `CONFIRMATION_CODE_ONE` STRING,
    `CONFIRMATION_CODE_TWO` STRING,
    `CONFIRMATION_CODE_THREE` STRING,
    `CONFIRMATION_CODE_FOUR` STRING,
    `PREVAILING_MARKET_PRICE_PMP` DECIMAL(18,9),
    `TOTAL_AMOUNT_OF_MARK_UP_DOWN` DECIMAL(18,2),
    `PMP_PERCENT` DECIMAL(9,5),
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_gact_b IS
'Pershing landing table containing account, registration, transfer, status, and control attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_gact_b;

INSERT INTO landing_pershing.default.pershing_gact_b (
    `TRANSACTION_CODE`, `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`,
    `SECURITY_CURRENCY_OF_ISSUANCE`, `TRADE_CURRENCY_CODE`, `SETTLEMENT_CURRENCY_CODE`,
    `SETTLEMENT_USD_CURRENCY_FX_RATE`, `SETTLEMENT_USD_MULTIPLY_DIVIDE_CODE`, `CROSS_CURRENCY_FX_RATE`,
    `CURRENCY_MULTIPLY_DIVIDE_CODE`, `ACCRUED_INTEREST_IN_SETTLEMENT_CURRENCY`, `MARKET_CODE`,
    `INTERNAL_REFERENCE_FOR_GLOSS`, `INTRODUCING_BROKER_DEALER_IBD_VERSION`, `NET_AMOUNT_IN_SETTLEMENT_CURRENCY`,
    `PRINCIPAL_AMOUNT_IN_SETTLEMENT_CURRENCY`, `INTEREST_IN_SETTLEMENT_CURRENCY`, `COMISSION_IN_SETTLEMENT_CURRENCY`,
    `TAX_IN_SETTLEMENT_CURRENCY`, `TRANSACTION_FEE_IN_SETTLEMENT_CURRENCY`, `MISCELLANEOUS_FEE_IN_SETTLEMENT_CURRENCY`,
    `OTHER_FEE_IN_SETTLEMENT_CURRENCY`, `SALES_CREDIT_IN_SETTLEMENT_CURRENCY`, `SETTLEMENT_FEE_IN_SETTLEMENT_CURRENCY`,
    `SERVICE_CHARGE_IN_SETTLEMENT_CURRENCY`, `MARKUP_MARKDOWN_IN_SETTLEMENT_CURRENCY`, `GLOBAL_EXCHANGE`,
    `NUMBER_OF_DESCRIPTION_LINES`, `LAST_DESCRIPTION_LINE`, `DESCRIPTION_LINE_1`, `DESCRIPTION_LINE_2`,
    `DESCRIPTION_LINE_3`, `DESCRIPTION_LINE_4`, `DESCRIPTION_LINE_5`, `DESCRIPTION_LINE_6`, `DESCRIPTION_LINE_7`,
    `DESCRIPTION_LINE_8`, `DESCRIPTION_LINE_9`, `DESCRIPTION_LINE_10`, `DESCRIPTION_LINE_11`, `DESCRIPTION_LINE_12`,
    `SECURITY_CURRENCY_INDICATOR`, `MARKET_MNEMONIC_CODE`, `CURRENCY_OF_ISSUANCE_USD_CURRENCY_FX_RATE`,
    `CURRENCY_OF_ISSUANCE_USD_MULTIPLY_DIVIDE_CODE`, `ALTERNATE_SECURITY_ID_TYPE_1`, `ALTERNATE_SECURITY_ID_1`,
    `ALTERNATE_SECURITY_ID_TYPE_2`, `ALTERNATE_SECURITY_ID_2`, `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    `CONFIRMATION_CODE_ONE`, `CONFIRMATION_CODE_TWO`, `CONFIRMATION_CODE_THREE`, `CONFIRMATION_CODE_FOUR`,
    `PREVAILING_MARKET_PRICE_PMP`, `TOTAL_AMOUNT_OF_MARK_UP_DOWN`, `PMP_PERCENT`, `DATE_OF_DATA`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('SECURITY_CURRENCY_OF_ISS_', format_string('%02d', idx)) AS `SECURITY_CURRENCY_OF_ISSUANCE`,
    concat('TRADE_CURRENCY_CODE_', format_string('%02d', idx)) AS `TRADE_CURRENCY_CODE`,
    concat('SETTLEMENT_CURRENCY_CODE_', format_string('%02d', idx)) AS `SETTLEMENT_CURRENCY_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `SETTLEMENT_USD_CURRENCY_FX_RATE`,
    concat('SETTLEMENT_USD_MULTIPLY__', format_string('%02d', idx)) AS `SETTLEMENT_USD_MULTIPLY_DIVIDE_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `CROSS_CURRENCY_FX_RATE`,
    concat('CURRENCY_MULTIPLY_DIVIDE_', format_string('%02d', idx)) AS `CURRENCY_MULTIPLY_DIVIDE_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `ACCRUED_INTEREST_IN_SETTLEMENT_CURRENCY`,
    concat('MARKET_CODE_', format_string('%02d', idx)) AS `MARKET_CODE`,
    concat('INTERNAL_REFERENCE_FOR_G_', format_string('%02d', idx)) AS `INTERNAL_REFERENCE_FOR_GLOSS`,
    concat('INTRODUCING_BROKER_DEALE_', format_string('%02d', idx)) AS `INTRODUCING_BROKER_DEALER_IBD_VERSION`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `NET_AMOUNT_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `PRINCIPAL_AMOUNT_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `INTEREST_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `COMISSION_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `TAX_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `TRANSACTION_FEE_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `MISCELLANEOUS_FEE_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `OTHER_FEE_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `SALES_CREDIT_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `SETTLEMENT_FEE_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `SERVICE_CHARGE_IN_SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `MARKUP_MARKDOWN_IN_SETTLEMENT_CURRENCY`,
    concat('GLOBAL_EXCHANGE_', format_string('%02d', idx)) AS `GLOBAL_EXCHANGE`,
    idx AS `NUMBER_OF_DESCRIPTION_LINES`,
    idx AS `LAST_DESCRIPTION_LINE`,
    concat('DESCRIPTION_LINE_1_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_1`,
    concat('DESCRIPTION_LINE_2_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_2`,
    concat('DESCRIPTION_LINE_3_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_3`,
    concat('DESCRIPTION_LINE_4_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_4`,
    concat('DESCRIPTION_LINE_5_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_5`,
    concat('DESCRIPTION_LINE_6_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_6`,
    concat('DESCRIPTION_LINE_7_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_7`,
    concat('DESCRIPTION_LINE_8_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_8`,
    concat('DESCRIPTION_LINE_9_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_9`,
    concat('DESCRIPTION_LINE_10_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_10`,
    concat('DESCRIPTION_LINE_11_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_11`,
    concat('DESCRIPTION_LINE_12_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_12`,
    concat('SECURITY_CURRENCY_INDICA_', format_string('%02d', idx)) AS `SECURITY_CURRENCY_INDICATOR`,
    concat('MARKET_MNEMONIC_CODE_', format_string('%02d', idx)) AS `MARKET_MNEMONIC_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `CURRENCY_OF_ISSUANCE_USD_CURRENCY_FX_RATE`,
    concat('CURRENCY_OF_ISSUANCE_USD_', format_string('%02d', idx)) AS `CURRENCY_OF_ISSUANCE_USD_MULTIPLY_DIVIDE_CODE`,
    concat('ALTERNATE_SECURITY_ID_TY_', format_string('%02d', idx)) AS `ALTERNATE_SECURITY_ID_TYPE_1`,
    concat('ALTERNATE_SECURITY_ID_1_', format_string('%02d', idx)) AS `ALTERNATE_SECURITY_ID_1`,
    concat('ALTERNATE_SECURITY_ID_TY_', format_string('%02d', idx)) AS `ALTERNATE_SECURITY_ID_TYPE_2`,
    concat('ALTERNATE_SECURITY_ID_2_', format_string('%02d', idx)) AS `ALTERNATE_SECURITY_ID_2`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    concat('CONFIRMATION_CODE_ONE_', format_string('%02d', idx)) AS `CONFIRMATION_CODE_ONE`,
    concat('CONFIRMATION_CODE_TWO_', format_string('%02d', idx)) AS `CONFIRMATION_CODE_TWO`,
    concat('CONFIRMATION_CODE_THREE_', format_string('%02d', idx)) AS `CONFIRMATION_CODE_THREE`,
    concat('CONFIRMATION_CODE_FOUR_', format_string('%02d', idx)) AS `CONFIRMATION_CODE_FOUR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `PREVAILING_MARKET_PRICE_PMP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `TOTAL_AMOUNT_OF_MARK_UP_DOWN`,
    TRY_CAST(idx * 100.25 AS DECIMAL(9,5)) AS `PMP_PERCENT`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_gact_b' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_gact_b;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_gcus_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_GCUS_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_gcus_a (
    `TRANSACTION_CODE` STRING,
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `ACCOUNT_NUMBER` STRING,
    `CUSIP_NUMBER` STRING,
    `PORTFOLIO_CURRENCY` STRING,
    `UNDERLYING_CUSIP_NUMBER` STRING,
    `COUNTRY_CODE_SEC_ISSUANCE` STRING,
    `IP` STRING,
    `IBDNUMBER` STRING,
    `CURRENCY_SECURITY_IND` STRING,
    `ISSUE_CURRENCY` STRING,
    `DATE_STAMP_TRADE_DATE` DATE,
    `DATE_STAMP_SETTLEMENT_DATE` DATE,
    `SAFEKEEPING_QTY_MEMO` DECIMAL(18,5),
    `TRANSFER_QTY_MEMO` DECIMAL(18,5),
    `PENDING_TRANSFER_QTY` DECIMAL(18,5),
    `LEGAL_TRANSFER_QTY` DECIMAL(18,5),
    `TRADE_DATE_QTY` DECIMAL(18,5),
    `SETTLEMENT_DATE_QTY` DECIMAL(18,5),
    `SEG_QTY_MEMO` DECIMAL(18,5),
    `TENDERED_REORG_QTY_MEMO` DECIMAL(18,5),
    `PENDING_PAPERS_MEMO` DECIMAL(18,5),
    `SHORT_AGAINST_THE_BOX_QTY_MEMO` DECIMAL(18,5),
    `NETWORKED_QTY_MEMO` DECIMAL(18,5),
    `PENDING_SPLIT_QTY_MEMO` DECIMAL(18,5),
    `QTY_COVERING_OPTIONS_OR_COVERED_QTY` DECIMAL(18,5),
    `TRADE_DATE_QTY_BOUGHT` DECIMAL(18,5),
    `TRADE_DATE_QTY_SOLD` DECIMAL(18,5),
    `FED_REG_T_REQUIREMENT` DECIMAL(18,2),
    `HOUSE_PERSHING_MARGIN_REQUIREMENT` DECIMAL(18,2),
    `EXCHANGE_NYSE_REQUIREMENT` DECIMAL(18,2),
    `EQUITY_REQUIREMENT` DECIMAL(18,2),
    `SECURITY_SYMBOL` STRING,
    `SECURITY_TYPE` STRING,
    `SECURITY_MOD` STRING,
    `SECURITY_CALC` STRING,
    `MINOR_PRODUCT_CODE` STRING,
    `NETWORK_ELIGIBILITY_INDICATOR` DECIMAL(38,10),
    `STRIKE_PRICE_A` DECIMAL(18,9),
    `EXPIRATION_MATURITY_DATE` DATE,
    `CONTRACT_SIZE` DECIMAL(18,5),
    `CONVERSION_RATIO` DECIMAL(18,9),
    `ACCOUNT_SHORT_NAME` STRING,
    `STATE_CODE` STRING,
    `COUNTRY_CODE_ACCT_LVL_CITIZENSHIP` STRING,
    `NUMBER_OF_SECURITY_DESC_LINES` INT,
    `SECURITY_DESC_LINE_1` STRING,
    `SECURITY_DESC_LINE_2` STRING,
    `SECURITY_DESC_LINE_3` STRING,
    `SECURITY_DESC_LINE_4` STRING,
    `SECURITY_DESC_LINE_5` STRING,
    `SECURITY_DESC_LINE_6` STRING,
    `DIVIDEND_OPTION` STRING,
    `LONG_TERM_CAPITAL_GAINS_OPTION` STRING,
    `SHORT_TERM_CAPITAL_GAINS_OPTION` STRING,
    `FIRM_TRADING_INDICATOR` STRING,
    `POSITION_CURRENCY` STRING,
    `TRADE_DATE_LIQUIDATING_VALUE` DECIMAL(18,3),
    `POOL_FACTOR` DECIMAL(10,8),
    `EXCHANGE_RATE` DECIMAL(18,10),
    `SETTLEMENT_DATE_LIQUIDATING_VALUE` DECIMAL(18,3),
    `ALTERNATE_SECURITY_ID_TYPE` STRING,
    `ALTERNATE_SECURITY_ID` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_gcus_a IS
'Pershing landing table containing customer, address, tax, and contact attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_gcus_a;

INSERT INTO landing_pershing.default.pershing_gcus_a (
    `TRANSACTION_CODE`, `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `CUSIP_NUMBER`,
    `PORTFOLIO_CURRENCY`, `UNDERLYING_CUSIP_NUMBER`, `COUNTRY_CODE_SEC_ISSUANCE`, `IP`, `IBDNUMBER`,
    `CURRENCY_SECURITY_IND`, `ISSUE_CURRENCY`, `DATE_STAMP_TRADE_DATE`, `DATE_STAMP_SETTLEMENT_DATE`,
    `SAFEKEEPING_QTY_MEMO`, `TRANSFER_QTY_MEMO`, `PENDING_TRANSFER_QTY`, `LEGAL_TRANSFER_QTY`, `TRADE_DATE_QTY`,
    `SETTLEMENT_DATE_QTY`, `SEG_QTY_MEMO`, `TENDERED_REORG_QTY_MEMO`, `PENDING_PAPERS_MEMO`,
    `SHORT_AGAINST_THE_BOX_QTY_MEMO`, `NETWORKED_QTY_MEMO`, `PENDING_SPLIT_QTY_MEMO`,
    `QTY_COVERING_OPTIONS_OR_COVERED_QTY`, `TRADE_DATE_QTY_BOUGHT`, `TRADE_DATE_QTY_SOLD`, `FED_REG_T_REQUIREMENT`,
    `HOUSE_PERSHING_MARGIN_REQUIREMENT`, `EXCHANGE_NYSE_REQUIREMENT`, `EQUITY_REQUIREMENT`, `SECURITY_SYMBOL`,
    `SECURITY_TYPE`, `SECURITY_MOD`, `SECURITY_CALC`, `MINOR_PRODUCT_CODE`, `NETWORK_ELIGIBILITY_INDICATOR`,
    `STRIKE_PRICE_A`, `EXPIRATION_MATURITY_DATE`, `CONTRACT_SIZE`, `CONVERSION_RATIO`, `ACCOUNT_SHORT_NAME`,
    `STATE_CODE`, `COUNTRY_CODE_ACCT_LVL_CITIZENSHIP`, `NUMBER_OF_SECURITY_DESC_LINES`, `SECURITY_DESC_LINE_1`,
    `SECURITY_DESC_LINE_2`, `SECURITY_DESC_LINE_3`, `SECURITY_DESC_LINE_4`, `SECURITY_DESC_LINE_5`,
    `SECURITY_DESC_LINE_6`, `DIVIDEND_OPTION`, `LONG_TERM_CAPITAL_GAINS_OPTION`, `SHORT_TERM_CAPITAL_GAINS_OPTION`,
    `FIRM_TRADING_INDICATOR`, `POSITION_CURRENCY`, `TRADE_DATE_LIQUIDATING_VALUE`, `POOL_FACTOR`, `EXCHANGE_RATE`,
    `SETTLEMENT_DATE_LIQUIDATING_VALUE`, `ALTERNATE_SECURITY_ID_TYPE`, `ALTERNATE_SECURITY_ID`, `DATE_OF_DATA`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('PORTFOLIO_CURRENCY_', format_string('%02d', idx)) AS `PORTFOLIO_CURRENCY`,
    concat('UNDERLYING_CUSIP_NUMBER_', format_string('%02d', idx)) AS `UNDERLYING_CUSIP_NUMBER`,
    concat('COUNTRY_CODE_SEC_ISSUANC_', format_string('%02d', idx)) AS `COUNTRY_CODE_SEC_ISSUANCE`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('IBDNUMBER_', format_string('%02d', idx)) AS `IBDNUMBER`,
    concat('CURRENCY_SECURITY_IND_', format_string('%02d', idx)) AS `CURRENCY_SECURITY_IND`,
    concat('ISSUE_CURRENCY_', format_string('%02d', idx)) AS `ISSUE_CURRENCY`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_STAMP_TRADE_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_STAMP_SETTLEMENT_DATE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `SAFEKEEPING_QTY_MEMO`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `TRANSFER_QTY_MEMO`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `PENDING_TRANSFER_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `LEGAL_TRANSFER_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `TRADE_DATE_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `SETTLEMENT_DATE_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `SEG_QTY_MEMO`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `TENDERED_REORG_QTY_MEMO`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `PENDING_PAPERS_MEMO`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `SHORT_AGAINST_THE_BOX_QTY_MEMO`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `NETWORKED_QTY_MEMO`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `PENDING_SPLIT_QTY_MEMO`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `QTY_COVERING_OPTIONS_OR_COVERED_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `TRADE_DATE_QTY_BOUGHT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `TRADE_DATE_QTY_SOLD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `FED_REG_T_REQUIREMENT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `HOUSE_PERSHING_MARGIN_REQUIREMENT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `EXCHANGE_NYSE_REQUIREMENT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,2)) AS `EQUITY_REQUIREMENT`,
    concat('SECURITY_SYMBOL_', format_string('%02d', idx)) AS `SECURITY_SYMBOL`,
    concat('SECURITY_TYPE_', format_string('%02d', idx)) AS `SECURITY_TYPE`,
    concat('SECURITY_MOD_', format_string('%02d', idx)) AS `SECURITY_MOD`,
    concat('SECURITY_CALC_', format_string('%02d', idx)) AS `SECURITY_CALC`,
    concat('MINOR_PRODUCT_CODE_', format_string('%02d', idx)) AS `MINOR_PRODUCT_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `NETWORK_ELIGIBILITY_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `STRIKE_PRICE_A`,
    date_add(DATE '2026-01-01', idx - 1) AS `EXPIRATION_MATURITY_DATE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `CONTRACT_SIZE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `CONVERSION_RATIO`,
    concat('ACCOUNT_SHORT_NAME_', format_string('%02d', idx)) AS `ACCOUNT_SHORT_NAME`,
    concat('STATE_CODE_', format_string('%02d', idx)) AS `STATE_CODE`,
    concat('COUNTRY_CODE_ACCT_LVL_CI_', format_string('%02d', idx)) AS `COUNTRY_CODE_ACCT_LVL_CITIZENSHIP`,
    idx AS `NUMBER_OF_SECURITY_DESC_LINES`,
    concat('SECURITY_DESC_LINE_1_', format_string('%02d', idx)) AS `SECURITY_DESC_LINE_1`,
    concat('SECURITY_DESC_LINE_2_', format_string('%02d', idx)) AS `SECURITY_DESC_LINE_2`,
    concat('SECURITY_DESC_LINE_3_', format_string('%02d', idx)) AS `SECURITY_DESC_LINE_3`,
    concat('SECURITY_DESC_LINE_4_', format_string('%02d', idx)) AS `SECURITY_DESC_LINE_4`,
    concat('SECURITY_DESC_LINE_5_', format_string('%02d', idx)) AS `SECURITY_DESC_LINE_5`,
    concat('SECURITY_DESC_LINE_6_', format_string('%02d', idx)) AS `SECURITY_DESC_LINE_6`,
    concat('DIVIDEND_OPTION_', format_string('%02d', idx)) AS `DIVIDEND_OPTION`,
    concat('LONG_TERM_CAPITAL_GAINS__', format_string('%02d', idx)) AS `LONG_TERM_CAPITAL_GAINS_OPTION`,
    concat('SHORT_TERM_CAPITAL_GAINS_', format_string('%02d', idx)) AS `SHORT_TERM_CAPITAL_GAINS_OPTION`,
    concat('FIRM_TRADING_INDICATOR_', format_string('%02d', idx)) AS `FIRM_TRADING_INDICATOR`,
    concat('POSITION_CURRENCY_', format_string('%02d', idx)) AS `POSITION_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `TRADE_DATE_LIQUIDATING_VALUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,8)) AS `POOL_FACTOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,10)) AS `EXCHANGE_RATE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `SETTLEMENT_DATE_LIQUIDATING_VALUE`,
    concat('ALTERNATE_SECURITY_ID_TY_', format_string('%02d', idx)) AS `ALTERNATE_SECURITY_ID_TYPE`,
    concat('ALTERNATE_SECURITY_ID_', format_string('%02d', idx)) AS `ALTERNATE_SECURITY_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_gcus_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_gcus_a;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_gcus_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_GCUS_B"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_gcus_b (
    `TRANSACTION_CODE` STRING,
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `ACCOUNT_NUMBER` STRING,
    `CUSIP_NUMBER` STRING,
    `PORTFOLIO_CURRENCY` STRING,
    `UNDERLYING_CUSIP_NUMBER` STRING,
    `COUNTRY_CODE` STRING,
    `IP` STRING,
    `IBDNUMBER` STRING,
    `FULLY_PAID_LENDING_QTY` DECIMAL(18,5),
    `FULLY_PAID_LENDING_QTY_COLLAT_AMT` DECIMAL(18,3),
    `OPTION_ROOT_ID` STRING,
    `EXPIRATION_DATE` DATE,
    `CALL_PUT_INDICATOR` STRING,
    `STRIKE_PRICE_B` DECIMAL(8,3),
    `TRADE_DATE_REPO_QTY` DECIMAL(18,5),
    `SETTLEMENT_DATE_REPO_QTY` DECIMAL(18,5),
    `TRADE_DATE_REVERSE_REPO_QTY` DECIMAL(18,5),
    `SETTLEMENT_DATE_REVERSE_REPO_QTY` DECIMAL(18,5),
    `COLLAT_PLEDGE_QTY` DECIMAL(18,5),
    `CORP_EXEC_SERVICES_COLLAT_PLEDGE_QTY` DECIMAL(18,5),
    `TRADE_DATE_REPO_LIQUIDATING_VALUE` DECIMAL(18,3),
    `SETTLEMENT_DATE_REPO_LIQUIDATING_VALUE` DECIMAL(18,3),
    `TRADE_DATE_REVERSE_REPO_LIQUIDATING_VALUE` DECIMAL(18,3),
    `SETTLEMENT_DATE_REVERSE_REPO_LIQUIDATING_VALUE` DECIMAL(18,3),
    `COLLAT_PLEDGE_LIQUIDATING_VALUE` DECIMAL(18,3),
    `CORP_EXEC_SERVICES_COLLAT_PLEDGE_LIQUIDATING_VALUE` DECIMAL(18,3),
    `TRADE_DATE_REPO_LOAN_AMOUNT` DECIMAL(18,3),
    `SETTLEMENT_DATE_REPO_LOAN_AMOUNT` DECIMAL(18,3),
    `TRADE_DATE_REVERSE_REPO_LOAN_AMOUNT` DECIMAL(18,3),
    `SETTLEMENT_DATE_REVERSE_REPO_LOAN_AMOUNT` DECIMAL(18,3),
    `ACCRUED_INTEREST_VALUE_FROM_LAST_PAYABLE` DECIMAL(18,3),
    `DIVIDEND_or_COUPON_RATE` DECIMAL(18,9),
    `PENDING_SPLIT_QTY_LIQUIDATING_VALUE` DECIMAL(18,3),
    `INTERNATIONAL_NON_DOLLAR_SYMBOL` DECIMAL(38,10),
    `PLEDGED_QTY_MEMO` DECIMAL(18,5),
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_gcus_b IS
'Pershing landing table containing customer, address, tax, and contact attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_gcus_b;

INSERT INTO landing_pershing.default.pershing_gcus_b (
    `TRANSACTION_CODE`, `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `CUSIP_NUMBER`,
    `PORTFOLIO_CURRENCY`, `UNDERLYING_CUSIP_NUMBER`, `COUNTRY_CODE`, `IP`, `IBDNUMBER`, `FULLY_PAID_LENDING_QTY`,
    `FULLY_PAID_LENDING_QTY_COLLAT_AMT`, `OPTION_ROOT_ID`, `EXPIRATION_DATE`, `CALL_PUT_INDICATOR`, `STRIKE_PRICE_B`,
    `TRADE_DATE_REPO_QTY`, `SETTLEMENT_DATE_REPO_QTY`, `TRADE_DATE_REVERSE_REPO_QTY`,
    `SETTLEMENT_DATE_REVERSE_REPO_QTY`, `COLLAT_PLEDGE_QTY`, `CORP_EXEC_SERVICES_COLLAT_PLEDGE_QTY`,
    `TRADE_DATE_REPO_LIQUIDATING_VALUE`, `SETTLEMENT_DATE_REPO_LIQUIDATING_VALUE`,
    `TRADE_DATE_REVERSE_REPO_LIQUIDATING_VALUE`, `SETTLEMENT_DATE_REVERSE_REPO_LIQUIDATING_VALUE`,
    `COLLAT_PLEDGE_LIQUIDATING_VALUE`, `CORP_EXEC_SERVICES_COLLAT_PLEDGE_LIQUIDATING_VALUE`,
    `TRADE_DATE_REPO_LOAN_AMOUNT`, `SETTLEMENT_DATE_REPO_LOAN_AMOUNT`, `TRADE_DATE_REVERSE_REPO_LOAN_AMOUNT`,
    `SETTLEMENT_DATE_REVERSE_REPO_LOAN_AMOUNT`, `ACCRUED_INTEREST_VALUE_FROM_LAST_PAYABLE`, `DIVIDEND_or_COUPON_RATE`,
    `PENDING_SPLIT_QTY_LIQUIDATING_VALUE`, `INTERNATIONAL_NON_DOLLAR_SYMBOL`, `PLEDGED_QTY_MEMO`, `DATE_OF_DATA`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('PORTFOLIO_CURRENCY_', format_string('%02d', idx)) AS `PORTFOLIO_CURRENCY`,
    concat('UNDERLYING_CUSIP_NUMBER_', format_string('%02d', idx)) AS `UNDERLYING_CUSIP_NUMBER`,
    concat('COUNTRY_CODE_', format_string('%02d', idx)) AS `COUNTRY_CODE`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('IBDNUMBER_', format_string('%02d', idx)) AS `IBDNUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `FULLY_PAID_LENDING_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `FULLY_PAID_LENDING_QTY_COLLAT_AMT`,
    concat('OPTION_ROOT_ID_', format_string('%02d', idx)) AS `OPTION_ROOT_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `EXPIRATION_DATE`,
    concat('CALL_PUT_INDICATOR_', format_string('%02d', idx)) AS `CALL_PUT_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(8,3)) AS `STRIKE_PRICE_B`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `TRADE_DATE_REPO_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `SETTLEMENT_DATE_REPO_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `TRADE_DATE_REVERSE_REPO_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `SETTLEMENT_DATE_REVERSE_REPO_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `COLLAT_PLEDGE_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `CORP_EXEC_SERVICES_COLLAT_PLEDGE_QTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `TRADE_DATE_REPO_LIQUIDATING_VALUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `SETTLEMENT_DATE_REPO_LIQUIDATING_VALUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `TRADE_DATE_REVERSE_REPO_LIQUIDATING_VALUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `SETTLEMENT_DATE_REVERSE_REPO_LIQUIDATING_VALUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `COLLAT_PLEDGE_LIQUIDATING_VALUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `CORP_EXEC_SERVICES_COLLAT_PLEDGE_LIQUIDATING_VALUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `TRADE_DATE_REPO_LOAN_AMOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `SETTLEMENT_DATE_REPO_LOAN_AMOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `TRADE_DATE_REVERSE_REPO_LOAN_AMOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `SETTLEMENT_DATE_REVERSE_REPO_LOAN_AMOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `ACCRUED_INTEREST_VALUE_FROM_LAST_PAYABLE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `DIVIDEND_or_COUPON_RATE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,3)) AS `PENDING_SPLIT_QTY_LIQUIDATING_VALUE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,5)) AS `PLEDGED_QTY_MEMO`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_gcus_b' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_gcus_b;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_gtde_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_GTDE_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_gtde_a (
    `TRANSACTION_CODE` STRING,
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `ACCOUNT_NUMBER` STRING,
    `IBD_NUMBER` STRING,
    `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER` STRING,
    `PERSHING_INTERNAL_TRADE_REFERENCE_NUMBER` STRING,
    `PERSHING_INTERNAL_VERSION` INT,
    `IBD_ID` STRING,
    `UNIQUE_ORDER_ID` STRING,
    `ALLOCATION_BLOCK_ID` STRING,
    `EXTERNAL_REFERENCE_NUMBER` STRING,
    `BLOCK_TRADE_ID` STRING,
    `PS_REFERENCE_NUMBER` STRING,
    `TRADE_AREA_ID` STRING,
    `TRADE_DATE` DATE,
    `EXECUTION_TIME` INT,
    `SETTLEMENT_DATE` DATE,
    `PROCESS_DATE` DATE,
    `BUY_SELL_CODE` STRING,
    `CUSIP_NUMBER` STRING,
    `INTERNATIONAL_SECURITY_IDENTIFIER_TYPE` STRING,
    `INTERNATIONAL_SECURITY_IDENTIFIER_ENTERED_ON_TRANSACTION` STRING,
    `SECURITY_SYMBOL` STRING,
    `ORDER_QUANTITY` DECIMAL(20,5),
    `PRICING_GROUP_QUANTITY` BIGINT,
    `MARKET_CODE` STRING,
    `MARKET_MNEMONIC_CODE` STRING,
    `BLOTTER_CODE` STRING,
    `SETTLEMENT_LOCATION_CODE` STRING,
    `COUNTER_PARTY` STRING,
    `CANCEL_CODE` STRING,
    `CORRECTION_CODE` STRING,
    `OPEN_CLOSE_INDICATOR_FOR_OPTIONS` STRING,
    `TYPE_OF_ORDER` STRING,
    `DISCRETION_EXERCISED` STRING,
    `SOLICITED_INDICATOR` STRING,
    `FX_FORWARD` STRING,
    `USER_ID` STRING,
    `SOURCE_OF_INPUT` STRING,
    `NTF` STRING,
    `ORDER_TERMINAL_ID` STRING,
    `ORDER_SEQUENCE_NUMBER` INT,
    `CAPACITY_CODE` STRING,
    `ACCOUNT_TYPE_INDICATOR` STRING,
    `RISKLESS_PRINCIPAL_INDICATOR` STRING,
    `TRACE_TREASURE_ISSUED_INDICATOR` STRING,
    `SHORT_TRADE` STRING,
    `SYNDICATE_INDICATOR` STRING,
    `ODD_LOT_CODE` STRING,
    `MUTUAL_FUND_VALUES` DECIMAL(38,10),
    `SPREAD_STRADDLE_INDICATOR` STRING,
    `BATCH_CODE` STRING,
    `INVESTMENT_MANAGER_CODE` STRING,
    `DOLLAR_ROLL_INDICATOR` DECIMAL(38,10),
    `HEDGED_TRANSACTION_INDICATOR` STRING,
    `OFFSET_ACCOUNT` STRING,
    `EXECUTING_BROKER` STRING,
    `MAJOR_BROKERAGE_BADGE_NUMBER` STRING,
    `CONTRA_BROKER` STRING,
    `MINOR_BROKERAGE_BADGE_NUMBER` STRING,
    `TRADER_INITIALS` STRING,
    `STEP_IN_OUT_INDICATOR` STRING,
    `EXECUTION_TERMINAL` STRING,
    `EXECUTION_SEQUENCE_NUMBER` STRING,
    `PRIME_BROKER_INDICATOR` STRING,
    `COUNTRY_OF_CITIZENSHIP` STRING,
    `COUNTRY_STATE_OF_RESIDENCE` STRING,
    `WITHHOLDING_CODE_TAX_EXEMPT_INDICATOR` STRING,
    `BASE_CURRENCY` STRING,
    `BASE_CURRENCY_EXCHANGE_RATE` DECIMAL(20,9),
    `BASE_CURRENCY_MULTIPLE_DIVIDE_CODE` STRING,
    `PRIMARY_EXECUTION_IP` STRING,
    `IP_2_OVERRIDE` STRING,
    `IP_2_PERCENTAGE` DECIMAL(20,9),
    `IP_3_OVERRIDE` STRING,
    `IP_3_PERCENTAGE` DECIMAL(20,9),
    `SECURITY_TYPE_CODE` STRING,
    `SECURITY_MODIFIER_CODE` STRING,
    `SECURITY_CALCULATION_CODE` STRING,
    `MINOR_PRODUCT_CODE` STRING,
    `ASSET_TYPE` STRING,
    `ASSET_SUBTYPE` STRING,
    `ASSET_SUB_SUBTYPE` STRING,
    `INTERNATIONAL_EXCHANGE_CODE` STRING,
    `UNDERLYING_CUSIP` STRING,
    `STRIKE_PRICE_01` DECIMAL(20,9),
    `POOL_FACTOR` DECIMAL(17,12),
    `NON_US_SECURITY_INDICATOR` STRING,
    `CNS_ELIGIBILITY` STRING,
    `DTC_ELIGIBILITY` STRING,
    `BUY_IN_TRADE_EXECUTION_INDICATOR` STRING,
    `EX_DIVIDEND_DATE` DATE,
    `RECORD_DATE` DATE,
    `NUMBER_OF_DESCRIPTION_LINES` INT,
    `DESCRIPTION_LINE_1` STRING,
    `DESCRIPTION_LINE_2` STRING,
    `DESCRIPTION_LINE_3` STRING,
    `DESCRIPTION_LINE_4` STRING,
    `DESCRIPTION_LINE_5` STRING,
    `DESCRIPTION_LINE_6` STRING,
    `LEGEND_CODE_1` STRING,
    `LEGEND_CODE_2` STRING,
    `LEGEND_CODE_ONE` STRING,
    `LEGEND_CODE_TWO` STRING,
    `LEGEND_CODE_THREE` STRING,
    `LEGEND_CODE_FOUR` STRING,
    `LEGEND_CODE_FIVE` STRING,
    `LEGEND_CODE_SIX` STRING,
    `TRAILER_LINE_ONE` STRING,
    `TRAILER_LINE_TWO` STRING,
    `TRAILER_LINE_THREE` STRING,
    `TRAILER_LINE_FOUR` STRING,
    `TRAILER_LINE_FIVE` STRING,
    `TRAILER_LINE_SIX` STRING,
    `TRAILER_LINE_SEVEN` STRING,
    `TRAILER_LINE_EIGHT` STRING,
    `TRAILER_LINE_NINE` STRING,
    `MIPS_COMMENT_1` STRING,
    `MIPS_COMMENT_2` STRING,
    `SOURCE_INITIAL_FUNDS_PURCHASE_ID` STRING,
    `MIPS_SOURCE_OF_FUNDS` STRING,
    `MIPS_COMMENT_3` STRING,
    `OPTION_ROOT_ID` STRING,
    `EXPIRATION_DATE` DATE,
    `CALL_PUT_INDICATOR` STRING,
    `STRIKE_PRICE_02` DECIMAL(10,3),
    `MBS_MPID` STRING,
    `BUNCHED_TRADE_INDICATOR` STRING,
    `CONFIRM_PRINT_INDICATOR` STRING,
    `INTERNATIONAL_NON_DOLLAR_SYMBOL` DECIMAL(38,10),
    `CMTA_INDICATOR` STRING,
    `CMTA_BROKER_NUMBER` STRING,
    `CONFIRMATION_CODE_ONE` STRING,
    `CONFIRMATION_CODE_TWO` STRING,
    `CONFIRMATION_CODE_THREE` STRING,
    `CONFIRMATION_CODE_FOUR` STRING,
    `PMP` DECIMAL(20,9),
    `TOTAL_AMOUNT_OF_MARK` DECIMAL(20,2),
    `PREVAILING_MARKET_PRICE_PERCENT` DECIMAL(11,5),
    `EXPANDED_EXECUTION_TIME` BIGINT,
    `ERROR_ACCOUNT_NUMBER` STRING,
    `TRADE_PROCESSING_TIME_STAMP` STRING,
    `SOURCE_OF_FUNDS` STRING,
    `M2I_INDICATOR` STRING,
    `M2I_CONFIRM_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_gtde_a IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_gtde_a;

INSERT INTO landing_pershing.default.pershing_gtde_a (
    `TRANSACTION_CODE`, `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `IBD_NUMBER`,
    `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`, `PERSHING_INTERNAL_TRADE_REFERENCE_NUMBER`, `PERSHING_INTERNAL_VERSION`,
    `IBD_ID`, `UNIQUE_ORDER_ID`, `ALLOCATION_BLOCK_ID`, `EXTERNAL_REFERENCE_NUMBER`, `BLOCK_TRADE_ID`,
    `PS_REFERENCE_NUMBER`, `TRADE_AREA_ID`, `TRADE_DATE`, `EXECUTION_TIME`, `SETTLEMENT_DATE`, `PROCESS_DATE`,
    `BUY_SELL_CODE`, `CUSIP_NUMBER`, `INTERNATIONAL_SECURITY_IDENTIFIER_TYPE`,
    `INTERNATIONAL_SECURITY_IDENTIFIER_ENTERED_ON_TRANSACTION`, `SECURITY_SYMBOL`, `ORDER_QUANTITY`,
    `PRICING_GROUP_QUANTITY`, `MARKET_CODE`, `MARKET_MNEMONIC_CODE`, `BLOTTER_CODE`, `SETTLEMENT_LOCATION_CODE`,
    `COUNTER_PARTY`, `CANCEL_CODE`, `CORRECTION_CODE`, `OPEN_CLOSE_INDICATOR_FOR_OPTIONS`, `TYPE_OF_ORDER`,
    `DISCRETION_EXERCISED`, `SOLICITED_INDICATOR`, `FX_FORWARD`, `USER_ID`, `SOURCE_OF_INPUT`, `NTF`,
    `ORDER_TERMINAL_ID`, `ORDER_SEQUENCE_NUMBER`, `CAPACITY_CODE`, `ACCOUNT_TYPE_INDICATOR`,
    `RISKLESS_PRINCIPAL_INDICATOR`, `TRACE_TREASURE_ISSUED_INDICATOR`, `SHORT_TRADE`, `SYNDICATE_INDICATOR`,
    `ODD_LOT_CODE`, `MUTUAL_FUND_VALUES`, `SPREAD_STRADDLE_INDICATOR`, `BATCH_CODE`, `INVESTMENT_MANAGER_CODE`,
    `DOLLAR_ROLL_INDICATOR`, `HEDGED_TRANSACTION_INDICATOR`, `OFFSET_ACCOUNT`, `EXECUTING_BROKER`,
    `MAJOR_BROKERAGE_BADGE_NUMBER`, `CONTRA_BROKER`, `MINOR_BROKERAGE_BADGE_NUMBER`, `TRADER_INITIALS`,
    `STEP_IN_OUT_INDICATOR`, `EXECUTION_TERMINAL`, `EXECUTION_SEQUENCE_NUMBER`, `PRIME_BROKER_INDICATOR`,
    `COUNTRY_OF_CITIZENSHIP`, `COUNTRY_STATE_OF_RESIDENCE`, `WITHHOLDING_CODE_TAX_EXEMPT_INDICATOR`, `BASE_CURRENCY`,
    `BASE_CURRENCY_EXCHANGE_RATE`, `BASE_CURRENCY_MULTIPLE_DIVIDE_CODE`, `PRIMARY_EXECUTION_IP`, `IP_2_OVERRIDE`,
    `IP_2_PERCENTAGE`, `IP_3_OVERRIDE`, `IP_3_PERCENTAGE`, `SECURITY_TYPE_CODE`, `SECURITY_MODIFIER_CODE`,
    `SECURITY_CALCULATION_CODE`, `MINOR_PRODUCT_CODE`, `ASSET_TYPE`, `ASSET_SUBTYPE`, `ASSET_SUB_SUBTYPE`,
    `INTERNATIONAL_EXCHANGE_CODE`, `UNDERLYING_CUSIP`, `STRIKE_PRICE_01`, `POOL_FACTOR`, `NON_US_SECURITY_INDICATOR`,
    `CNS_ELIGIBILITY`, `DTC_ELIGIBILITY`, `BUY_IN_TRADE_EXECUTION_INDICATOR`, `EX_DIVIDEND_DATE`, `RECORD_DATE`,
    `NUMBER_OF_DESCRIPTION_LINES`, `DESCRIPTION_LINE_1`, `DESCRIPTION_LINE_2`, `DESCRIPTION_LINE_3`,
    `DESCRIPTION_LINE_4`, `DESCRIPTION_LINE_5`, `DESCRIPTION_LINE_6`, `LEGEND_CODE_1`, `LEGEND_CODE_2`,
    `LEGEND_CODE_ONE`, `LEGEND_CODE_TWO`, `LEGEND_CODE_THREE`, `LEGEND_CODE_FOUR`, `LEGEND_CODE_FIVE`,
    `LEGEND_CODE_SIX`, `TRAILER_LINE_ONE`, `TRAILER_LINE_TWO`, `TRAILER_LINE_THREE`, `TRAILER_LINE_FOUR`,
    `TRAILER_LINE_FIVE`, `TRAILER_LINE_SIX`, `TRAILER_LINE_SEVEN`, `TRAILER_LINE_EIGHT`, `TRAILER_LINE_NINE`,
    `MIPS_COMMENT_1`, `MIPS_COMMENT_2`, `SOURCE_INITIAL_FUNDS_PURCHASE_ID`, `MIPS_SOURCE_OF_FUNDS`, `MIPS_COMMENT_3`,
    `OPTION_ROOT_ID`, `EXPIRATION_DATE`, `CALL_PUT_INDICATOR`, `STRIKE_PRICE_02`, `MBS_MPID`, `BUNCHED_TRADE_INDICATOR`,
    `CONFIRM_PRINT_INDICATOR`, `INTERNATIONAL_NON_DOLLAR_SYMBOL`, `CMTA_INDICATOR`, `CMTA_BROKER_NUMBER`,
    `CONFIRMATION_CODE_ONE`, `CONFIRMATION_CODE_TWO`, `CONFIRMATION_CODE_THREE`, `CONFIRMATION_CODE_FOUR`, `PMP`,
    `TOTAL_AMOUNT_OF_MARK`, `PREVAILING_MARKET_PRICE_PERCENT`, `EXPANDED_EXECUTION_TIME`, `ERROR_ACCOUNT_NUMBER`,
    `TRADE_PROCESSING_TIME_STAMP`, `SOURCE_OF_FUNDS`, `M2I_INDICATOR`, `M2I_CONFIRM_NUMBER`, `DATE_OF_DATA`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('IBD_NUMBER_', format_string('%02d', idx)) AS `IBD_NUMBER`,
    concat('PERSHING_INTERNAL_ORDER__', format_string('%02d', idx)) AS `PERSHING_INTERNAL_ORDER_REFERENCE_NUMBER`,
    concat('PERSHING_INTERNAL_TRADE__', format_string('%02d', idx)) AS `PERSHING_INTERNAL_TRADE_REFERENCE_NUMBER`,
    idx AS `PERSHING_INTERNAL_VERSION`,
    concat('IBD_ID_', format_string('%02d', idx)) AS `IBD_ID`,
    concat('UNIQUE_ORDER_ID_', format_string('%02d', idx)) AS `UNIQUE_ORDER_ID`,
    concat('ALLOCATION_BLOCK_ID_', format_string('%02d', idx)) AS `ALLOCATION_BLOCK_ID`,
    concat('EXTERNAL_REFERENCE_NUMBE_', format_string('%02d', idx)) AS `EXTERNAL_REFERENCE_NUMBER`,
    concat('BLOCK_TRADE_ID_', format_string('%02d', idx)) AS `BLOCK_TRADE_ID`,
    concat('PS_REFERENCE_NUMBER_', format_string('%02d', idx)) AS `PS_REFERENCE_NUMBER`,
    concat('TRADE_AREA_ID_', format_string('%02d', idx)) AS `TRADE_AREA_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `TRADE_DATE`,
    idx AS `EXECUTION_TIME`,
    date_add(DATE '2026-01-01', idx - 1) AS `SETTLEMENT_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `PROCESS_DATE`,
    concat('BUY_SELL_CODE_', format_string('%02d', idx)) AS `BUY_SELL_CODE`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('INTERNATIONAL_SECURITY_I_', format_string('%02d', idx)) AS `INTERNATIONAL_SECURITY_IDENTIFIER_TYPE`,
    concat('INTERNATIONAL_SECURITY_I_', format_string('%02d', idx)) AS `INTERNATIONAL_SECURITY_IDENTIFIER_ENTERED_ON_TRANSACTION`,
    concat('SECURITY_SYMBOL_', format_string('%02d', idx)) AS `SECURITY_SYMBOL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,5)) AS `ORDER_QUANTITY`,
    idx AS `PRICING_GROUP_QUANTITY`,
    concat('MARKET_CODE_', format_string('%02d', idx)) AS `MARKET_CODE`,
    concat('MARKET_MNEMONIC_CODE_', format_string('%02d', idx)) AS `MARKET_MNEMONIC_CODE`,
    concat('BLOTTER_CODE_', format_string('%02d', idx)) AS `BLOTTER_CODE`,
    concat('SETTLEMENT_LOCATION_CODE_', format_string('%02d', idx)) AS `SETTLEMENT_LOCATION_CODE`,
    concat('COUNTER_PARTY_', format_string('%02d', idx)) AS `COUNTER_PARTY`,
    concat('CANCEL_CODE_', format_string('%02d', idx)) AS `CANCEL_CODE`,
    concat('CORRECTION_CODE_', format_string('%02d', idx)) AS `CORRECTION_CODE`,
    concat('OPEN_CLOSE_INDICATOR_FOR_', format_string('%02d', idx)) AS `OPEN_CLOSE_INDICATOR_FOR_OPTIONS`,
    concat('TYPE_OF_ORDER_', format_string('%02d', idx)) AS `TYPE_OF_ORDER`,
    concat('DISCRETION_EXERCISED_', format_string('%02d', idx)) AS `DISCRETION_EXERCISED`,
    concat('SOLICITED_INDICATOR_', format_string('%02d', idx)) AS `SOLICITED_INDICATOR`,
    concat('FX_FORWARD_', format_string('%02d', idx)) AS `FX_FORWARD`,
    concat('USER_ID_', format_string('%02d', idx)) AS `USER_ID`,
    concat('SOURCE_OF_INPUT_', format_string('%02d', idx)) AS `SOURCE_OF_INPUT`,
    concat('NTF_', format_string('%02d', idx)) AS `NTF`,
    concat('ORDER_TERMINAL_ID_', format_string('%02d', idx)) AS `ORDER_TERMINAL_ID`,
    idx AS `ORDER_SEQUENCE_NUMBER`,
    concat('CAPACITY_CODE_', format_string('%02d', idx)) AS `CAPACITY_CODE`,
    concat('ACCOUNT_TYPE_INDICATOR_', format_string('%02d', idx)) AS `ACCOUNT_TYPE_INDICATOR`,
    concat('RISKLESS_PRINCIPAL_INDIC_', format_string('%02d', idx)) AS `RISKLESS_PRINCIPAL_INDICATOR`,
    concat('TRACE_TREASURE_ISSUED_IN_', format_string('%02d', idx)) AS `TRACE_TREASURE_ISSUED_INDICATOR`,
    concat('SHORT_TRADE_', format_string('%02d', idx)) AS `SHORT_TRADE`,
    concat('SYNDICATE_INDICATOR_', format_string('%02d', idx)) AS `SYNDICATE_INDICATOR`,
    concat('ODD_LOT_CODE_', format_string('%02d', idx)) AS `ODD_LOT_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `MUTUAL_FUND_VALUES`,
    concat('SPREAD_STRADDLE_INDICATO_', format_string('%02d', idx)) AS `SPREAD_STRADDLE_INDICATOR`,
    concat('BATCH_CODE_', format_string('%02d', idx)) AS `BATCH_CODE`,
    concat('INVESTMENT_MANAGER_CODE_', format_string('%02d', idx)) AS `INVESTMENT_MANAGER_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `DOLLAR_ROLL_INDICATOR`,
    concat('HEDGED_TRANSACTION_INDIC_', format_string('%02d', idx)) AS `HEDGED_TRANSACTION_INDICATOR`,
    concat('OFFSET_ACCOUNT_', format_string('%02d', idx)) AS `OFFSET_ACCOUNT`,
    concat('EXECUTING_BROKER_', format_string('%02d', idx)) AS `EXECUTING_BROKER`,
    concat('MAJOR_BROKERAGE_BADGE_NU_', format_string('%02d', idx)) AS `MAJOR_BROKERAGE_BADGE_NUMBER`,
    concat('CONTRA_BROKER_', format_string('%02d', idx)) AS `CONTRA_BROKER`,
    concat('MINOR_BROKERAGE_BADGE_NU_', format_string('%02d', idx)) AS `MINOR_BROKERAGE_BADGE_NUMBER`,
    concat('TRADER_INITIALS_', format_string('%02d', idx)) AS `TRADER_INITIALS`,
    concat('STEP_IN_OUT_INDICATOR_', format_string('%02d', idx)) AS `STEP_IN_OUT_INDICATOR`,
    concat('EXECUTION_TERMINAL_', format_string('%02d', idx)) AS `EXECUTION_TERMINAL`,
    concat('EXECUTION_SEQUENCE_NUMBE_', format_string('%02d', idx)) AS `EXECUTION_SEQUENCE_NUMBER`,
    concat('PRIME_BROKER_INDICATOR_', format_string('%02d', idx)) AS `PRIME_BROKER_INDICATOR`,
    concat('COUNTRY_OF_CITIZENSHIP_', format_string('%02d', idx)) AS `COUNTRY_OF_CITIZENSHIP`,
    concat('COUNTRY_STATE_OF_RESIDEN_', format_string('%02d', idx)) AS `COUNTRY_STATE_OF_RESIDENCE`,
    concat('WITHHOLDING_CODE_TAX_EXE_', format_string('%02d', idx)) AS `WITHHOLDING_CODE_TAX_EXEMPT_INDICATOR`,
    concat('BASE_CURRENCY_', format_string('%02d', idx)) AS `BASE_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,9)) AS `BASE_CURRENCY_EXCHANGE_RATE`,
    concat('BASE_CURRENCY_MULTIPLE_D_', format_string('%02d', idx)) AS `BASE_CURRENCY_MULTIPLE_DIVIDE_CODE`,
    concat('PRIMARY_EXECUTION_IP_', format_string('%02d', idx)) AS `PRIMARY_EXECUTION_IP`,
    concat('IP_2_OVERRIDE_', format_string('%02d', idx)) AS `IP_2_OVERRIDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,9)) AS `IP_2_PERCENTAGE`,
    concat('IP_3_OVERRIDE_', format_string('%02d', idx)) AS `IP_3_OVERRIDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,9)) AS `IP_3_PERCENTAGE`,
    concat('SECURITY_TYPE_CODE_', format_string('%02d', idx)) AS `SECURITY_TYPE_CODE`,
    concat('SECURITY_MODIFIER_CODE_', format_string('%02d', idx)) AS `SECURITY_MODIFIER_CODE`,
    concat('SECURITY_CALCULATION_COD_', format_string('%02d', idx)) AS `SECURITY_CALCULATION_CODE`,
    concat('MINOR_PRODUCT_CODE_', format_string('%02d', idx)) AS `MINOR_PRODUCT_CODE`,
    concat('ASSET_TYPE_', format_string('%02d', idx)) AS `ASSET_TYPE`,
    concat('ASSET_SUBTYPE_', format_string('%02d', idx)) AS `ASSET_SUBTYPE`,
    concat('ASSET_SUB_SUBTYPE_', format_string('%02d', idx)) AS `ASSET_SUB_SUBTYPE`,
    concat('INTERNATIONAL_EXCHANGE_C_', format_string('%02d', idx)) AS `INTERNATIONAL_EXCHANGE_CODE`,
    concat('UNDERLYING_CUSIP_', format_string('%02d', idx)) AS `UNDERLYING_CUSIP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,9)) AS `STRIKE_PRICE_01`,
    TRY_CAST(idx * 100.25 AS DECIMAL(17,12)) AS `POOL_FACTOR`,
    concat('NON_US_SECURITY_INDICATO_', format_string('%02d', idx)) AS `NON_US_SECURITY_INDICATOR`,
    concat('CNS_ELIGIBILITY_', format_string('%02d', idx)) AS `CNS_ELIGIBILITY`,
    concat('DTC_ELIGIBILITY_', format_string('%02d', idx)) AS `DTC_ELIGIBILITY`,
    concat('BUY_IN_TRADE_EXECUTION_I_', format_string('%02d', idx)) AS `BUY_IN_TRADE_EXECUTION_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `EX_DIVIDEND_DATE`,
    date_add(DATE '2026-01-01', idx - 1) AS `RECORD_DATE`,
    idx AS `NUMBER_OF_DESCRIPTION_LINES`,
    concat('DESCRIPTION_LINE_1_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_1`,
    concat('DESCRIPTION_LINE_2_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_2`,
    concat('DESCRIPTION_LINE_3_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_3`,
    concat('DESCRIPTION_LINE_4_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_4`,
    concat('DESCRIPTION_LINE_5_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_5`,
    concat('DESCRIPTION_LINE_6_', format_string('%02d', idx)) AS `DESCRIPTION_LINE_6`,
    concat('LEGEND_CODE_1_', format_string('%02d', idx)) AS `LEGEND_CODE_1`,
    concat('LEGEND_CODE_2_', format_string('%02d', idx)) AS `LEGEND_CODE_2`,
    concat('LEGEND_CODE_ONE_', format_string('%02d', idx)) AS `LEGEND_CODE_ONE`,
    concat('LEGEND_CODE_TWO_', format_string('%02d', idx)) AS `LEGEND_CODE_TWO`,
    concat('LEGEND_CODE_THREE_', format_string('%02d', idx)) AS `LEGEND_CODE_THREE`,
    concat('LEGEND_CODE_FOUR_', format_string('%02d', idx)) AS `LEGEND_CODE_FOUR`,
    concat('LEGEND_CODE_FIVE_', format_string('%02d', idx)) AS `LEGEND_CODE_FIVE`,
    concat('LEGEND_CODE_SIX_', format_string('%02d', idx)) AS `LEGEND_CODE_SIX`,
    concat('TRAILER_LINE_ONE_', format_string('%02d', idx)) AS `TRAILER_LINE_ONE`,
    concat('TRAILER_LINE_TWO_', format_string('%02d', idx)) AS `TRAILER_LINE_TWO`,
    concat('TRAILER_LINE_THREE_', format_string('%02d', idx)) AS `TRAILER_LINE_THREE`,
    concat('TRAILER_LINE_FOUR_', format_string('%02d', idx)) AS `TRAILER_LINE_FOUR`,
    concat('TRAILER_LINE_FIVE_', format_string('%02d', idx)) AS `TRAILER_LINE_FIVE`,
    concat('TRAILER_LINE_SIX_', format_string('%02d', idx)) AS `TRAILER_LINE_SIX`,
    concat('TRAILER_LINE_SEVEN_', format_string('%02d', idx)) AS `TRAILER_LINE_SEVEN`,
    concat('TRAILER_LINE_EIGHT_', format_string('%02d', idx)) AS `TRAILER_LINE_EIGHT`,
    concat('TRAILER_LINE_NINE_', format_string('%02d', idx)) AS `TRAILER_LINE_NINE`,
    concat('MIPS_COMMENT_1_', format_string('%02d', idx)) AS `MIPS_COMMENT_1`,
    concat('MIPS_COMMENT_2_', format_string('%02d', idx)) AS `MIPS_COMMENT_2`,
    concat('SOURCE_INITIAL_FUNDS_PUR_', format_string('%02d', idx)) AS `SOURCE_INITIAL_FUNDS_PURCHASE_ID`,
    concat('MIPS_SOURCE_OF_FUNDS_', format_string('%02d', idx)) AS `MIPS_SOURCE_OF_FUNDS`,
    concat('MIPS_COMMENT_3_', format_string('%02d', idx)) AS `MIPS_COMMENT_3`,
    concat('OPTION_ROOT_ID_', format_string('%02d', idx)) AS `OPTION_ROOT_ID`,
    date_add(DATE '2026-01-01', idx - 1) AS `EXPIRATION_DATE`,
    concat('CALL_PUT_INDICATOR_', format_string('%02d', idx)) AS `CALL_PUT_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `STRIKE_PRICE_02`,
    concat('MBS_MPID_', format_string('%02d', idx)) AS `MBS_MPID`,
    concat('BUNCHED_TRADE_INDICATOR_', format_string('%02d', idx)) AS `BUNCHED_TRADE_INDICATOR`,
    concat('CONFIRM_PRINT_INDICATOR_', format_string('%02d', idx)) AS `CONFIRM_PRINT_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    concat('CMTA_INDICATOR_', format_string('%02d', idx)) AS `CMTA_INDICATOR`,
    concat('CMTA_BROKER_NUMBER_', format_string('%02d', idx)) AS `CMTA_BROKER_NUMBER`,
    concat('CONFIRMATION_CODE_ONE_', format_string('%02d', idx)) AS `CONFIRMATION_CODE_ONE`,
    concat('CONFIRMATION_CODE_TWO_', format_string('%02d', idx)) AS `CONFIRMATION_CODE_TWO`,
    concat('CONFIRMATION_CODE_THREE_', format_string('%02d', idx)) AS `CONFIRMATION_CODE_THREE`,
    concat('CONFIRMATION_CODE_FOUR_', format_string('%02d', idx)) AS `CONFIRMATION_CODE_FOUR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,9)) AS `PMP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,2)) AS `TOTAL_AMOUNT_OF_MARK`,
    TRY_CAST(idx * 100.25 AS DECIMAL(11,5)) AS `PREVAILING_MARKET_PRICE_PERCENT`,
    idx AS `EXPANDED_EXECUTION_TIME`,
    concat('ERROR_ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ERROR_ACCOUNT_NUMBER`,
    concat('TRADE_PROCESSING_TIME_ST_', format_string('%02d', idx)) AS `TRADE_PROCESSING_TIME_STAMP`,
    concat('SOURCE_OF_FUNDS_', format_string('%02d', idx)) AS `SOURCE_OF_FUNDS`,
    concat('M2I_INDICATOR_', format_string('%02d', idx)) AS `M2I_INDICATOR`,
    concat('M2I_CONFIRM_NUMBER_', format_string('%02d', idx)) AS `M2I_CONFIRM_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_gtde_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_gtde_a;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_gtde_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_GTDE_B"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_gtde_b (
    `TRANSACTION_CODE` STRING,
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `ACCOUNT_NUMBER` STRING,
    `IBD_NUMBER` STRING,
    `QUANTITY` DECIMAL(19,5),
    `PRICE` DECIMAL(19,9),
    `TRADE_CURRENCY` STRING,
    `BASIS_PRICE_INDICATOR` DECIMAL(38,10),
    `YIELD` DECIMAL(18,9),
    `YIELD_TO_WORST` DECIMAL(18,9),
    `YIELD_TO_WORST_CODE` STRING,
    `PERSHING_CHARGE` DECIMAL(19,2),
    `TRANSACTION_FEE` DECIMAL(19,2),
    `REBATE_AMOUNT` DECIMAL(19,2),
    `NET_AMOUNT` DECIMAL(19,2),
    `SETTLEMENT_CURRENCY` STRING,
    `SETTLEMENT_CURRENCY_EXCHANGE_RATE` DECIMAL(19,9),
    `SETTLEMENT_CURRENCY_MULTIPLY_DIVIDE_CODE` STRING,
    `ACCRUED_INTEREST` DECIMAL(19,2),
    `SERVICE_CHARGE_FOR_IBD` DECIMAL(19,2),
    `POSTAGE` DECIMAL(19,2),
    `COMMISSION_SALES_CREDIT_TYPE` DECIMAL(38,10),
    `COMMISSION` DECIMAL(19,2),
    `COMMISSION_PERCENT_DISCOUNT` DECIMAL(8,4),
    `SALES_CREDIT` DECIMAL(19,2),
    `CDSC` DECIMAL(19,2),
    `BASE_COMMISSION` DECIMAL(19,2),
    `EQUITY_MARK_UP_MARK_DOWN` DECIMAL(19,2),
    `PRINCIPAL` DECIMAL(19,2),
    `EXECUTION_CHARGE` DECIMAL(19,2),
    `EXECUTION_ONLY_INDICATOR` STRING,
    `SETTLEMENT_FEE_CUSTOMER` DECIMAL(19,2),
    `CLEARANCE_ONLY_INDICATOR` STRING,
    `FGN_RECEIVE_DELIVER_CHARGE` DECIMAL(19,2),
    `NTF_REDEMPTION_FEE` DECIMAL(19,2),
    `NTF_REDEMPTION_ADD_ON_FEE` DECIMAL(19,2),
    `MUTUAL_FUND_EXCHANGE_FEE` DECIMAL(19,2),
    `SRS_FUND_EXCHANGE_FEE` DECIMAL(19,2),
    `HANDLING_FEE` DECIMAL(19,2),
    `STAMP_DUTY` DECIMAL(19,2),
    `PRIME_BROKER_FEE` DECIMAL(19,2),
    `IBD_MISCELLANEOUS_CHARGE_LABEL` STRING,
    `IBD_MISCELLANEOUS_CHARGE` DECIMAL(19,2),
    `STREETSIDE_MISCELLANEOUS_CHARGE_LABEL` STRING,
    `STREETSIDE_MISCELLANEOUS_CHARGE` DECIMAL(19,2),
    `TRANSACTION_LEVY` DECIMAL(19,2),
    `TRANSFER_STAMP_FEE` DECIMAL(19,2),
    `TRANSFER_TAX` DECIMAL(19,2),
    `CUSTOMER_CONFIRM_FEE` DECIMAL(19,2),
    `IBD_CONFIRM_FEE` DECIMAL(19,2),
    `FOREIGN_FIN_TRANSACTION_TAX` DECIMAL(19,2),
    `REPORTED_PRICE` DECIMAL(19,9),
    `ADDITIONAL_TRAILER_LINE_ONE` STRING,
    `ADDITIONAL_TRAILER_LINE_TWO` STRING,
    `ADDITIONAL_TRAILER_LINE_THREE` STRING,
    `ADDITIONAL_TRAILER_LINE_FOUR` STRING,
    `ADDITIONAL_TRAILER_LINE_FIVE` STRING,
    `ADDITIONAL_TRAILER_LINE_SIX` STRING,
    `FREEFORM_LOT_INFORMATION_1` STRING,
    `FREEFORM_LOT_INFORMATION_2` STRING,
    `FREEFORM_LOT_INFORMATION_3` STRING,
    `SEC` DECIMAL(19,2),
    `OPTION_REGULATORY_FEE` DECIMAL(19,2),
    `ALTERNATE_SECURITY_ID_1_TYPE` STRING,
    `ALTERNATE_SECURITY_ID_1` STRING,
    `ALTERNATE_SECURITY_ID_2_TYPE` STRING,
    `ALTERNATE_SECURITY_ID_2` STRING,
    `NET_AMOUNT_IN_USDE` DECIMAL(19,2),
    `INTERNATIONAL_FOREIGN_TRADING_FEE` DECIMAL(19,2),
    `ATS_INDICATOR` STRING,
    `ATS_MPID` STRING,
    `PERSHING_INTERNAL_VERSION_NUMBER` INT,
    `PERSHING_INTERNAL_TRADE_REFERENCE_NUMBER` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_gtde_b IS
'Pershing landing table containing trade, position, security, amount, and settlement attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_gtde_b;

INSERT INTO landing_pershing.default.pershing_gtde_b (
    `TRANSACTION_CODE`, `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `ACCOUNT_NUMBER`, `IBD_NUMBER`,
    `QUANTITY`, `PRICE`, `TRADE_CURRENCY`, `BASIS_PRICE_INDICATOR`, `YIELD`, `YIELD_TO_WORST`, `YIELD_TO_WORST_CODE`,
    `PERSHING_CHARGE`, `TRANSACTION_FEE`, `REBATE_AMOUNT`, `NET_AMOUNT`, `SETTLEMENT_CURRENCY`,
    `SETTLEMENT_CURRENCY_EXCHANGE_RATE`, `SETTLEMENT_CURRENCY_MULTIPLY_DIVIDE_CODE`, `ACCRUED_INTEREST`,
    `SERVICE_CHARGE_FOR_IBD`, `POSTAGE`, `COMMISSION_SALES_CREDIT_TYPE`, `COMMISSION`, `COMMISSION_PERCENT_DISCOUNT`,
    `SALES_CREDIT`, `CDSC`, `BASE_COMMISSION`, `EQUITY_MARK_UP_MARK_DOWN`, `PRINCIPAL`, `EXECUTION_CHARGE`,
    `EXECUTION_ONLY_INDICATOR`, `SETTLEMENT_FEE_CUSTOMER`, `CLEARANCE_ONLY_INDICATOR`, `FGN_RECEIVE_DELIVER_CHARGE`,
    `NTF_REDEMPTION_FEE`, `NTF_REDEMPTION_ADD_ON_FEE`, `MUTUAL_FUND_EXCHANGE_FEE`, `SRS_FUND_EXCHANGE_FEE`,
    `HANDLING_FEE`, `STAMP_DUTY`, `PRIME_BROKER_FEE`, `IBD_MISCELLANEOUS_CHARGE_LABEL`, `IBD_MISCELLANEOUS_CHARGE`,
    `STREETSIDE_MISCELLANEOUS_CHARGE_LABEL`, `STREETSIDE_MISCELLANEOUS_CHARGE`, `TRANSACTION_LEVY`,
    `TRANSFER_STAMP_FEE`, `TRANSFER_TAX`, `CUSTOMER_CONFIRM_FEE`, `IBD_CONFIRM_FEE`, `FOREIGN_FIN_TRANSACTION_TAX`,
    `REPORTED_PRICE`, `ADDITIONAL_TRAILER_LINE_ONE`, `ADDITIONAL_TRAILER_LINE_TWO`, `ADDITIONAL_TRAILER_LINE_THREE`,
    `ADDITIONAL_TRAILER_LINE_FOUR`, `ADDITIONAL_TRAILER_LINE_FIVE`, `ADDITIONAL_TRAILER_LINE_SIX`,
    `FREEFORM_LOT_INFORMATION_1`, `FREEFORM_LOT_INFORMATION_2`, `FREEFORM_LOT_INFORMATION_3`, `SEC`,
    `OPTION_REGULATORY_FEE`, `ALTERNATE_SECURITY_ID_1_TYPE`, `ALTERNATE_SECURITY_ID_1`, `ALTERNATE_SECURITY_ID_2_TYPE`,
    `ALTERNATE_SECURITY_ID_2`, `NET_AMOUNT_IN_USDE`, `INTERNATIONAL_FOREIGN_TRADING_FEE`, `ATS_INDICATOR`, `ATS_MPID`,
    `PERSHING_INTERNAL_VERSION_NUMBER`, `PERSHING_INTERNAL_TRADE_REFERENCE_NUMBER`, `DATE_OF_DATA`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('ACCOUNT_NUMBER_', format_string('%02d', idx)) AS `ACCOUNT_NUMBER`,
    concat('IBD_NUMBER_', format_string('%02d', idx)) AS `IBD_NUMBER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,5)) AS `QUANTITY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,9)) AS `PRICE`,
    concat('TRADE_CURRENCY_', format_string('%02d', idx)) AS `TRADE_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `BASIS_PRICE_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `YIELD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `YIELD_TO_WORST`,
    concat('YIELD_TO_WORST_CODE_', format_string('%02d', idx)) AS `YIELD_TO_WORST_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `PERSHING_CHARGE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `TRANSACTION_FEE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `REBATE_AMOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `NET_AMOUNT`,
    concat('SETTLEMENT_CURRENCY_', format_string('%02d', idx)) AS `SETTLEMENT_CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,9)) AS `SETTLEMENT_CURRENCY_EXCHANGE_RATE`,
    concat('SETTLEMENT_CURRENCY_MULT_', format_string('%02d', idx)) AS `SETTLEMENT_CURRENCY_MULTIPLY_DIVIDE_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `ACCRUED_INTEREST`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `SERVICE_CHARGE_FOR_IBD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `POSTAGE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `COMMISSION_SALES_CREDIT_TYPE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `COMMISSION`,
    TRY_CAST(idx * 100.25 AS DECIMAL(8,4)) AS `COMMISSION_PERCENT_DISCOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `SALES_CREDIT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `CDSC`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `BASE_COMMISSION`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `EQUITY_MARK_UP_MARK_DOWN`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `PRINCIPAL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `EXECUTION_CHARGE`,
    concat('EXECUTION_ONLY_INDICATOR_', format_string('%02d', idx)) AS `EXECUTION_ONLY_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `SETTLEMENT_FEE_CUSTOMER`,
    concat('CLEARANCE_ONLY_INDICATOR_', format_string('%02d', idx)) AS `CLEARANCE_ONLY_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `FGN_RECEIVE_DELIVER_CHARGE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `NTF_REDEMPTION_FEE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `NTF_REDEMPTION_ADD_ON_FEE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `MUTUAL_FUND_EXCHANGE_FEE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `SRS_FUND_EXCHANGE_FEE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `HANDLING_FEE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `STAMP_DUTY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `PRIME_BROKER_FEE`,
    concat('IBD_MISCELLANEOUS_CHARGE_', format_string('%02d', idx)) AS `IBD_MISCELLANEOUS_CHARGE_LABEL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `IBD_MISCELLANEOUS_CHARGE`,
    concat('STREETSIDE_MISCELLANEOUS_', format_string('%02d', idx)) AS `STREETSIDE_MISCELLANEOUS_CHARGE_LABEL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `STREETSIDE_MISCELLANEOUS_CHARGE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `TRANSACTION_LEVY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `TRANSFER_STAMP_FEE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `TRANSFER_TAX`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `CUSTOMER_CONFIRM_FEE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `IBD_CONFIRM_FEE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `FOREIGN_FIN_TRANSACTION_TAX`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,9)) AS `REPORTED_PRICE`,
    concat('ADDITIONAL_TRAILER_LINE__', format_string('%02d', idx)) AS `ADDITIONAL_TRAILER_LINE_ONE`,
    concat('ADDITIONAL_TRAILER_LINE__', format_string('%02d', idx)) AS `ADDITIONAL_TRAILER_LINE_TWO`,
    concat('ADDITIONAL_TRAILER_LINE__', format_string('%02d', idx)) AS `ADDITIONAL_TRAILER_LINE_THREE`,
    concat('ADDITIONAL_TRAILER_LINE__', format_string('%02d', idx)) AS `ADDITIONAL_TRAILER_LINE_FOUR`,
    concat('ADDITIONAL_TRAILER_LINE__', format_string('%02d', idx)) AS `ADDITIONAL_TRAILER_LINE_FIVE`,
    concat('ADDITIONAL_TRAILER_LINE__', format_string('%02d', idx)) AS `ADDITIONAL_TRAILER_LINE_SIX`,
    concat('FREEFORM_LOT_INFORMATION_', format_string('%02d', idx)) AS `FREEFORM_LOT_INFORMATION_1`,
    concat('FREEFORM_LOT_INFORMATION_', format_string('%02d', idx)) AS `FREEFORM_LOT_INFORMATION_2`,
    concat('FREEFORM_LOT_INFORMATION_', format_string('%02d', idx)) AS `FREEFORM_LOT_INFORMATION_3`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `SEC`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `OPTION_REGULATORY_FEE`,
    concat('ALTERNATE_SECURITY_ID_1__', format_string('%02d', idx)) AS `ALTERNATE_SECURITY_ID_1_TYPE`,
    concat('ALTERNATE_SECURITY_ID_1_', format_string('%02d', idx)) AS `ALTERNATE_SECURITY_ID_1`,
    concat('ALTERNATE_SECURITY_ID_2__', format_string('%02d', idx)) AS `ALTERNATE_SECURITY_ID_2_TYPE`,
    concat('ALTERNATE_SECURITY_ID_2_', format_string('%02d', idx)) AS `ALTERNATE_SECURITY_ID_2`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `NET_AMOUNT_IN_USDE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(19,2)) AS `INTERNATIONAL_FOREIGN_TRADING_FEE`,
    concat('ATS_INDICATOR_', format_string('%02d', idx)) AS `ATS_INDICATOR`,
    concat('ATS_MPID_', format_string('%02d', idx)) AS `ATS_MPID`,
    idx AS `PERSHING_INTERNAL_VERSION_NUMBER`,
    concat('PERSHING_INTERNAL_TRADE__', format_string('%02d', idx)) AS `PERSHING_INTERNAL_TRADE_REFERENCE_NUMBER`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_gtde_b' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_gtde_b;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_isca_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ISCA_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_isca_a (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CUSIP_NUMBER` STRING,
    `SECURITY_TYPE` STRING,
    `SECURITY_MODIFIER` STRING,
    `SECURITY_CALCULATION_CODE` STRING,
    `PRIMARY_EXCHANGE` STRING,
    `COUPON_RATE_OR_INDICATED_DIVIDEND` DECIMAL(10,3),
    `UNDERLYING_SECURITY_CUSIP` STRING,
    `FIRST_CALL_PRICE_OR_STRIKE_PRICE` DECIMAL(11,4),
    `FIRST_PAR_CALL_PRICE_OR_UNITS` DECIMAL(11,4),
    `PRIMARY_SYMBOL` STRING,
    `INTEREST_FREQUENCY` STRING,
    `BOND_CLASS` STRING,
    `FIRST_COUPON_DAY` STRING,
    `CALL_INDICATOR` STRING,
    `PUT_INDICATOR` STRING,
    `FEDERAL_MARGINABLE_INDICATOR` STRING,
    `CNS_ELIGIBLE_CODE` STRING,
    `DTCC_ELIGIBLE_CODE` STRING,
    `NSCC_ELIGIBLE_CODE` STRING,
    `FOREIGN_SECURITY` STRING,
    `SECOND_COUPON_DAY` STRING,
    `DIVIDEND_INTEREST_PAYMENT_METHOD` STRING,
    `MINOR_PRODUCT_CODE` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_isca_a IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_isca_a;

INSERT INTO landing_pershing.default.pershing_isca_a (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `CUSIP_NUMBER`, `SECURITY_TYPE`, `SECURITY_MODIFIER`,
    `SECURITY_CALCULATION_CODE`, `PRIMARY_EXCHANGE`, `COUPON_RATE_OR_INDICATED_DIVIDEND`, `UNDERLYING_SECURITY_CUSIP`,
    `FIRST_CALL_PRICE_OR_STRIKE_PRICE`, `FIRST_PAR_CALL_PRICE_OR_UNITS`, `PRIMARY_SYMBOL`, `INTEREST_FREQUENCY`,
    `BOND_CLASS`, `FIRST_COUPON_DAY`, `CALL_INDICATOR`, `PUT_INDICATOR`, `FEDERAL_MARGINABLE_INDICATOR`,
    `CNS_ELIGIBLE_CODE`, `DTCC_ELIGIBLE_CODE`, `NSCC_ELIGIBLE_CODE`, `FOREIGN_SECURITY`, `SECOND_COUPON_DAY`,
    `DIVIDEND_INTEREST_PAYMENT_METHOD`, `MINOR_PRODUCT_CODE`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('SECURITY_TYPE_', format_string('%02d', idx)) AS `SECURITY_TYPE`,
    concat('SECURITY_MODIFIER_', format_string('%02d', idx)) AS `SECURITY_MODIFIER`,
    concat('SECURITY_CALCULATION_COD_', format_string('%02d', idx)) AS `SECURITY_CALCULATION_CODE`,
    concat('PRIMARY_EXCHANGE_', format_string('%02d', idx)) AS `PRIMARY_EXCHANGE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `COUPON_RATE_OR_INDICATED_DIVIDEND`,
    concat('UNDERLYING_SECURITY_CUSI_', format_string('%02d', idx)) AS `UNDERLYING_SECURITY_CUSIP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(11,4)) AS `FIRST_CALL_PRICE_OR_STRIKE_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(11,4)) AS `FIRST_PAR_CALL_PRICE_OR_UNITS`,
    concat('PRIMARY_SYMBOL_', format_string('%02d', idx)) AS `PRIMARY_SYMBOL`,
    concat('INTEREST_FREQUENCY_', format_string('%02d', idx)) AS `INTEREST_FREQUENCY`,
    concat('BOND_CLASS_', format_string('%02d', idx)) AS `BOND_CLASS`,
    concat('FIRST_COUPON_DAY_', format_string('%02d', idx)) AS `FIRST_COUPON_DAY`,
    concat('CALL_INDICATOR_', format_string('%02d', idx)) AS `CALL_INDICATOR`,
    concat('PUT_INDICATOR_', format_string('%02d', idx)) AS `PUT_INDICATOR`,
    concat('FEDERAL_MARGINABLE_INDIC_', format_string('%02d', idx)) AS `FEDERAL_MARGINABLE_INDICATOR`,
    concat('CNS_ELIGIBLE_CODE_', format_string('%02d', idx)) AS `CNS_ELIGIBLE_CODE`,
    concat('DTCC_ELIGIBLE_CODE_', format_string('%02d', idx)) AS `DTCC_ELIGIBLE_CODE`,
    concat('NSCC_ELIGIBLE_CODE_', format_string('%02d', idx)) AS `NSCC_ELIGIBLE_CODE`,
    concat('FOREIGN_SECURITY_', format_string('%02d', idx)) AS `FOREIGN_SECURITY`,
    concat('SECOND_COUPON_DAY_', format_string('%02d', idx)) AS `SECOND_COUPON_DAY`,
    concat('DIVIDEND_INTEREST_PAYMEN_', format_string('%02d', idx)) AS `DIVIDEND_INTEREST_PAYMENT_METHOD`,
    concat('MINOR_PRODUCT_CODE_', format_string('%02d', idx)) AS `MINOR_PRODUCT_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_isca_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_isca_a;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_isca_rec_b.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ISCA_B"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_isca_b (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CUSIP_NUMBER` STRING,
    `NOT_USED` STRING,
    `ETF_INDICATOR` STRING,
    `BID_PRICE` DECIMAL(10,3),
    `ASK_PRICE` DECIMAL(10,3),
    `PREVIOUS_DAY_PRICE` DECIMAL(10,3),
    `LATEST_PRICE` DECIMAL(10,3),
    `END_OF_MONTH_PRICE` DECIMAL(10,3),
    `ROUND_LOT_QUANTITY` INT,
    `DIVIDEND_REINVESTMENT_ELIGIBILITY_INDICATOR` STRING,
    `PREVIOUS_PRICE_DATE` INT,
    `LATEST_PRICE_DATE` INT,
    `END_OF_MONTH_PRICE_DATE` INT,
    `RECORD_DATE` INT,
    `FUNDVEST_INDICATOR` STRING,
    `COUNTRY_CODE` STRING,
    `STANDARD_AND_POORS_RATING` STRING,
    `MOODYS_RATING` STRING,
    `BOND_SUB_CLASS` STRING,
    `RESTRICTION_INDICATOR` STRING,
    `TRACE_INDICATOR` STRING,
    `NEW_INTEREST_CALCULATION_CODE` STRING,
    `SIC_CODE` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_isca_b IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_isca_b;

INSERT INTO landing_pershing.default.pershing_isca_b (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `CUSIP_NUMBER`, `NOT_USED`, `ETF_INDICATOR`, `BID_PRICE`,
    `ASK_PRICE`, `PREVIOUS_DAY_PRICE`, `LATEST_PRICE`, `END_OF_MONTH_PRICE`, `ROUND_LOT_QUANTITY`,
    `DIVIDEND_REINVESTMENT_ELIGIBILITY_INDICATOR`, `PREVIOUS_PRICE_DATE`, `LATEST_PRICE_DATE`,
    `END_OF_MONTH_PRICE_DATE`, `RECORD_DATE`, `FUNDVEST_INDICATOR`, `COUNTRY_CODE`, `STANDARD_AND_POORS_RATING`,
    `MOODYS_RATING`, `BOND_SUB_CLASS`, `RESTRICTION_INDICATOR`, `TRACE_INDICATOR`, `NEW_INTEREST_CALCULATION_CODE`,
    `SIC_CODE`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('NOT_USED_', format_string('%02d', idx)) AS `NOT_USED`,
    concat('ETF_INDICATOR_', format_string('%02d', idx)) AS `ETF_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `BID_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `ASK_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `PREVIOUS_DAY_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `LATEST_PRICE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(10,3)) AS `END_OF_MONTH_PRICE`,
    idx AS `ROUND_LOT_QUANTITY`,
    concat('DIVIDEND_REINVESTMENT_EL_', format_string('%02d', idx)) AS `DIVIDEND_REINVESTMENT_ELIGIBILITY_INDICATOR`,
    idx AS `PREVIOUS_PRICE_DATE`,
    idx AS `LATEST_PRICE_DATE`,
    idx AS `END_OF_MONTH_PRICE_DATE`,
    idx AS `RECORD_DATE`,
    concat('FUNDVEST_INDICATOR_', format_string('%02d', idx)) AS `FUNDVEST_INDICATOR`,
    concat('COUNTRY_CODE_', format_string('%02d', idx)) AS `COUNTRY_CODE`,
    concat('STANDARD_AND_POORS_RATIN_', format_string('%02d', idx)) AS `STANDARD_AND_POORS_RATING`,
    concat('MOODYS_RATING_', format_string('%02d', idx)) AS `MOODYS_RATING`,
    concat('BOND_SUB_CLASS_', format_string('%02d', idx)) AS `BOND_SUB_CLASS`,
    concat('RESTRICTION_INDICATOR_', format_string('%02d', idx)) AS `RESTRICTION_INDICATOR`,
    concat('TRACE_INDICATOR_', format_string('%02d', idx)) AS `TRACE_INDICATOR`,
    concat('NEW_INTEREST_CALCULATION_', format_string('%02d', idx)) AS `NEW_INTEREST_CALCULATION_CODE`,
    concat('SIC_CODE_', format_string('%02d', idx)) AS `SIC_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_isca_b' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_isca_b;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_isca_rec_c.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ISCA_C"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_isca_c (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CUSIP_NUMBER` STRING,
    `STATE_TAX_INDICATOR` STRING,
    `FEDERAL_TAXABLE_STATUS_INDICATOR` STRING,
    `AMT_INDICATOR` STRING,
    `RIC_INDICATOR` STRING,
    `NUMBER_OF_DESCRIPTION_LINES` STRING,
    `SECURITY_DESCRIPTION_LINE_1` STRING,
    `SECURITY_DESCRIPTION_LINE_2` STRING,
    `SECURITY_DESCRIPTION_LINE_3` STRING,
    `SECURITY_DESCRIPTION_LINE_4` STRING,
    `SECURITY_DESCRIPTION_LINE_5` STRING,
    `USER_CUSIP_IDENTIFIER` STRING,
    `TAXABLE_INDICATOR` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_isca_c IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_isca_c;

INSERT INTO landing_pershing.default.pershing_isca_c (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `CUSIP_NUMBER`, `STATE_TAX_INDICATOR`,
    `FEDERAL_TAXABLE_STATUS_INDICATOR`, `AMT_INDICATOR`, `RIC_INDICATOR`, `NUMBER_OF_DESCRIPTION_LINES`,
    `SECURITY_DESCRIPTION_LINE_1`, `SECURITY_DESCRIPTION_LINE_2`, `SECURITY_DESCRIPTION_LINE_3`,
    `SECURITY_DESCRIPTION_LINE_4`, `SECURITY_DESCRIPTION_LINE_5`, `USER_CUSIP_IDENTIFIER`, `TAXABLE_INDICATOR`,
    `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('STATE_TAX_INDICATOR_', format_string('%02d', idx)) AS `STATE_TAX_INDICATOR`,
    concat('FEDERAL_TAXABLE_STATUS_I_', format_string('%02d', idx)) AS `FEDERAL_TAXABLE_STATUS_INDICATOR`,
    concat('AMT_INDICATOR_', format_string('%02d', idx)) AS `AMT_INDICATOR`,
    concat('RIC_INDICATOR_', format_string('%02d', idx)) AS `RIC_INDICATOR`,
    concat('NUMBER_OF_DESCRIPTION_LI_', format_string('%02d', idx)) AS `NUMBER_OF_DESCRIPTION_LINES`,
    concat('SECURITY_DESCRIPTION_LIN_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION_LINE_1`,
    concat('SECURITY_DESCRIPTION_LIN_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION_LINE_2`,
    concat('SECURITY_DESCRIPTION_LIN_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION_LINE_3`,
    concat('SECURITY_DESCRIPTION_LIN_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION_LINE_4`,
    concat('SECURITY_DESCRIPTION_LIN_', format_string('%02d', idx)) AS `SECURITY_DESCRIPTION_LINE_5`,
    concat('USER_CUSIP_IDENTIFIER_', format_string('%02d', idx)) AS `USER_CUSIP_IDENTIFIER`,
    concat('TAXABLE_INDICATOR_', format_string('%02d', idx)) AS `TAXABLE_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_isca_c' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_isca_c;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_isca_rec_g.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ISCA_G"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_isca_g (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CUSIP_NUMBER` STRING,
    `NOT_USED_1` STRING,
    `DELTA` DECIMAL(18,9),
    `DELTA_VALUE_PRESENCE_INDICATOR` DECIMAL(38,10),
    `NOT_USED_2` STRING,
    `ISIN_CODE` STRING,
    `ISSUER_IDENTIFIER` STRING,
    `PIUO` STRING,
    `NOT_USED_3` STRING,
    `SYMBOL_OF_THE_UNDERLYING_SECURITY` STRING,
    `ASSET_TYPE` STRING,
    `ASSET_SUBTYPE` STRING,
    `ASSET_SUB_SUBTYPE` STRING,
    `PAYMENT_DAY_DELAYS` INT,
    `RESERVED_FOR_FUTURE_RATING` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_isca_g IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_isca_g;

INSERT INTO landing_pershing.default.pershing_isca_g (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `CUSIP_NUMBER`, `NOT_USED_1`, `DELTA`,
    `DELTA_VALUE_PRESENCE_INDICATOR`, `NOT_USED_2`, `ISIN_CODE`, `ISSUER_IDENTIFIER`, `PIUO`, `NOT_USED_3`,
    `SYMBOL_OF_THE_UNDERLYING_SECURITY`, `ASSET_TYPE`, `ASSET_SUBTYPE`, `ASSET_SUB_SUBTYPE`, `PAYMENT_DAY_DELAYS`,
    `RESERVED_FOR_FUTURE_RATING`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('NOT_USED_1_', format_string('%02d', idx)) AS `NOT_USED_1`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `DELTA`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `DELTA_VALUE_PRESENCE_INDICATOR`,
    concat('NOT_USED_2_', format_string('%02d', idx)) AS `NOT_USED_2`,
    concat('ISIN_CODE_', format_string('%02d', idx)) AS `ISIN_CODE`,
    concat('ISSUER_IDENTIFIER_', format_string('%02d', idx)) AS `ISSUER_IDENTIFIER`,
    concat('PIUO_', format_string('%02d', idx)) AS `PIUO`,
    concat('NOT_USED_3_', format_string('%02d', idx)) AS `NOT_USED_3`,
    concat('SYMBOL_OF_THE_UNDERLYING_', format_string('%02d', idx)) AS `SYMBOL_OF_THE_UNDERLYING_SECURITY`,
    concat('ASSET_TYPE_', format_string('%02d', idx)) AS `ASSET_TYPE`,
    concat('ASSET_SUBTYPE_', format_string('%02d', idx)) AS `ASSET_SUBTYPE`,
    concat('ASSET_SUB_SUBTYPE_', format_string('%02d', idx)) AS `ASSET_SUB_SUBTYPE`,
    idx AS `PAYMENT_DAY_DELAYS`,
    concat('RESERVED_FOR_FUTURE_RATI_', format_string('%02d', idx)) AS `RESERVED_FOR_FUTURE_RATING`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_isca_g' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_isca_g;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_isca_rec_j.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ISCA_J"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_isca_j (
    `RECORD_INDICATOR_VALUE` DECIMAL(38,10),
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CUSIP_NUMBER` STRING,
    `NOT_USED_1` STRING,
    `LATEST_PRICE` DECIMAL(18,9),
    `LATEST_PRICE_DATE` INT,
    `FACTORED_MARKET_VALUE_MULTIPLIER` DECIMAL(18,9),
    `CURRENT_YIELD` DECIMAL(18,9),
    `YIELD` DECIMAL(18,9),
    `PRICE_SOURCE` DECIMAL(38,10),
    `COUNTRY_OF_ORIGIN` STRING,
    `RESTRICTED_SECURITY_CODE` STRING,
    `INTERNATIONAL_NON_DOLLAR_SYMBOL` DECIMAL(38,10),
    `INTERNATIONAL_EXCHANGE` STRING,
    `VARIABLE_RATE_CATEGORY_CODE` DECIMAL(38,10),
    `INTEREST_RATE_COMPLETION_INDICATOR` DECIMAL(38,10),
    `NOT_USED_2` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_isca_j IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_isca_j;

INSERT INTO landing_pershing.default.pershing_isca_j (
    `RECORD_INDICATOR_VALUE`, `RECORD_ID_SEQUENCE_NUMBER`, `CUSIP_NUMBER`, `NOT_USED_1`, `LATEST_PRICE`,
    `LATEST_PRICE_DATE`, `FACTORED_MARKET_VALUE_MULTIPLIER`, `CURRENT_YIELD`, `YIELD`, `PRICE_SOURCE`,
    `COUNTRY_OF_ORIGIN`, `RESTRICTED_SECURITY_CODE`, `INTERNATIONAL_NON_DOLLAR_SYMBOL`, `INTERNATIONAL_EXCHANGE`,
    `VARIABLE_RATE_CATEGORY_CODE`, `INTEREST_RATE_COMPLETION_INDICATOR`, `NOT_USED_2`, `DATE_OF_DATA`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RECORD_INDICATOR_VALUE`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('NOT_USED_1_', format_string('%02d', idx)) AS `NOT_USED_1`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `LATEST_PRICE`,
    idx AS `LATEST_PRICE_DATE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `FACTORED_MARKET_VALUE_MULTIPLIER`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `CURRENT_YIELD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(18,9)) AS `YIELD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PRICE_SOURCE`,
    concat('COUNTRY_OF_ORIGIN_', format_string('%02d', idx)) AS `COUNTRY_OF_ORIGIN`,
    concat('RESTRICTED_SECURITY_CODE_', format_string('%02d', idx)) AS `RESTRICTED_SECURITY_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `INTERNATIONAL_NON_DOLLAR_SYMBOL`,
    concat('INTERNATIONAL_EXCHANGE_', format_string('%02d', idx)) AS `INTERNATIONAL_EXCHANGE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `VARIABLE_RATE_CATEGORY_CODE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `INTEREST_RATE_COMPLETION_INDICATOR`,
    concat('NOT_USED_2_', format_string('%02d', idx)) AS `NOT_USED_2`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_isca_j' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_isca_j;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_isrc_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_ISRC_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_isrc_a (
    `TRANSACTION_CODE` STRING,
    `RECORD_SEQUENCE_IDENTIFIER` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CHANGE_INDICATOR` STRING,
    `SOURCE_CODE` STRING,
    `SOURCE_CODE_DESCRIPTION_LINE_ONE` STRING,
    `SOURCE_CODE_DESCRIPTION_LINE_TWO` STRING,
    `SOURCE_CODE_DESCRIPTION_LINE_THREE` STRING,
    `TAX_STATUS` STRING,
    `USERID_OF_PERSON_WHO_LAST_ADDED_UPDATED_RECORD` DATE,
    `DATE_ADDED` DATE,
    `DATE_UPDATED` DATE,
    `IRA_INCOME_ELEGIBLE` STRING,
    `RETAIL_INCOME_ELEGIBLE` STRING,
    `CUSTOMER_FIRM` STRING,
    `CREDIT_DEBIT` DECIMAL(38,10),
    `STATEMENT_INDICATOR` STRING,
    `STATEMENT_ACTIVITY_SUMMARY_INDICATOR` STRING,
    `STATEMENT_ACTIVITY_SUMMARY_NUMBER` STRING,
    `STATEMENT_TRANSACTION_SUMMARY_INDICATOR` STRING,
    `STATEMENT_TRANSACTION_NUMBER` STRING,
    `STATEMENT_DISTRIBUTION_INDICATOR` STRING,
    `STATEMENT_DISTRIBUTION_NUMBER` STRING,
    `STATEMENT_DISTRIBUTION_TAXABLE_INDICATOR` STRING,
    `STATEMENT_DIVIDEND_INDICATOR` STRING,
    `STATEMENT_DIVIDEND_NUMBER` STRING,
    `STATEMENT_DIVIDEND_TAXABLE_INDICATOR` STRING,
    `PERSHING_DEPARTMENT` STRING,
    `PERSHING_GROUP_THAT_MANAGES_THE_SOURCE_CODE` STRING,
    `USERID_OF_PERSON_WHO_ADDED_CODE` STRING,
    `USERID_OF_PERSON_WHO_UPDATED_CODE` DATE,
    `PORTFOLIO_ELIGIBLE_INDICATOR` STRING,
    `REINVEST_INDICATOR` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_isrc_a IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_isrc_a;

INSERT INTO landing_pershing.default.pershing_isrc_a (
    `TRANSACTION_CODE`, `RECORD_SEQUENCE_IDENTIFIER`, `RECORD_ID_SEQUENCE_NUMBER`, `CHANGE_INDICATOR`, `SOURCE_CODE`,
    `SOURCE_CODE_DESCRIPTION_LINE_ONE`, `SOURCE_CODE_DESCRIPTION_LINE_TWO`, `SOURCE_CODE_DESCRIPTION_LINE_THREE`,
    `TAX_STATUS`, `USERID_OF_PERSON_WHO_LAST_ADDED_UPDATED_RECORD`, `DATE_ADDED`, `DATE_UPDATED`, `IRA_INCOME_ELEGIBLE`,
    `RETAIL_INCOME_ELEGIBLE`, `CUSTOMER_FIRM`, `CREDIT_DEBIT`, `STATEMENT_INDICATOR`,
    `STATEMENT_ACTIVITY_SUMMARY_INDICATOR`, `STATEMENT_ACTIVITY_SUMMARY_NUMBER`,
    `STATEMENT_TRANSACTION_SUMMARY_INDICATOR`, `STATEMENT_TRANSACTION_NUMBER`, `STATEMENT_DISTRIBUTION_INDICATOR`,
    `STATEMENT_DISTRIBUTION_NUMBER`, `STATEMENT_DISTRIBUTION_TAXABLE_INDICATOR`, `STATEMENT_DIVIDEND_INDICATOR`,
    `STATEMENT_DIVIDEND_NUMBER`, `STATEMENT_DIVIDEND_TAXABLE_INDICATOR`, `PERSHING_DEPARTMENT`,
    `PERSHING_GROUP_THAT_MANAGES_THE_SOURCE_CODE`, `USERID_OF_PERSON_WHO_ADDED_CODE`,
    `USERID_OF_PERSON_WHO_UPDATED_CODE`, `PORTFOLIO_ELIGIBLE_INDICATOR`, `REINVEST_INDICATOR`, `DATE_OF_DATA`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    concat('RECORD_SEQUENCE_IDENTIFI_', format_string('%02d', idx)) AS `RECORD_SEQUENCE_IDENTIFIER`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CHANGE_INDICATOR_', format_string('%02d', idx)) AS `CHANGE_INDICATOR`,
    concat('SOURCE_CODE_', format_string('%02d', idx)) AS `SOURCE_CODE`,
    concat('SOURCE_CODE_DESCRIPTION__', format_string('%02d', idx)) AS `SOURCE_CODE_DESCRIPTION_LINE_ONE`,
    concat('SOURCE_CODE_DESCRIPTION__', format_string('%02d', idx)) AS `SOURCE_CODE_DESCRIPTION_LINE_TWO`,
    concat('SOURCE_CODE_DESCRIPTION__', format_string('%02d', idx)) AS `SOURCE_CODE_DESCRIPTION_LINE_THREE`,
    concat('TAX_STATUS_', format_string('%02d', idx)) AS `TAX_STATUS`,
    date_add(DATE '2026-01-01', idx - 1) AS `USERID_OF_PERSON_WHO_LAST_ADDED_UPDATED_RECORD`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_ADDED`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_UPDATED`,
    concat('IRA_INCOME_ELEGIBLE_', format_string('%02d', idx)) AS `IRA_INCOME_ELEGIBLE`,
    concat('RETAIL_INCOME_ELEGIBLE_', format_string('%02d', idx)) AS `RETAIL_INCOME_ELEGIBLE`,
    concat('CUSTOMER_FIRM_', format_string('%02d', idx)) AS `CUSTOMER_FIRM`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CREDIT_DEBIT`,
    concat('STATEMENT_INDICATOR_', format_string('%02d', idx)) AS `STATEMENT_INDICATOR`,
    concat('STATEMENT_ACTIVITY_SUMMA_', format_string('%02d', idx)) AS `STATEMENT_ACTIVITY_SUMMARY_INDICATOR`,
    concat('STATEMENT_ACTIVITY_SUMMA_', format_string('%02d', idx)) AS `STATEMENT_ACTIVITY_SUMMARY_NUMBER`,
    concat('STATEMENT_TRANSACTION_SU_', format_string('%02d', idx)) AS `STATEMENT_TRANSACTION_SUMMARY_INDICATOR`,
    concat('STATEMENT_TRANSACTION_NU_', format_string('%02d', idx)) AS `STATEMENT_TRANSACTION_NUMBER`,
    concat('STATEMENT_DISTRIBUTION_I_', format_string('%02d', idx)) AS `STATEMENT_DISTRIBUTION_INDICATOR`,
    concat('STATEMENT_DISTRIBUTION_N_', format_string('%02d', idx)) AS `STATEMENT_DISTRIBUTION_NUMBER`,
    concat('STATEMENT_DISTRIBUTION_T_', format_string('%02d', idx)) AS `STATEMENT_DISTRIBUTION_TAXABLE_INDICATOR`,
    concat('STATEMENT_DIVIDEND_INDIC_', format_string('%02d', idx)) AS `STATEMENT_DIVIDEND_INDICATOR`,
    concat('STATEMENT_DIVIDEND_NUMBE_', format_string('%02d', idx)) AS `STATEMENT_DIVIDEND_NUMBER`,
    concat('STATEMENT_DIVIDEND_TAXAB_', format_string('%02d', idx)) AS `STATEMENT_DIVIDEND_TAXABLE_INDICATOR`,
    concat('PERSHING_DEPARTMENT_', format_string('%02d', idx)) AS `PERSHING_DEPARTMENT`,
    concat('PERSHING_GROUP_THAT_MANA_', format_string('%02d', idx)) AS `PERSHING_GROUP_THAT_MANAGES_THE_SOURCE_CODE`,
    concat('USERID_OF_PERSON_WHO_ADD_', format_string('%02d', idx)) AS `USERID_OF_PERSON_WHO_ADDED_CODE`,
    date_add(DATE '2026-01-01', idx - 1) AS `USERID_OF_PERSON_WHO_UPDATED_CODE`,
    concat('PORTFOLIO_ELIGIBLE_INDIC_', format_string('%02d', idx)) AS `PORTFOLIO_ELIGIBLE_INDICATOR`,
    concat('REINVEST_INDICATOR_', format_string('%02d', idx)) AS `REINVEST_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_isrc_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_isrc_a;
-- Databricks SQL for source: pershing
-- Generated from sqlserver_landing_dbt/landing-pershing_mfds_rec_a.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERSHING_MFDS_A"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pershing_mfds_a (
    `TRANSACTION_CODE` STRING,
    `RECORD_ID` STRING,
    `RECORD_ID_SEQUENCE_NUMBER` INT,
    `CUSIP_NUMBER` STRING,
    `FUND_FAMILY_CODE` STRING,
    `SECURITY_SYMBOL` STRING,
    `DIVIDEND_REINVEST_INDICATOR` STRING,
    `CAPITAL_GAIN_REINVEST_INDICATOR` STRING,
    `FUNDSERV_INDICATOR` STRING,
    `GRANDFATHER_INDICATOR` STRING,
    `LOAD_NO_LOAD_INDICATOR` STRING,
    `NETWORKING_INDICATOR` DECIMAL(38,10),
    `NO_TRANSACTION_FEE_ELIGIBILITY_INDICATOR` DECIMAL(38,10),
    `SHORT_SETTLEMENT_ELIGIBILITY_INDICATOR` STRING,
    `SYSTEMATIC_REINVESTMENT_SYSTEM_ELIGIBILITY_INDICATOR` STRING,
    `DIVIDEND_FREQUENCY` STRING,
    `CLOSED_TO_BUYS_INDICATOR` STRING,
    `CLOSED_TO_SELLS_INDICATOR` STRING,
    `NEW_INVESTMENT_CLOSED_INDICATOR` STRING,
    `SETTLE_PURCHASE_DAYS_NON_FUNDSERV` STRING,
    `SETTLE_REDEMPTION_DAYS_NON_FUNDSERV` STRING,
    `SETTLE_PURCHASE_DAYS_FUNDSERV` STRING,
    `SETTLE_REDEMPTION_DAYS_FUNDSERV` STRING,
    `EXCHANGE_CUT_OFF_TIME` STRING,
    `PURCHASE_CUT_OFF_TIME` STRING,
    `REDEMPTION_CUT_OFF_TIME` STRING,
    `LAST_PRICE` DECIMAL(20,8),
    `LAST_PRICE_DATE` DATE,
    `FUND_FAMILY_NAME` STRING,
    `SHARE_CLASS` STRING,
    `MUTUAL_FUND_DESCRIPTION_LINE_1` STRING,
    `MUTUAL_FUND_DESCRIPTION_LINE_2` STRING,
    `MUTUAL_FUND_DESCRIPTION_LINE_3` STRING,
    `MUTUAL_FUND_DESCRIPTION_LINE_4` STRING,
    `MUTUAL_FUND_DESCRIPTION_LINE_5` STRING,
    `MUTUAL_FUND_DESCRIPTION_LINE_6` STRING,
    `EXCHANGE_ELIGIBLE_INDICATOR` STRING,
    `TRADE_STATUS` STRING,
    `CUSTOMER_COMMENTS` STRING,
    `OFFSHORE_INDICATOR` STRING,
    `OFFSHORE_PROCESSING_INDICATOR` STRING,
    `DEALER_AGREEMENT_REQUIRED_FOR_LOAD_TRADES` STRING,
    `DEALER_AGREEMENT_REQUIRED_FOR_NO_LOAD_TRADES` STRING,
    `DEALER_AGREEMENT_REQUIRED_FOR_LOAD_TRANSFERS` STRING,
    `DEALER_AGREEMENT_REQUIRED_FOR_NO_LOAD_TRANFERS` STRING,
    `AS_OF_INDICATOR` STRING,
    `AS_OF_DAYS` INT,
    `POST_SETTLE_CANCEL_INDICATOR` STRING,
    `POST_SETTLE_CANCEL_DAYS` INT,
    `POST_SETTLE_MAXIMUM_DOLLAR_AMOUNT` DECIMAL(14,2),
    `MINIMUM_INITIAL_PURCHASE_AMOUNT` DECIMAL(20,2),
    `MINIMUM_SUBSEQUENCE_PURCHASE_AMOUNT` DECIMAL(20,2),
    `MAXIMUM_INITIAL_PURCHASE_AMOUNT` DECIMAL(20,2),
    `MAXIMUM_SUBSEQUENCE_PURCHASE_AMOUNT` DECIMAL(20,2),
    `OMNIBUS_INDICATOR` STRING,
    `TENDER_INDICATOR` STRING,
    `FUNDVEST_200_ELIGIBLE` STRING,
    `SURCHARGE` STRING,
    `CURRENCY` STRING,
    `RETIREMENT_PLAN_NETWORK_RPN_ELIGIBLE_INDICATOR` DECIMAL(38,10),
    `TRADING_RESTRICTED_BY_BOOKING_ENTITIES` STRING,
    `BNY_MELLON_BNYM` STRING,
    `PERSHING_LLC_PLLC` STRING,
    `PERSHING_AUSTRALIA_PSAL` STRING,
    `PERSHING_CANADA_PSCL` STRING,
    `PERSHING_LONDON_PSLL` STRING,
    `FUND_SHARE_CLASS` STRING,
    `_12B_1_INDICATOR` STRING,
    `DATE_OF_DATA` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_pershing.default.pershing_mfds_a IS
'Pershing landing table containing cash, fund, income, security activity, and transaction attributes sourced from SQL Server dbt bronze logic for validation, reconciliation, and downstream brokerage reporting.';

TRUNCATE TABLE landing_pershing.default.pershing_mfds_a;

INSERT INTO landing_pershing.default.pershing_mfds_a (
    `TRANSACTION_CODE`, `RECORD_ID`, `RECORD_ID_SEQUENCE_NUMBER`, `CUSIP_NUMBER`, `FUND_FAMILY_CODE`, `SECURITY_SYMBOL`,
    `DIVIDEND_REINVEST_INDICATOR`, `CAPITAL_GAIN_REINVEST_INDICATOR`, `FUNDSERV_INDICATOR`, `GRANDFATHER_INDICATOR`,
    `LOAD_NO_LOAD_INDICATOR`, `NETWORKING_INDICATOR`, `NO_TRANSACTION_FEE_ELIGIBILITY_INDICATOR`,
    `SHORT_SETTLEMENT_ELIGIBILITY_INDICATOR`, `SYSTEMATIC_REINVESTMENT_SYSTEM_ELIGIBILITY_INDICATOR`,
    `DIVIDEND_FREQUENCY`, `CLOSED_TO_BUYS_INDICATOR`, `CLOSED_TO_SELLS_INDICATOR`, `NEW_INVESTMENT_CLOSED_INDICATOR`,
    `SETTLE_PURCHASE_DAYS_NON_FUNDSERV`, `SETTLE_REDEMPTION_DAYS_NON_FUNDSERV`, `SETTLE_PURCHASE_DAYS_FUNDSERV`,
    `SETTLE_REDEMPTION_DAYS_FUNDSERV`, `EXCHANGE_CUT_OFF_TIME`, `PURCHASE_CUT_OFF_TIME`, `REDEMPTION_CUT_OFF_TIME`,
    `LAST_PRICE`, `LAST_PRICE_DATE`, `FUND_FAMILY_NAME`, `SHARE_CLASS`, `MUTUAL_FUND_DESCRIPTION_LINE_1`,
    `MUTUAL_FUND_DESCRIPTION_LINE_2`, `MUTUAL_FUND_DESCRIPTION_LINE_3`, `MUTUAL_FUND_DESCRIPTION_LINE_4`,
    `MUTUAL_FUND_DESCRIPTION_LINE_5`, `MUTUAL_FUND_DESCRIPTION_LINE_6`, `EXCHANGE_ELIGIBLE_INDICATOR`, `TRADE_STATUS`,
    `CUSTOMER_COMMENTS`, `OFFSHORE_INDICATOR`, `OFFSHORE_PROCESSING_INDICATOR`,
    `DEALER_AGREEMENT_REQUIRED_FOR_LOAD_TRADES`, `DEALER_AGREEMENT_REQUIRED_FOR_NO_LOAD_TRADES`,
    `DEALER_AGREEMENT_REQUIRED_FOR_LOAD_TRANSFERS`, `DEALER_AGREEMENT_REQUIRED_FOR_NO_LOAD_TRANFERS`, `AS_OF_INDICATOR`,
    `AS_OF_DAYS`, `POST_SETTLE_CANCEL_INDICATOR`, `POST_SETTLE_CANCEL_DAYS`, `POST_SETTLE_MAXIMUM_DOLLAR_AMOUNT`,
    `MINIMUM_INITIAL_PURCHASE_AMOUNT`, `MINIMUM_SUBSEQUENCE_PURCHASE_AMOUNT`, `MAXIMUM_INITIAL_PURCHASE_AMOUNT`,
    `MAXIMUM_SUBSEQUENCE_PURCHASE_AMOUNT`, `OMNIBUS_INDICATOR`, `TENDER_INDICATOR`, `FUNDVEST_200_ELIGIBLE`,
    `SURCHARGE`, `CURRENCY`, `RETIREMENT_PLAN_NETWORK_RPN_ELIGIBLE_INDICATOR`, `TRADING_RESTRICTED_BY_BOOKING_ENTITIES`,
    `BNY_MELLON_BNYM`, `PERSHING_LLC_PLLC`, `PERSHING_AUSTRALIA_PSAL`, `PERSHING_CANADA_PSCL`, `PERSHING_LONDON_PSLL`,
    `FUND_SHARE_CLASS`, `_12B_1_INDICATOR`, `DATE_OF_DATA`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANSACTION_CODE_', format_string('%02d', idx)) AS `TRANSACTION_CODE`,
    concat('RECORD_ID_', format_string('%02d', idx)) AS `RECORD_ID`,
    idx AS `RECORD_ID_SEQUENCE_NUMBER`,
    concat('CUSIP_NUMBER_', format_string('%02d', idx)) AS `CUSIP_NUMBER`,
    concat('FUND_FAMILY_CODE_', format_string('%02d', idx)) AS `FUND_FAMILY_CODE`,
    concat('SECURITY_SYMBOL_', format_string('%02d', idx)) AS `SECURITY_SYMBOL`,
    concat('DIVIDEND_REINVEST_INDICA_', format_string('%02d', idx)) AS `DIVIDEND_REINVEST_INDICATOR`,
    concat('CAPITAL_GAIN_REINVEST_IN_', format_string('%02d', idx)) AS `CAPITAL_GAIN_REINVEST_INDICATOR`,
    concat('FUNDSERV_INDICATOR_', format_string('%02d', idx)) AS `FUNDSERV_INDICATOR`,
    concat('GRANDFATHER_INDICATOR_', format_string('%02d', idx)) AS `GRANDFATHER_INDICATOR`,
    concat('LOAD_NO_LOAD_INDICATOR_', format_string('%02d', idx)) AS `LOAD_NO_LOAD_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `NETWORKING_INDICATOR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `NO_TRANSACTION_FEE_ELIGIBILITY_INDICATOR`,
    concat('SHORT_SETTLEMENT_ELIGIBI_', format_string('%02d', idx)) AS `SHORT_SETTLEMENT_ELIGIBILITY_INDICATOR`,
    concat('SYSTEMATIC_REINVESTMENT__', format_string('%02d', idx)) AS `SYSTEMATIC_REINVESTMENT_SYSTEM_ELIGIBILITY_INDICATOR`,
    concat('DIVIDEND_FREQUENCY_', format_string('%02d', idx)) AS `DIVIDEND_FREQUENCY`,
    concat('CLOSED_TO_BUYS_INDICATOR_', format_string('%02d', idx)) AS `CLOSED_TO_BUYS_INDICATOR`,
    concat('CLOSED_TO_SELLS_INDICATO_', format_string('%02d', idx)) AS `CLOSED_TO_SELLS_INDICATOR`,
    concat('NEW_INVESTMENT_CLOSED_IN_', format_string('%02d', idx)) AS `NEW_INVESTMENT_CLOSED_INDICATOR`,
    concat('SETTLE_PURCHASE_DAYS_NON_', format_string('%02d', idx)) AS `SETTLE_PURCHASE_DAYS_NON_FUNDSERV`,
    concat('SETTLE_REDEMPTION_DAYS_N_', format_string('%02d', idx)) AS `SETTLE_REDEMPTION_DAYS_NON_FUNDSERV`,
    concat('SETTLE_PURCHASE_DAYS_FUN_', format_string('%02d', idx)) AS `SETTLE_PURCHASE_DAYS_FUNDSERV`,
    concat('SETTLE_REDEMPTION_DAYS_F_', format_string('%02d', idx)) AS `SETTLE_REDEMPTION_DAYS_FUNDSERV`,
    concat('EXCHANGE_CUT_OFF_TIME_', format_string('%02d', idx)) AS `EXCHANGE_CUT_OFF_TIME`,
    concat('PURCHASE_CUT_OFF_TIME_', format_string('%02d', idx)) AS `PURCHASE_CUT_OFF_TIME`,
    concat('REDEMPTION_CUT_OFF_TIME_', format_string('%02d', idx)) AS `REDEMPTION_CUT_OFF_TIME`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,8)) AS `LAST_PRICE`,
    date_add(DATE '2026-01-01', idx - 1) AS `LAST_PRICE_DATE`,
    concat('FUND_FAMILY_NAME_', format_string('%02d', idx)) AS `FUND_FAMILY_NAME`,
    concat('SHARE_CLASS_', format_string('%02d', idx)) AS `SHARE_CLASS`,
    concat('MUTUAL_FUND_DESCRIPTION__', format_string('%02d', idx)) AS `MUTUAL_FUND_DESCRIPTION_LINE_1`,
    concat('MUTUAL_FUND_DESCRIPTION__', format_string('%02d', idx)) AS `MUTUAL_FUND_DESCRIPTION_LINE_2`,
    concat('MUTUAL_FUND_DESCRIPTION__', format_string('%02d', idx)) AS `MUTUAL_FUND_DESCRIPTION_LINE_3`,
    concat('MUTUAL_FUND_DESCRIPTION__', format_string('%02d', idx)) AS `MUTUAL_FUND_DESCRIPTION_LINE_4`,
    concat('MUTUAL_FUND_DESCRIPTION__', format_string('%02d', idx)) AS `MUTUAL_FUND_DESCRIPTION_LINE_5`,
    concat('MUTUAL_FUND_DESCRIPTION__', format_string('%02d', idx)) AS `MUTUAL_FUND_DESCRIPTION_LINE_6`,
    concat('EXCHANGE_ELIGIBLE_INDICA_', format_string('%02d', idx)) AS `EXCHANGE_ELIGIBLE_INDICATOR`,
    concat('TRADE_STATUS_', format_string('%02d', idx)) AS `TRADE_STATUS`,
    concat('CUSTOMER_COMMENTS_', format_string('%02d', idx)) AS `CUSTOMER_COMMENTS`,
    concat('OFFSHORE_INDICATOR_', format_string('%02d', idx)) AS `OFFSHORE_INDICATOR`,
    concat('OFFSHORE_PROCESSING_INDI_', format_string('%02d', idx)) AS `OFFSHORE_PROCESSING_INDICATOR`,
    concat('DEALER_AGREEMENT_REQUIRE_', format_string('%02d', idx)) AS `DEALER_AGREEMENT_REQUIRED_FOR_LOAD_TRADES`,
    concat('DEALER_AGREEMENT_REQUIRE_', format_string('%02d', idx)) AS `DEALER_AGREEMENT_REQUIRED_FOR_NO_LOAD_TRADES`,
    concat('DEALER_AGREEMENT_REQUIRE_', format_string('%02d', idx)) AS `DEALER_AGREEMENT_REQUIRED_FOR_LOAD_TRANSFERS`,
    concat('DEALER_AGREEMENT_REQUIRE_', format_string('%02d', idx)) AS `DEALER_AGREEMENT_REQUIRED_FOR_NO_LOAD_TRANFERS`,
    concat('AS_OF_INDICATOR_', format_string('%02d', idx)) AS `AS_OF_INDICATOR`,
    idx AS `AS_OF_DAYS`,
    concat('POST_SETTLE_CANCEL_INDIC_', format_string('%02d', idx)) AS `POST_SETTLE_CANCEL_INDICATOR`,
    idx AS `POST_SETTLE_CANCEL_DAYS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(14,2)) AS `POST_SETTLE_MAXIMUM_DOLLAR_AMOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,2)) AS `MINIMUM_INITIAL_PURCHASE_AMOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,2)) AS `MINIMUM_SUBSEQUENCE_PURCHASE_AMOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,2)) AS `MAXIMUM_INITIAL_PURCHASE_AMOUNT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(20,2)) AS `MAXIMUM_SUBSEQUENCE_PURCHASE_AMOUNT`,
    concat('OMNIBUS_INDICATOR_', format_string('%02d', idx)) AS `OMNIBUS_INDICATOR`,
    concat('TENDER_INDICATOR_', format_string('%02d', idx)) AS `TENDER_INDICATOR`,
    concat('FUNDVEST_200_ELIGIBLE_', format_string('%02d', idx)) AS `FUNDVEST_200_ELIGIBLE`,
    concat('SURCHARGE_', format_string('%02d', idx)) AS `SURCHARGE`,
    concat('CURRENCY_', format_string('%02d', idx)) AS `CURRENCY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `RETIREMENT_PLAN_NETWORK_RPN_ELIGIBLE_INDICATOR`,
    concat('TRADING_RESTRICTED_BY_BO_', format_string('%02d', idx)) AS `TRADING_RESTRICTED_BY_BOOKING_ENTITIES`,
    concat('BNY_MELLON_BNYM_', format_string('%02d', idx)) AS `BNY_MELLON_BNYM`,
    concat('PERSHING_LLC_PLLC_', format_string('%02d', idx)) AS `PERSHING_LLC_PLLC`,
    concat('PERSHING_AUSTRALIA_PSAL_', format_string('%02d', idx)) AS `PERSHING_AUSTRALIA_PSAL`,
    concat('PERSHING_CANADA_PSCL_', format_string('%02d', idx)) AS `PERSHING_CANADA_PSCL`,
    concat('PERSHING_LONDON_PSLL_', format_string('%02d', idx)) AS `PERSHING_LONDON_PSLL`,
    concat('FUND_SHARE_CLASS_', format_string('%02d', idx)) AS `FUND_SHARE_CLASS`,
    concat('_12B_1_INDICATOR_', format_string('%02d', idx)) AS `_12B_1_INDICATOR`,
    date_add(DATE '2026-01-01', idx - 1) AS `DATE_OF_DATA`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pershing_mfds_a' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pershing_mfds_a;
