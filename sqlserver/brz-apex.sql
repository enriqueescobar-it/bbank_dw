-- NAME: BRONZE_APEX_DAILY_ACCOUNTS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: November 19, 2024



with landing_data AS (
    SELECT
         account_id
        ,correspondent_code
        ,account_group_code
        ,ownership_type
        ,registration_type
        ,funding_type
        ,status
        ,fdid
        ,cat_account_holder_type
        ,title
        ,CASE
            WHEN CHARINDEX('.', created_time) > 0
                 AND LEN(SUBSTRING(created_time, CHARINDEX('.', created_time) + 1, LEN(created_time))) > 3
            THEN CAST(LEFT(created_time, CHARINDEX('.', created_time) + 3) AS DATETIME)
            WHEN created_time is NULL
            THEN NULL
            ELSE CAST(created_time AS DATETIME)
         END AS created_time
        ,CASE
            WHEN CHARINDEX('.', opened_time) > 0
                 AND LEN(SUBSTRING(opened_time, CHARINDEX('.', opened_time) + 1, LEN(opened_time))) > 3
            THEN CAST(LEFT(opened_time, CHARINDEX('.', opened_time) + 3) AS DATETIME)
            WHEN opened_time is NULL
            THEN NULL
            ELSE CAST(opened_time AS DATETIME)
        END AS opened_time
        ,is_pattern_day_trader
        ,accepts_issuer_direct_communication
        ,primary_registered_rep_id
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(investment_profile, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',') AS investment_profile
        ,dividend_reinvestment_plan
        ,business_unit
        ,external_account_id
        ,margin_group_id
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(tax_profile, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',') AS tax_profile
        ,finra_coa_code
        ,reserve_class
        ,account_number
        ,CASE
            WHEN CHARINDEX('.', close_time) > 0
                 AND LEN(SUBSTRING(close_time, CHARINDEX('.', close_time) + 1, LEN(close_time))) > 3
            THEN CAST(LEFT(close_time, CHARINDEX('.', close_time) + 3) AS DATETIME)
            WHEN close_time is NULL
            THEN NULL
            ELSE CAST(close_time AS DATETIME)
        END AS close_time
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(agreements, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',') AS agreements
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(enrollments, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',') AS enrollments
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(active_restrictions, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',') AS active_restrictions
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(interested_parties, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',') AS interested_parties
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(registered_representatives, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',') AS registered_representatives
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(parties, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',') AS parties
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(entitlements, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',') AS entitlements
        ,_key
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(trusted_contacts, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',') AS trusted_contacts
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(correspondents_record, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',') AS correspondents_record
        ,identifiers
        ,replacing_fdid
        ,fdid_end_reason
        ,last_modified_by
        ,CASE
            WHEN CHARINDEX('.', last_modified_time) > 0
                 AND LEN(SUBSTRING(last_modified_time, CHARINDEX('.', last_modified_time) + 1, LEN(last_modified_time))) > 3
            THEN CAST(LEFT(last_modified_time, CHARINDEX('.', last_modified_time) + 3) AS DATETIME)
            WHEN last_modified_time is NULL
            THEN NULL
            ELSE CAST(last_modified_time AS DATETIME)
         END AS last_modified_time
        ,mutual_fund_external_facilitation_account
        ,CASE
            WHEN CHARINDEX('.', snapshot_timestamp) > 0
                 AND LEN(SUBSTRING(snapshot_timestamp, CHARINDEX('.', snapshot_timestamp) + 1, LEN(snapshot_timestamp))) > 3
            THEN CAST(LEFT(snapshot_timestamp, CHARINDEX('.', snapshot_timestamp) + 3) AS DATETIME)
            WHEN snapshot_timestamp is NULL
            THEN NULL
            ELSE CAST(snapshot_timestamp AS DATETIME)
        END AS snapshot_timestamp
        ,source_file
        ,CONVERT(DATE, DATE_OF_DATA) AS DATE_OF_DATA
        ,CONVERT(INT,LEFT(REPLACE(REPLACE(RIGHT(source_file,18),'.parquet',''),'-',''),6)) AS YEARMONTH
        ,loaded_at

    FROM
         "DQP_LANDING"."dbo"."APEX_daily_accounts"
    
    WHERE
        source_file NOT IN (SELECT DISTINCT SOURCE_FILE FROM "DQP_BRONZE"."dbo"."bronze_apex_daily_accounts")
    
),

bronze_data AS (
    SELECT
         account_id                                                                                 AS account_id
        ,account_group_code                                                                         AS account_group_code
        ,correspondent_code                                                                         AS correspondent_code
        ,ownership_type                                                                             AS ownership_type
        ,registration_type                                                                          AS registration_type
        ,funding_type                                                                               AS funding_type
        ,status                                                                                     AS status
        ,fdid                                                                                       AS fdid
        ,cat_account_holder_type                                                                    AS cat_account_holder_type
        ,title                                                                                      AS title
        ,created_time                                                                               AS created_time
        ,opened_time                                                                                AS opened_time
        ,is_pattern_day_trader                                                                      AS is_pattern_day_trader
        ,accepts_issuer_direct_communication                                                        AS accepts_issuer_direct_communication
        ,primary_registered_rep_id                                                                  AS primary_registered_rep_id
        ,JSON_VALUE(investment_profile, '$.investment_profile_id')                                  AS investment_profile_investment_profile_id
        ,JSON_VALUE(investment_profile, '$.account_goals.investment_objective')                     AS investment_profile_account_goals_investment_objective
        ,JSON_VALUE(investment_profile, '$.account_goals.risk_tolerance')                           AS investment_profile_account_goals_risk_tolerance
        ,JSON_VALUE(investment_profile, '$.account_goals.liquidity_needs')                          AS investment_profile_account_goals_liquidity_needs
        ,JSON_VALUE(investment_profile, '$.account_goals.time_horizon')                             AS investment_profile_account_goals_time_horizon
        ,JSON_VALUE(investment_profile, '$.customer_profile.investment_experience')                 AS investment_profile_customer_profile_investment_experience
        ,JSON_VALUE(investment_profile, '$.customer_profile.annual_income_range_usd')               AS investment_profile_customer_profile_annual_income_range_usd
        ,JSON_VALUE(investment_profile, '$.customer_profile.liquid_net_worth_range_usd')            AS investment_profile_customer_profile_liquid_net_worth_range_usd
        ,JSON_VALUE(investment_profile, '$.customer_profile.total_net_worth_range_usd')             AS investment_profile_customer_profile_total_net_worth_range_usd
        ,CAST(JSON_VALUE(investment_profile, '$.customer_profile.federal_tax_bracket') AS FLOAT)    AS investment_profile_customer_profile_federal_tax_bracket
        ,dividend_reinvestment_plan                                                                 AS dividend_reinvestment_plan
        ,business_unit                                                                              AS business_unit
        ,external_account_id                                                                        AS external_account_id
        ,margin_group_id                                                                            AS margin_group_id
        ,JSON_VALUE(tax_profile, '$.cost_basis_lot_disposal_method')                                AS tax_profile_cost_basis_lot_disposal_method
        ,JSON_VALUE(tax_profile, '$.wash_sale_eligible')                                            AS tax_profile_wash_sale_eligible
        ,JSON_VALUE(tax_profile, '$.section_475_election')                                          AS tax_profile_section_475_election
        ,finra_coa_code                                                                             AS finra_coa_code
        ,reserve_class                                                                              AS reserve_class
        ,account_number                                                                             AS account_number
        ,close_time                                                                                 AS close_time
        ,agreements                                                                                 AS agreements
        ,enrollments                                                                                AS enrollments
        ,active_restrictions                                                                        AS active_restrictions
        ,interested_parties                                                                         AS interested_parties
        ,registered_representatives                                                                 AS registered_representatives
        ,parties                                                                                    AS parties
        ,entitlements                                                                               AS entitlements
        ,_key                                                                                       AS _key
        ,trusted_contacts                                                                           AS trusted_contacts
        ,JSON_VALUE(correspondents_record, '$.correspondent_id')                                    AS correspondents_record_correspondent_id
        ,JSON_VALUE(correspondents_record, '$.trading_mpid')                                        AS correspondents_record_trading_mpid
        ,JSON_VALUE(correspondents_record, '$.correspondent_code')                                  AS correspondents_record_correspondent_code
        ,JSON_VALUE(correspondents_record, '$.client_id')                                           AS correspondents_record_client_id
        ,JSON_VALUE(correspondents_record, '$.client_code')                                         AS correspondents_record_client_code
        ,JSON_VALUE(correspondents_record, '$.account_group_code')                                  AS correspondents_record_account_group_code
        ,JSON_VALUE(correspondents_record, '$.account_group_id')                                    AS correspondents_record_account_group_id
        ,CAST(JSON_VALUE(correspondents_record, '$.branch_office') AS INTEGER)                      AS correspondents_record_branch_office
        ,identifiers                                                                                AS identifiers
        ,replacing_fdid                                                                             AS replacing_fdid
        ,fdid_end_reason                                                                            AS fdid_end_reason
        ,last_modified_by                                                                           AS last_modified_by
        ,last_modified_time                                                                         AS last_modified_time
        ,mutual_fund_external_facilitation_account                                                  AS mutual_fund_external_facilitation_account
        ,snapshot_timestamp                                                                         AS snapshot_timestamp
        ,source_file                                                                                AS source_file
        ,DATE_OF_DATA                                                                               AS DATE_OF_DATA
        ,YEARMONTH                                                                                  AS YEARMONTH
        ,GETUTCDATE()                                                                                  AS LOADED_AT
    FROM
        landing_data
)



SELECT * FROM bronze_data


-- NAME: BRONZE_APEX_DAILY_ACTIVITIES
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: November 21, 2024




