-- NAME: BRONZE_RPRT_SHARING_AGREEMENT_EXCEPTION
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        ID
        ,CIF_NO
        ,ACTIVE
        ,CONVERT(INT, CONVERT(nvarchar(6), LOADED_AT, 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."RPRT_sharing_agreement_exception"
),

bronze_data AS (
    SELECT
        ID
        ,CIF_NO
        ,ACTIVE
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_rprt_sharing_agreement_exception"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data



