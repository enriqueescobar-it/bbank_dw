-- NAME: silver_all_accounts_loans
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
	 CAST(spl.ACCTNO as varchar)	AS Account_Number
	,spl.ACTYPE						AS Account_Type
	,spl.GLCOST						AS Cost_Center
	,spl.CIFNO						AS Customer_Number
	,spl.STATUS						AS Account_Status
	,spl.SNAME						AS Account_Name
	,spl.OriginalLoanDate			AS Opening_Date
	,spl.GLPROD						AS GL_Product_Code
	,'Loan'							AS Account_Type_Description
	,spl.BR__CS						AS Account_Branch
	,spl.OFFCR						AS Officer_Code
	,spl.DatePaidOff				AS Closing_Date
	,spl.MaturityDate				AS Maturity_Date
	,spl.TYPE						AS Product_Code
	,NULL							AS Last_Renewal_Date
	,spl.GLCOST						AS Assigned_Cost_Center
	,spl.RATE						AS Rate
	,spl.GROUP__CS					AS GL_Group_Code
	,srg.PRACCT						AS GL_Principal_Account
	,spl.AsOfDate					AS AsOfDate
FROM {{ ref('silver_product_lnmast') }} spl
	LEFT  JOIN {{ ref('silver_referencetable_glint1') }} srg
			ON spl.GROUP__CS = srg.GROUP__CS
		   AND srg.APPCDE = 'LN'
		   AND srg.INTER__CS = 2