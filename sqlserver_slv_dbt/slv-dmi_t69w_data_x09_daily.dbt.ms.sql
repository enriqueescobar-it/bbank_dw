-- NAME: SILVER_DMI_T69W_DATA_X09_DAILY
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

WITH cte_silver_dmi_t69w_data_x09 AS (
	SELECT
		 CorpCode
		,AccountNumber
		,CostCenterCode
		,PayeeCode
		,TypeOfFunds
		,InvestorCode
		,CategoryCode
		,RptCode
		,TrnCode
		,CollectionsDebit
		,CollectionsCredit
		,InvestorDebit
		,InvestorCredit
		,CorporateDebit
		,CorporateCredit
		,TypeCode
		,ClientCode
		,ClientName
		,ReportDate
		,ReportNumber
		,FILE_NAME_DMI
		,DATE_OF_DATA
		,YEARMONTH
	FROM {{ ref('silver_dmi_t69w_data_x09')}}
		{% if is_incremental() %}
			WHERE DATE_OF_DATA NOT IN (SELECT DISTINCT DATE_OF_DATA FROM {{ this }})
		{% endif %}
)
SELECT *, GETUTCDATE() AS LOADED_AT FROM cte_silver_dmi_t69w_data_x09