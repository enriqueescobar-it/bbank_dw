-- NAME: BRONZE_MULESOFT_CUSTOMER_EXTERNAL_ID
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: Daily
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: November 08, 2024




WITH cte_bronze_mulesoft_customer_external_id as (
SELECT
	 id
	,CONVERT(VARCHAR(MAX),uuid) AS uuid
	,tenant_id
	,customer_id
	,[type]
	,source_system
	,external_id
	,sys_created_by
	,sys_created_at_ts
	,sys_last_modify_by
	,sys_last_modify_at_ts
	,CONVERT(INT,CONVERT(VARCHAR(6),GETDATE(),112)) AS yearmonth
	,loaded_at
FROM "DQP_LANDING"."dbo"."MULESOFT_CUSTOMER_EXTERNAL_ID"
),

cte_bronze_data as (
    SELECT
	 id
	,uuid
	,tenant_id
	,customer_id
	,[type]
	,source_system
	,external_id
	,sys_created_by
	,sys_created_at_ts
	,sys_last_modify_by
	,sys_last_modify_at_ts
	,yearmonth
	,GETUTCDATE() AS LOADED_AT
    FROM cte_bronze_mulesoft_customer_external_id
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_mulesoft_customer_external_id"),'1970-01-01 00:00:00.000')
    

)





select * from cte_bronze_data



-- NAME: BRONZE_MULESOFT_PARTY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: Daily
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: November 08, 2024




WITH cte_bronze_mulesoft_customer_external_id as (
SELECT
	 id
	,CONVERT(VARCHAR(MAX),uuid) AS uuid
	,tenant_id
	,primary_id_type
	,primary_id_country
	,primary_id_number
	,sys_created_by
	,sys_created_at_ts
	,sys_last_modify_by
	,sys_last_modify_at_ts
	,CONVERT(INT,CONVERT(VARCHAR(6),GETDATE(),112)) AS yearmonth
	,loaded_at
FROM "DQP_LANDING"."dbo"."MULESOFT_PARTY"
),

cte_bronze_data as (
	SELECT
		 id
		,uuid
		,tenant_id
		,primary_id_type
		,primary_id_country
		,primary_id_number
		,sys_created_by
		,sys_created_at_ts
		,sys_last_modify_by
		,sys_last_modify_at_ts
		,yearmonth
		,GETUTCDATE() LOADED_AT
	FROM cte_bronze_mulesoft_customer_external_id
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_mulesoft_party"),'1970-01-01 00:00:00.000')
    

)





select * from cte_bronze_data



-- NAME: MULESOFT_PROSPECT_EXTERNAL_DATA
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: Daily
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: November 08, 2024




WITH cte_bronze_mulesoft_prospect_external_data AS (
SELECT
	 id
	,external_id
	,primary_id_type
	,primary_id_country
	,primary_id_number
	,full_name
	,email
	,phone_country_code
	,phone_area_code
	,phone_number
	,phone_number_e164
	,fiscal_residence_country
	,communication_optin
	,birthdate
	,gender
	,nationality
	,mothers_name
	,source_account_branch_number
	,source_account_number
	,source_account_institution_id
	,source_account_veracity_declaration_confirmed
	,personal_document_type
	,personal_document_number
	,residential_address_country
	,residential_address_state
	,residential_address_city
	,residential_address_street_name
	,residential_address_neighborhood
	,residential_address_building_number
	,residential_address_additional_information
	,residential_address_postal_code
	,residential_paperless_optin
	,mail_address_country
	,mail_address_state
	,mail_address_city
	,mail_address_street_name
	,mail_address_neighborhood
	,mail_address_building_number
	,mail_address_additional_information
	,mail_address_postal_code
	,mail_paperless_optin
	,income_information_annual_amount
	,employer_information_address_state
	,employer_information_address_city
	,employer_information_address_country
	,employer_information_address_street_name
	,employer_information_address_neighborhood
	,employer_information_address_building_number
	,employer_information_address_additional_information
	,employer_information_address_postal_code
	,income_information_assets_value
	,income_information_initial_investment_plan
	,information_pep_status
	,information_pep_position_of_person
	,information_pep_date_of_service
	,information_pep_country_operation
	,account_usage_intentions
	,employer_information_sector
	,employer_information_working_time_at_company
	,occupation
	,employer_information_name
	,sys_created_by
	,sys_created_at_ts
	,sys_last_modify_by
	,sys_last_modify_at_ts
	,source_account_primary_owner
	,market_segment
	,market_sub_segment
	,screening_restriction_codes
	,personal_document_expiry_date
	,employer_information_source_of_income
	,employer_information_source_of_income_other
	,employer_information_position
	,personal_document_issued_date
	,CONVERT(INT,CONVERT(VARCHAR(6),GETDATE(),112)) AS yearmonth
	,loaded_at
	FROM "DQP_LANDING"."dbo"."MULESOFT_PROSPECT_EXTERNAL_DATA"
),

