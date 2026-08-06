-- NAME: SILVER_DMI_S2TT
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


WITH cte_dmi_s2tt AS (
	SELECT
		 AccrualEntityCode
		,HeaderInvestorCode
		,LoanNumber
		,PSCode
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(BEGINNINGIRBALANCE), ',', ''), '(','-'),')',''))		AS BeginningIRBalance
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(PeriodIncome), ',', ''), '(','-'),')',''))				AS PeriodIncome
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(AccrualAdjust), ',', ''), '(','-'),')',''))				AS AccrualAdjust
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(InterestCollected), ',', ''), '(','-'),')',''))			AS InterestCollected
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(EndIRBalance), ',', ''), '(','-'),')',''))				AS EndIRBalance
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(AmortizedPrincipalBalance), ',', ''), '(','-'),')',''))	AS AmortizedPrincipalBalance
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(InterestRate), ',', ''), '(','-'),')',''))				AS InterestRate
		,convert(DATE,DueOrEffectiveDate)																			AS DueOrEffectiveDate
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(PandIConstant), ',', ''), '(','-'),')',''))				AS PandIConstant
		,InvestorCode
		,CategoryCode
		,PCCode
		,Percent__CS
		,PTCode
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(ForecastedIncome), ',', ''), '(','-'),')',''))			AS ForecastedIncome
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(ForecastedIRBalance), ',', ''), '(','-'),')',''))		AS ForecastedIRBalance
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(FirstPrincipalBalance), ',', ''), '(','-'),')',''))		AS FirstPrincipalBalance
		,IntlInd
		,LoanTypeCode
		,SLCode
		,PtFq
		,AI 			-- CHECK IS NECESSARY FROM MIS TO UNDERSTAND CLASSIFICATIONS ABOUT 02 AND 2 TO UNDERSTAND IF THEY ARE THE SAME
		,ARMPrimeRate
		,AFCode
		,Delq
		,SDCode
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(ASDDifference), ',', ''), '(','-'),')','')) AS ASDDifference
		,ASDIR
		,ExceptionCodes1
		,convert(date,ExceptionsCodesDateLine1)													  AS ExceptionsCodesDateLine1
		,NumberOfDays
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(PerDiem), ',', ''), '(','-'),')','')) AS PerDiem
		,Sum__CS
		,ClientCode
		,ExceptionCodes2
		,convert(date,ExceptionsCodesDateLine2)													 AS ExceptionsCodesDateLine2
		,NumberOfDays2
		,PerDiem2
		,Sum2
		,FILE_NAME_DMI
		,CONVERT(DATE,SUBSTRING(file_name_dmi , 15, 10)) AS DATE_OF_DATA
	FROM {{ ref('bronze_dmi_s2tt')}}
	WHERE
	    CONVERT(DATE,LOADED_AT) = (SELECT MAX(CONVERT(DATE,LOADED_AT)) FROM {{ ref('bronze_dmi_s2tt')}})
)

SELECT *,CONVERT(VARCHAR(6), DATE_OF_DATA, 112) AS YEARMONTH, GETUTCDATE() AS LOADED_AT FROM cte_dmi_s2tt