-- NAME: SILVER_REFERENCETABLE_COS_TD_TREASURY_RATE
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: May 01, 2025

{{
   config(
		  tags=["cos_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        CD_Type_Code
        ,Effective_Date
        ,Base_Renewal_Rate
        ,Standard_Rate
        ,Cap_Rate
        ,Rate_Code
        ,created_date
        ,created_by
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_cos_td_treasury_rate') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)
SELECT * FROM bronze_data