cte_bronze_data as (
    SELECT
	 id
	,external_id
	,primary_id_type
	,primary_id_country
	,primary_id_number
	,full_name
	,email
	,phone_country_code
	,phone_area_code
	,phone_number
	,phone_number_e164
	,fiscal_residence_country
	,communication_optin
	,birthdate
	,gender
	,nationality
	,mothers_name
	,source_account_branch_number
	,source_account_number
	,source_account_institution_id
	,source_account_veracity_declaration_confirmed
	,personal_document_type
	,personal_document_number
	,residential_address_country
	,residential_address_state
	,residential_address_city
	,residential_address_street_name
	,residential_address_neighborhood
	,residential_address_building_number
	,residential_address_additional_information
	,residential_address_postal_code
	,residential_paperless_optin
	,mail_address_country
	,mail_address_state
	,mail_address_city
	,mail_address_street_name
	,mail_address_neighborhood
	,mail_address_building_number
	,mail_address_additional_information
	,mail_address_postal_code
	,mail_paperless_optin
	,income_information_annual_amount
	,employer_information_address_state
	,employer_information_address_city
	,employer_information_address_country
	,employer_information_address_street_name
	,employer_information_address_neighborhood
	,employer_information_address_building_number
	,employer_information_address_additional_information
	,employer_information_address_postal_code
	,income_information_assets_value
	,income_information_initial_investment_plan
	,information_pep_status
	,information_pep_position_of_person
	,information_pep_date_of_service
	,information_pep_country_operation
	,account_usage_intentions
	,employer_information_sector
	,employer_information_working_time_at_company
	,occupation
	,employer_information_name
	,sys_created_by
	,sys_created_at_ts
	,sys_last_modify_by
	,sys_last_modify_at_ts
	,source_account_primary_owner
	,market_segment
	,market_sub_segment
	,screening_restriction_codes
	,personal_document_expiry_date
	,employer_information_source_of_income
	,employer_information_source_of_income_other
	,employer_information_position
	,personal_document_issued_date
	,yearmonth
	,getdate()	as loaded_at
    FROM cte_bronze_mulesoft_prospect_external_data
	
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_mulesoft_prospect_external_data"),'1970-01-01 00:00:00.000')
    

)





select * from cte_bronze_data



-- NAME: MULESOFT_PROSPECT_EXTERNAL_DATA
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: Daily
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: November 08, 2024




