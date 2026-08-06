-- NAME: SILVER_MIS_PERSHING_OFFICER_CODE
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: MONTHLY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: December 16, 2025

{{
   config(
          tags=["Monthly"]
        )
}}

WITH bronze_data AS (
    SELECT
    	IP_CODE,
	    OFFICER_CODE,
	    [NAME],
	    COST_CENTER,
	    TEAM,
	    DATA_OF_DATA,
	    YEARMONTH,
        LOADED_AT
FROM
    {{ref("bronze_mis_pershing_officer_code") }}
),

silver_data AS (
    SELECT
    	IP_CODE,
	    OFFICER_CODE,
	    [NAME],
	    COST_CENTER,
	    TEAM,
	    DATA_OF_DATA,
	    YEARMONTH,
        GETUTCDATE() AS LOADED_AT
    FROM bronze_data
	WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM silver_data