WITH landing_data AS (
SELECT
     account_id
    ,activity_id
    ,type
    ,sub_type
    ,symbol
    ,asset_type
    ,region_code
    ,asset_id
    ,side
    ,quantity
    ,currency_code
    ,currency_asset_id
    ,price
    ,gross_amount
    ,net_amount
    ,activity_date
    ,activity_time
    ,process_date
    ,settle_date
    ,state
    ,activity_description
    ,asset_description
    ,asset_version
    -- Trade fields
    ,JSON_VALUE(trade, '$.symbol_description')                                                                     AS trade_symbol_description
    ,JSON_QUERY(trade, '$.additional_instructions')                                                                 AS trade_additional_instructions
    ,JSON_QUERY(trade, '$.special_instructions')                                                                 AS trade_special_instructions
    ,JSON_VALUE(trade, '$.client_order_id')                                                                         AS trade_client_order_id
    ,JSON_VALUE(trade, '$.exchange')                                                                             AS trade_exchange
    ,JSON_VALUE(trade, '$.broker_capacity')                                                                         AS trade_broker_capacity
    ,JSON_VALUE(trade, '$.route')                                                                                 AS trade_route
    ,JSON_VALUE(trade, '$.algo')                                                                                 AS trade_algo
    ,JSON_VALUE(trade, '$.broker')                                                                                 AS trade_broker
    ,JSON_VALUE(trade, '$.execution_id')                                                                         AS trade_execution_id
    ,CAST(JSON_VALUE(trade, '$.markup') AS FLOAT)                                                                 AS trade_markup
    ,CAST(JSON_VALUE(trade, '$.markdown') AS FLOAT)                                                                 AS trade_markdown
    ,CAST(JSON_VALUE(trade, '$.execution_only') AS BIT)                                                             AS trade_execution_only
    ,CAST(JSON_VALUE(trade, '$.when_issued') AS BIT)                                                             AS trade_when_issued
    ,CAST(JSON_VALUE(trade, '$.when_distributed') AS BIT)                                                         AS trade_when_distributed
    ,CAST(JSON_VALUE(trade, '$.is_writeoff') AS BIT)                                                             AS trade_is_writeoff
    ,JSON_QUERY(trade, '$.client_memos')                                                                         AS trade_client_memos
    ,JSON_VALUE(trade, '$.order_id')                                                                             AS trade_order_id
    ,JSON_VALUE(trade, '$.alternate_order_id')                                                                     AS trade_alternate_order_id
    ,JSON_VALUE(trade, '$.external_id')                                                                             AS trade_external_id
    ,JSON_VALUE(trade, '$.source_account_id')                                                                     AS trade_source_account_id
    ,JSON_VALUE(trade, '$.booking_api_trade_id')                                                                 AS trade_booking_api_trade_id
    ,JSON_VALUE(trade, '$.booking_api_trade_allocation_id')                                                         AS trade_booking_api_trade_allocation_id
    ,JSON_VALUE(trade, '$.gateway_client_order_id')                                                                 AS trade_gateway_client_order_id
    ,CAST(JSON_VALUE(trade, '$.internal_error') AS BIT)                                                             AS trade_internal_error
    ,CAST(JSON_VALUE(trade, '$.prevailing_market_price') AS FLOAT)                                                 AS trade_prevailing_market_price
    ,JSON_VALUE(trade, '$.price_adjustment_type')                                                                 AS trade_price_adjustment_type
    ,CAST(JSON_VALUE(trade, '$.price_adjustment_amount') AS FLOAT)                                                 AS trade_price_adjustment_amount
    ,CAST(JSON_VALUE(trade, '$.price_adjustment_percent') AS FLOAT)                                                 AS trade_price_adjustment_percent
    ,JSON_QUERY(trade, '$.yield_records')                                                                         AS trade_yield_records

    -- Reverse Stock Split fields
    ,JSON_VALUE(reverse_stock_split, '$.symbol_description')                                                     AS reverse_stock_split_symbol_description
    ,CAST(JSON_VALUE(reverse_stock_split, '$.factor_numerator') AS FLOAT)                                         AS reverse_stock_split_factor_numerator
    ,CAST(JSON_VALUE(reverse_stock_split, '$.factor_denominator') AS FLOAT)                                         AS reverse_stock_split_factor_denominator
    ,CAST(JSON_VALUE(reverse_stock_split, '$.quantity') AS FLOAT)                                                 AS reverse_stock_split_quantity
    ,JSON_VALUE(reverse_stock_split, '$.new_cusip')                                                                 AS reverse_stock_split_new_cusip
    ,CAST(JSON_VALUE(reverse_stock_split, '$.cash_rate') AS FLOAT)                                                 AS reverse_stock_split_cash_rate
    ,JSON_VALUE(reverse_stock_split, '$.old_cusip')                                                                 AS reverse_stock_split_old_cusip
    ,JSON_VALUE(reverse_stock_split, '$.action')                                                                 AS reverse_stock_split_action
    ,JSON_VALUE(reverse_stock_split, '$.effective_date')                                                         AS reverse_stock_split_effective_date
    ,JSON_VALUE(reverse_stock_split, '$.corporate_action_general_information.corporate_action_id')                 AS reverse_stock_split_corporate_action_id
    ,JSON_VALUE(reverse_stock_split, '$.corporate_action_general_information.target_symbol_description')         AS reverse_stock_split_target_symbol_description
    ,JSON_VALUE(reverse_stock_split, '$.corporate_action_general_information.target_cusip')                         AS reverse_stock_split_target_cusip
    ,CAST(JSON_VALUE(reverse_stock_split, '$.corporate_action_general_information.target_asset_id') AS FLOAT)     AS reverse_stock_split_target_asset_id
    ,JSON_VALUE(reverse_stock_split, '$.corporate_action_general_information.disbursed_symbol_description')         AS reverse_stock_split_disbursed_symbol_description
    ,JSON_VALUE(reverse_stock_split, '$.corporate_action_general_information.disbursed_cusip')                     AS reverse_stock_split_disbursed_cusip
    ,CAST(JSON_VALUE(reverse_stock_split, '$.corporate_action_general_information.disbursed_asset_id') AS FLOAT) AS reverse_stock_split_disbursed_asset_id

    -- cash_dividend symbol_description
    ,JSON_VALUE(cash_dividend, '$.symbol_description')                                                        AS cash_dividend_symbol_description
    ,JSON_VALUE(cash_dividend, '$.cash_rate')                                                                AS cash_dividend_cash_rate
    ,JSON_VALUE(cash_dividend, '$.settled')                                                                    AS cash_dividend_settled
    ,JSON_VALUE(cash_dividend, '$.record_date')                                                                AS cash_dividend_record_date
    ,JSON_VALUE(cash_dividend, '$.payment_date')                                                            AS cash_dividend_payment_date
    ,JSON_VALUE(cash_dividend, '$.tefra_withholding')                                                        AS cash_dividend_tefra_withholding
    ,JSON_VALUE(cash_dividend, '$.foreign_withholding')                                                        AS cash_dividend_foreign_withholding
    ,JSON_VALUE(cash_dividend, '$.nra_withholding')                                                            AS cash_dividend_nra_withholding
    ,JSON_VALUE(cash_dividend, '$.qualified')                                                                AS cash_dividend_qualified
    ,JSON_VALUE(cash_dividend, '$.long_term_gain')                                                            AS cash_dividend_long_term_gain
    ,JSON_VALUE(cash_dividend, '$.free')                                                                    AS cash_dividend_free
    ,JSON_VALUE(cash_dividend, '$.fpsl')                                                                    AS cash_dividend_fpsl
    ,JSON_VALUE(cash_dividend, '$.is_substitute_payment')                                                    AS cash_dividend_is_substitute_payment
    ,JSON_VALUE(cash_dividend, '$.subtype')                                                                    AS cash_dividend_subtype
    ,JSON_VALUE(cash_dividend, '$.quantity')                                                                AS cash_dividend_quantity
    ,JSON_VALUE(cash_dividend, '$.corporate_action_general_information.corporate_action_id')                AS cash_dividend_corporate_action_id
    ,JSON_VALUE(cash_dividend, '$.corporate_action_general_information.target_symbol_description')            AS cash_dividend_target_symbol_description
    ,JSON_VALUE(cash_dividend, '$.corporate_action_general_information.target_cusip')                        AS cash_dividend_target_cusip
    ,JSON_VALUE(cash_dividend, '$.corporate_action_general_information.target_asset_id')                    AS cash_dividend_target_asset_id
    ,JSON_VALUE(cash_dividend, '$.corporate_action_general_information.disbursed_symbol_description')        AS cash_dividend_disbursed_symbol_description
    ,JSON_VALUE(cash_dividend, '$.corporate_action_general_information.disbursed_cusip')                    AS cash_dividend_disbursed_cusip
    ,JSON_VALUE(cash_dividend, '$.corporate_action_general_information.disbursed_asset_id')                    AS cash_dividend_disbursed_asset_id
    ,JSON_VALUE(cash_dividend, '$.reinvested')                                                                AS cash_dividend_reinvested

    -- Stock Dividend fields
    ,CAST(ISNULL(NULLIF(JSON_VALUE(stock_dividend, '$.rate'), 'null'), NULL) AS FLOAT)                            AS stock_dividend_rate
    ,CAST(ISNULL(NULLIF(JSON_VALUE(stock_dividend, '$.quantity'), 'null'), NULL) AS FLOAT)                        AS stock_dividend_quantity
    ,JSON_VALUE(stock_dividend, '$.record_date')                                                                AS stock_dividend_record_date
    ,JSON_VALUE(stock_dividend, '$.pay_date')                                                                    AS stock_dividend_pay_date
    ,JSON_VALUE(stock_dividend, '$.corporate_action_general_information.corporate_action_id')                    AS stock_dividend_corporate_action_id
    ,JSON_VALUE(stock_dividend, '$.corporate_action_general_information.target_symbol_description')                AS stock_dividend_target_symbol_description
    ,JSON_VALUE(stock_dividend, '$.corporate_action_general_information.target_cusip')                            AS stock_dividend_target_cusip
    ,JSON_VALUE(stock_dividend, '$.corporate_action_general_information.target_asset_id')                        AS stock_dividend_target_asset_id
    ,JSON_VALUE(stock_dividend, '$.corporate_action_general_information.disbursed_symbol_description')            AS stock_dividend_disbursed_symbol_description
    ,JSON_VALUE(stock_dividend, '$.corporate_action_general_information.disbursed_cusip')                        AS stock_dividend_disbursed_cusip
    ,JSON_VALUE(stock_dividend, '$.corporate_action_general_information.disbursed_asset_id')                    AS stock_dividend_disbursed_asset_id

    -- Withdrawal Deposit Transfer
    ,JSON_VALUE(withdrawal_deposit_transfer, '$.originating_institution')                                        AS withdrawal_deposit_transfer_originating_institution
    ,JSON_VALUE(withdrawal_deposit_transfer, '$.destination_institution')                                        AS withdrawal_deposit_transfer_destination_institution
    ,JSON_VALUE(withdrawal_deposit_transfer, '$.additional_instructions')                                        AS withdrawal_deposit_transfer_additional_instructions


    -- stock_split
    ,CAST(ISNULL(NULLIF(JSON_VALUE(stock_split, '$.factor_numerator'), 'null'), NULL) AS FLOAT)                    AS stock_split_factor_numerator
    ,CAST(ISNULL(NULLIF(JSON_VALUE(stock_split, '$.factor_denominator'), 'null'), NULL) AS FLOAT)                AS stock_split_factor_denominator
    ,CAST(ISNULL(NULLIF(JSON_VALUE(stock_split, '$.quantity'), 'null'), NULL) AS FLOAT)                            AS stock_split_quantity
    ,JSON_VALUE(stock_split, '$.record_date')                                                                    AS stock_split_record_date
    ,JSON_VALUE(stock_split, '$.pay_date')                                                                        AS stock_split_pay_date
    ,JSON_VALUE(stock_split, '$.corporate_action_general_information.corporate_action_id')                        AS stock_split_corporate_action_id
    ,JSON_VALUE(stock_split, '$.corporate_action_general_information.target_symbol_description')                AS stock_split_target_symbol_description
    ,JSON_VALUE(stock_split, '$.corporate_action_general_information.target_cusip')                                AS stock_split_target_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(stock_split, '$.corporate_action_general_information.target_asset_id'), 'null'), NULL) AS FLOAT) AS stock_split_target_asset_id
    ,JSON_VALUE(stock_split, '$.corporate_action_general_information.disbursed_symbol_description')                AS stock_split_disbursed_symbol_description
    ,JSON_VALUE(stock_split, '$.corporate_action_general_information.disbursed_cusip')                            AS stock_split_disbursed_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(stock_split, '$.corporate_action_general_information.disbursed_asset_id'), 'null'), NULL) AS FLOAT) AS stock_split_disbursed_asset_id

    -- name_change
    ,JSON_VALUE(name_change, '$.old_symbol_description')                                                        AS name_change_old_symbol_description
    ,CAST(ISNULL(NULLIF(JSON_VALUE(name_change, '$.quantity'), 'null'), NULL) AS FLOAT)                            AS name_change_quantity
    ,JSON_VALUE(name_change, '$.old_cusip')                                                                        AS name_change_old_cusip
    ,JSON_VALUE(name_change, '$.new_cusip')                                                                        AS name_change_new_cusip
    ,JSON_VALUE(name_change, '$.action')                                                                        AS name_change_action
    ,JSON_VALUE(name_change, '$.effective_date')                                                                AS name_change_effective_date
    ,JSON_VALUE(name_change, '$.corporate_action_general_information.corporate_action_id')                        AS name_change_corporate_action_id
    ,JSON_VALUE(name_change, '$.corporate_action_general_information.target_symbol_description')                AS name_change_target_symbol_description
    ,JSON_VALUE(name_change, '$.corporate_action_general_information.target_cusip')                                AS name_change_target_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(name_change, '$.corporate_action_general_information.target_asset_id'), 'null'), NULL) AS FLOAT) AS name_change_target_asset_id
    ,JSON_VALUE(name_change, '$.corporate_action_general_information.disbursed_symbol_description')                AS name_change_disbursed_symbol_description
    ,JSON_VALUE(name_change, '$.corporate_action_general_information.disbursed_cusip')                            AS name_change_disbursed_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(name_change, '$.corporate_action_general_information.disbursed_asset_id'), 'null'), NULL) AS FLOAT) AS name_change_disbursed_asset_id

    -- capital_gains
    ,CAST(ISNULL(NULLIF(JSON_VALUE(capital_gains, '$.quantity'), 'null'), NULL) AS FLOAT)                        AS capital_gains_quantity
    ,JSON_VALUE(capital_gains, '$.record_date')                                                                    AS capital_gains_record_date
    ,JSON_VALUE(capital_gains, '$.payment_date')                                                                AS capital_gains_payment_date
    ,CAST(ISNULL(NULLIF(JSON_VALUE(capital_gains, '$.long_term_gain'), 'null'), NULL) AS FLOAT)                    AS capital_gains_long_term_gain
    ,JSON_VALUE(capital_gains, '$.corporate_action_general_information.corporate_action_id')                    AS capital_gains_corporate_action_id
    ,JSON_VALUE(capital_gains, '$.corporate_action_general_information.target_symbol_description')                AS capital_gains_target_symbol_description
    ,JSON_VALUE(capital_gains, '$.corporate_action_general_information.target_cusip')                            AS capital_gains_target_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(capital_gains, '$.corporate_action_general_information.target_asset_id'), 'null'), NULL) AS FLOAT) AS capital_gains_target_asset_id
    ,JSON_VALUE(capital_gains, '$.corporate_action_general_information.disbursed_symbol_description')            AS capital_gains_disbursed_symbol_description
    ,JSON_VALUE(capital_gains, '$.corporate_action_general_information.disbursed_cusip')                        AS capital_gains_disbursed_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(capital_gains, '$.corporate_action_general_information.disbursed_asset_id'), 'null'), NULL) AS FLOAT) AS capital_gains_disbursed_asset_id
    ,CAST(ISNULL(NULLIF(JSON_VALUE(capital_gains, '$.reinvested'), 'null'), NULL) AS BIT)                        AS capital_gains_reinvested

    -- spinoff
    ,JSON_VALUE(spinoff, '$.old_symbol_description')                                                            AS spinoff_old_symbol_description
    ,JSON_VALUE(spinoff, '$.new_symbol_description')                                                            AS spinoff_new_symbol_description
    ,CAST(ISNULL(NULLIF(JSON_VALUE(spinoff, '$.quantity'), 'null'), NULL) AS FLOAT)                                AS spinoff_quantity
    ,JSON_VALUE(spinoff, '$.record_date')                                                                        AS spinoff_record_date
    ,JSON_VALUE(spinoff, '$.pay_date')                                                                            AS spinoff_pay_date
    ,JSON_VALUE(spinoff, '$.corporate_action_general_information.corporate_action_id')                            AS spinoff_corporate_action_id
    ,JSON_VALUE(spinoff, '$.corporate_action_general_information.target_symbol_description')                    AS spinoff_target_symbol_description
    ,JSON_VALUE(spinoff, '$.corporate_action_general_information.target_cusip')                                    AS spinoff_target_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(spinoff, '$.corporate_action_general_information.target_asset_id'), 'null'), NULL) AS FLOAT) AS spinoff_target_asset_id
    ,JSON_VALUE(spinoff, '$.corporate_action_general_information.disbursed_symbol_description')                    AS spinoff_disbursed_symbol_description
    ,JSON_VALUE(spinoff, '$.corporate_action_general_information.disbursed_cusip')                                AS spinoff_disbursed_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(spinoff, '$.corporate_action_general_information.disbursed_asset_id'), 'null'), NULL) AS FLOAT) AS spinoff_disbursed_asset_id

    -- interest_payment
    ,JSON_VALUE(interest_payment, '$.symbol_description') AS interest_payment_symbol_description
    ,CAST(ISNULL(NULLIF(JSON_VALUE(interest_payment, '$.cash_rate'), 'null'), NULL) AS FLOAT)                    AS interest_payment_cash_rate
    ,CAST(ISNULL(NULLIF(JSON_VALUE(interest_payment, '$.settled'), 'null'), NULL) AS FLOAT)                        AS interest_payment_settled
    ,JSON_VALUE(interest_payment, '$.record_date')                                                                AS interest_payment_record_date
    ,JSON_VALUE(interest_payment, '$.payment_date')                                                                AS interest_payment_payment_date
    ,JSON_VALUE(interest_payment, '$.corporate_action_general_information.corporate_action_id')                    AS interest_payment_corporate_action_id
    ,JSON_VALUE(interest_payment, '$.corporate_action_general_information.target_symbol_description')            AS interest_payment_target_symbol_description
    ,JSON_VALUE(interest_payment, '$.corporate_action_general_information.target_cusip')                        AS interest_payment_target_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(interest_payment, '$.corporate_action_general_information.target_asset_id'), 'null'), NULL) AS FLOAT) AS interest_payment_target_asset_id
    ,JSON_VALUE(interest_payment, '$.corporate_action_general_information.disbursed_symbol_description')        AS interest_payment_disbursed_symbol_description
    ,JSON_VALUE(interest_payment, '$.corporate_action_general_information.disbursed_cusip')                        AS interest_payment_disbursed_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(interest_payment, '$.corporate_action_general_information.disbursed_asset_id'), 'null'), NULL) AS FLOAT) AS interest_payment_disbursed_asset_id

    -- liquidation
    ,JSON_VALUE(liquidation, '$.symbol_description')                                                            AS liquidation_symbol_description
    ,JSON_VALUE(liquidation, '$.cash_rate')                                                                        AS liquidation_cash_rate
    ,JSON_VALUE(liquidation, '$.quantity')                                                                        AS liquidation_quantity
    ,JSON_VALUE(liquidation, '$.settled')                                                                        AS liquidation_settled
    ,JSON_VALUE(liquidation, '$.action')                                                                        AS liquidation_action
    ,JSON_VALUE(liquidation, '$.subtype')                                                                        AS liquidation_subtype
    ,JSON_VALUE(liquidation, '$.record_date')                                                                    AS liquidation_record_date
    ,JSON_VALUE(liquidation, '$.payment_date')                                                                    AS liquidation_payment_date
    ,JSON_VALUE(liquidation, '$.effective_date')                                                                AS liquidation_effective_date
    ,JSON_VALUE(liquidation, '$.corporate_action_general_information.corporate_action_id')                        AS liquidation_corporate_action_id
    ,JSON_VALUE(liquidation, '$.corporate_action_general_information.target_symbol_description')                AS liquidation_target_symbol_description
    ,JSON_VALUE(liquidation, '$.corporate_action_general_information.target_cusip')                                AS liquidation_target_cusip
    ,JSON_VALUE(liquidation, '$.corporate_action_general_information.target_asset_id')                            AS liquidation_target_asset_id
    ,JSON_VALUE(liquidation, '$.corporate_action_general_information.disbursed_symbol_description')                AS liquidation_disbursed_symbol_description
    ,JSON_VALUE(liquidation, '$.corporate_action_general_information.disbursed_cusip')                            AS liquidation_disbursed_cusip
    ,JSON_VALUE(liquidation, '$.corporate_action_general_information.disbursed_asset_id')                        AS liquidation_disbursed_asset_id

    -- dividend
    ,JSON_VALUE(dividend, '$.symbol_description') AS dividend_symbol_description
    ,CAST(ISNULL(NULLIF(JSON_VALUE(dividend, '$.cash_rate'), 'null'), NULL) AS FLOAT)                            AS dividend_cash_rate
    ,CAST(ISNULL(NULLIF(JSON_VALUE(dividend, '$.settled'), 'null'), NULL) AS FLOAT)                                AS dividend_settled
    ,JSON_VALUE(dividend, '$.record_date')                                                                        AS dividend_record_date
    ,JSON_VALUE(dividend, '$.subtype')                                                                            AS dividend_subtype
    ,JSON_VALUE(dividend, '$.corporate_action_general_information.corporate_action_id')                            AS dividend_corporate_action_id
    ,JSON_VALUE(dividend, '$.corporate_action_general_information.target_symbol_description')                    AS dividend_target_symbol_description
    ,JSON_VALUE(dividend, '$.corporate_action_general_information.target_cusip')                                AS dividend_target_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(dividend, '$.corporate_action_general_information.target_asset_id'), 'null'), NULL) AS FLOAT) AS dividend_target_asset_id
    ,JSON_VALUE(dividend, '$.corporate_action_general_information.disbursed_symbol_description') AS dividend_disbursed_symbol_description
    ,JSON_VALUE(dividend, '$.corporate_action_general_information.disbursed_cusip')                                AS dividend_disbursed_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(dividend, '$.corporate_action_general_information.disbursed_asset_id'), 'null'), NULL) AS FLOAT) AS dividend_disbursed_asset_id

    -- sale_of_rights
    ,JSON_VALUE(sale_of_rights, '$.symbol_description') AS sale_of_rights_symbol_description
    ,CAST(ISNULL(NULLIF(JSON_VALUE(sale_of_rights, '$.cash_rate'), 'null'), NULL) AS FLOAT)                        AS sale_of_rights_cash_rate
    ,CAST(ISNULL(NULLIF(JSON_VALUE(sale_of_rights, '$.settled'), 'null'), NULL) AS FLOAT)                        AS sale_of_rights_settled
    ,JSON_VALUE(sale_of_rights, '$.record_date')                                                                AS sale_of_rights_record_date
    ,JSON_VALUE(sale_of_rights, '$.payment_date')                                                                AS sale_of_rights_payment_date
    ,JSON_VALUE(sale_of_rights, '$.corporate_action_general_information.corporate_action_id')                    AS sale_of_rights_corporate_action_id
    ,JSON_VALUE(sale_of_rights, '$.corporate_action_general_information.target_symbol_description')                AS sale_of_rights_target_symbol_description
    ,JSON_VALUE(sale_of_rights, '$.corporate_action_general_information.target_cusip')                            AS sale_of_rights_target_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(sale_of_rights, '$.corporate_action_general_information.target_asset_id'), 'null'), NULL) AS FLOAT) AS sale_of_rights_target_asset_id
    ,JSON_VALUE(sale_of_rights, '$.corporate_action_general_information.disbursed_symbol_description')            AS sale_of_rights_disbursed_symbol_description
    ,JSON_VALUE(sale_of_rights, '$.corporate_action_general_information.disbursed_cusip')                        AS sale_of_rights_disbursed_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(sale_of_rights, '$.corporate_action_general_information.disbursed_asset_id'), 'null'), NULL) AS FLOAT) AS sale_of_rights_disbursed_asset_id

    -- redemption_full
    ,JSON_VALUE(redemption_full, '$.symbol_description')                                                        AS redemption_full_symbol_description
    ,CAST(ISNULL(NULLIF(JSON_VALUE(redemption_full, '$.cash_rate'), 'null'), NULL) AS FLOAT)                    AS redemption_full_cash_rate
    ,CAST(ISNULL(NULLIF(JSON_VALUE(redemption_full, '$.quantity'), 'null'), NULL) AS FLOAT)                        AS redemption_full_quantity
    ,JSON_VALUE(redemption_full, '$.action')                                                                    AS redemption_full_action
    ,JSON_VALUE(redemption_full, '$.subtype')                                                                    AS redemption_full_subtype
    ,JSON_VALUE(redemption_full, '$.payment_date')                                                                AS redemption_full_payment_date
    ,JSON_VALUE(redemption_full, '$.corporate_action_general_information.corporate_action_id')                    AS redemption_full_corporate_action_id
    ,JSON_VALUE(redemption_full, '$.corporate_action_general_information.target_symbol_description')            AS redemption_full_target_symbol_description
    ,JSON_VALUE(redemption_full, '$.corporate_action_general_information.target_cusip')                            AS redemption_full_target_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(redemption_full, '$.corporate_action_general_information.target_asset_id'), 'null'), NULL) AS FLOAT) AS redemption_full_target_asset_id
    ,JSON_VALUE(redemption_full, '$.corporate_action_general_information.disbursed_symbol_description')            AS redemption_full_disbursed_symbol_description
    ,JSON_VALUE(redemption_full, '$.corporate_action_general_information.disbursed_cusip')                        AS redemption_full_disbursed_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(redemption_full, '$.corporate_action_general_information.disbursed_asset_id'), 'null'), NULL) AS FLOAT) AS redemption_full_disbursed_asset_id

    -- rights_distribution
    ,JSON_VALUE(rights_distribution, '$.new_symbol_description')                                                AS rights_distribution_new_symbol_description
    ,CAST(ISNULL(NULLIF(JSON_VALUE(rights_distribution, '$.settled'), 'null'), NULL) AS FLOAT)                    AS rights_distribution_settled
    ,JSON_VALUE(rights_distribution, '$.record_date')                                                            AS rights_distribution_record_date
    ,JSON_VALUE(rights_distribution, '$.payment_date')                                                            AS rights_distribution_payment_date
    ,JSON_VALUE(rights_distribution, '$.corporate_action_general_information.corporate_action_id')                AS rights_distribution_corporate_action_id
    ,JSON_VALUE(rights_distribution, '$.corporate_action_general_information.target_symbol_description')        AS rights_distribution_target_symbol_description
    ,JSON_VALUE(rights_distribution, '$.corporate_action_general_information.target_cusip')                        AS rights_distribution_target_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(rights_distribution, '$.corporate_action_general_information.target_asset_id'), 'null'), NULL) AS FLOAT)        AS rights_distribution_target_asset_id
    ,JSON_VALUE(rights_distribution, '$.corporate_action_general_information.disbursed_symbol_description')        AS rights_distribution_disbursed_symbol_description
    ,JSON_VALUE(rights_distribution, '$.corporate_action_general_information.disbursed_cusip')                    AS rights_distribution_disbursed_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(rights_distribution, '$.corporate_action_general_information.disbursed_asset_id'), 'null'), NULL) AS FLOAT)    AS rights_distribution_disbursed_asset_id

    -- deposit
     ,JSON_VALUE(deposit, '$.contribution_type')                                                                AS deposit_contribution_type
     ,JSON_VALUE(deposit, '$.contribution_year')                                                                AS deposit_contribution_year
     ,JSON_VALUE(deposit, '$.conversion')                                                                        AS deposit_conversion
     ,JSON_VALUE(deposit, '$.futures_settlement')                                                                AS deposit_futures_settlement
     ,JSON_VALUE(deposit, '$.micro')                                                                            AS deposit_micro
     ,JSON_VALUE(deposit, '$.retirement_type')                                                                    AS deposit_retirement_type
     ,JSON_VALUE(deposit, '$.type')                                                                                AS deposit_type
     ,JSON_VALUE(deposit, '$.originating_institution')                                                            AS deposit_originating_institution
     ,JSON_VALUE(deposit, '$.destination_institution')                                                            AS deposit_destination_institution
     ,JSON_VALUE(deposit, '$.additional_instructions')                                                            AS deposit_additional_instructions
     ,JSON_VALUE(deposit, '$.fed_reference_number')                                                                AS deposit_fed_reference_number
     ,JSON_VALUE(deposit, '$.originating_account_number')                                                        AS deposit_originating_account_number

    -- withdrawal
    ,JSON_VALUE(withdrawal, '$.conversion')                                                                        AS withdrawal_conversion
    ,JSON_VALUE(withdrawal, '$.distribution_type')                                                                AS withdrawal_distribution_type
    ,JSON_VALUE(withdrawal, '$.distribution_year')                                                                AS withdrawal_distribution_year
    ,JSON_VALUE(withdrawal, '$.closing_account')                                                                AS withdrawal_closing_account
    ,JSON_VALUE(withdrawal, '$.futures_settlement')                                                                AS withdrawal_futures_settlement
    ,JSON_VALUE(withdrawal, '$.micro')                                                                            AS withdrawal_micro
    ,JSON_VALUE(withdrawal, '$.periodic')                                                                        AS withdrawal_periodic
    ,JSON_VALUE(withdrawal, '$.retirement_type')                                                                AS withdrawal_retirement_type
    ,JSON_VALUE(withdrawal, '$.taxable')                                                                        AS withdrawal_taxable
    ,JSON_VALUE(withdrawal, '$.type')                                                                            AS withdrawal_type
    ,JSON_VALUE(withdrawal, '$.advance')                                                                        AS withdrawal_advance
    ,JSON_VALUE(withdrawal, '$.originating_institution')                                                        AS withdrawal_originating_institution
    ,JSON_VALUE(withdrawal, '$.destination_institution')                                                        AS withdrawal_destination_institution
    ,JSON_VALUE(withdrawal, '$.additional_instructions')                                                        AS withdrawal_additional_instructions
    ,JSON_VALUE(withdrawal, '$.fed_reference_number')                                                            AS withdrawal_fed_reference_number
    ,JSON_VALUE(withdrawal, '$.destination_account_number')                                                        AS withdrawal_destination_account_number

      -- worthless
    ,JSON_VALUE(worthless, '$.symbol_description')                                                                AS worthless_symbol_description
    ,JSON_VALUE(worthless, '$.effective_date')                                                                    AS worthless_effective_date
    ,JSON_VALUE(worthless, '$.payment_date')                                                                    AS worthless_payment_date
    ,JSON_VALUE(worthless, '$.corporate_action_general_information.corporate_action_id')                        AS worthless_corporate_action_id
    ,JSON_VALUE(worthless, '$.corporate_action_general_information.target_symbol_description')                    AS worthless_target_symbol_description
    ,JSON_VALUE(worthless, '$.corporate_action_general_information.target_cusip')                                AS worthless_target_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(worthless, '$.corporate_action_general_information.target_asset_id'), 'null'), NULL) AS FLOAT) AS worthless_target_asset_id
    ,JSON_VALUE(worthless, '$.corporate_action_general_information.disbursed_symbol_description') AS worthless_disbursed_symbol_description
    ,JSON_VALUE(worthless, '$.corporate_action_general_information.disbursed_cusip')                            AS worthless_disbursed_cusip
    ,CAST(ISNULL(NULLIF(JSON_VALUE(worthless, '$.corporate_action_general_information.disbursed_asset_id'), 'null'), NULL) AS FLOAT) AS worthless_disbursed_asset_id

    -- transfer
    ,JSON_VALUE(transfer, '$.first_party')                                                                        AS transfer_first_party
    ,JSON_VALUE(transfer, '$.originating_institution')                                                            AS transfer_originating_institution
    ,JSON_VALUE(transfer, '$.destination_institution')                                                            AS transfer_destination_institution
    ,JSON_VALUE(transfer, '$.additional_instructions')                                                            AS transfer_additional_instructions
    ,JSON_VALUE(transfer, '$.client_brokerage')                                                                    AS transfer_client_brokerage
    ,JSON_VALUE(transfer, '$.transfer_type')                                                                    AS transfer_transfer_type

    -- rounding_adjustment
    ,JSON_VALUE(rounding_adjustment, '$.rounding_reason')                                                        AS rounding_adjustment_rounding_reason
    ,fees
    ,withholdings
    ,commissions
    ,accrued_interests

    -- merger
    ,JSON_VALUE(merger, '$.symbol_description')                                                                    AS merger_symbol_description
    ,CAST(JSON_VALUE(merger, '$.quantity') AS FLOAT)                                                            AS merger_quantity
    ,JSON_VALUE(merger, '$.old_cusip')                                                                            AS merger_old_cusip
    ,JSON_VALUE(merger, '$.new_cusip')                                                                            AS merger_new_cusip
    ,CAST(JSON_VALUE(merger, '$.cash_rate') AS FLOAT)                                                            AS merger_cash_rate
    ,CAST(JSON_VALUE(merger, '$.stock_rate') AS FLOAT)                                                            AS merger_stock_rate
    ,JSON_VALUE(merger, '$.type')                                                                                AS merger_type
    ,JSON_VALUE(merger, '$.action')                                                                                AS merger_action
    ,JSON_VALUE(merger, '$.effective_date')                                                                        AS merger_effective_date
    ,JSON_VALUE(merger, '$.corporate_action_general_information.corporate_action_id')                            AS merger_corporate_action_id
    ,JSON_VALUE(merger, '$.corporate_action_general_information.target_symbol_description')                        AS merger_target_symbol_description
    ,JSON_VALUE(merger, '$.corporate_action_general_information.target_cusip')                                    AS merger_target_cusip
    ,CAST(JSON_VALUE(merger, '$.corporate_action_general_information.target_asset_id') AS FLOAT)                AS merger_target_asset_id
    ,JSON_VALUE(merger, '$.corporate_action_general_information.disbursed_symbol_description')                    AS merger_disbursed_symbol_description
    ,JSON_VALUE(merger, '$.corporate_action_general_information.disbursed_cusip')                                AS merger_disbursed_cusip
    ,CAST(JSON_VALUE(merger, '$.corporate_action_general_information.disbursed_asset_id') AS FLOAT)                AS merger_disbursed_asset_id

    -- credit fields
    ,JSON_VALUE(credit, '$.credit_type')                                                                        AS credit_credit_type
    ,JSON_VALUE(credit, '$.taxable')                                                                            AS credit_taxable
    ,JSON_VALUE(credit, '$.additional_instructions')                                                            AS credit_additional_instructions

    -- fpsl fields
    ,JSON_VALUE(fpsl, '$.action')                                                                                AS fpsl_action

    -- account_transfer fields
    , JSON_VALUE(account_transfer, '$.action')                                                                    AS account_transfer_action
    , JSON_VALUE(account_transfer, '$.acats_control_number')                                                    AS account_transfer_acats_control_number
    , JSON_VALUE(account_transfer, '$.institution')                                                                AS account_transfer_institution
    , JSON_VALUE(account_transfer, '$.additional_instructions')                                                    AS account_transfer_additional_instructions
    , JSON_VALUE(account_transfer, '$.acats_asset_sequence_number')                                                AS account_transfer_acats_asset_sequence_number
    , JSON_VALUE(account_transfer, '$.contra_party_id')                                                            AS account_transfer_contra_party_id
    , JSON_VALUE(account_transfer, '$.contra_party_account_number')                                                AS account_transfer_contra_party_account_number
    , JSON_VALUE(account_transfer, '$.method')                                                                    AS account_transfer_method

    -- tender_offer fields
    , JSON_VALUE(tender_offer, '$.symbol_description')                                                            AS tender_offer_symbol_description
    , JSON_VALUE(tender_offer, '$.target_cusip')                                                                AS tender_offer_target_cusip
    , CAST(JSON_VALUE(tender_offer, '$.cash_rate') AS FLOAT)                                                    AS tender_offer_cash_rate
    , JSON_VALUE(tender_offer, '$.corporate_action_general_information.corporate_action_id')                    AS tender_offer_corporate_action_id
    , JSON_VALUE(tender_offer, '$.corporate_action_general_information.target_symbol_description')                AS tender_offer_target_symbol_description
    , JSON_VALUE(tender_offer, '$.corporate_action_general_information.target_cusip')                            AS tender_offer_corporate_action_general_information_target_cusip
    , CAST(JSON_VALUE(tender_offer, '$.corporate_action_general_information.target_asset_id') AS FLOAT)            AS tender_offer_target_asset_id
    , JSON_VALUE(tender_offer, '$.corporate_action_general_information.disbursed_symbol_description')            AS tender_offer_disbursed_symbol_description
    , JSON_VALUE(tender_offer, '$.corporate_action_general_information.disbursed_cusip')                        AS tender_offer_disbursed_cusip
    , CAST(JSON_VALUE(tender_offer, '$.corporate_action_general_information.disbursed_asset_id') AS FLOAT)        AS tender_offer_disbursed_asset_id


    -- unit_split fields
    , JSON_VALUE(unit_split, '$.symbol_description')                                                            AS unit_split_symbol_description
    , CAST(JSON_VALUE(unit_split, '$.stock_rate') AS FLOAT)                                                        AS unit_split_stock_rate
    , JSON_VALUE(unit_split, '$.corporate_action_general_information.corporate_action_id')                        AS unit_split_corporate_action_id
    , JSON_VALUE(unit_split, '$.corporate_action_general_information.target_symbol_description')                AS unit_split_target_symbol_description
    , JSON_VALUE(unit_split, '$.corporate_action_general_information.target_cusip')                                AS unit_split_target_cusip
    , CAST(JSON_VALUE(unit_split, '$.corporate_action_general_information.target_asset_id') AS FLOAT)            AS unit_split_target_asset_id
    , JSON_VALUE(unit_split, '$.corporate_action_general_information.disbursed_symbol_description')                AS unit_split_disbursed_symbol_description
    , JSON_VALUE(unit_split, '$.corporate_action_general_information.disbursed_cusip')                            AS unit_split_disbursed_cusip
    , CAST(JSON_VALUE(unit_split, '$.corporate_action_general_information.disbursed_asset_id') AS FLOAT)        AS unit_split_disbursed_asset_id

    -- Exchange fields
    , JSON_VALUE(exchange, '$.symbol_description')                                                                AS exchange_symbol_description
    , JSON_VALUE(exchange, '$.old_cusip')                                                                        AS exchange_old_cusip
    , JSON_VALUE(exchange, '$.new_cusip')                                                                        AS exchange_new_cusip
    , CAST(JSON_VALUE(exchange, '$.cash_rate') AS FLOAT)                                                        AS exchange_cash_rate
    , CAST(JSON_VALUE(exchange, '$.stock_rate') AS FLOAT)                                                        AS exchange_stock_rate
    , JSON_VALUE(exchange, '$.type')                                                                            AS exchange_type
    , JSON_VALUE(exchange, '$.corporate_action_general_information.corporate_action_id')                        AS exchange_corporate_action_id
    , JSON_VALUE(exchange, '$.corporate_action_general_information.target_symbol_description')                    AS exchange_target_symbol_description
    , JSON_VALUE(exchange, '$.corporate_action_general_information.target_cusip')                                AS exchange_target_cusip
    , CAST(JSON_VALUE(exchange, '$.corporate_action_general_information.target_asset_id') AS FLOAT)                AS exchange_target_asset_id
    , JSON_VALUE(exchange, '$.corporate_action_general_information.disbursed_symbol_description')                AS exchange_disbursed_symbol_description
    , JSON_VALUE(exchange, '$.corporate_action_general_information.disbursed_cusip')                            AS exchange_disbursed_cusip
    , CAST(JSON_VALUE(exchange, '$.corporate_action_general_information.disbursed_asset_id') AS FLOAT)            AS exchange_disbursed_asset_id

    -- Conversion fields
    , JSON_VALUE(conversion, '$.symbol_description')                                                            AS conversion_symbol_description
    , JSON_VALUE(conversion, '$.old_cusip')                                                                        AS conversion_old_cusip
    , JSON_VALUE(conversion, '$.new_cusip')                                                                        AS conversion_new_cusip
    , CAST(JSON_VALUE(conversion, '$.cash_rate') AS FLOAT)                                                        AS conversion_cash_rate
    , CAST(JSON_VALUE(conversion, '$.stock_rate') AS FLOAT)                                                        AS conversion_stock_rate
    , JSON_VALUE(conversion, '$.type')                                                                            AS conversion_type
    , JSON_VALUE(conversion, '$.corporate_action_general_information.corporate_action_id')                        AS conversion_corporate_action_id
    , JSON_VALUE(conversion, '$.corporate_action_general_information.target_symbol_description')                AS conversion_target_symbol_description
    , JSON_VALUE(conversion, '$.corporate_action_general_information.target_cusip')                                AS conversion_target_cusip
    , CAST(JSON_VALUE(conversion, '$.corporate_action_general_information.target_asset_id') AS FLOAT)            AS conversion_target_asset_id
    , JSON_VALUE(conversion, '$.corporate_action_general_information.disbursed_symbol_description')                AS conversion_disbursed_symbol_description
    , JSON_VALUE(conversion, '$.corporate_action_general_information.disbursed_cusip')                            AS conversion_disbursed_cusip
    , CAST(JSON_VALUE(conversion, '$.corporate_action_general_information.disbursed_asset_id') AS FLOAT)        AS conversion_disbursed_asset_id

    ,account_memo
    -- Warrant Exercise Fields
    , JSON_VALUE(warrant_exercise, '$.symbol_description') AS warrant_exercise_symbol_description
    , JSON_VALUE(warrant_exercise, '$.corporate_action_general_information.corporate_action_id')                AS warrant_exercise_corporate_action_id
    , JSON_VALUE(warrant_exercise, '$.corporate_action_general_information.target_symbol_description')            AS warrant_exercise_target_symbol_description
    , JSON_VALUE(warrant_exercise, '$.corporate_action_general_information.target_cusip')                        AS warrant_exercise_target_cusip
    , CAST(JSON_VALUE(warrant_exercise, '$.corporate_action_general_information.target_asset_id') AS FLOAT)        AS warrant_exercise_target_asset_id
    , JSON_VALUE(warrant_exercise, '$.corporate_action_general_information.disbursed_symbol_description')        AS warrant_exercise_disbursed_symbol_description
    , JSON_VALUE(warrant_exercise, '$.corporate_action_general_information.disbursed_cusip')                    AS warrant_exercise_disbursed_cusip
    , CAST(JSON_VALUE(warrant_exercise, '$.corporate_action_general_information.disbursed_asset_id') AS FLOAT)    AS warrant_exercise_disbursed_asset_id

    -- Rights Subscription Fields
    , JSON_VALUE(rights_subscription, '$.symbol_description') AS rights_subscription_symbol_description
    , JSON_VALUE(rights_subscription, '$.corporate_action_general_information.corporate_action_id')                    AS rights_subscription_corporate_action_id
    , JSON_VALUE(rights_subscription, '$.corporate_action_general_information.target_symbol_description')            AS rights_subscription_target_symbol_description
    , JSON_VALUE(rights_subscription, '$.corporate_action_general_information.target_cusip')                        AS rights_subscription_target_cusip
    , CAST(JSON_VALUE(rights_subscription, '$.corporate_action_general_information.target_asset_id') AS FLOAT)        AS rights_subscription_target_asset_id
    , JSON_VALUE(rights_subscription, '$.corporate_action_general_information.disbursed_symbol_description')        AS rights_subscription_disbursed_symbol_description
    , JSON_VALUE(rights_subscription, '$.corporate_action_general_information.disbursed_cusip')                        AS rights_subscription_disbursed_cusip
    , CAST(JSON_VALUE(rights_subscription, '$.corporate_action_general_information.disbursed_asset_id') AS FLOAT)    AS rights_subscription_disbursed_asset_id

    -- Maturity Fields
    , CAST(JSON_VALUE(maturity, '$.cash_rate') AS FLOAT) AS maturity_cash_rate
    , CAST(JSON_VALUE(maturity, '$.quantity') AS FLOAT) AS maturity_quantity
    , JSON_VALUE(maturity, '$.payment_date') AS maturity_payment_date
    , JSON_VALUE(maturity, '$.corporate_action_general_information.corporate_action_id')                    AS maturity_corporate_action_id
    , JSON_VALUE(maturity, '$.corporate_action_general_information.target_symbol_description')                AS maturity_target_symbol_description
    , JSON_VALUE(maturity, '$.corporate_action_general_information.target_cusip')                            AS maturity_target_cusip
    , CAST(JSON_VALUE(maturity, '$.corporate_action_general_information.target_asset_id') AS FLOAT)            AS maturity_target_asset_id
    , JSON_VALUE(maturity, '$.corporate_action_general_information.disbursed_symbol_description')            AS maturity_disbursed_symbol_description
    , JSON_VALUE(maturity, '$.corporate_action_general_information.disbursed_cusip')                        AS maturity_disbursed_cusip
    , CAST(JSON_VALUE(maturity, '$.corporate_action_general_information.disbursed_asset_id') AS FLOAT)        AS maturity_disbursed_asset_id

    -- Drip Field
    , JSON_VALUE(drip, '$.action')                                                                            AS drip_action

    -- Fee fields
    , JSON_VALUE(fee, '$.additional_instructions')                                                            AS fee_additional_instructions

    -- Sweep fields
    , JSON_VALUE(sweep, '$.action')                                                                            AS sweep_action
    , JSON_VALUE(sweep, '$.type')                                                                            AS sweep_type
    , CAST(JSON_VALUE(sweep, '$.eod_redemption') AS BIT)                                                    AS sweep_eod_redemption

    ,subtype_category
    ,source_application
    ,source_application_id
    ,generation
    ,client_id
    ,suppress_downstream
    ,rounded_offset
    ,suppress_documents
    ,creation_time
    ,initiating_user_id
    ,previous_activity_id
    ,previous_process_date
    ,_key
    ,_ingested_at

    -- Kafka Metadata fields
    ,JSON_VALUE(_kafka_metadata, '$.topic')                                                                    AS kafka_metadata_topic
    ,CAST(JSON_VALUE(_kafka_metadata, '$.partition') AS INT)                                                AS kafka_metadata_partition
    ,CAST(JSON_VALUE(_kafka_metadata, '$.offset') AS FLOAT)                                                    AS kafka_metadata_offset

    -- Proto Metadata fields
    ,JSON_VALUE(_proto_metadata, '$.type_name')                                                                AS proto_metadata_type_name
    ,CAST(JSON_VALUE(_proto_metadata, '$.schema_id') AS INT)                                                AS proto_metadata_schema_id
    ,snapshot_timestamp
    ,correspondent_id
    ,source_file
    ,DATE_OF_DATA
    ,YEARMONTH
    ,LOADED_AT
