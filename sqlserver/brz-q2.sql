-- NAME: BRONZE_Q2_CUSTOMER
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        CUSTOMER_ID
        ,GROUP_ID
        ,GROUP_NAME
        ,CUSTOMER_NAME
        ,TAX_ID
        ,IS_COMPANY
        ,IS_TREASURY
        ,PRIMARY_CIF
        ,SERVICE_CHARGE_PLAN_ID
        ,PLAN_NAME
        ,CHARGE_ACCOUNT
        ,CREATE_DATE
        ,STREET_ADDRESS1
        ,STREET_ADDRESS2
        ,CITY
        ,[STATE]
        ,POSTAL_CODE
        ,PROVINCE
        ,IS_INTERNATIONAL
        ,ISO_CODE_A3
        ,CUSTOMER_DELETED_DATE
        ,CONVERT(INT, CONVERT(nvarchar(6), LOADED_AT, 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."Q2_CUSTOMER"
),

bronze_data AS (
    SELECT
        CUSTOMER_ID
        ,GROUP_ID
        ,GROUP_NAME
        ,CUSTOMER_NAME
        ,TAX_ID
        ,IS_COMPANY
        ,IS_TREASURY
        ,PRIMARY_CIF
        ,SERVICE_CHARGE_PLAN_ID
        ,PLAN_NAME
        ,CHARGE_ACCOUNT
        ,CREATE_DATE
        ,STREET_ADDRESS1
        ,STREET_ADDRESS2
        ,CITY
        ,[STATE]
        ,POSTAL_CODE
        ,PROVINCE
        ,IS_INTERNATIONAL
        ,ISO_CODE_A3
        ,CUSTOMER_DELETED_DATE
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_q2_customer"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data



-- NAME: BRONZE_Q2_CUSTOMER
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        USER_ID
        ,CUSTOMER_ID
        ,USER_ROLE_ID
        ,GROUP_ID
        ,ACTIVE_INACTIVE
        ,CREATED_DATE
        ,DELETED_DATE
        ,GROUP_NAME
        ,GROUP_DELETED_DATES
        ,ZONE_ID
        ,ZONE_DESCRIPTION
        ,AUTO_GENERATED
        ,CONVERT(INT, CONVERT(nvarchar(6), LOADED_AT, 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."Q2_USER"
),

bronze_data AS (
    SELECT
        USER_ID
        ,CUSTOMER_ID
        ,USER_ROLE_ID
        ,GROUP_ID
        ,ACTIVE_INACTIVE
        ,CREATED_DATE
        ,DELETED_DATE
        ,GROUP_NAME
        ,GROUP_DELETED_DATES
        ,ZONE_ID
        ,ZONE_DESCRIPTION
        ,AUTO_GENERATED
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_q2_user"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data



-- NAME: BRONZE_Q2_CUSTOMER
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        USER_ID
        ,PRIMARY_CIF
        ,LAST_NAME
        ,FIRST_NAME
        ,MIDDLE_NAME
        ,SALUTATION
        ,SUFFIX
        ,SOCIAL_SECURITY_NUMBER
        ,EMAIL_ADDRESS
        ,STREET_ADDRESS_1
        ,STREET_ADDRESS_2
        ,CITY
        ,[STATE]
        ,POSTAL_CODE
        ,PROVINCE
        ,IS_INTERNATIONAL
        ,ISO_CODE_A3
        ,CONVERT(INT, CONVERT(nvarchar(6), LOADED_AT, 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."Q2_USER_PII"
),

bronze_data AS (
    SELECT
        USER_ID
        ,PRIMARY_CIF
        ,LAST_NAME
        ,FIRST_NAME
        ,MIDDLE_NAME
        ,SALUTATION
        ,SUFFIX
        ,SOCIAL_SECURITY_NUMBER
        ,EMAIL_ADDRESS
        ,STREET_ADDRESS_1
        ,STREET_ADDRESS_2
        ,CITY
        ,[STATE]
        ,POSTAL_CODE
        ,PROVINCE
        ,IS_INTERNATIONAL
        ,ISO_CODE_A3
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_q2_user_pii"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data


