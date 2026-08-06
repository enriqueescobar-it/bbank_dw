-- NAME: SILVER_DMI_P132
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: APPEND
-- TYPE: REPLICATION
-- DATE: MARCH 20, 2026

{{
   config(
          materialized='incremental',
          incremental_strategy='append',
          tags=["dmi_standard"]
        )
}}



WITH cte_dmi_s5az AS (
	SELECT
		 Frequency
		,RefinanceDescription
		,LoanNumber
		,InvestorCode2
		,CategoryCode2
		,HICode
		,convert(date,DueDate)																			AS DueDate
		,CONVERT(DECIMAL(17,2),REPLACE(REPLACE(REPLACE(PrincipalBalance, ',', ''), ')', ''), '(', '-')) AS PrincipalBalance
		,CONVERT(DECIMAL(17,7),REPLACE(REPLACE(REPLACE(InterestRate, ',', ''), ')', ''), '(', '-'))		AS InterestRate
		,CONVERT(DECIMAL(17,7),REPLACE(REPLACE(REPLACE(Yield, ',', ''), ')', ''), '(', '-'))			AS Yield
		,CONVERT(DECIMAL(17,7),REPLACE(REPLACE(REPLACE(FeeCost1, ',', ''), ')', ''), '(', '-'))			AS FeeCost1
		,CONVERT(DECIMAL(17,7),REPLACE(REPLACE(REPLACE(FeeCost2, ',', ''), ')', ''), '(', '-'))			AS FeeCost2
		,CONVERT(DECIMAL(17,7),REPLACE(REPLACE(REPLACE(FeeCost3, ',', ''), ')', ''), '(', '-'))			AS FeeCost3
		,CONVERT(DECIMAL(17,7),REPLACE(REPLACE(REPLACE(FeeCost4, ',', ''), ')', ''), '(', '-'))			AS FeeCost4
		,CONVERT(DECIMAL(17,7),REPLACE(REPLACE(REPLACE(FeeCost5, ',', ''), ')', ''), '(', '-'))			AS FeeCost5
		,CONVERT(DECIMAL(17,7),REPLACE(REPLACE(REPLACE(FeeCost6, ',', ''), ')', ''), '(', '-'))			AS FeeCost6
		,CONVERT(DECIMAL(17,7),REPLACE(REPLACE(REPLACE(FeeCost7, ',', ''), ')', ''), '(', '-'))			AS FeeCost7
		,CONVERT(DECIMAL(17,7),REPLACE(REPLACE(REPLACE(FeeCost8, ',', ''), ')', ''), '(', '-'))			AS FeeCost8
		,[Action]
		,FILE_NAME_DMI
		,CONVERT(DATE,SUBSTRING(FILE_NAME_DMI , 15, 10))												AS DATE_OF_DATA
	FROM  {{ ref('bronze_dmi_s5az')}}
		{% if is_incremental() %}
	    	WHERE CONVERT(DATE,SUBSTRING(FILE_NAME_DMI , 15, 10)) NOT IN (SELECT DISTINCT CONVERT(DATE,DATE_OF_DATA) FROM {{ this }})
	    {% endif %}
)

SELECT *,CONVERT(VARCHAR(6), DATE_OF_DATA, 112) AS YEARMONTH, GETUTCDATE() AS LOADED_AT FROM cte_dmi_s5az