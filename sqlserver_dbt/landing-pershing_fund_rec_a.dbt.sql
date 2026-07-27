-- NAME: BRONZE_PERSHING_FUND_REC_A
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024

{{
   config(
          materialized='incremental',
          incremental_strategy='append',
          tags=["pershing_standard"]
        )
}}

WITH landing_data AS (
    SELECT DISTINCT
        RECORD_INDICATOR_VALUE
        ,RECORD_ID_SEQUENCE_NUMBER
        ,ACCOUNT_NUMBER
        ,IP
        ,FUND_MNEMONIC
        ,ACCOUNT_NUMBER_AT_FUND
        ,FUND_MANAGER
        ,LAST_SWEEP_DATE
        ,LAST_UPDATE_DATE
        ,CASE
            WHEN RIGHT(PRINCIPAL,1) IN ('{','A','B','C','D','E','F','G','H','I') THEN CONVERT(DECIMAL(18,3),REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(PRINCIPAL,'{',0),'A',1),'B',2),'C', 3),'D',4),'E', 5),'F',6),'G',7),'H',8),'I',9))
            WHEN RIGHT(PRINCIPAL,1) IN ('}','J','K','L','M','N','O','P','Q','R') THEN CONVERT(DECIMAL(18,3),REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(PRINCIPAL,'}',0),'J',1),'K',2),'L', 3),'M',4),'N', 5),'O',6),'P',7),'Q',8),'R',9)) * -1
         END PRINCIPAL
        ,CASE
            WHEN RIGHT(ACCRUED_DIVIDEND,1) IN ('{','A','B','C','D','E','F','G','H','I') THEN CONVERT(DECIMAL(18,3),REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(ACCRUED_DIVIDEND,'{',0),'A',1),'B',2),'C', 3),'D',4),'E', 5),'F',6),'G',7),'H',8),'I',9))
            WHEN RIGHT(ACCRUED_DIVIDEND,1) IN ('}','J','K','L','M','N','O','P','Q','R') THEN CONVERT(DECIMAL(18,3),REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(ACCRUED_DIVIDEND,'}',0),'J',1),'K',2),'L', 3),'M',4),'N', 5),'O',6),'P',7),'Q',8),'R',9)) * -1
         END ACCRUED_DIVIDEND
        ,GROUP_NUMBER
        ,OMNIBUS_ACCOUNT_INDICATOR
        ,SWEEP_ACCOUNT_INDICATOR
        ,MARGIN_DEBIT_AUTO_SWEEP_INDICATOR
        ,CUSIP_NUMBER
        ,PRICING_GROUP
        ,IBDNUMBER
        ,SUBSTRING(ACCOUNT_NUMBER, 1, 3) AS ACCOUNT_NUMBER_OFFICE
        ,SUBSTRING(ACCOUNT_NUMBER, 4, 6) AS ACCOUNT_NUMBER_BASE
        ,NULL AS ACCOUNT_NUMBER_TYPE
        ,DATE_OF_DATA
        ,YEARMONTH
    FROM {{ source("pershing", "PERSHING_FUND_A") }}
    {% if is_incremental() %}
        WHERE DATE_OF_DATA NOT IN (SELECT DISTINCT DATE_OF_DATA FROM {{ this }})
    {% endif %}
)

{% if execute %}
{{
    log("Running incrementally: " ~ is_incremental(), info=True)
}}
{% endif %}

SELECT *, GETUTCDATE() AS LOADED_AT FROM landing_data