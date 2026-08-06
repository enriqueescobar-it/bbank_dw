-- NAME: silver_all_accounts_dmi
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
	 CAST(sdm.LOANNO as varchar)							AS Account_Number
	,'E'													AS Account_Type
	,ISNULL(spj.glcost, 7400)								AS Cost_Center  -- REVIEW  -- Should come from the officer cost center?
	,spj.CIFNO												AS Customer_Number
	,CASE
		WHEN sdm.PAYFULLDT > 0 THEN 2
			WHEN sdm.LastBradescoDate <> (SELECT MAX(LatestAsofDate) FROM {{ ref('silver_product_dmilay_current_detail') }}) THEN 8 -- ASSUMPTION! Review! SOLD OFF
		ELSE 1
	 END													AS Account_Status
	,sdm.BILLNAME											AS Account_Name
	,CAST(sdm.LOANDATE as DATE)								AS Opening_Date
	,0														AS GL_Product_Code
	,src.APPDES												AS Account_Type_Description
	,1														AS Account_Branch
	,ISNULL(scf.CFOFFR, 'JAG')								AS Officer_Code
	,CASE
		WHEN sdm.PAYFULLDT > 0 THEN CAST(sdm.PAYFULLDT AS DATE)
		WHEN sdm.LastBradescoDate <> (SELECT MAX(LatestAsofDate) FROM {{ ref('silver_product_dmilay_current_detail') }}) THEN sdm.LastBradescoDate -- ASSUMPTION! Review!
	 END													AS Closing_Date
	,CAST(sdm.MATDATE as DATE)								AS Maturity_Date
	,CONCAT(sdm.LatestBank,' ',  sdm.AGGR)					AS Product_Code  -- CASE WHEN LatestBank ='L41' AND AGGR IN ('002','009') THEN 'Comercial' ELSE 'Residential'
	,NULL													AS Last_Renewal_Date
	,roe.Cost_Center										AS Assigned_Cost_Center
	,sdm.ANNUALIN											AS Rat
	,NULL													AS GL_Group_Code
	,CAST(SUBSTRING(Principal_G_L_Acct_No, 5, 7) AS INT)	AS GL_Principal_Account
	,sdm.AsOfDate											AS AsOfDate
FROM {{ ref('silver_product_dmilay_current_detail') }} sdm
	LEFT  JOIN {{ ref('silver_product_jhmast') }} spj
			ON  sdm.LOANNO = spj.ACCTNO
		   AND  spj.ACTYPE ='E'
	LEFT  JOIN {{ ref('silver_referencetable_cfpard') }} src
			ON spj.ACTYPE = src.APPCOD
		   AND  src.APPCOD = 'E'
	LEFT  JOIN {{ ref('silver_customer_cfmast') }} scf
		    ON spj.CIFNO  = scf.CFCIF__CS
	LEFT  JOIN {{ ref('silver_mis_team_officers_v2') }} roe
			ON ISNULL(scf.CFOFFR, 'JAG') = roe.Officer_Code
	LEFT  JOIN {{ ref('silver_product_dmi_gl_mapping') }} dmi
			ON dmi.Perm_Cat = sdm.AGGR
		   AND dmi.Perm_Inv = sdm.LatestBank