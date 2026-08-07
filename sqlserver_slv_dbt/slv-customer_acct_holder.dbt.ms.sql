-- NAME: SILVER_CUSTOMER_ACCT_HOLDER
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: June 28, 2024

{{
   config(
          tags=["ibkr_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        id
        ,acct_id
        ,account_relation
        ,email
        ,fname
        ,lname
        ,gender
        ,dob
        ,marital_status
        ,phone_number
        ,address_line
        ,[state]
        ,city
        ,country
        ,zip_code
        ,citizenship
        ,country_of_birth
        ,employer_business
        ,employer_company
        ,employer_primary_address_line
        ,employer_city
        ,employer_state_province
        ,employer_zip_code
        ,employer_country
        ,employment_position
        ,employment_status
        ,annual_incomes
        ,networth_liquid
        ,networth_total
        ,investment_experiences
        ,withdraw
        ,concerned
        ,stock_market
        ,investment_objetives
        ,politically_exposed
        ,foreign_tax_id
        ,id_number
        ,ewf_processed
        ,cif
        ,iban_number
        ,receive_offers
        ,monthly_housing_payments
        ,other_monthly_expenses
        ,eligibility_date
        ,ack_signed_when
        ,id_type
        ,id_expiration_date
        ,account_type
        ,account_status
        ,ownership_type
        ,advisor
        ,[language]
        ,dependents
        ,ack_signed_by
        ,affiliation
        ,affiliation_name
        ,affiliation_relationship
        ,affiliation_company
        ,affiliation_address
        ,affiliation_country
        ,affiliation_state
        ,affiliation_city
        ,affiliation_postal_code
        ,litigation
        ,litigation_details
        ,exchangemembership
        ,membership_exchanges
        ,membership_organizations
        ,investigation
        ,investigation_details
        ,regulatory_control
        ,regulatory_control_details
        ,customer_agent_group
        ,customer_agent_group_id
        ,emplcountry_rescountry_details
        ,initial_deposit_informed
        ,client_documents
        ,ack_tax_id_when
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_bcp_ibkr_acct_holder') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data