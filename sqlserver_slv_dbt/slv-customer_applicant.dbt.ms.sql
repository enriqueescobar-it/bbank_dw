-- NAME: SILVER_CUSTOMER_APPLICANT
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: June 28, 2024

{{
   config(
          tags=["cos_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        applicant_id
        ,applicant_index
        ,CPF
        ,app_ref
        ,first_nm
        ,last_nm
        ,middle_nm
        ,add1
        ,add2
        ,city_state_zip
        ,home_ph
        ,mobile_ph
        ,long_hm_ph
        ,long_bus_ph
        ,email
        ,occupation
        ,gender
        ,bbd_id
        ,bus_ph
        ,bus_ph_ext
        ,applicant_cust1
        ,applicant_cust2
        ,applicant_cust3
        ,applicant_cust4
        ,applicant_cust5
        ,alien_cntry
        ,alien_city
        ,alien_cntry_reside
        ,employer_nm
        ,other_email
        ,insufficient_address
        ,profit_analysis
        ,[retention]
        ,sic_user1_defined
        ,sic_user2_defined
        ,sic_user3_defined
        ,sic_user4_defined
        ,sic_user5_defined
        ,sic_user6_defined
        ,sic_user7_defined
        ,special_cust
        ,alien_cust
        ,fincen_legal_entity
        ,class
        ,no_call_cust
        ,prvcy_act_opt_out
        ,tin_nm_match
        ,afflt_opt_out
        ,fax_ph
        ,long_cell_ph
        ,long_othr_ph
        ,long_fax_ph
        ,irs_address
        ,irs_foreign_address
        ,irs_foreign_cntry
        ,inquiry_id_num
        ,alien_w8_cert_date
        ,exclusion_reason
        ,tittle
        ,foreign_cntry
        ,tax_id_num_type
        ,tin_cert
        ,tin_cert_date
        ,officers
        ,date_last_contact
        ,othr_cell_ph
        ,sic_user8_defined
        ,customer_number
        ,mail_notice_code
        ,print_name_on_statement
        ,dob
        ,add3
        ,ewf_processed
        ,created_dt
        ,alien_w8_exp_date
        ,alien_w8_type
        ,alien_w8_status
        ,alien_chpt3_exemp_code
        ,alien_chpt3_status_code
        ,alien_chpt4_exemp_code
        ,alien_chpt4_status_code
        ,city
        ,[state]
        ,zip_code
        ,long_bus_ph_ext
        ,is_pep
        ,is_origin_brad
        ,has_neg_news
        ,tax_id
        ,suffix
        ,commname
        ,q2_enroll
        ,ss
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM
        {{ ref('bronze_cos_applicant') }}
    WHERE CONVERT(DATE,LOADED_AT) = CONVERT(DATE, GETUTCDATE())
)

SELECT * FROM bronze_data