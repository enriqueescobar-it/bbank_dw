-- NAME: SILVER_DMI_P110
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: APPEND
-- TYPE: REPLICATION
-- DATE: MARCH 19, 2026

{{
   config(
          materialized='incremental',
          incremental_strategy='append',
          tags=["dmi_standard"]
        )
}}


WITH cte_silver_dmi_p110 AS (
	SELECT
		 LoanNumber
		,BankCode
		,LoanCategory
		,LoanType
		,CONVERT(DECIMAL(17,7),InterestRate)	AS InterestRate
		,CONVERT(DECIMAL(17,7),ServiceRate)		AS ServiceRate
		,ManCode
		,ShortName
		,InvestorLoanNumber
		,SubCode
		,HITY
		,CONVERT(DATE,InterestPaidToDate)						AS InterestPaidToDate
		,SegmentNumber
		,CONVERT(DECIMAL(17,2),REPLACE(REPLACE(REPLACE(EscrowBalance, ',', ''), ')', ''), '(', '-')) AS EscrowBalance
		,SuspenseBalance
		,HUDBalance
		,CONVERT(DECIMAL(17,2),REPLACE(REPLACE(REPLACE(PrincipalPaid, ',', ''), ')', ''), '(', '-')) 	AS PrincipalPaid
		,CONVERT(DECIMAL(17,2),REPLACE(REPLACE(REPLACE(InterestPaid, ',', ''), ')', ''), '(', '-')) 	AS InterestPaid
		,CONVERT(DECIMAL(17,2),REPLACE(REPLACE(REPLACE(ServiceFee, ',', ''), ')', ''), '(', '-')) 		AS ServiceFee
		,Penalty
		,PenaltySerFee
		,FHAPenalty
		,CONVERT(DECIMAL(17,2),REPLACE(REPLACE(REPLACE(EscrowPaid, ',', ''), ')', ''), '(', '-')) 		AS EscrowPaid
		,CONVERT(DECIMAL(17,2),REPLACE(REPLACE(REPLACE(SuspensePaid, ',', ''), ')', ''), '(', '-')) 	AS SuspensePaid
		,RestEscPaid
		,AdvanceBalance
		,RestEsc
		,RepRsv
		,PrinReductAmt
		,DedCode
		,PrinFBAmt
		,P443FundingInterestRate
		,P443FundingServiceFee
		,FILE_NAME_DMI
		,CONVERT(DATE,SUBSTRING(FILE_NAME_DMI , 15, 10)) AS DATE_OF_DATA
	FROM  {{ ref('bronze_dmi_p110')}}
		{% if is_incremental() %}
	      WHERE CONVERT(DATE,SUBSTRING(FILE_NAME_DMI , 15, 10)) NOT IN (SELECT DISTINCT CONVERT(DATE,DATE_OF_DATA) FROM {{ this }})
	    {% endif %}
)

SELECT *, CONVERT(VARCHAR(6), DATE_OF_DATA, 112) AS YEARMONTH, GETUTCDATE() AS LOADED_AT from cte_silver_dmi_p110