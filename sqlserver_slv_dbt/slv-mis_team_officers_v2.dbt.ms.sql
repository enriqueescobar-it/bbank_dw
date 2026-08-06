-- NAME: SILVER_MIS_TEAM_OFFICERS_V2
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
        OFFICER_CODE,
	    FULL_NAME,
	    SHORT_NAME,
	    TITLE,
	    PHONE_NUMBER,
	    EMAIL,
	    BUSINESS_LINE,
    	TEAM,
	    TEAM_CODE,
	    COST_CENTER,
	    ACTIVEOFFICER,
	    DATA_OF_DATA,
	    YEARMONTH,
	    LOADED_AT
FROM
    {{ref("bronze_mis_team_officers_v2") }}
),

silver_data AS (
    SELECT
        OFFICER_CODE,
	    FULL_NAME,
	    SHORT_NAME,
	    TITLE,
	    PHONE_NUMBER,
	    EMAIL,
	    BUSINESS_LINE,
    	TEAM,
	    TEAM_CODE,
	    COST_CENTER,
	    ACTIVEOFFICER,
	    DATA_OF_DATA,
	    YEARMONTH,
        GETUTCDATE() AS LOADED_AT
    FROM bronze_data
	WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM silver_data