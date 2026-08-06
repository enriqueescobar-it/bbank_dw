-- NAME: SILVER_PRODUCT_FIS_ETHOS_INTERCHANGE_FEE_DATA
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: January 26, 2026

{{
   config(
          tags=["fis_standard"]
        )
}}

WITH silver_data AS (
    SELECT
        Index__CS                                           AS INDEX__CS
        ,Account_Number                                     AS ACCOUNT_NUMBER
        ,Customer_Number                                    AS CUSTOMER_NUMBER
        ,BIN                                                AS BIN
        ,Product                                            AS PRODUCT
        ,Block_Reclass_Desc                                 AS BLOCK_RECLASS_DESC
        ,Transaction_Code                                   AS TRANSACTION_CODE
        ,Trans_Reason_Code                                  AS TRANS_REASON_CODE
        ,Trans_Reason_Desc                                  AS TRANS_REASON_DESC
        ,Sub_Product                                        AS SUB_PRODUCT
        ,Interchange_Fee                                    AS INTERCHANGE_FEE
        ,Transaction_Amount                                 AS TRANSACTION_AMOUNT
        ,Merchant_Name                                      AS MERCHANT_NAME
        ,Merchant_Country_Code                              AS MERCHANT_COUNTRY_CODE
        ,Transaction_Date                                   AS TRANSACTION_DATE
        ,Posting_Date                                       AS POSTING_DATE
        ,SIC_4_Code                                         AS SIC_4_CODE
        ,SIC_Description                                    AS SIC_DESCRIPTION
        ,DATE_OF_DATA                                       AS DATE_OF_DATA
        ,YEARMONTH                                          AS YEARMONTH
        ,ROW_NUMBER() OVER (PARTITION BY Index__CS,Posting_Date ORDER BY LOADED_AT_NIFI_BASE ASC) rn
    FROM {{ref('bronze_fis_ethos_interchange_fee_data')}}
)

SELECT INDEX__CS
,ACCOUNT_NUMBER
,CUSTOMER_NUMBER
,BIN
,PRODUCT
,BLOCK_RECLASS_DESC
,TRANSACTION_CODE
,TRANS_REASON_CODE
,TRANS_REASON_DESC
,SUB_PRODUCT
,INTERCHANGE_FEE
,TRANSACTION_AMOUNT
,MERCHANT_NAME
,MERCHANT_COUNTRY_CODE
,TRANSACTION_DATE
,POSTING_DATE
,SIC_4_CODE
,SIC_DESCRIPTION
,DATE_OF_DATA
,YEARMONTH
,GETUTCDATE() AS LOADED_AT FROM silver_data where rn = 1