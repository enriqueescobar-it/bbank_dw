-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

SELECT 'bronze_apex_daily_accounts' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_apex_daily_accounts
UNION ALL
SELECT 'bronze_apex_daily_activities' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_apex_daily_activities
UNION ALL
SELECT 'bronze_apex_daily_overnight_balances' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_apex_daily_overnight_balances
UNION ALL
SELECT 'bronze_apex_daily_positions' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_apex_daily_positions
UNION ALL
SELECT 'bronze_apex_daily_stock_record' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_apex_daily_stock_record
UNION ALL
SELECT 'bronze_apex_onboarding_status' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_apex_onboarding_status
UNION ALL
SELECT 'bronze_assist_codfil_ref' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_assist_codfil_ref
UNION ALL
SELECT 'bronze_assist_customer_addl_fields' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_assist_customer_addl_fields
UNION ALL
SELECT 'bronze_assist_customer_class' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_assist_customer_class
UNION ALL
SELECT 'bronze_assist_customer_tbl' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_assist_customer_tbl
UNION ALL
SELECT 'bronze_assist_master_account_tbl' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_assist_master_account_tbl
UNION ALL
SELECT 'bronze_assist_officers_costcenter' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_assist_officers_costcenter
UNION ALL
SELECT 'bronze_assist_transactions_tbl' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_assist_transactions_tbl
UNION ALL
SELECT 'bronze_auxiliary_br_dcode' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_auxiliary_br_dcode
UNION ALL
SELECT 'bronze_auxiliary_jha_sei_trans_code' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_auxiliary_jha_sei_trans_code
UNION ALL
SELECT 'bronze_axiom_acct' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_axiom_acct
UNION ALL
SELECT 'bronze_axiom_cds' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_axiom_cds
UNION ALL
SELECT 'bronze_axiom_devops' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_axiom_devops
UNION ALL
SELECT 'bronze_axiom_dmi_chargeoffs' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_axiom_dmi_chargeoffs
UNION ALL
SELECT 'bronze_axiom_dmiloans' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_axiom_dmiloans
UNION ALL
SELECT 'bronze_axiom_instmodelstg' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_axiom_instmodelstg
UNION ALL
SELECT 'bronze_axiom_loans' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_axiom_loans
UNION ALL
SELECT 'bronze_axiom_ovrntdep' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_axiom_ovrntdep
UNION ALL
SELECT 'bronze_cos_applicant' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_cos_applicant
UNION ALL
SELECT 'bronze_cos_prospect' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_cos_prospect
UNION ALL
SELECT 'bronze_cos_td_treasury_rate' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_cos_td_treasury_rate
UNION ALL
SELECT 'bronze_dmi_bacmast' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_bacmast
UNION ALL
SELECT 'bronze_dmi_disb' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_disb
UNION ALL
SELECT 'bronze_dmi_e006' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_e006
UNION ALL
SELECT 'bronze_dmi_gl_mapping' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_gl_mapping
UNION ALL
SELECT 'bronze_dmi_non_cash' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_non_cash
UNION ALL
SELECT 'bronze_dmi_p110' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_p110
UNION ALL
SELECT 'bronze_dmi_p132' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_p132
UNION ALL
SELECT 'bronze_dmi_pmt' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_pmt
UNION ALL
SELECT 'bronze_dmi_s2tt' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_s2tt
UNION ALL
SELECT 'bronze_dmi_s2tv' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_s2tv
UNION ALL
SELECT 'bronze_dmi_s5az' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_s5az
UNION ALL
SELECT 'bronze_dmi_t69w' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_t69w
UNION ALL
SELECT 'bronze_dmi_transaction_codes_mapping' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_dmi_transaction_codes_mapping
UNION ALL
SELECT 'bronze_fis_cd300' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_fis_cd300
UNION ALL
SELECT 'bronze_fis_ethos_interchange_fee_data' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_fis_ethos_interchange_fee_data
UNION ALL
SELECT 'bronze_fis_lp_510' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_fis_lp_510
UNION ALL
SELECT 'bronze_bcp_ibkr_account' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_bcp_ibkr_account
UNION ALL
SELECT 'bronze_bcp_ibkr_acct_holder' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_bcp_ibkr_acct_holder
UNION ALL
SELECT 'bronze_bcp_ibkr_balance_history' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_bcp_ibkr_balance_history
UNION ALL
SELECT 'bronze_file_invoice_requests' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_invoice_requests
UNION ALL
SELECT 'bronze_file_apex_monthly_accounts' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_apex_monthly_accounts
UNION ALL
SELECT 'bronze_file_apex_monthly_credit' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_apex_monthly_credit
UNION ALL
SELECT 'bronze_file_apex_monthly_execution' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_apex_monthly_execution
UNION ALL
SELECT 'bronze_file_apex_monthly_fdic' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_apex_monthly_fdic
UNION ALL
SELECT 'bronze_file_apex_monthly_trades' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_apex_monthly_trades
UNION ALL
SELECT 'bronze_file_bflcrtran' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_bflcrtran
UNION ALL
SELECT 'bronze_file_biu_activity' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_biu_activity
UNION ALL
SELECT 'bronze_file_fedlink_inc' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_fedlink_inc
UNION ALL
SELECT 'bronze_file_fedlink_out' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_fedlink_out
UNION ALL
SELECT 'bronze_file_rdci' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_rdci
UNION ALL
SELECT 'bronze_file_trailer_fees' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_trailer_fees
UNION ALL
SELECT 'bronze_file_trailer_fees_accruals' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_file_trailer_fees_accruals
UNION ALL
SELECT 'bronze_mis_pershing_officer_code' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_mis_pershing_officer_code
UNION ALL
SELECT 'bronze_mis_team_officers_v2' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_mis_team_officers_v2
UNION ALL
SELECT 'bronze_mulesoft_customer_external_id' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_mulesoft_customer_external_id
UNION ALL
SELECT 'bronze_mulesoft_party' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_mulesoft_party
UNION ALL
SELECT 'bronze_mulesoft_prospect_external_data' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_mulesoft_prospect_external_data
UNION ALL
SELECT 'bronze_intrafi_account_trial_balance' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_intrafi_account_trial_balance
UNION ALL
SELECT 'bronze_q2_customer' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_q2_customer
UNION ALL
SELECT 'bronze_q2_user' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_q2_user
UNION ALL
SELECT 'bronze_q2_user_pii' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_q2_user_pii
UNION ALL
SELECT 'bronze_rprt_sharing_agreement_exception' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_rprt_sharing_agreement_exception
UNION ALL
SELECT 'bronze_sblc_lcmaster' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sblc_lcmaster
UNION ALL
SELECT 'bronze_sblc_lctranx' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sblc_lctranx
UNION ALL
SELECT 'bronze_sei_accountoptionalfields' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_accountoptionalfields
UNION ALL
SELECT 'bronze_sei_accounts' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_accounts
UNION ALL
SELECT 'bronze_sei_activeblocks' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_activeblocks
UNION ALL
SELECT 'bronze_sei_assetinvclas' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_assetinvclas
UNION ALL
SELECT 'bronze_sei_assetoptfields' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_assetoptfields
UNION ALL
SELECT 'bronze_sei_assets' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_assets
UNION ALL
SELECT 'bronze_sei_clientaccountlink' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_clientaccountlink
UNION ALL
SELECT 'bronze_sei_clients' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_clients
UNION ALL
SELECT 'bronze_sei_contactdetails' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_contactdetails
UNION ALL
SELECT 'bronze_sei_custodynostropositions' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_custodynostropositions
UNION ALL
SELECT 'bronze_sei_eodchangedpositions' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_eodchangedpositions
UNION ALL
SELECT 'bronze_sei_eodposvalaggr' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_eodposvalaggr
UNION ALL
SELECT 'bronze_sei_eodpositions' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_eodpositions
UNION ALL
SELECT 'bronze_sei_eodpositionssupplemental' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_eodpositionssupplemental
UNION ALL
SELECT 'bronze_sei_feecomputation' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_feecomputation
UNION ALL
SELECT 'bronze_sei_feegroup' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_feegroup
UNION ALL
SELECT 'bronze_sei_feepackagerule' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_feepackagerule
UNION ALL
SELECT 'bronze_sei_feepackageusage' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_feepackageusage
UNION ALL
SELECT 'bronze_sei_fundcutoff' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_fundcutoff
UNION ALL
SELECT 'bronze_sei_fxforward' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_fxforward
UNION ALL
SELECT 'bronze_sei_interestratetypes' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_interestratetypes
UNION ALL
SELECT 'bronze_sei_modelalloc' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_modelalloc
UNION ALL
SELECT 'bronze_sei_modelsintext' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_modelsintext
UNION ALL
SELECT 'bronze_sei_paidto' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_paidto
UNION ALL
SELECT 'bronze_sei_partyoptionalfields' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_partyoptionalfields
UNION ALL
SELECT 'bronze_sei_portfoliogroups' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_portfoliogroups
UNION ALL
SELECT 'bronze_sei_portfolioperformance' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_portfolioperformance
UNION ALL
SELECT 'bronze_sei_reccashactivities' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_reccashactivities
UNION ALL
SELECT 'bronze_sei_reference' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_reference
UNION ALL
SELECT 'bronze_sei_relationshipmapping_sei_jha' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_relationshipmapping_sei_jha
UNION ALL
SELECT 'bronze_sei_relationships' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_relationships
UNION ALL
SELECT 'bronze_sei_roledetail' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_roledetail
UNION ALL
SELECT 'bronze_sei_statementevents' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_statementevents
UNION ALL
SELECT 'bronze_sei_statementinstance' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_statementinstance
UNION ALL
SELECT 'bronze_sei_statementpackage' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_statementpackage
UNION ALL
SELECT 'bronze_sei_transactiondetail' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_transactiondetail
UNION ALL
SELECT 'bronze_sei_transactiondetailupd' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_transactiondetailupd
UNION ALL
SELECT 'bronze_sei_transactionheader' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_transactionheader
UNION ALL
SELECT 'bronze_sei_transactionheaderupd' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_transactionheaderupd
UNION ALL
SELECT 'bronze_sei_upcomingactivities' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_upcomingactivities
UNION ALL
SELECT 'bronze_sei_userdetail' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_userdetail
UNION ALL
SELECT 'bronze_sei_userteamroledetail' AS table_name, COUNT(*) AS record_count
FROM bronze.default.bronze_sei_userteamroledetail;
