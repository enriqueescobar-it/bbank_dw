-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From bronze-cos.dbx.sql
-- Source model: bronze_cos_applicant
CREATE OR REPLACE TABLE bronze.default.bronze_cos_applicant AS
-- NAME: BRONZE_COS_APPLICANT
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        APPLICANT_ID
        ,APPLICANT_INDEX
        ,CPF
        ,APP_REF
        ,FIRST_NM
        ,LAST_NM
        ,MIDDLE_NM
        ,ADD1
        ,ADD2
        ,CITY_STATE_ZIP
        ,HOME_PH
        ,MOBILE_PH
        ,LONG_HM_PH
        ,LONG_BUS_PH
        ,EMAIL
        ,OCCUPATION
        ,GENDER
        ,BBD_ID
        ,BUS_PH
        ,BUS_PH_EXT
        ,APPLICANT_CUST1
        ,APPLICANT_CUST2
        ,APPLICANT_CUST3
        ,APPLICANT_CUST4
        ,APPLICANT_CUST5
        ,ALIEN_CNTRY
        ,ALIEN_CITY
        ,ALIEN_CNTRY_RESIDE
        ,EMPLOYER_NM
        ,OTHER_EMAIL
        ,INSUFFICIENT_ADDRESS
        ,PROFIT_ANALYSIS
        ,`RETENTION`
        ,SIC_USER1_DEFINED
        ,SIC_USER2_DEFINED
        ,SIC_USER3_DEFINED
        ,SIC_USER4_DEFINED
        ,SIC_USER5_DEFINED
        ,SIC_USER6_DEFINED
        ,SIC_USER7_DEFINED
        ,SPECIAL_CUST
        ,ALIEN_CUST
        ,FINCEN_LEGAL_ENTITY
        ,CLASS
        ,NO_CALL_CUST
        ,PRVCY_ACT_OPT_OUT
        ,TIN_NM_MATCH
        ,AFFLT_OPT_OUT
        ,FAX_PH
        ,LONG_CELL_PH
        ,LONG_OTHR_PH
        ,LONG_FAX_PH
        ,IRS_ADDRESS
        ,IRS_FOREIGN_ADDRESS
        ,IRS_FOREIGN_CNTRY
        ,INQUIRY_ID_NUM
        ,ALIEN_W8_CERT_DATE
        ,EXCLUSION_REASON
        ,TITTLE
        ,FOREIGN_CNTRY
        ,TAX_ID_NUM_TYPE
        ,TIN_CERT
        ,TIN_CERT_DATE
        ,OFFICERS
        ,DATE_LAST_CONTACT
        ,OTHR_CELL_PH
        ,SIC_USER8_DEFINED
        ,CUSTOMER_NUMBER
        ,MAIL_NOTICE_CODE
        ,PRINT_NAME_ON_STATEMENT
        ,DOB
        ,ADD3
        ,EWF_PROCESSED
        ,CREATED_DT
        ,ALIEN_W8_EXP_DATE
        ,ALIEN_W8_TYPE
        ,ALIEN_W8_STATUS
        ,ALIEN_CHPT3_EXEMP_CODE
        ,ALIEN_CHPT3_STATUS_CODE
        ,ALIEN_CHPT4_EXEMP_CODE
        ,ALIEN_CHPT4_STATUS_CODE
        ,CITY
        ,`STATE`
        ,ZIP_CODE
        ,LONG_BUS_PH_EXT
        ,IS_PEP
        ,IS_ORIGIN_BRAD
        ,HAS_NEG_NEWS
        ,TAX_ID
        ,SUFFIX
        ,COMMNAME
        ,Q2_ENROLL
        ,SS
        ,TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.cos_applicant
),

