-- Databricks SQL for source: assist
-- Generated from sqlserver/brz-assist.sql

CREATE CATALOG IF NOT EXISTS landing;
USE CATALOG landing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."ASSIST_CODFIL_REF"
CREATE TABLE IF NOT EXISTS landing.default.assist_codfil_ref (
    `COD_COD` STRING,
    `COD_TYP` STRING,
    `COD_USD` STRING,
    `COD_DES` STRING,
    `COD_GR` STRING,
    `COD_SIG` STRING,
    `Cod_Risk` STRING,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing.default.assist_codfil_ref IS 
'This table contains reference data related to coding standards. It records various attributes associated with codes, such as type, description, grouping, and risk classification. Possible use cases include generating reports on coding patterns, validating code usage, and tracking changes over time. The table also includes a timestamp for when the data was loaded.';

TRUNCATE TABLE landing.default.assist_codfil_ref;

INSERT INTO landing.default.assist_codfil_ref (
    `COD_COD`, `COD_TYP`, `COD_USD`, `COD_DES`, `COD_GR`, `COD_SIG`,
    `Cod_Risk`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('COD_COD_', lpad(CAST(idx AS STRING), 2, '0')) AS `COD_COD`,
    concat('COD_TYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `COD_TYP`,
    concat('COD_USD_', lpad(CAST(idx AS STRING), 2, '0')) AS `COD_USD`,
    concat('COD_DES_', lpad(CAST(idx AS STRING), 2, '0')) AS `COD_DES`,
    concat('COD_GR_', lpad(CAST(idx AS STRING), 2, '0')) AS `COD_GR`,
    concat('COD_SIG_', lpad(CAST(idx AS STRING), 2, '0')) AS `COD_SIG`,
    concat('COD_RISK_', lpad(CAST(idx AS STRING), 2, '0')) AS `Cod_Risk`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."ASSIST_CUSTOMER_ADDL_FIELDS"
CREATE TABLE IF NOT EXISTS landing.default.assist_customer_addl_fields (
    `cifno` STRING,
    `fullName` STRING,
    `firstName` STRING,
    `middleName` STRING,
    `lastName` STRING,
    `class` STRING,
    `officer_code` STRING,
    `cifGroupID` BIGINT,
    `cifGroupDesc` STRING,
    `residenceCountryCode` STRING,
    `residenceCountryDesc` STRING,
    `customerSince` STRING,
    `date_imported` STRING,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing.default.assist_customer_addl_fields IS 
'The table contains additional fields related to customer information. It includes data such as customer identification numbers, names, and the officer handling the account. It can be used for profiling customers, tracking customer relationships over time, and organizing customer data based on classifications and geographical details.';

TRUNCATE TABLE landing.default.assist_customer_addl_fields;

INSERT INTO landing.default.assist_customer_addl_fields (
    `cifno`, `fullName`, `firstName`, `middleName`, `lastName`, `class`,
    `officer_code`, `cifGroupID`, `cifGroupDesc`, `residenceCountryCode`, `residenceCountryDesc`, `customerSince`,
    `date_imported`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CIFNO_', lpad(CAST(idx AS STRING), 2, '0')) AS `cifno`,
    concat('FULLNAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `fullName`,
    concat('FIRSTNAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `firstName`,
    concat('MIDDLENAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `middleName`,
    concat('LASTNAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `lastName`,
    concat('CLASS_', lpad(CAST(idx AS STRING), 2, '0')) AS `class`,
    concat('OFFICER_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `officer_code`,
    idx AS `cifGroupID`,
    concat('CIFGROUPDESC_', lpad(CAST(idx AS STRING), 2, '0')) AS `cifGroupDesc`,
    concat('RESIDENCECOUNTRYCODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `residenceCountryCode`,
    concat('RESIDENCECOUNTRYDESC_', lpad(CAST(idx AS STRING), 2, '0')) AS `residenceCountryDesc`,
    concat('CUSTOMERSINCE_', lpad(CAST(idx AS STRING), 2, '0')) AS `customerSince`,
    concat('DATE_IMPORTED_', lpad(CAST(idx AS STRING), 2, '0')) AS `date_imported`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."ASSIST_CUSTOMER_CLASS"
CREATE TABLE IF NOT EXISTS landing.default.assist_customer_class (
    `class_code` STRING,
    `class_description` STRING,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing.default.assist_customer_class IS 
'The table contains classifications for customers, detailing the class code and its description along with the year and month of the data loading timestamp. This information can be useful for analyzing customer segments, tracking trends over time, and understanding the demographic distribution of customer classes.';

TRUNCATE TABLE landing.default.assist_customer_class;

INSERT INTO landing.default.assist_customer_class (
    `class_code`, `class_description`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CLASS_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `class_code`,
    concat('CLASS_DESCRIPTION_', lpad(CAST(idx AS STRING), 2, '0')) AS `class_description`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."ASSIST_CUSTOMER_TBL"
CREATE TABLE IF NOT EXISTS landing.default.assist_customer_tbl (
    `ASCIFN` BIGINT,
    `ASCUSTYP` STRING,
    `ASFNAM` STRING,
    `ASLNAM` STRING,
    `ASCODE` STRING,
    `ASIDTYP` STRING,
    `ASDTBIR` DATE,
    `ASSTRDAT` DATE,
    `ASOCCUP` STRING,
    `ASCNTNAT` STRING,
    `ASCNTDOM` STRING,
    `ASCFNA2` STRING,
    `ASCFNA3` STRING,
    `ASCITDOM` STRING,
    `ASSTADOM` STRING,
    `ASZIPDOM` STRING,
    `ASPHONE1` STRING,
    `ASPHONE2` STRING,
    `ASEMAIL` STRING,
    `ASPOLEXP` STRING,
    `ASRISK` STRING,
    `ASSRCWEA` STRING,
    `ASTARGTP` STRING,
    `ASENDDAT` DATE,
    `ASECOGRP` STRING,
    `IMPYM` STRING,
    `LMODDT` DATE,
    `IMPDT` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing.default.assist_customer_tbl IS 
'The table contains customer information relevant to the assistance department. It includes personal details such as name, date of birth, contact information, occupation, nationality, and other attributes related to the customers. This data can be useful for analyzing customer demographics, tracking customer trends, and managing communications with clients effectively.';

TRUNCATE TABLE landing.default.assist_customer_tbl;

INSERT INTO landing.default.assist_customer_tbl (
    `ASCIFN`, `ASCUSTYP`, `ASFNAM`, `ASLNAM`, `ASCODE`, `ASIDTYP`,
    `ASDTBIR`, `ASSTRDAT`, `ASOCCUP`, `ASCNTNAT`, `ASCNTDOM`, `ASCFNA2`,
    `ASCFNA3`, `ASCITDOM`, `ASSTADOM`, `ASZIPDOM`, `ASPHONE1`, `ASPHONE2`,
    `ASEMAIL`, `ASPOLEXP`, `ASRISK`, `ASSRCWEA`, `ASTARGTP`, `ASENDDAT`,
    `ASECOGRP`, `IMPYM`, `LMODDT`, `IMPDT`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    idx AS `ASCIFN`,
    concat('ASCUSTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCUSTYP`,
    concat('ASFNAM_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASFNAM`,
    concat('ASLNAM_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASLNAM`,
    concat('ASCODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCODE`,
    concat('ASIDTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASIDTYP`,
    date_add(DATE '2026-01-01', idx - 1) AS `ASDTBIR`,
    date_add(DATE '2026-01-01', idx - 1) AS `ASSTRDAT`,
    concat('ASOCCUP_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASOCCUP`,
    concat('ASCNTNAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCNTNAT`,
    concat('ASCNTDOM_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCNTDOM`,
    concat('ASCFNA2_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCFNA2`,
    concat('ASCFNA3_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCFNA3`,
    concat('ASCITDOM_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCITDOM`,
    concat('ASSTADOM_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASSTADOM`,
    concat('ASZIPDOM_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASZIPDOM`,
    concat('ASPHONE1_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASPHONE1`,
    concat('ASPHONE2_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASPHONE2`,
    concat('ASEMAIL_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASEMAIL`,
    concat('ASPOLEXP_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASPOLEXP`,
    concat('ASRISK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASRISK`,
    concat('ASSRCWEA_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASSRCWEA`,
    concat('ASTARGTP_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTARGTP`,
    date_add(DATE '2026-01-01', idx - 1) AS `ASENDDAT`,
    concat('ASECOGRP_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASECOGRP`,
    concat('IMPYM_', lpad(CAST(idx AS STRING), 2, '0')) AS `IMPYM`,
    date_add(DATE '2026-01-01', idx - 1) AS `LMODDT`,
    date_add(DATE '2026-01-01', idx - 1) AS `IMPDT`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."ASSIST_MASTER_ACCOUNT_TBL"
CREATE TABLE IF NOT EXISTS landing.default.assist_master_account_tbl (
    `ASACCT` BIGINT,
    `ASOFDT` DATE,
    `ASCIFN` BIGINT,
    `ASBRNC` STRING,
    `ASCURC` STRING,
    `ASOFFI` STRING,
    `ASCTYR` STRING,
    `ASCLAS` STRING,
    `ASDAOP` STRING,
    `ASDACL` STRING,
    `ASCODE` STRING,
    `ASTYPE` STRING,
    `ASBUST` STRING,
    `ASTARGTP` STRING,
    `ASCMCI` STRING,
    `ASCMCO` STRING,
    `ASBALA` DECIMAL(38,10),
    `ASFNAME` STRING,
    `ASLNAME` STRING,
    `ASCTYP` STRING,
    `ASSTAT` STRING,
    `ASABLK` STRING,
    `ASCTYL` STRING,
    `IMPYM` STRING,
    `IMPDT` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing.default.assist_master_account_tbl IS 
'The table contains information related to master accounts and their associated details. It includes historical data about account statuses, classifications, balances, and customer information. Use cases include monitoring account performance over time, analyzing customer demographics, and tracking account changes. This data can help in understanding account characteristics and trends.';

TRUNCATE TABLE landing.default.assist_master_account_tbl;

INSERT INTO landing.default.assist_master_account_tbl (
    `ASACCT`, `ASOFDT`, `ASCIFN`, `ASBRNC`, `ASCURC`, `ASOFFI`,
    `ASCTYR`, `ASCLAS`, `ASDAOP`, `ASDACL`, `ASCODE`, `ASTYPE`,
    `ASBUST`, `ASTARGTP`, `ASCMCI`, `ASCMCO`, `ASBALA`, `ASFNAME`,
    `ASLNAME`, `ASCTYP`, `ASSTAT`, `ASABLK`, `ASCTYL`, `IMPYM`,
    `IMPDT`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    idx AS `ASACCT`,
    date_add(DATE '2026-01-01', idx - 1) AS `ASOFDT`,
    idx AS `ASCIFN`,
    concat('ASBRNC_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASBRNC`,
    concat('ASCURC_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCURC`,
    concat('ASOFFI_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASOFFI`,
    concat('ASCTYR_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCTYR`,
    concat('ASCLAS_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCLAS`,
    concat('ASDAOP_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASDAOP`,
    concat('ASDACL_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASDACL`,
    concat('ASCODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCODE`,
    concat('ASTYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTYPE`,
    concat('ASBUST_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASBUST`,
    concat('ASTARGTP_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTARGTP`,
    concat('ASCMCI_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCMCI`,
    concat('ASCMCO_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCMCO`,
    CAST(idx * 100.25 AS DECIMAL(38,10)) AS `ASBALA`,
    concat('ASFNAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASFNAME`,
    concat('ASLNAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASLNAME`,
    concat('ASCTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCTYP`,
    concat('ASSTAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASSTAT`,
    concat('ASABLK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASABLK`,
    concat('ASCTYL_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCTYL`,
    concat('IMPYM_', lpad(CAST(idx AS STRING), 2, '0')) AS `IMPYM`,
    date_add(DATE '2026-01-01', idx - 1) AS `IMPDT`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."ASSIST_OFFICERS_COSTCENTER"
CREATE TABLE IF NOT EXISTS landing.default.assist_officers_costcenter (
    `officer_code` STRING,
    `first_name` STRING,
    `last_name` STRING,
    `cost_center` STRING,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing.default.assist_officers_costcenter IS 
'The table contains information about officers and their associated cost centers. It includes details such as the officer s code, first and last names, the cost center they are linked to, and the period for which the data is relevant. This data can be utilized for tracking costs by individual officers, managing budgets, and analyzing resource allocation within various cost centers over time';

TRUNCATE TABLE landing.default.assist_officers_costcenter;

INSERT INTO landing.default.assist_officers_costcenter (
    `officer_code`, `first_name`, `last_name`, `cost_center`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('OFFICER_CODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `officer_code`,
    concat('FIRST_NAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `first_name`,
    concat('LAST_NAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `last_name`,
    concat('COST_CENTER_', lpad(CAST(idx AS STRING), 2, '0')) AS `cost_center`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."ASSIST_TRANSACTION_TBL"
CREATE TABLE IF NOT EXISTS landing.default.assist_transaction_tbl (
    `TRID` BIGINT,
    `ASTRCD` STRING,
    `ASAMTB` DECIMAL(38,10),
    `ASTRDA` DATE,
    `ASACCT` BIGINT,
    `ASDESC` STRING,
    `ASAMTO` DECIMAL(38,10),
    `ASCURC` STRING,
    `ASAPCO` STRING,
    `ASTIME` STRING,
    `ASORGI` STRING,
    `ASTOBK` STRING,
    `ASTIBK` STRING,
    `ASTBBK` STRING,
    `ASBENE` STRING,
    `ASTRCO` STRING,
    `ASORDE` STRING,
    `ASTRDE` STRING,
    `ASTVDA` DATE,
    `ASTBNK` STRING,
    `ASIBAN` STRING,
    `ASCNTR` STRING,
    `IMPYM` STRING,
    `IMPDT` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing.default.assist_transaction_tbl IS 
'The table contains transaction records related to various assist operations. It includes details such as transaction IDs, account information, amounts involved, currency types, and timestamps. This data can be used for financial analysis, tracking transaction flows, and auditing purposes, as well as understanding trends in transaction activities over time.';

TRUNCATE TABLE landing.default.assist_transaction_tbl;

INSERT INTO landing.default.assist_transaction_tbl (
    `TRID`, `ASTRCD`, `ASAMTB`, `ASTRDA`, `ASACCT`, `ASDESC`,
    `ASAMTO`, `ASCURC`, `ASAPCO`, `ASTIME`, `ASORGI`, `ASTOBK`,
    `ASTIBK`, `ASTBBK`, `ASBENE`, `ASTRCO`, `ASORDE`, `ASTRDE`,
    `ASTVDA`, `ASTBNK`, `ASIBAN`, `ASCNTR`, `IMPYM`, `IMPDT`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    idx AS `TRID`,
    concat('ASTRCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTRCD`,
    CAST(idx * 100.25 AS DECIMAL(38,10)) AS `ASAMTB`,
    date_add(DATE '2026-01-01', idx - 1) AS `ASTRDA`,
    idx AS `ASACCT`,
    concat('ASDESC_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASDESC`,
    CAST(idx * 100.25 AS DECIMAL(38,10)) AS `ASAMTO`,
    concat('ASCURC_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCURC`,
    concat('ASAPCO_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASAPCO`,
    concat('ASTIME_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTIME`,
    concat('ASORGI_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASORGI`,
    concat('ASTOBK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTOBK`,
    concat('ASTIBK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTIBK`,
    concat('ASTBBK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTBBK`,
    concat('ASBENE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASBENE`,
    concat('ASTRCO_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTRCO`,
    concat('ASORDE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASORDE`,
    concat('ASTRDE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTRDE`,
    date_add(DATE '2026-01-01', idx - 1) AS `ASTVDA`,
    concat('ASTBNK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASTBNK`,
    concat('ASIBAN_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASIBAN`,
    concat('ASCNTR_', lpad(CAST(idx AS STRING), 2, '0')) AS `ASCNTR`,
    concat('IMPYM_', lpad(CAST(idx AS STRING), 2, '0')) AS `IMPYM`,
    date_add(DATE '2026-01-01', idx - 1) AS `IMPDT`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

SELECT 'assist_codfil_ref' AS table_name, COUNT(*) AS record_count
FROM landing.default.assist_codfil_ref
UNION ALL
SELECT 'assist_customer_addl_fields' AS table_name, COUNT(*) AS record_count
FROM landing.default.assist_customer_addl_fields
UNION ALL
SELECT 'assist_customer_class' AS table_name, COUNT(*) AS record_count
FROM landing.default.assist_customer_class
UNION ALL
SELECT 'assist_customer_tbl' AS table_name, COUNT(*) AS record_count
FROM landing.default.assist_customer_tbl
UNION ALL
SELECT 'assist_master_account_tbl' AS table_name, COUNT(*) AS record_count
FROM landing.default.assist_master_account_tbl
UNION ALL
SELECT 'assist_officers_costcenter' AS table_name, COUNT(*) AS record_count
FROM landing.default.assist_officers_costcenter
UNION ALL
SELECT 'assist_transaction_tbl' AS table_name, COUNT(*) AS record_count
FROM landing.default.assist_transaction_tbl;
