-- NAME: SILVER_DMI_NON_CASH_DAILY
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


WITH cte_dmi_non_cash AS (
	SELECT
		 LOAN_NUMBER
		,INVESTOR_NUMBER
		,CATEGORY_CODE
		,NC_TRANSACTION_CODE
		,NC_TRANSACTION_DATE
		,NC_AMOUNT
		,NC_PRINCIPAL_AMOUNT
		,NC_INTEREST_AMOUNT
		,MSP_LAST_RUN_DATE
		,FILE_NAME_DMI
		,DATE_OF_DATA
		,YEARMONTH
	FROM {{ ref('silver_dmi_non_cash')}}
		{% if is_incremental() %}
			WHERE DATE_OF_DATA NOT IN (SELECT DISTINCT DATE_OF_DATA FROM {{ this }})
		{% endif %}
)
SELECT *, GETUTCDATE() AS LOADED_AT FROM cte_dmi_non_cash