-- NAME: SILVER_DMI_S2TV
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


WITH cte_silver_dmi_s2tv AS (
	SELECT
		 ExceptionDescription
		,LoanNumber
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(BeginningIRBalance), ',', ''), '(','-'),')',''))	AS BeginningIRBalance
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(PeriodIncome), ',', ''), '(','-'),')',''))			AS PeriodIncome
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(AccrualAdjust), ',', ''), '(','-'),')',''))			AS AccrualAdjust
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(InterestCollected), ',', ''), '(','-'),')',''))		AS InterestCollected
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(EndIRBalance), ',', ''), '(','-'),')',''))			AS EndIRBalance
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(FirstPrinBalance), ',', ''), '(','-'),')',''))		AS FirstPrinBalance
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(InterestRate), ',', ''), '(','-'),')',''))			AS InterestRate
		,CONVERT(date,DueEffDate)																				AS DueEffDate
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(PNIConstant), ',', ''), '(','-'),')',''))			AS PNIConstant
		,AccrualEntityCode
		,InvestorCode
		,CategoryCode
		,PartCode
		,PostingType
		,VariableBeforeAfter -- Understand the rule for new and old records, with the objective of splitting them into two different columns. The original state will be preserved, however we need to understand this rule in case it becomes necessary to separate them into different columns.
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
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(ASDDiff), ',', ''), '(',''),')',''))		    AS ASDDiff
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(ASDIR), ',', ''), '(',''),')',''))			   AS ASDIR
		,CONVERT(DECIMAL(12,2),REPLACE(REPLACE(REPLACE(TRIM(AmortPrinBalance), ',', ''), '(',''),')',''))  AS AmortPrinBalance
		,FILE_NAME_DMI
		,CONVERT(DATE,SUBSTRING(FILE_NAME_DMI , 15, 10)) AS DATE_OF_DATA
	FROM {{ ref('bronze_dmi_s2tv')}}
	WHERE
	    CONVERT(DATE,LOADED_AT) = (SELECT MAX(CONVERT(DATE,LOADED_AT)) FROM {{ ref('bronze_dmi_s2tv')}} )
)

SELECT *,CONVERT(VARCHAR(6), DATE_OF_DATA, 112) AS YEARMONTH, GETUTCDATE() AS LOADED_AT FROM cte_silver_dmi_s2tv