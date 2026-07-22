-- Databricks SQL for source: mulesoft
-- Generated from sqlserver/brz-mulesoft.sql

CREATE CATALOG IF NOT EXISTS mulesoft;
USE CATALOG mulesoft;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."MULESOFT_CUSTOMER_EXTERNAL_ID"
CREATE TABLE IF NOT EXISTS mulesoft.default.mulesoft_customer_external_id (
    id BIGINT,
    uuid STRING,
    tenant_id STRING,
    customer_id STRING,
    `type` STRING,
    source_system STRING,
    external_id STRING,
    sys_created_by STRING,
    sys_created_at_ts TIMESTAMP,
    sys_last_modify_by STRING,
    sys_last_modify_at_ts TIMESTAMP,
    yearmonth INT,
    loaded_at TIMESTAMP
);

TRUNCATE TABLE mulesoft.default.mulesoft_customer_external_id;

INSERT INTO mulesoft.default.mulesoft_customer_external_id (
    id, uuid, tenant_id, customer_id, `type`, source_system, external_id,
    sys_created_by, sys_created_at_ts, sys_last_modify_by,
    sys_last_modify_at_ts, yearmonth, loaded_at
)
SELECT
    idx AS id,
    concat('00000000-0000-4000-8000-', lpad(CAST(idx AS STRING), 12, '0')) AS uuid,
    concat('tenant_', lpad(CAST(idx AS STRING), 2, '0')) AS tenant_id,
    concat('customer_', lpad(CAST(idx AS STRING), 6, '0')) AS customer_id,
    CASE WHEN idx % 2 = 0 THEN 'CIF' ELSE 'PARTY' END AS `type`,
    CASE WHEN idx % 2 = 0 THEN 'core' ELSE 'digital' END AS source_system,
    concat('EXT-', lpad(CAST(idx AS STRING), 6, '0')) AS external_id,
    'seed_user' AS sys_created_by,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 09:00:00') AS sys_created_at_ts,
    'seed_user' AS sys_last_modify_by,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 10:00:00') AS sys_last_modify_at_ts,
    202601 AS yearmonth,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS loaded_at
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."MULESOFT_PARTY"
CREATE TABLE IF NOT EXISTS mulesoft.default.mulesoft_party (
    id BIGINT,
    uuid STRING,
    tenant_id STRING,
    primary_id_type STRING,
    primary_id_country STRING,
    primary_id_number STRING,
    sys_created_by STRING,
    sys_created_at_ts TIMESTAMP,
    sys_last_modify_by STRING,
    sys_last_modify_at_ts TIMESTAMP,
    yearmonth INT,
    loaded_at TIMESTAMP
);

TRUNCATE TABLE mulesoft.default.mulesoft_party;

INSERT INTO mulesoft.default.mulesoft_party (
    id, uuid, tenant_id, primary_id_type, primary_id_country,
    primary_id_number, sys_created_by, sys_created_at_ts,
    sys_last_modify_by, sys_last_modify_at_ts, yearmonth, loaded_at
)
SELECT
    idx AS id,
    concat('10000000-0000-4000-8000-', lpad(CAST(idx AS STRING), 12, '0')) AS uuid,
    concat('tenant_', lpad(CAST(idx AS STRING), 2, '0')) AS tenant_id,
    CASE WHEN idx % 2 = 0 THEN 'EIN' ELSE 'SSN' END AS primary_id_type,
    'US' AS primary_id_country,
    concat('900-10-', lpad(CAST(idx AS STRING), 4, '0')) AS primary_id_number,
    'seed_user' AS sys_created_by,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 09:00:00') AS sys_created_at_ts,
    'seed_user' AS sys_last_modify_by,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 10:00:00') AS sys_last_modify_at_ts,
    202601 AS yearmonth,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS loaded_at
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Source: "DQP_LANDING"."dbo"."MULESOFT_PROSPECT_EXTERNAL_DATA"
CREATE TABLE IF NOT EXISTS mulesoft.default.mulesoft_prospect_external_data (
    id BIGINT,
    external_id STRING,
    primary_id_type STRING,
    primary_id_country STRING,
    primary_id_number STRING,
    full_name STRING,
    email STRING,
    phone_country_code STRING,
    phone_area_code STRING,
    phone_number STRING,
    phone_number_e164 STRING,
    fiscal_residence_country STRING,
    communication_optin STRING,
    birthdate DATE,
    gender STRING,
    nationality STRING,
    mothers_name STRING,
    source_account_branch_number STRING,
    source_account_number STRING,
    source_account_institution_id STRING,
    source_account_veracity_declaration_confirmed STRING,
    personal_document_type STRING,
    personal_document_number STRING,
    residential_address_country STRING,
    residential_address_state STRING,
    residential_address_city STRING,
    residential_address_street_name STRING,
    residential_address_neighborhood STRING,
    residential_address_building_number STRING,
    residential_address_additional_information STRING,
    residential_address_postal_code STRING,
    residential_paperless_optin STRING,
    mail_address_country STRING,
    mail_address_state STRING,
    mail_address_city STRING,
    mail_address_street_name STRING,
    mail_address_neighborhood STRING,
    mail_address_building_number STRING,
    mail_address_additional_information STRING,
    mail_address_postal_code STRING,
    mail_paperless_optin STRING,
    income_information_annual_amount DECIMAL(18,2),
    employer_information_address_state STRING,
    employer_information_address_city STRING,
    employer_information_address_country STRING,
    employer_information_address_street_name STRING,
    employer_information_address_neighborhood STRING,
    employer_information_address_building_number STRING,
    employer_information_address_additional_information STRING,
    employer_information_address_postal_code STRING,
    income_information_assets_value DECIMAL(18,2),
    income_information_initial_investment_plan DECIMAL(18,2),
    information_pep_status STRING,
    information_pep_position_of_person STRING,
    information_pep_date_of_service DATE,
    information_pep_country_operation STRING,
    account_usage_intentions STRING,
    employer_information_sector STRING,
    employer_information_working_time_at_company STRING,
    occupation STRING,
    employer_information_name STRING,
    sys_created_by STRING,
    sys_created_at_ts TIMESTAMP,
    sys_last_modify_by STRING,
    sys_last_modify_at_ts TIMESTAMP,
    source_account_primary_owner STRING,
    market_segment STRING,
    market_sub_segment STRING,
    screening_restriction_codes STRING,
    personal_document_expiry_date DATE,
    employer_information_source_of_income STRING,
    employer_information_source_of_income_other STRING,
    employer_information_position STRING,
    personal_document_issued_date DATE,
    yearmonth INT,
    loaded_at TIMESTAMP
);

