-- NAME: silver_all_accounts_time_deposits
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
	 CAST(spc.ACCTNO as varchar)		AS Account_Number
	,spc.ACTYPE							AS Account_Type
	,spc.GLCOST							AS Cost_Center
	,spc.CIFNO							AS Customer_Number
	,spc.STATUS							AS Account_Status
	,spc.SNAME							AS Account_Name
	,spc.DateIssued						AS Opening_Date
	,spc.GLPROD							AS GL_Product_Code
	,'Time Deposit'						AS Account_Type_Description
	,spc.BR__CS							AS Account_Branch
	,spc.OFFCR AS Officer_Code
	,CASE
		WHEN spc.STATUS NOT IN (2,8) THEN NULL
		ELSE spc.RedemptionDate
	 END AS Closing_Date
	,spc.MaturityDate					AS Maturity_Date
	,spc.TYPE							AS Product_Code
	,spc.RENDT							AS Last_Renewal_Date  -- CONVERT TO DATE!!!
	,spc.GLCOST							AS Assigned_Cost_Center
	,spc.rate							AS Rate
	,spc.GROUP__CS						AS GL_Group_Code
	,srg.PRACCT							AS GL_Principal_Account
	,spc.AsOfDate						AS AsOfDate

FROM {{ ref('silver_product_cdmast') }} spc
	LEFT  JOIN {{ ref('silver_referencetable_glint1') }} srg
			ON spc.GROUP__CS = srg.GROUP__CS
			AND srg.APPCDE = 'CD'
			AND srg.INTER__CS = 3