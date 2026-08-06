-- NAME: silver_all_accounts_demand_deposits
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
	 CAST(spd.ACCTNO as varchar)				AS Account_Number
	,spd.ACTYPE									AS Account_Type
	,spd.GLCOST									AS GL_Cost_Center
	,spd.CIFNO									AS Customer_Number
	,spd.STATUS									AS Account_Status
	,spd.SNAME									AS Account_Name
	,spd.DateOpened								AS Opening_Date
	,spd.GLPROD									AS GL_Product_Code
	,CASE
		WHEN spd.ACTYPE = 'D' THEN 'Demand Deposit'
		WHEN spd.ACTYPE = 'S' THEN 'Saving Account'
	 END										AS Account_Type_Description
	,spd.BRANCH									AS Account_Branch
	,spd.OFFICR									AS Officer_Code
	,spd.DateClosed								AS Closing_Date
	,NULL										AS Maturity_Date
	,spd.SCCODE									AS Product_Code
	,NULL										AS Last_Renewal_Date
	,spd.GLCOST									AS Assigned_Cost_Center
	,spd.RATE									AS Rate
	,spd.GROUP__CS								AS GL_Group_Code
	,srg.PRACCT									AS GL_Principal_Account
	,spd.AsOfDate								AS AsOfDate

FROM {{ ref('silver_product_ddmast') }} spd
	LEFT  JOIN {{ ref('silver_referencetable_glint1') }} srg
			ON spd.GROUP__CS = srg.GROUP__CS
		   AND srg.APPCDE = 'DD'
		   AND srg.INTER__CS = 1