TRUNCATE TABLE mulesoft.default.mulesoft_prospect_external_data;

INSERT INTO mulesoft.default.mulesoft_prospect_external_data (
    id, external_id, primary_id_type, primary_id_country, primary_id_number,
    full_name, email, phone_country_code, phone_area_code, phone_number,
    phone_number_e164, fiscal_residence_country, communication_optin,
    birthdate, gender, nationality, mothers_name, source_account_branch_number,
    source_account_number, source_account_institution_id,
    source_account_veracity_declaration_confirmed, personal_document_type,
    personal_document_number, residential_address_country,
    residential_address_state, residential_address_city,
    residential_address_street_name, residential_address_neighborhood,
    residential_address_building_number, residential_address_additional_information,
    residential_address_postal_code, residential_paperless_optin,
    mail_address_country, mail_address_state, mail_address_city,
    mail_address_street_name, mail_address_neighborhood,
    mail_address_building_number, mail_address_additional_information,
    mail_address_postal_code, mail_paperless_optin, income_information_annual_amount,
    employer_information_address_state, employer_information_address_city,
    employer_information_address_country, employer_information_address_street_name,
    employer_information_address_neighborhood, employer_information_address_building_number,
    employer_information_address_additional_information, employer_information_address_postal_code,
    income_information_assets_value, income_information_initial_investment_plan,
    information_pep_status, information_pep_position_of_person,
    information_pep_date_of_service, information_pep_country_operation,
    account_usage_intentions, employer_information_sector,
    employer_information_working_time_at_company, occupation, employer_information_name,
    sys_created_by, sys_created_at_ts, sys_last_modify_by, sys_last_modify_at_ts,
    source_account_primary_owner, market_segment, market_sub_segment,
    screening_restriction_codes, personal_document_expiry_date,
    employer_information_source_of_income, employer_information_source_of_income_other,
    employer_information_position, personal_document_issued_date, yearmonth, loaded_at
)
SELECT
    idx AS id,
    concat('PROSPECT-', lpad(CAST(idx AS STRING), 6, '0')) AS external_id,
    'SSN' AS primary_id_type,
    'US' AS primary_id_country,
    concat('222-33-', lpad(CAST(idx AS STRING), 4, '0')) AS primary_id_number,
    concat('Prospect Customer ', CAST(idx AS STRING)) AS full_name,
    concat('prospect', CAST(idx AS STRING), '@example.com') AS email,
    '1' AS phone_country_code,
    '305' AS phone_area_code,
    concat('555', lpad(CAST(idx AS STRING), 4, '0')) AS phone_number,
    concat('+1305555', lpad(CAST(idx AS STRING), 4, '0')) AS phone_number_e164,
    'US' AS fiscal_residence_country,
    CASE WHEN idx % 2 = 0 THEN 'Y' ELSE 'N' END AS communication_optin,
    date_add(DATE '1985-01-01', idx * 30) AS birthdate,
    CASE WHEN idx % 2 = 0 THEN 'F' ELSE 'M' END AS gender,
    'US' AS nationality,
    concat('Mother ', CAST(idx AS STRING)) AS mothers_name,
    lpad(CAST(100 + idx AS STRING), 3, '0') AS source_account_branch_number,
    concat('700000', lpad(CAST(idx AS STRING), 4, '0')) AS source_account_number,
    'BBANK' AS source_account_institution_id,
    'Y' AS source_account_veracity_declaration_confirmed,
    'DL' AS personal_document_type,
    concat('D', lpad(CAST(idx AS STRING), 8, '0')) AS personal_document_number,
    'US' AS residential_address_country,
    'FL' AS residential_address_state,
    'Miami' AS residential_address_city,
    concat(CAST(100 + idx AS STRING), ' Brickell Ave') AS residential_address_street_name,
    'Downtown' AS residential_address_neighborhood,
    CAST(100 + idx AS STRING) AS residential_address_building_number,
    concat('Apt ', CAST(idx AS STRING)) AS residential_address_additional_information,
    '33131' AS residential_address_postal_code,
    CASE WHEN idx % 2 = 0 THEN 'Y' ELSE 'N' END AS residential_paperless_optin,
    'US' AS mail_address_country,
    'FL' AS mail_address_state,
    'Miami' AS mail_address_city,
    concat(CAST(200 + idx AS STRING), ' Biscayne Blvd') AS mail_address_street_name,
    'Financial District' AS mail_address_neighborhood,
    CAST(200 + idx AS STRING) AS mail_address_building_number,
    concat('Mailbox ', CAST(idx AS STRING)) AS mail_address_additional_information,
    '33132' AS mail_address_postal_code,
    CASE WHEN idx % 2 = 0 THEN 'Y' ELSE 'N' END AS mail_paperless_optin,
    CAST(75000 + (idx * 5000) AS DECIMAL(18,2)) AS income_information_annual_amount,
    'FL' AS employer_information_address_state,
    'Miami' AS employer_information_address_city,
    'US' AS employer_information_address_country,
    concat(CAST(300 + idx AS STRING), ' Commerce St') AS employer_information_address_street_name,
    'Business District' AS employer_information_address_neighborhood,
    CAST(300 + idx AS STRING) AS employer_information_address_building_number,
    concat('Floor ', CAST(idx AS STRING)) AS employer_information_address_additional_information,
    '33130' AS employer_information_address_postal_code,
    CAST(150000 + (idx * 10000) AS DECIMAL(18,2)) AS income_information_assets_value,
    CAST(25000 + (idx * 2500) AS DECIMAL(18,2)) AS income_information_initial_investment_plan,
    CASE WHEN idx = 10 THEN 'Y' ELSE 'N' END AS information_pep_status,
    CASE WHEN idx = 10 THEN 'Council Member' ELSE NULL END AS information_pep_position_of_person,
    CASE WHEN idx = 10 THEN DATE '2020-01-01' ELSE NULL END AS information_pep_date_of_service,
    CASE WHEN idx = 10 THEN 'US' ELSE NULL END AS information_pep_country_operation,
    'Savings and payments' AS account_usage_intentions,
    CASE WHEN idx % 2 = 0 THEN 'Technology' ELSE 'Professional Services' END AS employer_information_sector,
    concat(CAST(idx AS STRING), ' years') AS employer_information_working_time_at_company,
    CASE WHEN idx % 2 = 0 THEN 'Manager' ELSE 'Analyst' END AS occupation,
    concat('Employer ', CAST(idx AS STRING)) AS employer_information_name,
    'seed_user' AS sys_created_by,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 09:00:00') AS sys_created_at_ts,
    'seed_user' AS sys_last_modify_by,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 10:00:00') AS sys_last_modify_at_ts,
    CASE WHEN idx % 2 = 0 THEN 'Y' ELSE 'N' END AS source_account_primary_owner,
    'Retail' AS market_segment,
    CASE WHEN idx % 2 = 0 THEN 'Affluent' ELSE 'Mass Market' END AS market_sub_segment,
    CASE WHEN idx = 9 THEN 'REVIEW' ELSE NULL END AS screening_restriction_codes,
    date_add(DATE '2030-01-01', idx * 10) AS personal_document_expiry_date,
    'Employment' AS employer_information_source_of_income,
    NULL AS employer_information_source_of_income_other,
    CASE WHEN idx % 2 = 0 THEN 'Director' ELSE 'Associate' END AS employer_information_position,
    date_add(DATE '2020-01-01', idx * 10) AS personal_document_issued_date,
    202601 AS yearmonth,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS loaded_at
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

SELECT 'mulesoft_customer_external_id' AS table_name, COUNT(*) AS record_count
FROM mulesoft.default.mulesoft_customer_external_id
UNION ALL
SELECT 'mulesoft_party' AS table_name, COUNT(*) AS record_count
FROM mulesoft.default.mulesoft_party
UNION ALL
SELECT 'mulesoft_prospect_external_data' AS table_name, COUNT(*) AS record_count
FROM mulesoft.default.mulesoft_prospect_external_data;
