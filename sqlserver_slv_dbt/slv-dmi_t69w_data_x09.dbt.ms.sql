-- NAME: SILVER_DMI_T69W_DATA_X09
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: MARCH 17, 2026

{{
   config(
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
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(CollectionsDebit), ',', ''), '(','-'),')',''))	AS CollectionsDebit
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(CollectionsCredit), ',', ''), '(','-'),')',''))	AS CollectionsCredit
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(InvestorDebit), ',', ''), '(','-'),')',''))		AS InvestorDebit
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(InvestorCredit), ',', ''), '(','-'),')',''))	AS InvestorCredit
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(CorporateDebit), ',', ''), '(','-'),')',''))	AS CorporateDebit
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(CorporateCredit), ',', ''), '(','-'),')',''))	AS CorporateCredit
		,TypeCode
		,ClientCode
		,ClientName
		,CONVERT(DATE,ReportDate)																			AS ReportDate
		,ReportNumber
		,FILE_NAME_DMI
		,convert(DATE,CONVERT(DATE,SUBSTRING(file_name_dmi,15,10))) AS DATE_OF_DATA
	FROM {{ ref('bronze_dmi_t69w')}}
	WHERE
	    CONVERT(DATE,LOADED_AT) = (SELECT MAX(CONVERT(DATE,LOADED_AT)) FROM {{ ref('bronze_dmi_s2tv')}})
)

SELECT *,CONVERT(VARCHAR(6), DATE_OF_DATA, 112) AS YEARMONTH, GETUTCDATE() AS LOADED_AT FROM cte_silver_dmi_t69w_data_x09