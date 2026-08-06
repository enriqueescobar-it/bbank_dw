-- NAME: SILVER_DMI_S2TT_DAILY
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


WITH cte_dmi_s2tt AS (
	SELECT
		 AccrualEntityCode
		,HeaderInvestorCode
		,LoanNumber
		,PSCode
		,BeginningIRBalance
		,PeriodIncome
		,AccrualAdjust
		,InterestCollected
		,EndIRBalance
		,AmortizedPrincipalBalance
		,InterestRate
		,DueOrEffectiveDate
		,PandIConstant
		,InvestorCode
		,CategoryCode
		,PCCode
		,Percent__CS
		,PTCode
		,ForecastedIncome
		,ForecastedIRBalance
		,FirstPrincipalBalance
		,IntlInd
		,LoanTypeCode
		,SLCode
		,PtFq
		,AI
		,ARMPrimeRate
		,AFCode
		,Delq
		,SDCode
		,ASDDifference
		,ASDIR
		,ExceptionCodes1
		,ExceptionsCodesDateLine1
		,NumberOfDays
		,PerDiem
		,Sum__CS
		,ClientCode
		,ExceptionCodes2
		,ExceptionsCodesDateLine2
		,NumberOfDays2
		,PerDiem2
		,Sum2
		,FILE_NAME_DMI
		,DATE_OF_DATA
		,YEARMONTH
	FROM {{ ref('silver_dmi_s2tt')}}
		{% if is_incremental() %}
			WHERE DATE_OF_DATA NOT IN (SELECT DISTINCT DATE_OF_DATA FROM {{ this }})
		{% endif %}
)
SELECT *, GETUTCDATE() AS LOADED_AT FROM cte_dmi_s2tt