FROM (
     SELECT
         account_id
        ,activity_id
        ,type
        ,sub_type
        ,symbol
        ,asset_type
        ,region_code
        ,asset_id
        ,side
        ,quantity
        ,currency_code
        ,currency_asset_id
        ,price
        ,gross_amount
        ,net_amount
        ,activity_date
        ,activity_time
        ,process_date
        ,settle_date
        ,state
        ,activity_description
        ,asset_description
        ,asset_version
        -- Parse and clean "trade" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(trade, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ','),'),','')                                                                                    AS trade
        -- Parse and clean "reverse_stock_split" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(reverse_stock_split, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',')                                                                                        AS reverse_stock_split
        -- Parse and clean "cash_dividend" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(cash_dividend, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',')                                                                                            AS cash_dividend
        -- Parse and clean "stock_dividend" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(stock_dividend, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                AS stock_dividend
        -- Parse and clean "withdrawal_deposit_transfer" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(withdrawal_deposit_transfer, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')    AS withdrawal_deposit_transfer
        --Parse and clean "stock_split" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(stock_split, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                    AS stock_split
        ,-- Parse and clean "name_change" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name_change, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                    AS name_change
        ,-- Parse and clean "capital_gains" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(capital_gains, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                    AS capital_gains
        ,-- Parse and clean "spinoff" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(spinoff, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                        AS spinoff
        ,-- Parse and clean "interest_payment" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(interest_payment, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                AS interest_payment
        -- Parse and clean "liquidation" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(liquidation, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ', ', ',')                                                                                                AS liquidation
        ,-- Parse and clean "dividend" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dividend, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                        AS dividend
        ,-- Parse and clean "sale_of_rights" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(sale_of_rights, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                    AS sale_of_rights
        ,-- Parse and clean "redemption_full" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(redemption_full, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                AS redemption_full
        ,-- Parse and clean "rights_distribution" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(rights_distribution, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')            AS rights_distribution
        ,-- Parse and clean "deposit" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(deposit, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                        AS deposit
        ,-- Parse and clean "withdrawal" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(withdrawal, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                        AS withdrawal
        ,-- Parse and clean "worthless" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(worthless, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                        AS worthless
        ,-- Parse and clean "transfer" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(transfer, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                        AS transfer
        ,-- Parse and clean "rounding_adjustment" field
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(rounding_adjustment, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')            AS rounding_adjustment
        ,fees
        ,withholdings
        ,commissions
        ,REPLACE(accrued_interests, '[]','') as accrued_interests
        -- Parse and clean "merger" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(merger, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                        AS merger
         -- Parse and clean "credit" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(credit, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                        AS credit
        -- Parse and clean "fpsl" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(fpsl, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                            AS fpsl
        -- Parse and clean "acats_pending_out" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(acats_pending_out, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                AS acats_pending_out
        -- Parse and clean "account_transfer" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(account_transfer, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                AS account_transfer
        -- Parse and clean "tender_offer" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(tender_offer, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                    AS tender_offer
        -- Parse and clean "unit_split" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(unit_split, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                    AS unit_split
        -- Parse and clean "exchange" field
        , REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(exchange, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                        AS exchange
        -- Parse and clean "conversion" field
        , REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(conversion, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                    AS conversion
        ,account_memo
        -- Parse and clean "warrant_exercise" field
        , REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(warrant_exercise, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                AS warrant_exercise
        -- Parse and clean "rights_subscription" field
        , REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(rights_subscription, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')            AS rights_subscription
        -- Parse and clean "maturity" field
        , REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(maturity, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                        AS maturity
        -- Parse and clean "drip" field
        , REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(drip, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                            AS drip
        -- Parse and clean "fee" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(fee, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                            AS fee
        -- Parse and clean "sweep" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(sweep, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                            AS sweep
        ,subtype_category
        ,source_application
        ,source_application_id
        ,generation
        ,client_id
        ,suppress_downstream
        ,rounded_offset
        ,suppress_documents
        ,creation_time
        ,initiating_user_id
        ,previous_activity_id
        ,previous_process_date
        ,_key
        ,_ingested_at
        -- Parse and clean "kafka_metadata" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(_kafka_metadata, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                AS _kafka_metadata
        -- Parse and clean "proto_metadata" field
        ,REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(_proto_metadata, '''', '"'), 'None', 'null'), 'False', 'false'), 'True', 'true'), 'Decimal(', ''), 'datetime.date(', ''), ')', ''), 'array([], dtype=object)', '[]'), 'array([', '['), '], dtype=object)', ']'), 'dtype=object', ''), ': ', ':')                AS _proto_metadata
        ,snapshot_timestamp
        ,correspondent_id
        ,source_file
        ,CONVERT(DATE, DATE_OF_DATA) AS DATE_OF_DATA
        ,CONVERT(INT,LEFT(REPLACE(REPLACE(RIGHT(source_file,18),'.parquet',''),'-',''),6)) as YEARMONTH
        ,LOADED_AT
    FROM "DQP_LANDING"."dbo"."APEX_daily_activities"
    
    WHERE
        source_file NOT IN (SELECT DISTINCT SOURCE_FILE FROM "DQP_BRONZE"."dbo"."bronze_apex_daily_activities")
    
    )ada -- convert all json fields to json sql server format
),
 bronze_data AS (
    SELECT
         account_id
        ,activity_id
        ,type
        ,sub_type
        ,symbol
        ,asset_type
        ,region_code
        ,asset_id
        ,side
        ,quantity
        ,currency_code
        ,currency_asset_id
        ,price
        ,gross_amount
        ,net_amount
        ,activity_date
        ,activity_time
        ,process_date
        ,settle_date
        ,state
        ,activity_description
        ,asset_description
        ,asset_version
        ,trade_symbol_description
        ,trade_additional_instructions
        ,trade_special_instructions
        ,trade_client_order_id
        ,trade_exchange
        ,trade_broker_capacity
        ,trade_route
        ,trade_algo
        ,trade_broker
        ,trade_execution_id
        ,trade_markup
        ,trade_markdown
        ,trade_execution_only
        ,trade_when_issued
        ,trade_when_distributed
        ,trade_is_writeoff
        ,trade_client_memos
        ,trade_order_id
        ,trade_alternate_order_id
        ,trade_external_id
        ,trade_source_account_id
        ,trade_booking_api_trade_id
        ,trade_booking_api_trade_allocation_id
        ,trade_gateway_client_order_id
        ,trade_internal_error
        ,trade_prevailing_market_price
        ,trade_price_adjustment_type
        ,trade_price_adjustment_amount
        ,trade_price_adjustment_percent
        ,trade_yield_records
        ,reverse_stock_split_symbol_description
        ,reverse_stock_split_factor_numerator
        ,reverse_stock_split_factor_denominator
        ,reverse_stock_split_quantity
        ,reverse_stock_split_new_cusip
        ,reverse_stock_split_cash_rate
        ,reverse_stock_split_old_cusip
        ,reverse_stock_split_action
        ,reverse_stock_split_effective_date
        ,reverse_stock_split_corporate_action_id
        ,reverse_stock_split_target_symbol_description
        ,reverse_stock_split_target_cusip
        ,reverse_stock_split_target_asset_id
        ,reverse_stock_split_disbursed_symbol_description
        ,reverse_stock_split_disbursed_cusip
        ,reverse_stock_split_disbursed_asset_id
        ,cash_dividend_symbol_description
        ,cash_dividend_cash_rate
        ,cash_dividend_settled
        ,cash_dividend_record_date
        ,cash_dividend_payment_date
        ,cash_dividend_tefra_withholding
        ,cash_dividend_foreign_withholding
        ,cash_dividend_nra_withholding
        ,cash_dividend_qualified
        ,cash_dividend_long_term_gain
        ,cash_dividend_free
        ,cash_dividend_fpsl
        ,cash_dividend_is_substitute_payment
        ,cash_dividend_subtype
        ,cash_dividend_quantity
        ,cash_dividend_corporate_action_id
        ,cash_dividend_target_symbol_description
        ,cash_dividend_target_cusip
        ,cash_dividend_target_asset_id
        ,cash_dividend_disbursed_symbol_description
        ,cash_dividend_disbursed_cusip
        ,cash_dividend_disbursed_asset_id
        ,cash_dividend_reinvested
        ,stock_dividend_rate
        ,stock_dividend_quantity
        ,stock_dividend_record_date
        ,stock_dividend_pay_date
        ,stock_dividend_corporate_action_id
        ,stock_dividend_target_symbol_description
        ,stock_dividend_target_cusip
        ,stock_dividend_target_asset_id
        ,stock_dividend_disbursed_symbol_description
        ,stock_dividend_disbursed_cusip
        ,stock_dividend_disbursed_asset_id
        ,withdrawal_deposit_transfer_originating_institution
        ,withdrawal_deposit_transfer_destination_institution
        ,withdrawal_deposit_transfer_additional_instructions
        ,stock_split_factor_numerator
        ,stock_split_factor_denominator
        ,stock_split_quantity
        ,stock_split_record_date
        ,stock_split_pay_date
        ,stock_split_corporate_action_id
        ,stock_split_target_symbol_description
        ,stock_split_target_cusip
        ,stock_split_target_asset_id
        ,stock_split_disbursed_symbol_description
        ,stock_split_disbursed_cusip
        ,stock_split_disbursed_asset_id
        ,name_change_old_symbol_description
        ,name_change_quantity
        ,name_change_old_cusip
        ,name_change_new_cusip
        ,name_change_action
        ,name_change_effective_date
        ,name_change_corporate_action_id
        ,name_change_target_symbol_description
        ,name_change_target_cusip
        ,name_change_target_asset_id
        ,name_change_disbursed_symbol_description
        ,name_change_disbursed_cusip
        ,name_change_disbursed_asset_id
        ,capital_gains_quantity
        ,capital_gains_record_date
        ,capital_gains_payment_date
        ,capital_gains_long_term_gain
        ,capital_gains_corporate_action_id
        ,capital_gains_target_symbol_description
        ,capital_gains_target_cusip
        ,capital_gains_target_asset_id
        ,capital_gains_disbursed_symbol_description
        ,capital_gains_disbursed_cusip
        ,capital_gains_disbursed_asset_id
        ,capital_gains_reinvested
        ,spinoff_old_symbol_description
        ,spinoff_new_symbol_description
        ,spinoff_quantity
        ,spinoff_record_date
        ,spinoff_pay_date
        ,spinoff_corporate_action_id
        ,spinoff_target_symbol_description
        ,spinoff_target_cusip
        ,spinoff_target_asset_id
        ,spinoff_disbursed_symbol_description
        ,spinoff_disbursed_cusip
        ,spinoff_disbursed_asset_id
        ,interest_payment_symbol_description
        ,interest_payment_cash_rate
        ,interest_payment_settled
        ,interest_payment_record_date
        ,interest_payment_payment_date
        ,interest_payment_corporate_action_id
        ,interest_payment_target_symbol_description
        ,interest_payment_target_cusip
        ,interest_payment_target_asset_id
        ,interest_payment_disbursed_symbol_description
        ,interest_payment_disbursed_cusip
        ,interest_payment_disbursed_asset_id
        ,liquidation_symbol_description
        ,liquidation_cash_rate
        ,liquidation_quantity
        ,liquidation_settled
        ,liquidation_action
        ,liquidation_subtype
        ,liquidation_record_date
        ,liquidation_payment_date
        ,liquidation_effective_date
        ,liquidation_corporate_action_id
        ,liquidation_target_symbol_description
        ,liquidation_target_cusip
        ,liquidation_target_asset_id
        ,liquidation_disbursed_symbol_description
        ,liquidation_disbursed_cusip
        ,liquidation_disbursed_asset_id
        ,dividend_symbol_description
        ,dividend_cash_rate
        ,dividend_settled
        ,dividend_record_date
        ,dividend_subtype
        ,dividend_corporate_action_id
        ,dividend_target_symbol_description
        ,dividend_target_cusip
        ,dividend_target_asset_id
        ,dividend_disbursed_symbol_description
        ,dividend_disbursed_cusip
        ,dividend_disbursed_asset_id
        ,sale_of_rights_symbol_description
        ,sale_of_rights_cash_rate
        ,sale_of_rights_settled
        ,sale_of_rights_record_date
        ,sale_of_rights_payment_date
        ,sale_of_rights_corporate_action_id
        ,sale_of_rights_target_symbol_description
        ,sale_of_rights_target_cusip
        ,sale_of_rights_target_asset_id
        ,sale_of_rights_disbursed_symbol_description
        ,sale_of_rights_disbursed_cusip
        ,sale_of_rights_disbursed_asset_id
        ,redemption_full_symbol_description
        ,redemption_full_cash_rate
        ,redemption_full_quantity
        ,redemption_full_action
        ,redemption_full_subtype
        ,redemption_full_payment_date
        ,redemption_full_corporate_action_id
        ,redemption_full_target_symbol_description
        ,redemption_full_target_cusip
        ,redemption_full_target_asset_id
        ,redemption_full_disbursed_symbol_description
        ,redemption_full_disbursed_cusip
        ,redemption_full_disbursed_asset_id
        ,rights_distribution_new_symbol_description
        ,rights_distribution_settled
        ,rights_distribution_record_date
        ,rights_distribution_payment_date
        ,rights_distribution_corporate_action_id
        ,rights_distribution_target_symbol_description
        ,rights_distribution_target_cusip
        ,rights_distribution_target_asset_id
        ,rights_distribution_disbursed_symbol_description
        ,rights_distribution_disbursed_cusip
        ,rights_distribution_disbursed_asset_id
        ,deposit_contribution_type
        ,deposit_contribution_year
        ,deposit_conversion
        ,deposit_futures_settlement
        ,deposit_micro
        ,deposit_retirement_type
        ,deposit_type
        ,deposit_originating_institution
        ,deposit_destination_institution
        ,deposit_additional_instructions
        ,deposit_fed_reference_number
        ,deposit_originating_account_number
        ,withdrawal_conversion
        ,withdrawal_distribution_type
        ,withdrawal_distribution_year
        ,withdrawal_closing_account
        ,withdrawal_futures_settlement
        ,withdrawal_micro
        ,withdrawal_periodic
        ,withdrawal_retirement_type
        ,withdrawal_taxable
        ,withdrawal_type
        ,withdrawal_advance
        ,withdrawal_originating_institution
        ,withdrawal_destination_institution
        ,withdrawal_additional_instructions
        ,withdrawal_fed_reference_number
        ,withdrawal_destination_account_number
        ,worthless_symbol_description
        ,worthless_effective_date
        ,worthless_payment_date
        ,worthless_corporate_action_id
        ,worthless_target_symbol_description
        ,worthless_target_cusip
        ,worthless_target_asset_id
        ,worthless_disbursed_symbol_description
        ,worthless_disbursed_cusip
        ,worthless_disbursed_asset_id
        ,transfer_first_party
        ,transfer_originating_institution
        ,transfer_destination_institution
        ,transfer_additional_instructions
        ,transfer_client_brokerage
        ,transfer_transfer_type
        ,rounding_adjustment_rounding_reason
        ,fees
        ,withholdings
        ,commissions
        ,accrued_interests
        ,merger_symbol_description
        ,merger_quantity
        ,merger_old_cusip
        ,merger_new_cusip
        ,merger_cash_rate
        ,merger_stock_rate
        ,merger_type
        ,merger_action
        ,merger_effective_date
        ,merger_corporate_action_id
        ,merger_target_symbol_description
        ,merger_target_cusip
        ,merger_target_asset_id
        ,merger_disbursed_symbol_description
        ,merger_disbursed_cusip
        ,merger_disbursed_asset_id
        ,credit_credit_type
        ,credit_taxable
        ,credit_additional_instructions
        ,fpsl_action
        ,account_transfer_action
        ,account_transfer_acats_control_number
        ,account_transfer_institution
        ,account_transfer_additional_instructions
        ,account_transfer_acats_asset_sequence_number
        ,account_transfer_contra_party_id
        ,account_transfer_contra_party_account_number
        ,account_transfer_method
        ,tender_offer_symbol_description
        ,tender_offer_target_cusip
        ,tender_offer_cash_rate
        ,tender_offer_corporate_action_id
        ,tender_offer_target_symbol_description
        ,tender_offer_corporate_action_general_information_target_cusip
        ,tender_offer_target_asset_id
        ,tender_offer_disbursed_symbol_description
        ,tender_offer_disbursed_cusip
        ,tender_offer_disbursed_asset_id
        ,unit_split_symbol_description
        ,unit_split_stock_rate
        ,unit_split_corporate_action_id
        ,unit_split_target_symbol_description
        ,unit_split_target_cusip
        ,unit_split_target_asset_id
        ,unit_split_disbursed_symbol_description
        ,unit_split_disbursed_cusip
        ,unit_split_disbursed_asset_id
        ,exchange_symbol_description
        ,exchange_old_cusip
        ,exchange_new_cusip
        ,exchange_cash_rate
        ,exchange_stock_rate
        ,exchange_type
        ,exchange_corporate_action_id
        ,exchange_target_symbol_description
        ,exchange_target_cusip
        ,exchange_target_asset_id
        ,exchange_disbursed_symbol_description
        ,exchange_disbursed_cusip
        ,exchange_disbursed_asset_id
        ,conversion_symbol_description
        ,conversion_old_cusip
        ,conversion_new_cusip
        ,conversion_cash_rate
        ,conversion_stock_rate
        ,conversion_type
        ,conversion_corporate_action_id
        ,conversion_target_symbol_description
        ,conversion_target_cusip
        ,conversion_target_asset_id
        ,conversion_disbursed_symbol_description
        ,conversion_disbursed_cusip
        ,conversion_disbursed_asset_id
        ,account_memo
        ,warrant_exercise_symbol_description
        ,warrant_exercise_corporate_action_id
        ,warrant_exercise_target_symbol_description
        ,warrant_exercise_target_cusip
        ,warrant_exercise_target_asset_id
        ,warrant_exercise_disbursed_symbol_description
        ,warrant_exercise_disbursed_cusip
        ,warrant_exercise_disbursed_asset_id
        ,rights_subscription_symbol_description
        ,rights_subscription_corporate_action_id
        ,rights_subscription_target_symbol_description
        ,rights_subscription_target_cusip
        ,rights_subscription_target_asset_id
        ,rights_subscription_disbursed_symbol_description
        ,rights_subscription_disbursed_cusip
        ,rights_subscription_disbursed_asset_id
        ,maturity_cash_rate
        ,maturity_quantity
        ,maturity_payment_date
        ,maturity_corporate_action_id
        ,maturity_target_symbol_description
        ,maturity_target_cusip
        ,maturity_target_asset_id
        ,maturity_disbursed_symbol_description
        ,maturity_disbursed_cusip
        ,maturity_disbursed_asset_id
        ,drip_action
        ,fee_additional_instructions
        ,sweep_action
        ,sweep_type
        ,sweep_eod_redemption
        ,subtype_category
        ,source_application
        ,source_application_id
        ,generation
        ,client_id
        ,suppress_downstream
        ,rounded_offset
        ,suppress_documents
        ,creation_time
        ,initiating_user_id
        ,previous_activity_id
        ,previous_process_date
        ,_key
        ,_ingested_at
        ,kafka_metadata_topic
        ,kafka_metadata_partition
        ,kafka_metadata_offset
        ,proto_metadata_type_name
        ,proto_metadata_schema_id
        ,snapshot_timestamp
        ,correspondent_id
        ,source_file
        ,DATE_OF_DATA
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data

)




SELECT * FROM BRONZE_DATA


-- NAME: BRONZE_APEX_DAILY_OVERNIGHT_BALANCES
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: November 20, 2024




WITH landing_data as (
    SELECT
        account_id
        ,firm
        ,process_date
        ,currency_code
        ,CAST(CAST(total_equity AS FLOAT(48))  AS DECIMAL(18,9))                                    AS total_equity
        ,CAST(CAST(margin_equity AS FLOAT(48))  AS DECIMAL(18,9))                                    AS margin_equity
        ,CAST(CAST(margin_requirement AS FLOAT(48))  AS DECIMAL(18,9))                                AS margin_requirement
        ,CAST(CAST(margin_excess_equity AS FLOAT(48))  AS DECIMAL(18,9))                            AS margin_excess_equity
        ,CAST(CAST(cash_equity AS FLOAT(48))  AS DECIMAL(18,9))                                        AS cash_equity
        ,CAST(CAST(cash_requirement AS FLOAT(48))  AS DECIMAL(18,9))                                AS cash_requirement
        ,CAST(CAST(cash_excess_equity AS FLOAT(48))  AS DECIMAL(18,9))                                AS cash_excess_equity
        ,CAST(CAST(margin_requirement_with_concentration AS FLOAT(48))  AS DECIMAL(18,9))            AS margin_requirement_with_concentration
        ,CAST(CAST(margin_excess_equity_with_concentration AS FLOAT(48))  AS DECIMAL(18,9))            AS margin_excess_equity_with_concentration
        ,CAST(CAST(overnight_buying_power_calculated AS FLOAT(48))  AS DECIMAL(18,9))                AS overnight_buying_power_calculated
        ,CAST(CAST(overnight_buying_power_issued AS FLOAT(48))  AS DECIMAL(18,9))                    AS overnight_buying_power_issued
        ,CAST(CAST(day_trade_buying_power_issued AS FLOAT(48))  AS DECIMAL(18,9))                    AS day_trade_buying_power_issued
        ,CAST(CAST(regt_buying_power_calculated AS FLOAT(48))  AS DECIMAL(18,9))                    AS regt_buying_power_calculated
        ,CAST(CAST(regt_buying_power_issued AS FLOAT(48))  AS DECIMAL(18,9))                        AS regt_buying_power_issued
        ,CAST(CAST(overnight_factor_calculated AS FLOAT(48))  AS DECIMAL(18,9))                        AS overnight_factor_calculated
        ,CAST(CAST(overnight_factor_issued AS FLOAT(48))  AS DECIMAL(18,9))                            AS overnight_factor_issued
        ,CAST(CAST(day_trade_factor_calculated AS FLOAT(48))  AS DECIMAL(18,9))                        AS day_trade_factor_calculated
        ,CAST(CAST(day_trade_factor_issued AS FLOAT(48))  AS DECIMAL(18,9))                            AS day_trade_factor_issued
        ,CAST(CAST(margin_equity_percent AS FLOAT(48))  AS DECIMAL(18,9))                            AS margin_equity_percent
        ,CAST(CAST(position_market_value AS FLOAT(48))  AS DECIMAL(18,9))                            AS position_market_value
        ,CAST(CAST(long_equity_market_value AS FLOAT(48))  AS DECIMAL(18,9))                        AS long_equity_market_value
        ,CAST(CAST(short_equity_market_value AS FLOAT(48))  AS DECIMAL(18,9))                        AS short_equity_market_value
        ,CAST(CAST(long_option_market_value AS FLOAT(48))  AS DECIMAL(18,9))                        AS long_option_market_value
        ,CAST(CAST(short_option_market_value AS FLOAT(48))  AS DECIMAL(18,9))                        AS short_option_market_value
        ,CAST(CAST(total_trade_balance AS FLOAT(48))  AS DECIMAL(18,9))                                AS total_trade_balance
        ,CAST(CAST(total_settle_balance AS FLOAT(48))  AS DECIMAL(18,9))                            AS total_settle_balance
        ,CAST(CAST(cash_trade_balance AS FLOAT(48))  AS DECIMAL(18,9))                                AS cash_trade_balance
        ,CAST(CAST(margin_trade_balance AS FLOAT(48))  AS DECIMAL(18,9))                            AS margin_trade_balance
        ,CAST(CAST(short_trade_balance AS FLOAT(48))  AS DECIMAL(18,9))                                AS short_trade_balance
        ,CAST(CAST(money_market_trade_balance AS FLOAT(48))  AS DECIMAL(18,9))                        AS money_market_trade_balance
        ,CAST(CAST(cash_settle_balance AS FLOAT(48))  AS DECIMAL(18,9))                                AS cash_settle_balance
        ,CAST(CAST(margin_settle_balance AS FLOAT(48))  AS DECIMAL(18,9))                            AS margin_settle_balance
        ,CAST(CAST(short_settle_balance AS FLOAT(48))  AS DECIMAL(18,9))                            AS short_settle_balance
        ,CAST(CAST(money_market_settle_balance AS FLOAT(48))  AS DECIMAL(18,9))                        AS money_market_settle_balance
        ,CAST(CAST(free_cash AS FLOAT(48))  AS DECIMAL(18,9))                                        AS free_cash
        ,CAST(CAST(sma AS FLOAT(48))  AS DECIMAL(18,9))                                                AS sma
        ,CAST(CAST(available_to_withdraw AS FLOAT(48))  AS DECIMAL(18,9))                            AS available_to_withdraw
        ,CAST(CAST(future_balance AS FLOAT(48))  AS DECIMAL(18,9))                                    AS future_balance
        ,CAST(CAST(future_equity AS FLOAT(48))  AS DECIMAL(18,9))                                    AS future_equity
        ,CAST(CAST(future_requirement AS FLOAT(48))  AS DECIMAL(18,9))                                AS future_requirement
        ,CAST(CAST(options_requirement AS FLOAT(48))  AS DECIMAL(18,9))                                AS options_requirement
        ,CAST(CAST(non_options_requirement AS FLOAT(48))  AS DECIMAL(18,9))                            AS non_options_requirement
        ,last_update_time
        ,CAST(CAST(non_options_requirement_not_concentrated AS FLOAT(48))  AS DECIMAL(18,9))        AS non_options_requirement_not_concentrated
        ,CAST(CAST(type1_unavailable_cash_proceeds AS FLOAT(48))  AS DECIMAL(18,9))                    AS type1_unavailable_cash_proceeds
        ,CAST(CAST(type2_unavailable_cash_proceeds AS FLOAT(48))  AS DECIMAL(18,9))                    AS type2_unavailable_cash_proceeds
        ,CAST(CAST(net_balance AS FLOAT(48))  AS DECIMAL(18,9))                                        AS net_balance
        ,CAST(CAST(sma_committed AS FLOAT(48))  AS DECIMAL(18,9))                                    AS sma_committed
        ,CAST(CAST(high_water_mark AS FLOAT(48))  AS DECIMAL(18,9))                                    AS high_water_mark
        ,CAST(CAST(margin_requirement_nyse AS FLOAT(48))  AS DECIMAL(18,9))                            AS margin_requirement_nyse
        ,CAST(CAST(margin_excess_equity_nyse AS FLOAT(48))  AS DECIMAL(18,9))                        AS margin_excess_equity_nyse
        ,CAST(CAST(settled_cash_available_to_withdraw AS FLOAT(48))  AS DECIMAL(18,9))                AS settled_cash_available_to_withdraw
        ,snapshot_timestamp
        ,correspondent_id
        ,source_file
        ,CONVERT(DATE, DATE_OF_DATA) AS DATE_OF_DATA
        ,CONVERT(INT,LEFT(REPLACE(REPLACE(RIGHT(source_file,18),'.parquet',''),'-',''),6))          AS YEARMONTH
        ,LOADED_AT
    FROM "DQP_LANDING"."dbo"."APEX_daily_overnight_balances"
    
    WHERE
        source_file NOT IN (SELECT DISTINCT SOURCE_FILE FROM "DQP_BRONZE"."dbo"."bronze_apex_daily_overnight_balances")
    
),
bronze_data as (
    SELECT
        account_id
        ,firm
        ,process_date
        ,currency_code
        ,total_equity
        ,margin_equity
        ,margin_requirement
        ,margin_excess_equity
        ,cash_equity
        ,cash_requirement
        ,cash_excess_equity
        ,margin_requirement_with_concentration
        ,margin_excess_equity_with_concentration
        ,overnight_buying_power_calculated
        ,overnight_buying_power_issued
        ,day_trade_buying_power_issued
        ,regt_buying_power_calculated
        ,regt_buying_power_issued
        ,overnight_factor_calculated
        ,overnight_factor_issued
        ,day_trade_factor_calculated
        ,day_trade_factor_issued
        ,margin_equity_percent
        ,position_market_value
        ,long_equity_market_value
        ,short_equity_market_value
        ,long_option_market_value
        ,short_option_market_value
        ,total_trade_balance
        ,total_settle_balance
        ,cash_trade_balance
        ,margin_trade_balance
        ,short_trade_balance
        ,money_market_trade_balance
        ,cash_settle_balance
        ,margin_settle_balance
        ,short_settle_balance
        ,money_market_settle_balance
        ,free_cash
        ,sma
        ,available_to_withdraw
        ,future_balance
        ,future_equity
        ,future_requirement
        ,options_requirement
        ,non_options_requirement
        ,last_update_time
        ,non_options_requirement_not_concentrated
        ,type1_unavailable_cash_proceeds
        ,type2_unavailable_cash_proceeds
        ,net_balance
        ,sma_committed
        ,high_water_mark
        ,margin_requirement_nyse
        ,margin_excess_equity_nyse
        ,settled_cash_available_to_withdraw
        ,snapshot_timestamp
        ,correspondent_id
        ,source_file
        ,DATE_OF_DATA
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM  landing_data

)




SELECT * FROM bronze_data


-- NAME: BRONZE_APEX_DAILY_POSITIONS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: November 20, 2024




WITH landing_data as (
    SELECT
        account_id
        ,asset_id
        ,date
        ,CAST(CAST(trade AS FLOAT(48))  AS DECIMAL(18,9))                    AS trade
        ,CAST(CAST(settled AS FLOAT(48))  AS DECIMAL(18,9))                    AS settled
        ,last_adjusted_date
        ,CAST(CAST(adjusted_trade AS FLOAT(48))  AS DECIMAL(18,9))            AS adjusted_trade
        ,CAST(CAST(adjusted_settled AS FLOAT(48))  AS DECIMAL(18,9))        AS adjusted_settled
        ,CAST(CAST(free AS FLOAT(48))  AS DECIMAL(18,9))                    AS free
        ,CAST(CAST(fpsl AS FLOAT(48))  AS DECIMAL(18,9))                    AS fpsl
        ,CAST(CAST(pending_outgoing_acat AS FLOAT(48))  AS DECIMAL(18,9))    AS pending_outgoing_acat
        ,CAST(CAST(unrestricted AS FLOAT(48))  AS DECIMAL(18,9))            AS unrestricted
        ,CAST(CAST(pending_drip AS FLOAT(48))  AS DECIMAL(18,9))            AS pending_drip
        ,CAST(CAST(pending_withdrawal AS FLOAT(48))  AS DECIMAL(18,9))        AS pending_withdrawal
        ,snapshot_timestamp
        ,correspondent_id
        ,source_file
        ,CONVERT(DATE, DATE_OF_DATA) AS DATE_OF_DATA
        ,CONVERT(INT,LEFT(REPLACE(REPLACE(RIGHT(source_file,18),'.parquet',''),'-',''),6))    AS YEARMONTH
        ,LOADED_AT
    FROM "DQP_LANDING"."dbo"."APEX_daily_positions"
    
    WHERE
        source_file NOT IN (SELECT DISTINCT SOURCE_FILE FROM "DQP_BRONZE"."dbo"."bronze_apex_daily_positions")
    

),
bronze_data as (
    SELECT
         account_id
        ,asset_id
        ,date
        ,trade
        ,settled
        ,last_adjusted_date
        ,adjusted_trade
        ,adjusted_settled
        ,free
        ,fpsl
        ,pending_outgoing_acat
        ,unrestricted
        ,pending_drip
        ,pending_withdrawal
        ,snapshot_timestamp
        ,correspondent_id
        ,source_file
        ,DATE_OF_DATA
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    from landing_data

)





select * from bronze_data


-- NAME: BRONZE_APEX_DAILY_STOCK_RECORD
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: November 20, 2024



WITH landing_data as (
    SELECT
        Id
        ,business_date
        ,branch_id
        ,account_id
        ,account_type
        ,account_class
        ,account_class_type
        ,account_name
        ,account_group_id
        ,asset_id
        ,asset_type
        ,asset_country
        ,cusip
        ,symbol
        ,symbol_description
        ,CAST(CAST(trade_position AS FLOAT(48))  AS DECIMAL(18,9))                AS trade_position
        ,CAST(CAST(settled_position AS FLOAT(48))  AS DECIMAL(18,9))            AS settled_position
        ,CAST(CAST(closing_price AS FLOAT(48))  AS DECIMAL(18,9))                AS closing_price
        ,closing_price_date
        ,CAST(CAST(factor AS FLOAT(48))  AS DECIMAL(18,9))                        AS factor
        ,CAST(CAST(trade_position_value AS FLOAT(48))  AS DECIMAL(18,9))        AS trade_position_value
        ,CAST(CAST(settled_position_value AS FLOAT(48))  AS DECIMAL(18,9))        AS settled_position_value
        ,contract_price
        ,currency_code
        ,CAST(CAST(currency_rate AS FLOAT(48))  AS DECIMAL(18,9))                AS currency_rate
        ,CAST(CAST(trade_position_value_usd AS FLOAT(48))  AS DECIMAL(18,9))    AS trade_position_value_usd
        ,CAST(CAST(settled_position_value_usd AS FLOAT(48))  AS DECIMAL(18,9))    AS settled_position_value_usd
        ,ref_id
        ,source
        ,created_date
        ,allocation_code
        ,correspondent_code
        ,trading_mpid
        ,account_number
        ,correspondent_id
        ,CAST(CAST(fpsl_position AS FLOAT(48))  AS DECIMAL(18,9))                AS fpsl_position
        ,snapshot_timestamp
        ,source_file
        ,CONVERT(DATE, DATE_OF_DATA) AS DATE_OF_DATA
        ,CONVERT(INT,LEFT(REPLACE(REPLACE(RIGHT(source_file,18),'.parquet',''),'-',''),6)) AS YEARMONTH
        ,LOADED_AT
    from "DQP_LANDING"."dbo"."APEX_daily_stock_record"
    
    WHERE
        source_file NOT IN (SELECT DISTINCT SOURCE_FILE FROM "DQP_BRONZE"."dbo"."bronze_apex_daily_stock_record")
    
),
bronze_data AS (
    SELECT
          Id
        ,business_date
        ,branch_id
        ,account_id
        ,account_type
        ,account_class
        ,account_class_type
        ,account_name
        ,account_group_id
        ,asset_id
        ,asset_type
        ,asset_country
        ,cusip
        ,symbol
        ,symbol_description
        ,trade_position
        ,settled_position
        ,closing_price
        ,closing_price_date
        ,factor
        ,trade_position_value
        ,settled_position_value
        ,contract_price
        ,currency_code
        ,currency_rate
        ,trade_position_value_usd
        ,settled_position_value_usd
        ,ref_id
        ,source
        ,created_date
        ,allocation_code
        ,correspondent_code
        ,trading_mpid
        ,account_number
        ,correspondent_id
        ,fpsl_position
        ,snapshot_timestamp
        ,source_file
        ,DATE_OF_DATA
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data

)





select * from bronze_data


-- NAME: APEX_ONBOARDING_STATUS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: November 20, 2024




WITH landing_data as (
    SELECT
        id
        ,cif
        ,partnerUserId
        ,status
        ,partnerAccountId
        ,createdAt
        ,updatedAt
        ,partnerFileUploadId
        ,failureReason
        ,failures
        ,brokerAccountId
        ,CONVERT(DATE, getdate()) AS AsOfDate
        ,NULL AS YEARMONTH
        ,loaded_at
    FROM "DQP_LANDING"."dbo"."APEX_onboarding_status"
),
bronze_data as (
    SELECT
        id
        ,cif
        ,partnerUserId
        ,status
        ,partnerAccountId
        ,createdAt
        ,updatedAt
        ,partnerFileUploadId
        ,failureReason
        ,failures
        ,brokerAccountId
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6),AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
    WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_apex_onboarding_status"),'1970-01-01 00:00:00.000')
    
)






select * from bronze_data