WITH cte_bronze_mulesoft_prospect_external_data AS (
SELECT
	 id
	,external_id
	,primary_id_type
	,primary_id_country
	,primary_id_number
	,full_name
	,email
	,phone_country_code
	,phone_area_code
	,phone_number
	,phone_number_e164
	,fiscal_residence_country
	,communication_optin
	,birthdate
	,gender
	,nationality
	,mothers_name
	,source_account_branch_number
	,source_account_number
	,source_account_institution_id
	,source_account_veracity_declaration_confirmed
	,personal_document_type
	,personal_document_number
	,residential_address_country
	,residential_address_state
	,residential_address_city
	,residential_address_street_name
	,residential_address_neighborhood
	,residential_address_building_number
	,residential_address_additional_information
	,residential_address_postal_code
	,residential_paperless_optin
	,mail_address_country
	,mail_address_state
	,mail_address_city
	,mail_address_street_name
	,mail_address_neighborhood
	,mail_address_building_number
	,mail_address_additional_information
	,mail_address_postal_code
	,mail_paperless_optin
	,income_information_annual_amount
	,employer_information_address_state
	,employer_information_address_city
	,employer_information_address_country
	,employer_information_address_street_name
	,employer_information_address_neighborhood
	,employer_information_address_building_number
	,employer_information_address_additional_information
	,employer_information_address_postal_code
	,income_information_assets_value
	,income_information_initial_investment_plan
	,information_pep_status
	,information_pep_position_of_person
	,information_pep_date_of_service
	,information_pep_country_operation
	,account_usage_intentions
	,employer_information_sector
	,employer_information_working_time_at_company
	,occupation
	,employer_information_name
	,sys_created_by
	,sys_created_at_ts
	,sys_last_modify_by
	,sys_last_modify_at_ts
	,source_account_primary_owner
	,market_segment
	,market_sub_segment
	,screening_restriction_codes
	,personal_document_expiry_date
	,employer_information_source_of_income
	,employer_information_source_of_income_other
	,employer_information_position
	,personal_document_issued_date
	,CONVERT(INT,CONVERT(VARCHAR(6),GETDATE(),112)) AS yearmonth
	,loaded_at
	FROM "DQP_LANDING"."dbo"."MULESOFT_PROSPECT_EXTERNAL_DATA"
),

cte_bronze_data as (
    SELECT
	 id
	,external_id
	,primary_id_type
	,primary_id_country
	,primary_id_number
	,full_name
	,email
	,phone_country_code
	,phone_area_code
	,phone_number
	,phone_number_e164
	,fiscal_residence_country
	,communication_optin
	,birthdate
	,gender
	,nationality
	,mothers_name
	,source_account_branch_number
	,source_account_number
	,source_account_institution_id
	,source_account_veracity_declaration_confirmed
	,personal_document_type
	,personal_document_number
	,residential_address_country
	,residential_address_state
	,residential_address_city
	,residential_address_street_name
	,residential_address_neighborhood
	,residential_address_building_number
	,residential_address_additional_information
	,residential_address_postal_code
	,residential_paperless_optin
	,mail_address_country
	,mail_address_state
	,mail_address_city
	,mail_address_street_name
	,mail_address_neighborhood
	,mail_address_building_number
	,mail_address_additional_information
	,mail_address_postal_code
	,mail_paperless_optin
	,income_information_annual_amount
	,employer_information_address_state
	,employer_information_address_city
	,employer_information_address_country
	,employer_information_address_street_name
	,employer_information_address_neighborhood
	,employer_information_address_building_number
	,employer_information_address_additional_information
	,employer_information_address_postal_code
	,income_information_assets_value
	,income_information_initial_investment_plan
	,information_pep_status
	,information_pep_position_of_person
	,information_pep_date_of_service
	,information_pep_country_operation
	,account_usage_intentions
	,employer_information_sector
	,employer_information_working_time_at_company
	,occupation
	,employer_information_name
	,sys_created_by
	,sys_created_at_ts
	,sys_last_modify_by
	,sys_last_modify_at_ts
	,source_account_primary_owner
	,market_segment
	,market_sub_segment
	,screening_restriction_codes
	,personal_document_expiry_date
	,employer_information_source_of_income
	,employer_information_source_of_income_other
	,employer_information_position
	,personal_document_issued_date
	,yearmonth
	,getdate()	as loaded_at
    FROM cte_bronze_mulesoft_prospect_external_data
	
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_mulesoft_prospect_external_data"),'1970-01-01 00:00:00.000')
    

)





select * from cte_bronze_data



