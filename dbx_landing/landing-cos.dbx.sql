-- Databricks SQL for source: cos
-- Generated from sqlserver/brz-cos.sql

CREATE CATALOG IF NOT EXISTS landing;
USE CATALOG landing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."COS_APPLICANT"
CREATE TABLE IF NOT EXISTS landing.default.cos_applicant (
    `APPLICANT_ID` BIGINT,
    `APPLICANT_INDEX` STRING,
    `CPF` STRING,
    `APP_REF` STRING,
    `FIRST_NM` STRING,
    `LAST_NM` STRING,
    `MIDDLE_NM` STRING,
    `ADD1` STRING,
    `ADD2` STRING,
    `CITY_STATE_ZIP` STRING,
    `HOME_PH` STRING,
    `MOBILE_PH` STRING,
    `LONG_HM_PH` STRING,
    `LONG_BUS_PH` STRING,
    `EMAIL` STRING,
    `OCCUPATION` STRING,
    `GENDER` STRING,
    `BBD_ID` BIGINT,
    `BUS_PH` STRING,
    `BUS_PH_EXT` STRING,
    `APPLICANT_CUST1` STRING,
    `APPLICANT_CUST2` STRING,
    `APPLICANT_CUST3` STRING,
    `APPLICANT_CUST4` STRING,
    `APPLICANT_CUST5` STRING,
    `ALIEN_CNTRY` STRING,
    `ALIEN_CITY` STRING,
    `ALIEN_CNTRY_RESIDE` STRING,
    `EMPLOYER_NM` STRING,
    `OTHER_EMAIL` STRING,
    `INSUFFICIENT_ADDRESS` STRING,
    `PROFIT_ANALYSIS` STRING,
    `RETENTION` STRING,
    `SIC_USER1_DEFINED` STRING,
    `SIC_USER2_DEFINED` STRING,
    `SIC_USER3_DEFINED` STRING,
    `SIC_USER4_DEFINED` STRING,
    `SIC_USER5_DEFINED` STRING,
    `SIC_USER6_DEFINED` STRING,
    `SIC_USER7_DEFINED` STRING,
    `SPECIAL_CUST` STRING,
    `ALIEN_CUST` STRING,
    `FINCEN_LEGAL_ENTITY` STRING,
    `CLASS` STRING,
    `NO_CALL_CUST` STRING,
    `PRVCY_ACT_OPT_OUT` STRING,
    `TIN_NM_MATCH` STRING,
    `AFFLT_OPT_OUT` STRING,
    `FAX_PH` STRING,
    `LONG_CELL_PH` STRING,
    `LONG_OTHR_PH` STRING,
    `LONG_FAX_PH` STRING,
    `IRS_ADDRESS` STRING,
    `IRS_FOREIGN_ADDRESS` STRING,
    `IRS_FOREIGN_CNTRY` STRING,
    `INQUIRY_ID_NUM` BIGINT,
    `ALIEN_W8_CERT_DATE` DATE,
    `EXCLUSION_REASON` STRING,
    `TITTLE` STRING,
    `FOREIGN_CNTRY` STRING,
    `TAX_ID_NUM_TYPE` STRING,
    `TIN_CERT` STRING,
    `TIN_CERT_DATE` DATE,
    `OFFICERS` STRING,
    `DATE_LAST_CONTACT` STRING,
    `OTHR_CELL_PH` STRING,
    `SIC_USER8_DEFINED` STRING,
    `CUSTOMER_NUMBER` BIGINT,
    `MAIL_NOTICE_CODE` STRING,
    `PRINT_NAME_ON_STATEMENT` STRING,
    `DOB` DATE,
    `ADD3` STRING,
    `EWF_PROCESSED` STRING,
    `CREATED_DT` DATE,
    `ALIEN_W8_EXP_DATE` DATE,
    `ALIEN_W8_TYPE` STRING,
    `ALIEN_W8_STATUS` STRING,
    `ALIEN_CHPT3_EXEMP_CODE` STRING,
    `ALIEN_CHPT3_STATUS_CODE` STRING,
    `ALIEN_CHPT4_EXEMP_CODE` STRING,
    `ALIEN_CHPT4_STATUS_CODE` STRING,
    `CITY` STRING,
    `STATE` STRING,
    `ZIP_CODE` STRING,
    `LONG_BUS_PH_EXT` STRING,
    `IS_PEP` STRING,
    `IS_ORIGIN_BRAD` STRING,
    `HAS_NEG_NEWS` STRING,
    `TAX_ID` BIGINT,
    `SUFFIX` STRING,
    `COMMNAME` STRING,
    `Q2_ENROLL` STRING,
    `SS` STRING,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing.default.cos_applicant IS 
'The table contains detailed information about applicants, including their personal details, contact information, and employment data. This data can be used for managing applicant records, verifying identities, and assessing applicant eligibility. Possible use cases include tracking applicant progress, analyzing demographic information, and ensuring compliance with regulatory requirements.';

TRUNCATE TABLE landing.default.cos_applicant;

INSERT INTO landing.default.cos_applicant (
    `APPLICANT_ID`, `APPLICANT_INDEX`, `CPF`, `APP_REF`, `FIRST_NM`, `LAST_NM`,
    `MIDDLE_NM`, `ADD1`, `ADD2`, `CITY_STATE_ZIP`, `HOME_PH`, `MOBILE_PH`,
    `LONG_HM_PH`, `LONG_BUS_PH`, `EMAIL`, `OCCUPATION`, `GENDER`, `BBD_ID`,
    `BUS_PH`, `BUS_PH_EXT`, `APPLICANT_CUST1`, `APPLICANT_CUST2`, `APPLICANT_CUST3`, `APPLICANT_CUST4`,
    `APPLICANT_CUST5`, `ALIEN_CNTRY`, `ALIEN_CITY`, `ALIEN_CNTRY_RESIDE`, `EMPLOYER_NM`, `OTHER_EMAIL`,
    `INSUFFICIENT_ADDRESS`, `PROFIT_ANALYSIS`, `RETENTION`, `SIC_USER1_DEFINED`, `SIC_USER2_DEFINED`, `SIC_USER3_DEFINED`,
    `SIC_USER4_DEFINED`, `SIC_USER5_DEFINED`, `SIC_USER6_DEFINED`, `SIC_USER7_DEFINED`, `SPECIAL_CUST`, `ALIEN_CUST`,
    `FINCEN_LEGAL_ENTITY`, `CLASS`, `NO_CALL_CUST`, `PRVCY_ACT_OPT_OUT`, `TIN_NM_MATCH`, `AFFLT_OPT_OUT`,
    `FAX_PH`, `LONG_CELL_PH`, `LONG_OTHR_PH`, `LONG_FAX_PH`, `IRS_ADDRESS`, `IRS_FOREIGN_ADDRESS`,
    `IRS_FOREIGN_CNTRY`, `INQUIRY_ID_NUM`, `ALIEN_W8_CERT_DATE`, `EXCLUSION_REASON`, `TITTLE`, `FOREIGN_CNTRY`,
    `TAX_ID_NUM_TYPE`, `TIN_CERT`, `TIN_CERT_DATE`, `OFFICERS`, `DATE_LAST_CONTACT`, `OTHR_CELL_PH`,
    `SIC_USER8_DEFINED`, `CUSTOMER_NUMBER`, `MAIL_NOTICE_CODE`, `PRINT_NAME_ON_STATEMENT`, `DOB`, `ADD3`,
    `EWF_PROCESSED`, `CREATED_DT`, `ALIEN_W8_EXP_DATE`, `ALIEN_W8_TYPE`, `ALIEN_W8_STATUS`, `ALIEN_CHPT3_EXEMP_CODE`,
    `ALIEN_CHPT3_STATUS_CODE`, `ALIEN_CHPT4_EXEMP_CODE`, `ALIEN_CHPT4_STATUS_CODE`, `CITY`, `STATE`, `ZIP_CODE`,
    `LONG_BUS_PH_EXT`, `IS_PEP`, `IS_ORIGIN_BRAD`, `HAS_NEG_NEWS`, `TAX_ID`, `SUFFIX`,
    `COMMNAME`, `Q2_ENROLL`, `SS`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    idx AS `APPLICANT_ID`,
    concat('APPLICANT_INDEX_', lpad(CAST(idx AS STRING), 2, '0')) AS `APPLICANT_INDEX`,
    concat('CPF_', lpad(CAST(idx AS STRING), 2, '0')) AS `CPF`,
    concat('APP_REF_', lpad(CAST(idx AS STRING), 2, '0')) AS `APP_REF`,
    concat('FIRST_NM_', lpad(CAST(idx AS STRING), 2, '0')) AS `FIRST_NM`,
    concat('LAST_NM_', lpad(CAST(idx AS STRING), 2, '0')) AS `LAST_NM`,
    concat('MIDDLE_NM_', lpad(CAST(idx AS STRING), 2, '0')) AS `MIDDLE_NM`,
    concat('ADD1_', lpad(CAST(idx AS STRING), 2, '0')) AS `ADD1`,
    concat('ADD2_', lpad(CAST(idx AS STRING), 2, '0')) AS `ADD2`,
    concat('CITY_STATE_ZIP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CITY_STATE_ZIP`,
    concat('HOME_PH_', lpad(CAST(idx AS STRING), 2, '0')) AS `HOME_PH`,
    concat('MOBILE_PH_', lpad(CAST(idx AS STRING), 2, '0')) AS `MOBILE_PH`,
    concat('LONG_HM_PH_', lpad(CAST(idx AS STRING), 2, '0')) AS `LONG_HM_PH`,
    concat('LONG_BUS_PH_', lpad(CAST(idx AS STRING), 2, '0')) AS `LONG_BUS_PH`,
    concat('EMAIL_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMAIL`,
    concat('OCCUPATION_', lpad(CAST(idx AS STRING), 2, '0')) AS `OCCUPATION`,
    concat('GENDER_', lpad(CAST(idx AS STRING), 2, '0')) AS `GENDER`,
    idx AS `BBD_ID`,
    concat('BUS_PH_', lpad(CAST(idx AS STRING), 2, '0')) AS `BUS_PH`,
    concat('BUS_PH_EXT_', lpad(CAST(idx AS STRING), 2, '0')) AS `BUS_PH_EXT`,
    concat('APPLICANT_CUST1_', lpad(CAST(idx AS STRING), 2, '0')) AS `APPLICANT_CUST1`,
    concat('APPLICANT_CUST2_', lpad(CAST(idx AS STRING), 2, '0')) AS `APPLICANT_CUST2`,
    concat('APPLICANT_CUST3_', lpad(CAST(idx AS STRING), 2, '0')) AS `APPLICANT_CUST3`,
    concat('APPLICANT_CUST4_', lpad(CAST(idx AS STRING), 2, '0')) AS `APPLICANT_CUST4`,
    concat('APPLICANT_CUST5_', lpad(CAST(idx AS STRING), 2, '0')) AS `APPLICANT_CUST5`,
    concat('ALIEN_CNTRY_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALIEN_CNTRY`,
    concat('ALIEN_CITY_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALIEN_CITY`,
    concat('ALIEN_CNTRY_RESIDE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALIEN_CNTRY_RESIDE`,
    concat('EMPLOYER_NM_', lpad(CAST(idx AS STRING), 2, '0')) AS `EMPLOYER_NM`,
    concat('OTHER_EMAIL_', lpad(CAST(idx AS STRING), 2, '0')) AS `OTHER_EMAIL`,
    concat('INSUFFICIENT_ADDRESS_', lpad(CAST(idx AS STRING), 2, '0')) AS `INSUFFICIENT_ADDRESS`,
    concat('PROFIT_ANALYSIS_', lpad(CAST(idx AS STRING), 2, '0')) AS `PROFIT_ANALYSIS`,
    concat('RETENTION_', lpad(CAST(idx AS STRING), 2, '0')) AS `RETENTION`,
    concat('SIC_USER1_DEFINED_', lpad(CAST(idx AS STRING), 2, '0')) AS `SIC_USER1_DEFINED`,
    concat('SIC_USER2_DEFINED_', lpad(CAST(idx AS STRING), 2, '0')) AS `SIC_USER2_DEFINED`,
    concat('SIC_USER3_DEFINED_', lpad(CAST(idx AS STRING), 2, '0')) AS `SIC_USER3_DEFINED`,
    concat('SIC_USER4_DEFINED_', lpad(CAST(idx AS STRING), 2, '0')) AS `SIC_USER4_DEFINED`,
    concat('SIC_USER5_DEFINED_', lpad(CAST(idx AS STRING), 2, '0')) AS `SIC_USER5_DEFINED`,
    concat('SIC_USER6_DEFINED_', lpad(CAST(idx AS STRING), 2, '0')) AS `SIC_USER6_DEFINED`,
    concat('SIC_USER7_DEFINED_', lpad(CAST(idx AS STRING), 2, '0')) AS `SIC_USER7_DEFINED`,
    concat('SPECIAL_CUST_', lpad(CAST(idx AS STRING), 2, '0')) AS `SPECIAL_CUST`,
    concat('ALIEN_CUST_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALIEN_CUST`,
    concat('FINCEN_LEGAL_ENTITY_', lpad(CAST(idx AS STRING), 2, '0')) AS `FINCEN_LEGAL_ENTITY`,
    concat('CLASS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CLASS`,
    concat('NO_CALL_CUST_', lpad(CAST(idx AS STRING), 2, '0')) AS `NO_CALL_CUST`,
    concat('PRVCY_ACT_OPT_OUT_', lpad(CAST(idx AS STRING), 2, '0')) AS `PRVCY_ACT_OPT_OUT`,
    concat('TIN_NM_MATCH_', lpad(CAST(idx AS STRING), 2, '0')) AS `TIN_NM_MATCH`,
    concat('AFFLT_OPT_OUT_', lpad(CAST(idx AS STRING), 2, '0')) AS `AFFLT_OPT_OUT`,
    concat('FAX_PH_', lpad(CAST(idx AS STRING), 2, '0')) AS `FAX_PH`,
    concat('LONG_CELL_PH_', lpad(CAST(idx AS STRING), 2, '0')) AS `LONG_CELL_PH`,
    concat('LONG_OTHR_PH_', lpad(CAST(idx AS STRING), 2, '0')) AS `LONG_OTHR_PH`,
    concat('LONG_FAX_PH_', lpad(CAST(idx AS STRING), 2, '0')) AS `LONG_FAX_PH`,
    concat('IRS_ADDRESS_', lpad(CAST(idx AS STRING), 2, '0')) AS `IRS_ADDRESS`,
    concat('IRS_FOREIGN_ADDRESS_', lpad(CAST(idx AS STRING), 2, '0')) AS `IRS_FOREIGN_ADDRESS`,
    concat('IRS_FOREIGN_CNTRY_', lpad(CAST(idx AS STRING), 2, '0')) AS `IRS_FOREIGN_CNTRY`,
    idx AS `INQUIRY_ID_NUM`,
    date_add(DATE '2026-01-01', idx - 1) AS `ALIEN_W8_CERT_DATE`,
    concat('EXCLUSION_REASON_', lpad(CAST(idx AS STRING), 2, '0')) AS `EXCLUSION_REASON`,
    concat('TITTLE_', lpad(CAST(idx AS STRING), 2, '0')) AS `TITTLE`,
    concat('FOREIGN_CNTRY_', lpad(CAST(idx AS STRING), 2, '0')) AS `FOREIGN_CNTRY`,
    concat('TAX_ID_NUM_TYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `TAX_ID_NUM_TYPE`,
    concat('TIN_CERT_', lpad(CAST(idx AS STRING), 2, '0')) AS `TIN_CERT`,
    date_add(DATE '2026-01-01', idx - 1) AS `TIN_CERT_DATE`,
    concat('OFFICERS_', lpad(CAST(idx AS STRING), 2, '0')) AS `OFFICERS`,
    concat('DATE_LAST_CONTACT_', lpad(CAST(idx AS STRING), 2, '0')) AS `DATE_LAST_CONTACT`,
    concat('OTHR_CELL_PH_', lpad(CAST(idx AS STRING), 2, '0')) AS `OTHR_CELL_PH`,
    concat('SIC_USER8_DEFINED_', lpad(CAST(idx AS STRING), 2, '0')) AS `SIC_USER8_DEFINED`,
    idx AS `CUSTOMER_NUMBER`,
    concat('MAIL_NOTICE_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `MAIL_NOTICE_CODE`,
    concat('PRINT_NAME_ON_STATEMENT_', lpad(CAST(idx AS STRING), 2, '0')) AS `PRINT_NAME_ON_STATEMENT`,
    date_add(DATE '2026-01-01', idx - 1) AS `DOB`,
    concat('ADD3_', lpad(CAST(idx AS STRING), 2, '0')) AS `ADD3`,
    concat('EWF_PROCESSED_', lpad(CAST(idx AS STRING), 2, '0')) AS `EWF_PROCESSED`,
    date_add(DATE '2026-01-01', idx - 1) AS `CREATED_DT`,
    date_add(DATE '2026-01-01', idx - 1) AS `ALIEN_W8_EXP_DATE`,
    concat('ALIEN_W8_TYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALIEN_W8_TYPE`,
    concat('ALIEN_W8_STATUS_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALIEN_W8_STATUS`,
    concat('ALIEN_CHPT3_EXEMP_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALIEN_CHPT3_EXEMP_CODE`,
    concat('ALIEN_CHPT3_STATUS_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALIEN_CHPT3_STATUS_CODE`,
    concat('ALIEN_CHPT4_EXEMP_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALIEN_CHPT4_EXEMP_CODE`,
    concat('ALIEN_CHPT4_STATUS_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALIEN_CHPT4_STATUS_CODE`,
    concat('CITY_', lpad(CAST(idx AS STRING), 2, '0')) AS `CITY`,
    concat('STATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `STATE`,
    concat('ZIP_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ZIP_CODE`,
    concat('LONG_BUS_PH_EXT_', lpad(CAST(idx AS STRING), 2, '0')) AS `LONG_BUS_PH_EXT`,
    concat('IS_PEP_', lpad(CAST(idx AS STRING), 2, '0')) AS `IS_PEP`,
    concat('IS_ORIGIN_BRAD_', lpad(CAST(idx AS STRING), 2, '0')) AS `IS_ORIGIN_BRAD`,
    concat('HAS_NEG_NEWS_', lpad(CAST(idx AS STRING), 2, '0')) AS `HAS_NEG_NEWS`,
    idx AS `TAX_ID`,
    concat('SUFFIX_', lpad(CAST(idx AS STRING), 2, '0')) AS `SUFFIX`,
    concat('COMMNAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `COMMNAME`,
    concat('Q2_ENROLL_', lpad(CAST(idx AS STRING), 2, '0')) AS `Q2_ENROLL`,
    concat('SS_', lpad(CAST(idx AS STRING), 2, '0')) AS `SS`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."COS_PROSPECT"
CREATE TABLE IF NOT EXISTS landing.default.cos_prospect (
    `APP_REF` STRING,
    `REQUEST_DATA` STRING,
    `STATUS` STRING,
    `MODIFED_ON` STRING,
    `MODIFIED_BY` STRING,
    `CREATED_ON` STRING,
    `CREATED_BY` STRING,
    `CONTACORRENTE` STRING,
    `AGENCIA` STRING,
    `SEGMENTO` STRING,
    `CBLC` STRING,
    `BBDID` STRING,
    `STAGE_PROSPECT` STRING,
    `USER_WORKING` STRING,
    `BBDESK_VERSION` STRING,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing.default.cos_prospect IS 
'The table contains data related to prospects within the organization. It includes information on the creation and modification of prospect records, their status, and details about the agency and segment they belong to. Potential use cases include tracking the progress of prospects through different stages, analyzing modification trends, and monitoring the performance of users handling these prospects.';

TRUNCATE TABLE landing.default.cos_prospect;

INSERT INTO landing.default.cos_prospect (
    `APP_REF`, `REQUEST_DATA`, `STATUS`, `MODIFED_ON`, `MODIFIED_BY`, `CREATED_ON`,
    `CREATED_BY`, `CONTACORRENTE`, `AGENCIA`, `SEGMENTO`, `CBLC`, `BBDID`,
    `STAGE_PROSPECT`, `USER_WORKING`, `BBDESK_VERSION`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('APP_REF_', lpad(CAST(idx AS STRING), 2, '0')) AS `APP_REF`,
    concat('REQUEST_DATA_', lpad(CAST(idx AS STRING), 2, '0')) AS `REQUEST_DATA`,
    concat('STATUS_', lpad(CAST(idx AS STRING), 2, '0')) AS `STATUS`,
    concat('MODIFED_ON_', lpad(CAST(idx AS STRING), 2, '0')) AS `MODIFED_ON`,
    concat('MODIFIED_BY_', lpad(CAST(idx AS STRING), 2, '0')) AS `MODIFIED_BY`,
    concat('CREATED_ON_', lpad(CAST(idx AS STRING), 2, '0')) AS `CREATED_ON`,
    concat('CREATED_BY_', lpad(CAST(idx AS STRING), 2, '0')) AS `CREATED_BY`,
    concat('CONTACORRENTE_', lpad(CAST(idx AS STRING), 2, '0')) AS `CONTACORRENTE`,
    concat('AGENCIA_', lpad(CAST(idx AS STRING), 2, '0')) AS `AGENCIA`,
    concat('SEGMENTO_', lpad(CAST(idx AS STRING), 2, '0')) AS `SEGMENTO`,
    concat('CBLC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CBLC`,
    concat('BBDID_', lpad(CAST(idx AS STRING), 2, '0')) AS `BBDID`,
    concat('STAGE_PROSPECT_', lpad(CAST(idx AS STRING), 2, '0')) AS `STAGE_PROSPECT`,
    concat('USER_WORKING_', lpad(CAST(idx AS STRING), 2, '0')) AS `USER_WORKING`,
    concat('BBDESK_VERSION_', lpad(CAST(idx AS STRING), 2, '0')) AS `BBDESK_VERSION`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."COS_TD_TREASURY_RATE"
CREATE TABLE IF NOT EXISTS landing.default.cos_td_treasury_rate (
    `CD_Type_Code` STRING,
    `Effective_Date` DATE,
    `Base_Renewal_Rate` DECIMAL(38,10),
    `Standard_Rate` DECIMAL(38,10),
    `Cap_Rate` DECIMAL(38,10),
    `Rate_Code` DECIMAL(38,10),
    `created_date` DATE,
    `created_by` STRING,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing.default.cos_td_treasury_rate IS 
'The table contains data related to treasury rates, including various rate types and their effective dates. Use cases include analyzing trends in treasury rates, determining base and cap rates for financial products, and tracking historical changes in rates over time.';

TRUNCATE TABLE landing.default.cos_td_treasury_rate;

INSERT INTO landing.default.cos_td_treasury_rate (
    `CD_Type_Code`, `Effective_Date`, `Base_Renewal_Rate`, `Standard_Rate`, `Cap_Rate`, `Rate_Code`,
    `created_date`, `created_by`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CD_TYPE_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `CD_Type_Code`,
    date_add(DATE '2026-01-01', idx - 1) AS `Effective_Date`,
    CAST(idx * 100.25 AS DECIMAL(38,10)) AS `Base_Renewal_Rate`,
    CAST(idx * 100.25 AS DECIMAL(38,10)) AS `Standard_Rate`,
    CAST(idx * 100.25 AS DECIMAL(38,10)) AS `Cap_Rate`,
    CAST(idx * 100.25 AS DECIMAL(38,10)) AS `Rate_Code`,
    date_add(DATE '2026-01-01', idx - 1) AS `created_date`,
    concat('CREATED_BY_', lpad(CAST(idx AS STRING), 2, '0')) AS `created_by`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

SELECT 'cos_applicant' AS table_name, COUNT(*) AS record_count
FROM landing.default.cos_applicant
UNION ALL
SELECT 'cos_prospect' AS table_name, COUNT(*) AS record_count
FROM landing.default.cos_prospect
UNION ALL
SELECT 'cos_td_treasury_rate' AS table_name, COUNT(*) AS record_count
FROM landing.default.cos_td_treasury_rate;
