-- NAME: SILVER_DMI_E006_DATA_X09
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


WITH cte_silver_dmi_t69w_data_x09 AS (
	SELECT
		 BatchCode
		,SequenceNumber
		,TransactionCode
		,CLTNumber
		,LoanNumber
		,HITypeCode
		,CONVERT(DECIMAL(12,2),PrincipalAdjustment) AS PrincipalAdjustment
		,CONVERT(DECIMAL(12,2),InterestAdjustment) 	AS InterestAdjustment
		,DiscountAdjustmentOrPercent
		,InterestDueAdjustment
		,CONVERT(DECIMAL(12,2),TransactionTotal) 	 AS TransactionTotal
		,DueDateAdjustment
		,NXNumber
		,NLOR
		,CSCode
		,DISCCode
		,CASE
	        WHEN TRY_CONVERT(INT, DISMCode) IS NOT NULL THEN RIGHT('000' + DISMCode, 3)
	        ELSE DISMCode
		 END 										AS DISMCode
		,ORGADJCode
		,STPAcr
		,ACSTCode
		,SCCode
		,ReasonCode
		,CardCode
		,convert(decimal(12,2),PointsPaidByBorrower) AS PointsPaidByBorrower
		,RPTGYR_26_27
		,AutoAdjSW1098
		,DiscFlag
		,PPBBFlag
		,UpfrontMIP
		,RPTGYR_40_41
		,MI1098AdjSW
		,[Auto]
		,FILE_NAME_DMI
		,CONVERT(DATE,SUBSTRING(FILE_NAME_DMI , 15, 10)) AS DATE_OF_DATA
	FROM {{ ref('bronze_dmi_e006')}}
	WHERE
	    CONVERT(DATE,LOADED_AT) = (SELECT MAX(CONVERT(DATE,LOADED_AT)) FROM {{ ref('bronze_dmi_e006')}})
)

SELECT *,CONVERT(VARCHAR(6), DATE_OF_DATA, 112) AS YEARMONTH, GETUTCDATE() AS LOADED_AT FROM cte_silver_dmi_t69w_data_x09