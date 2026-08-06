-- NAME: silver_all_accounts_pershing
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: EPHEMERAL
-- TYPE: SOURCE
-- DATE: June 24, 2026

{{
   config(
          materialized='ephemeral',
          tags=["ephemeral"]
        )
}}

SELECT
	 pac.ACCOUNT_NUMBER												AS Account_Number
	,'PER'															AS Account_Type
	,poc.COST_CENTER												AS Cost_Center
	,pac.Customer_Number											AS Customer_Number
	,CASE
		WHEN pac.ACCOUNT_STATUS_INDICATOR_A = 'O' THEN 1
		WHEN pac.ACCOUNT_STATUS_INDICATOR_A = 'C' THEN 2
		WHEN pac.ACCOUNT_STATUS_INDICATOR_A = 'P' THEN 5
	END																 AS Account_Status
	,pac.ACCOUNT_REGISTRATION_LINE_1_A								 AS Account_Name
	,pac.DATE_ACCOUNT_OPENED_A										 AS Opening_Date
	,NULL															 AS GL_Product_Code
	,'Pershing Account'												 AS Account_Type_Description
	,NULL															 AS Account_Branch
	,ISNULL(poc.OFFICER_CODE, pac.INVESTMENT_PROFESSIONAL_IP_NUMBER) AS Officer_Code
	,TRY_CAST(pac.DATE_ACCOUNT_CLOSED_A as DATE)					 AS Closing_Date
	,NULL															 AS Maturity_Date
	,NULL															 AS Product_Code
	,NULL															 AS Last_Renewal_Date
	,poc.COST_CENTER												 AS Assigned_Cost_Center
	,NULL															 AS Rate
	,NULL															 AS GL_Group_Code
	,NULL															 AS GL_Principal_Account
	,pac.DATE_OF_DATA												 AS DATE_OF_DATA
FROM {{ ref('silver_account_pershing_acct_accf') }} pac
	LEFT  JOIN {{ ref('silver_mis_pershing_officer_code') }} poc
			ON pac.INVESTMENT_PROFESSIONAL_IP_NUMBER = poc.IP_CODE