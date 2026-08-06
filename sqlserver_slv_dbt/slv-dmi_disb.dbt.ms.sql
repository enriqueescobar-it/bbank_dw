-- NAME: SILVER_DMI_DISB
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


WITH cte_silver_dmi_disb AS (
	SELECT
		 LOAN_NUMBER
		,INVESTOR_NUMBER
		,CATEGORY_CODE
		,CONVERT(DATE,DSB_TRANSACTION_DATE) AS DSB_TRANSACTION_DATE
		,DSB_TRANSACTION_CODE
		,CONVERT(DECIMAL(12,2),REPLACE(DSB_AMOUNT, ',', '')) AS DSB_AMOUNT
		,CONVERT(DATE,MSP_LAST_RUN_DATE)	AS MSP_LAST_RUN_DATE
		,FILE_NAME_DMI
	    ,COALESCE(
		    TRY_CONVERT(
		        DATE,
		        CONCAT(
		            '20',
		            SUBSTRING(file_name_dmi, 10, 2),
		            '-',
		            SUBSTRING(file_name_dmi, 6, 2),
		            '-',
		            SUBSTRING(file_name_dmi, 8, 2)
		        )
		    ),
		    CONVERT(DATE, DSB_TRANSACTION_DATE)
		) AS DATE_OF_DATA

	FROM {{ ref('bronze_dmi_disb')}}
	WHERE
    	CONVERT(DATE,LOADED_AT) = (SELECT MAX(CONVERT(DATE,LOADED_AT)) FROM {{ ref('bronze_dmi_disb')}})
)

SELECT *,CONVERT(VARCHAR(6), DATE_OF_DATA, 112) AS YEARMONTH,GETUTCDATE() AS LOADED_AT FROM cte_silver_dmi_disb