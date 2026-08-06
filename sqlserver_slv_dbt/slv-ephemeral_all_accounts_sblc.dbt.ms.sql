-- NAME: silver_all_accounts_sblc
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
	 CAST(lcm.LCMACC as varchar)	AS Account_Number
	,'C'							AS Account_Type
	,lcm.LCMCCN						AS Cost_Center
	,lcm.LCMCFK						AS Customer_Number
	,CASE
		WHEN lcm.LCMCLJ > 0 THEN 2
		WHEN lcm.ASOFDATE <> (SELECT MAX(ASOFDATE) FROM {{ ref('silver_product_lcmast_current_detail') }}) THEN 2
		WHEN lcm.LCMSTS ='A' THEN 1
		ELSE 2
	 END							AS Account_Status
	,lcm.LCMIB1						AS Account_Name
	,CASE
		WHEN LCMODD > 0 THEN DATEFROMPARTS(2000 + LCMODY, LCMODM, LCMODD)
		ELSE NULL
	 END AS Opening_Date   --DQP_BRONZE.dbo.ConvertJhDateJulianToDatetime(lcm.LCMOPJ) AS Opening_Date, -- UPDATE
	,lcm.LCMPRC						AS GL_Product_Code
	,cfp.APPDES						AS Account_Type_Description
	,lcm.LCMBRN						AS Account_Branch
	,CASE
		WHEN lcm.LCMOFI = '' THEN cfm.CFOFFR
		ELSE lcm.LCMOFI
	 END							AS Officer_Code  -- Review and Document
	,CASE
		WHEN lcm.LCMCLJ > 0 THEN DATEFROMPARTS(2000 + LCMCLY, LCMCLM, LCMCLD) -- UPDATE
		--WHEN lcm.ASOFDATE <> (SELECT MAX(ASOFDATE) FROM ##tmp1_v2_lcmast_ACCOUNTS) THEN lcm.ASOFDATE
		ELSE NULL
	 END AS Closing_Date
	,CASE
		WHEN LCMEXJ > 0 THEN DATEFROMPARTS(2000 + LCMEXY, LCMEXM, LCMEXD)
		ELSE NULL
	 END							AS Maturity_Date
	,NULL							AS Product_Code
	,NULL							AS Last_Renewal_Date
	,lcm.LCMCCN						AS Assigned_Cost_Center
	,NULL							AS Rate
	,NULL							AS GL_Group_Code
	,LCMGLN							AS GL_Principal_Account
	,lcm.AsOfDate					AS AsOfDate

FROM {{ ref('silver_product_lcmast_current_detail') }} lcm
	LEFT  JOIN  {{ ref('silver_customer_cfmast') }} cfm
			ON lcm.LCMCFK = cfm.CFCIF__CS
	LEFT  JOIN {{ ref('silver_referencetable_cfpard') }} cfp
			ON cfp.APPCOD = 'c'