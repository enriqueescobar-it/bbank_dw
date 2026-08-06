-- NAME: SILVER_DMI_DISB_DAILY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: MARCH 17, 2026

{{
   config(
            materialized='incremental',
            incremental_strategy='append',
            tags=["dmi_standard"]
        )
}}


WITH cte_silver_dmi_disb AS (
	SELECT
		 LOAN_NUMBER
		,INVESTOR_NUMBER
		,CATEGORY_CODE
		,DSB_TRANSACTION_DATE
		,DSB_TRANSACTION_CODE
		,DSB_AMOUNT
		,MSP_LAST_RUN_DATE
		,FILE_NAME_DMI
		,DATE_OF_DATA
		,YEARMONTH
	FROM {{ ref('silver_dmi_disb')}}
		{% if is_incremental() %}
			WHERE DATE_OF_DATA NOT IN (SELECT DISTINCT DATE_OF_DATA FROM {{ this }})
		{% endif %}
)

SELECT *, GETUTCDATE() AS LOADED_AT FROM cte_silver_dmi_disb