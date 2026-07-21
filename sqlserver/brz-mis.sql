-- NAME: BRONZE_MIS_PERSHING_OFFICER_CODE
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: December 16, 2025



WITH landing_data AS (
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
    "DQP_LANDING"."dbo"."FILE_MIS_PERSHING_OFFICER_CODE"
),

bronze_data AS (
    SELECT
    	IP_CODE,
	    OFFICER_CODE,
	    [NAME],
	    COST_CENTER,
	    TEAM,
	    DATA_OF_DATA,
	    YEARMONTH,
        GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_mis_pershing_officer_code"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data



-- NAME: BRONZE_MIS_TEAM_OFFICERS_V2
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: December 16, 2025



WITH landing_data AS (
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
    "DQP_LANDING"."dbo"."FILE_MIS_TEAM_OFFICERS_V2"
),

bronze_data AS (
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
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_mis_team_officers_v2"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data


