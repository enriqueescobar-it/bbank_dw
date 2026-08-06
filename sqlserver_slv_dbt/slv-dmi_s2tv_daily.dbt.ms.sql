-- NAME: SILVER_DMI_S2TV_DAILY
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


WITH cte_silver_dmi_s2tv AS (
	SELECT
		 ExceptionDescription
		,LoanNumber
		,BeginningIRBalance
		,PeriodIncome
		,AccrualAdjust
		,InterestCollected
		,EndIRBalance
		,FirstPrinBalance
		,InterestRate
		,DueEffDate
		,PNIConstant
		,AccrualEntityCode
		,InvestorCode
		,CategoryCode
		,PartCode
		,PostingType
		,VariableBeforeAfter
		,Date
		,ExceptionCodes
		,LoanType
		,SLCode1
		,PTFQCode
		,AICode
		,ArmPrmRt
		,AFCode
		,DelqCode
		,SDCode
		,PPDCode1
		,ASDDiff
		,ASDIR
		,AmortPrinBalance
		,FILE_NAME_DMI
		,DATE_OF_DATA
		,YEARMONTH
	FROM {{ ref('silver_dmi_s2tv')}}
		{% if is_incremental() %}
			WHERE DATE_OF_DATA NOT IN (SELECT DISTINCT DATE_OF_DATA FROM {{ this }})
		{% endif %}
)
SELECT *, GETUTCDATE() AS LOADED_AT FROM cte_silver_dmi_s2tv