bronze_data AS (
    SELECT
        APPLICANT_ID
        ,APPLICANT_INDEX
        ,CPF
        ,APP_REF
        ,FIRST_NM
        ,LAST_NM
        ,MIDDLE_NM
        ,ADD1
        ,ADD2
        ,CITY_STATE_ZIP
        ,HOME_PH
        ,MOBILE_PH
        ,LONG_HM_PH
        ,LONG_BUS_PH
        ,EMAIL
        ,OCCUPATION
        ,GENDER
        ,BBD_ID
        ,BUS_PH
        ,BUS_PH_EXT
        ,APPLICANT_CUST1
        ,APPLICANT_CUST2
        ,APPLICANT_CUST3
        ,APPLICANT_CUST4
        ,APPLICANT_CUST5
        ,ALIEN_CNTRY
        ,ALIEN_CITY
        ,ALIEN_CNTRY_RESIDE
        ,EMPLOYER_NM
        ,OTHER_EMAIL
        ,INSUFFICIENT_ADDRESS
        ,PROFIT_ANALYSIS
        ,`RETENTION`
        ,SIC_USER1_DEFINED
        ,SIC_USER2_DEFINED
        ,SIC_USER3_DEFINED
        ,SIC_USER4_DEFINED
        ,SIC_USER5_DEFINED
        ,SIC_USER6_DEFINED
        ,SIC_USER7_DEFINED
        ,SPECIAL_CUST
        ,ALIEN_CUST
        ,FINCEN_LEGAL_ENTITY
        ,CLASS
        ,NO_CALL_CUST
        ,PRVCY_ACT_OPT_OUT
        ,TIN_NM_MATCH
        ,AFFLT_OPT_OUT
        ,FAX_PH
        ,LONG_CELL_PH
        ,LONG_OTHR_PH
        ,LONG_FAX_PH
        ,IRS_ADDRESS
        ,IRS_FOREIGN_ADDRESS
        ,IRS_FOREIGN_CNTRY
        ,INQUIRY_ID_NUM
        ,ALIEN_W8_CERT_DATE
        ,EXCLUSION_REASON
        ,TITTLE
        ,FOREIGN_CNTRY
        ,TAX_ID_NUM_TYPE
        ,TIN_CERT
        ,TIN_CERT_DATE
        ,OFFICERS
        ,DATE_LAST_CONTACT
        ,OTHR_CELL_PH
        ,SIC_USER8_DEFINED
        ,CUSTOMER_NUMBER
        ,MAIL_NOTICE_CODE
        ,PRINT_NAME_ON_STATEMENT
        ,DOB
        ,ADD3
        ,EWF_PROCESSED
        ,CREATED_DT
        ,ALIEN_W8_EXP_DATE
        ,ALIEN_W8_TYPE
        ,ALIEN_W8_STATUS
        ,ALIEN_CHPT3_EXEMP_CODE
        ,ALIEN_CHPT3_STATUS_CODE
        ,ALIEN_CHPT4_EXEMP_CODE
        ,ALIEN_CHPT4_STATUS_CODE
        ,CITY
        ,`STATE`
        ,ZIP_CODE
        ,LONG_BUS_PH_EXT
        ,IS_PEP
        ,IS_ORIGIN_BRAD
        ,HAS_NEG_NEWS
        ,TAX_ID
        ,SUFFIX
        ,COMMNAME
        ,Q2_ENROLL
        ,SS
        ,YEARMONTH
        ,current_timestamp() LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-cos.dbx.sql
-- Source model: bronze_cos_prospect
CREATE OR REPLACE TABLE bronze.default.bronze_cos_prospect AS
-- NAME: BRONZE_COS_PROSPECT
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        APP_REF
        ,REQUEST_DATA
        ,`STATUS`
        ,MODIFED_ON
        ,MODIFIED_BY
        ,CREATED_ON
        ,CREATED_BY
        ,CONTACORRENTE
        ,AGENCIA
        ,SEGMENTO
        ,CBLC
        ,BBDID
        ,STAGE_PROSPECT
        ,USER_WORKING
        ,BBDESK_VERSION
        ,TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.cos_prospect
),

bronze_data AS (
    SELECT
        APP_REF
        ,REQUEST_DATA
        ,`STATUS`
        ,MODIFED_ON
        ,MODIFIED_BY
        ,CREATED_ON
        ,CREATED_BY
        ,CONTACORRENTE
        ,AGENCIA
        ,SEGMENTO
        ,CBLC
        ,BBDID
        ,STAGE_PROSPECT
        ,USER_WORKING
        ,BBDESK_VERSION
        ,YEARMONTH
        ,current_timestamp() LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;

-- From bronze-cos.dbx.sql
-- Source model: bronze_cos_td_treasury_rate
CREATE OR REPLACE TABLE bronze.default.bronze_cos_td_treasury_rate AS
-- NAME: BRONZE_COS_TD_TREASURY_RATE
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: May 01, 2025



WITH landing_data AS (
    SELECT
        CD_Type_Code
        ,Effective_Date
        ,Base_Renewal_Rate
        ,Standard_Rate
        ,Cap_Rate
        ,Rate_Code
        ,created_date
        ,created_by
        ,TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.cos_td_treasury_rate
),

bronze_data AS (
    SELECT
        CD_Type_Code
        ,Effective_Date
        ,Base_Renewal_Rate
        ,Standard_Rate
        ,Cap_Rate
        ,Rate_Code
        ,created_date
        ,created_by
        ,YEARMONTH
        ,current_timestamp() LOADED_AT
    FROM landing_data
    
    
)





SELECT * FROM bronze_data;
