-- NAME: SILVER_PRODUCT_FIS_CD300
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: January 26, 2026

{{
   config(
          tags=["fis_standard_weekday"]
        )
}}

WITH silver_data AS (
    SELECT
        [future_use_1_4]                                    AS FUTURE_USE
        ,[corp_id_5_6]                                      AS CORP_ID
        ,[acct_num_7_22_masked]                             AS ACCOUNT_NUMBER
        ,[crdt_lmt_23_35]                                   AS CREDIT_LIMIT
        ,[curr_bal_36_48]                                   AS CURRENT_BALANCE
        ,[avail_credit_49_61]                               AS AVAILABLE_CREDIT
        ,[outstanding_auth_amt_62_74]                       AS OUTSTANDING_AUTHORIZATION_AMOUNT
        ,[outstanding_auth_num_75_77]                       AS OUTSTANDING_AUTHORIZATION_NUMBER
        ,[block_code_78_78]                                 AS BLOCK_CODE
        ,[reclass_code_79_79]                               AS RECLASS_CODE
        ,[rltnshp_acct_80_95]                               AS RELATIONSHIP_ACCOUNT
        ,[ltd_num_mnths_pst_due_96_98]                      AS LTD_NUMBER_MONTHS_PASTDUE
        ,[primary_nm_99_124]                                AS PRIMARY_NAME
        ,[mnth_to_dt_pymnt_125_137]                         AS MONTH_TO_DATE_PAYMENT
        ,[lst_stmnt_bal_138_150]                            AS LAST_STATEMENT_BALANCE
        ,[amt_of_lst_pymnt_151_163]                         AS AMOUNT_LAST_PAYMENT
        ,[dt_of_lst_pymnt_164_171]                          AS DATE_OF_LAST_PAYMENT
        ,[dt_lst_purch_172_179]                             AS DATE_OF_LAST_PURCHASE
        ,[dt_lst_csh_advnc_180_187]                         AS DATE_OF_LAST_CASH_ADVANCE
        ,[dlnqntamt_188_200]                                AS DELINQUENT_AMOUNT
        ,[pymnt_due_201_213]                                AS PAYMENT_DUE
        ,[dt_pymnt_due_214_221]                             AS DATE_PAYMENT_DUE
        ,[exprtn_dt_222_227]                                AS EXPIRATION_DATE
        ,[pst_due_hstry_12_01_228_239]                      AS PAST_DUE_HISTORY
        ,[ssn_prmry_240_252]                                AS SSN_PRIMARY
        ,[ssn_scndry_253_265]                               AS SSN_SECODARY
        ,[visa_plstc_out_266_267]                           AS VISA_PLASTICS_OUT
        ,[mc_pstc_out_268_269]                              AS MASTERCARD_PLASTICS_OUT
        ,[cycle_dy_chng_270_271]                            AS CYCLE_DAY_CHANGE
        ,[typ_plstc_1_272_272]                              AS TYPE_PLASTIC_1
        ,[typ_plstc_273_273]                                AS TYPE_PLASTIC_2
        ,[rss_dnl_code_274_275]                             AS REISSUE_DENIAL_CODE
        ,[spcl_sttmnt_grp_cd_276_276]                       AS SPECIAL_STATEMENT_GROUP_CODE
        ,[pymn_cd_277_277]                                  AS PAYMENT_CODE
        ,[crd_fee_indctr_278_278]                           AS CARD_FEE_INDICATOR
        ,[crd_lf_cd_279_279]                                AS CREDIT_LIFE_CODE
        ,[auto_py_ac_typ_280_280]                           AS AUTO_PAY_AC_TYPE
        ,[bill_day_281_282]                                 AS BILL_DAY
        ,[tot_bal_fwd_csh_283_295]                          AS TOTAL_BALANCE_FORWARD_CASH
        ,[curr_bill_cd_296_303]                             AS CURRENT_BILL_CODE
        ,[curr_bill_dt_304_311]                             AS CURRENT_BILL_DATE
        ,[crss_ref_num_312_327]                             AS CROSS_REFERENCE_NUMBER
        ,[curr_pymnt_fxd_328_340]                           AS CURRENT_PAYMENT_FIXED
        ,[dt_lst_fee_chrgd_341_348]                         AS DATE_LAST_FEE_CHARGED
        ,[crd_lmt_chng_dt_1_349_356]                        AS CREDIT_LIMIT_CHANGE_DATE_1
        ,[dda_acct_num_357_373]                             AS DDA_ACCOUNT_NUMBER
        ,[prev_bllng_dt_374_381]                            AS PREVIOUS_BILLING_DATE
        ,[frst_us_dt_382_389]                               AS FIRST_USE_DATE
        ,[lf_hgh_bal_amt_390_402]                           AS LIFE_HIGH_BALANCE_AMOUNT
        ,[lst_addrss_chng_dt_403_410]                       AS LAST_ADDRESS_CHANGE_DATE
        ,[dspt_amt_411_423]                                 AS DISPUTE_AMOUNT
        ,[lst_blckd_dt_424_431]                             AS LAST_BLOCKED_DATE
        ,[prdct_cd_432_434]                                 AS PRODUCT_CODE
        ,[sub_prdct_cd_432_434]                             AS SUB_PRODUCT_CODE
        ,[_005_dys_dlnqnt_438_450]                          AS _005_DAYS_DELINQUENT
        ,[_030_dys_dlnqnt_451_463]                          AS _030_DAYS_DELINQUENT
        ,[_060_dys_dlnqnt_464_476]                          AS _060_DAYS_DELINQUENT
        ,[_090_dys_dlnqnt_477_489]                          AS _090_DAYS_DELINQUENT
        ,[_120_dys_dlnqnt_490_502]                          AS _120_DAYS_DELINQUENT
        ,[_150_dys_dlnqnt_503_515]                          AS _150_DAYS_DELINQUENT
        ,[_180_dys_dlnqnt_516_528]                          AS _180_DAYS_DELINQUENT
        ,[_210_dys_dlnqnt_529_541]                          AS _210_DAYS_DELINQUENT
        ,[chrg_off_cd_542_542]                              AS CHARGE_OFF_CODE
        ,[secr_crd_crr_bal_543_555]                         AS SECURE_CARD_CURRENT_BALANCE
        ,[usr_fld_1_556_558]                                AS USER_FIELD_1
        ,[usr_fld_2_559_561]                                AS USER_FIELD_2
        ,[usr_fld_3_562_564]                                AS USER_FIELD_3
        ,[usr_fld_4_565_567]                                AS USER_FIELD_4
        ,[usr_fld_5_568_570]                                AS USER_FIELD_5
        ,[usr_fld_6_571_573]                                AS USER_FIELD_6
        ,[urs_fld_7_574_576]                                AS USER_FIELD_7
        ,[usr_fld_8_577_579]                                AS USER_FIELD_8
        ,[tms_5_dys_dlnqnt_580_582]                         AS TIMES_05_DAYS_DELINQUENT
        ,[tms_30_dys_dlnqnt_583_585]                        AS TIMES_30_DAYS_DELINQUENT
        ,[tms_60_dys_dlnqnt_586_588]                        AS TIMES_60_DAYS_DELINQUENT
        ,[tms_90_dys_dlnqnt_589_591]                        AS TIMES_90_DAYS_DELINQUENT
        ,[tms_120_dys_dlnqnt_592_594]                       AS TIMES_120_DAYS_DELINQUENT
        ,[tms_150_dys_dlnqnt_595_597]                       AS TIMES_150_DAYS_DELINQUENT
        ,[tms_180_dys_dlnqnt_598_600]                       AS TIMES_180_DAYS_DELINQUENT
        ,[tms_210_dys_dlnqnt_601_603]                       AS TIMES_210_DAYS_DELINQUENT
        ,[clnt_crd_scr_604_606]                             AS CLIENT_CREDIT_SCORE
        ,[prev_crd_scr_607_609]                             AS PREVIOUS_CREDIT_SCORE
        ,[addrss_ln_1_610_634]                              AS ADDRESS_LINE_1
        ,[addrss_ln_2_635_659]                              AS ADDRESS_LINE_2
        ,[addrss_ln_3_660_684]                              AS ADDRESS_LINE_3
        ,[city_685_709]                                     AS CITY
        ,[state_710_712]                                    AS STATE
        ,[zp_code_9_713_721]                                AS ZIP_CODE_9
        ,[zp_walk_cd_722_723]                               AS ZIP_WALK_CODE
        ,[phone_724_733]                                    AS PHONE
        ,[bsnss_phn_734_743]                                AS BUSINESS_PHONE
        ,[tot_bal_frwrd_744_756]                            AS TOTAL_BALANCE_FORWARD
        ,[nm_1_brth_dt_757_764]                             AS NAME_1_BIRTH_DATE
        ,[nm_2_brth_dt_765_772]                             AS NAME_2_BIRTH_DATE
        ,[nm_1_crdt_assctn_773_773]                         AS NAME_1_CREDIT_ASSOCIATION
        ,[nm_2_crdt_assctn_774_774]                         AS NAME_2_CREDIT_ASSOCIATION
        ,[crdt_lf_prem_775_787]                             AS CREDIT_LIFE_PREMIUM
        ,[dt_lst_fin_actvty_788_795]                        AS DATE_OF_LAST_FINANCIAL_ACTIVITY
        ,[ltd_mnths_ovrlmt_796_798]                         AS LTD_MONTHS_OVERLIMIT
        ,[crd_actvtn_status_799_799]                        AS CARD_ACTIVATION_STATUS
        ,[vs_plstcs_iss_dt_800_807]                         AS VISA_PLASTICS_ISSUE_DATE
        ,[mc_plstcs_iss_dt_808_815]                         AS MC_PLASTICS_ISSUE_DATE
        ,[ltd_num_rtrnd_chks_816_818]                       AS LTD_NUMBER_RETURNED_CHECKS
        ,[lst_nsf_dt_819_826]                               AS LAST_NSF_DATE
        ,[lst_nsf_amt_827_839]                              AS LAST_NSF_AMOUNT
        ,[amt_lst_lt_chrg_840_852]                          AS AMOUNT_LAST_LATE_CHARGE
        ,[dt_acct_opnd_853_860]                             AS DATE_ACCOUNT_OPENED
        ,[curr_tot_due_861_873]                             AS CURRENT_TOTAL_DUE
        ,[embssng_ln_4_874_898]                             AS EMBOSSING_LINE_4
        ,[tot_ytd_fin_chrg_pd_899_911]                      AS TOTAL_YTD_FINANCE_CHARGE_PAID
        ,[ytd_purch_amt_912_924]                            AS YTD_PURCHASES_AMOUNT
        ,[ytd_purch_num_925_929]                            AS YTD_PURCHASES_NUMBER
        ,[ytd_lt_fee_pd_fees_930_942]                       AS YTD_LATE_FEES_PAID_FEES
        ,[ctd_amnt_csh_adv_fee_943_955]                     AS CTD_AMOUNT_CASH_ADV_FEE
        ,[ctd_misc_fee_956_968]                             AS CTD_MISCELLANEOUS_FEE
        ,[ytd_fees_chrgd_969_981]                           AS YTD_FEES_CHARGED
        ,[typ_prcssng_982_983]                              AS TYPE_OF_PROCESSING
        ,[ltd_lt_chrg_amt_984_996]                          AS LTD_LATE_CHARGE_AMOUNT
        ,[lt_chrg_ytd_997_1009]                             AS LATE_CHARGE_YTD
        ,[lftm_purch_num_1010_1014]                         AS LIFETIME_PURCHASES
        ,[lftm_purch_amt_1015_1027]                         AS LIFETIME_AMOUNT
        ,[filler_1028_1040]                                 AS FILLER_1
        ,[fin_chrg_ytd_1041_1053]                           AS FINANCE_CHARGE_YTD
        ,[lst_sttmnt_dt_1054_1061]                          AS LAST_STATEMENT_DATE
        ,[name_2_1062_1087]                                 AS NAME2
        ,[nxt_annl_rnwl_dt_1088_1094]                       AS NEXT_ANNUAL_RENEWALDATE
        ,[intrst_pd_lst_yr_1095_1107]                       AS INTEREST_PAID_LAST_YEAR
        ,[ach_py_amt_1108_1120]                             AS ACHPAYAMOUNT
        ,[ach_effctv_dt_1121_1128]                          AS ACH_EFFECTIVE_DATE
        ,[nm_3_1129_1154]                                   AS NAME_3
        ,[nm_3_ss_num_1155_1167]                            AS NAME_3_SOCIAL_SECURITY_NUMBER
        ,[nm_3_crdt_assctn_1168_1168]                       AS NAME_3_CREDIT_ASSOCIATION
        ,[nm_3_brth_dt_1169_1176]                           AS NAME_3_BIRTH_DATE
        ,[nm_4_1117_1215]                                   AS NAME_4
        ,[nm_4_ss_num_1203_1215]                            AS NAME_4_SOCIAL_SECURITY_NUMBER
        ,[nm_4_crdt_assctn_1216_1261]                       AS NAME_4_CREDIT_ASSOCIATION
        ,[nm_4_brth_dt_1217_1224]                           AS NAME_4_BIRTH_DATE
        ,[prmry_addrss_cntry_cd_1225_1227]                  AS PRIMARY_ADDRESS_COUNTRY_CODE
        ,[prmry_addrss_frgn_indctr_1228_1228]               AS PRIMARY_ADDRESS_FOREIGN_INDICATOR
        ,[sttmnt_ml_addrss_ln_1_1229_1258]                  AS STATEMENT_MAIL_ADDRESS_LINE_1
        ,[sttmnt_ml_addrss_ln_2_1259_1288]                  AS STATEMENT_MAIL_ADDRESS_LINE_2
        ,[sttmnt_ml_addrss_ln_3_1289_1318]                  AS STATEMENT_MAIL_ADDRESS_LINE_3
        ,[sttmnt_ml_addrss_cty_1319_1348]                   AS STATEMENT_MAIL_ADDRESS_CITY
        ,[sttmnt_ml_addrss_st_1349_1351]                    AS STATEMENT_MAIL_ADDRESS_STATE
        ,[sttmnt_ml_addrss_zip_code_1352_1360]              AS STATEMENT_MAIL_ADDRESS_ZIP_CODE
        ,[eml_addrss_1361_1430]                             AS EMAIL_ADDRESS
        ,[free_frm_memo_1431_1460]                          AS FREE_FORM_MEMO
        ,[phn_3_1461_1476]                                  AS PHONE_3
        ,[phn_3_indctr_1477_1477]                           AS PHONE_3_INDICATOR
        ,[phn_4_1478_1493]                                  AS PHONE_4
        ,[phn_4_indctr_1494_1494]                           AS PHONE_4_INDICATOR
        ,[phn_1495_1510]                                    AS PHONE_5
        ,[phn_5_indctr_1511_1511]                           AS PHONE_5_INDICATOR
        ,[prsnl_crp_rep_1512_1521]                          AS PERSONAL_CORP_REP
        ,[rltnshp_mngr_1522_1528]                           AS RELATIONSHIP_MANAGER
        ,[usr_num_1_1529_1536]                              AS USER_NUMBER_1
        ,[usr_num_2_1537_1544]                              AS USER_NUMBER_2
        ,[usr_fld_9_1545_1564]                              AS USER_FIELD_9
        ,[usr_fld_10_1565_1584]                             AS USER_FIELD_10
        ,[usr_fld_11_1585_1609]                             AS USER_FIELD_11
        ,[usr_fld_12_1610_1612]                             AS USER_FIELD_12
        ,[usr_fld_13_1613_1615]                             AS USER_FIELD_13
        ,[usr_fld_14_1616_1618]                             AS USER_FIELD_14
        ,[usr_fld_15_1619_1621]                             AS USER_FIELD_15
        ,[usr_fld_16_1622_1624]                             AS USER_FIELD_16
        ,[usr_fld_17_1625_1627]                             AS USER_FIELD_17
        ,[usr_fld_18_1628_1630]                             AS USER_FIELD_18
        ,[usr_fld_19_1631_1633]                             AS USER_FIELD_19
        ,[usr_fld_20_1634_1635]                             AS USER_FIELD_20
        ,[usr_fld_21_1636_1637]                             AS USER_FIELD_21
        ,[usr_fld_22_1638_1639]                             AS USER_FIELD_22
        ,[usr_fld_23_1640_1641]                             AS USER_FIELD_23
        ,[ytd_num_rtrnd_chks_1642_1644]                     AS YTD_NUMBER_RETURNED_CHECKS
        ,[dt_into_cllctns_1645_1652]                        AS DATE_INTO_COLLECTIONS
        ,[in_cllctns_indctr_1653_1653]                      AS IN_COLLECTIONS_INDICATOR
        ,[lst_annl_fee_amt_1654_1666]                       AS LAST_ANNUAL_FEE_AMOUNT
        ,[dt_lst_annl_fee_chrgd_1667_1674]                  AS DATE_LAST_ANNUAL_FEE_CHARGED
        ,[dt_lst_crdt_chng_1675_1682]                       AS DATE_OF_LAST_CREDIT_CHANGE
        ,[amt_lst_crdt_chng_1683_1691]                      AS AMOUNT_OF_LAST_CREDIT_CHANGE
        ,[dt_lst_csh_lmt_chng_1692_1699]                    AS DATE_OF_LAST_CASH_LIMIT_CHANGE
        ,[tmp_crdt_lmt_1700_1712]                           AS TEMPORARY_CREDIT_LIMIT
        ,[dt_lst_tmp_crd_lmt_1713_1720]                     AS DATE_LAST_TEMPORARY_CREDIT_LIMIT
        ,[orgnl_crd_lmt_1721_1733]                          AS ORIGINAL_CREDIT_LIMIT
        ,[crd_actvtn_dt_1734_1741]                          AS CARD_ACTIVATION_DATE
        ,[dt_lst_dlnqncy_1742_1749]                         AS DATE_OF_LAST_DELINQUENCY
        ,[dlnqncy_hstry_flgs_24_13_1750_1761]               AS DELINQUENCY_HISTORY_FLAGS
        ,[fin_chr_indctr_1762_1762]                         AS FINANCE_CHARGE_INDICATOR
        ,[ezcrd_enrllmnt_indctr_1763_1763]                  AS EZCARD_ENROLLMENT_INDICATOR
        ,[prvs_bill_cd_1764_1771]                           AS PREVIOUS_BILL_CODE
        ,[prvs_bill_day_1772_1779]                          AS PREVIOUS_BILL_DAY
        ,[lst_trnsfr_bal_dt_1780_1787]                      AS LAST_TRANSFER_OF_BALANCE_DATE
        ,[ovrlm_hstry_24_01_1788_1811]                      AS OVERLIMIT_HISTORY_24_01
        ,[auto_py_dy_1812_1813]                             AS AUTO_PAY_DAY
        ,[auto_py_amt_1814_1826]                            AS AUTO_PAY_AMOUNT
        ,[auto_py_prcnt_1827_1829]                          AS AUTO_PAY_PERCENT
        ,[aba_rtng_num_1830_1838]                           AS ABA_ROUTING_NUMBER
        ,[tms_auto_re_aged_1847_1848]                       AS TIMES_AUTO_RE_AGED
        ,[lst_manl_re_age_1849_1856]                        AS LAST_MANUAL_RE_AGE
        ,[tms_manl_re_aged_1857_1858]                       AS TIMES_MANUAL_RE_AGED
        ,[new_bal_purch_1859_1871]                          AS NEW_BALANCE_PURCHASED
        ,[new_bal_csh_1872_1884]                            AS NEW_BALANCE_CASH
        ,[new_bal_specl_1885_1897]                          AS NEW_BALANCE_SPECIAL
        ,[csh_adv_lmt_1898_1910]                            AS CASH_ADVANCE_LIMIT
        ,[csh_adv_avail_1911_1923]                          AS CASH_ADVANCE_AVAILABLE
        ,[ctd_prncpl_purch_1924_1936]                       AS CTD_PRINCIPLE_PURCHASES
        ,[ctd_prncpl_csh_1937_1949]                         AS CTD_PRINCIPLE_CASH
        ,[ctd_prncpl_spcl_1950_1962]                        AS CTD_PRINCIPLE_SPECIAL
        ,[ctd_pymnt_1963_1975]                              AS CTD_PAYMENTS
        ,[inst_id_1976_1984]                                AS INSTITUTION_ID
        ,[corp_rtl_indctr_1985_1985]                        AS CORPORATE_RETAIL_INDICATOR
        ,[assctd_acct_num_1986_2001]                        AS ASSOCIATED_ACCOUNT_NUMBER
        ,[cnsldtd_acct_typ_2002_2002]                       AS CONSOLIDATED_ACCOUNT_TYPE
        ,[comm_crd_cmpny_id_2003_2010]                      AS COMMERCIAL_CARD_COMPANYID
        ,[comm_crd_sub_lvl_2011_2018]                       AS COMMERCIAL_CARD_SUB_LEVEL
        ,[bus_crd_indctr_2019_2019]                         AS BUSINESS_CARD_INDICATOR
        ,[pvs_acct_num_2020_2035]                           AS PREVIOUS_ACCOUNT_NUMBER
        ,[lst_bcn_scr_2036_2038]                            AS LAST_BEACON_SCORE
        ,[orgnl_bnkrptcy_scr_2039_2041]                     AS ORIGINALBANKRUPTCY_SCORE
        ,[lst_bnkrptcy_scr_2042_2044]                       AS LAST_BANKRUPTCY_SCORE
        ,[orgnl_bcn_scr_2045_2047]                          AS ORIGINAL_BEACON_SCORE
        ,[src_2048_2053]                                    AS SOURCE
        ,[chrg_off_amt_2054_2066]                           AS CHARGE_OFF_AMOUNT
        ,[chrg_off_dt_2067_2074]                            AS CHARGE_OFF_DATE
        ,[lst_crdt_scr_dt_2075_2082]                        AS LAST_CREDIT_SCORE_DATE
        ,[cnsldtd_pst_optn_2083_2083]                       AS CONSOLIDATED_POST_OPTION
        ,[triad_sp_id_2084_2085]                            AS TRIAD_SP_ID
        ,[triad_tst_dgts_2086_2087]                         AS TRIAD_TEST_DIGIT
        ,[triad_cllctn_scnr_id_2088_2090]                   AS TRIAD_COLLECTION_SCENARIO_ID
        ,[triad_cllctn_scnr_id_2091_2095]                   AS TRIAD_COLLECTION_LETTER_ID
        ,[triad_algnd_scr_2096_2099]                        AS TRIAD_ALIGNED_SCORE
        ,[triad_scr_typ_2100_2100]                          AS TRIAD_SCORED_TYPE
        ,[triad_cllctn_indctr_2101_2103]                    AS RIAD_COLLECTION_INDICATOR
        ,[triad_blnc_at_rsk_2104_2112]                      AS TRIAD_BALANCE_AT_RIS
        ,[cnvrtd_acct_num_2113_2128]                        AS CONVERTED_ACCOUNT_NUMBER
        ,[usr_ltd_defrrd_intrst_2129_2141]                  AS USER_LTD_DEFERRED_INTEREST
        ,[unpd_prncpl_2142_2154]                            AS UNPAID_PRINCIPLE
        ,[unpd_fnnc_chrg_2155_2167]                         AS UNPAID_FINANCE_CHARGE
        ,[unpd_annl_fee_2168_2180]                          AS UNPAID_ANNUAL_FEE
        ,[unpd_othr_fee_2181_2193]                          AS UNPAID_OTHER_FEES
        ,[unpd_insrnc_2194_2206]                            AS UNPAID_INSURANCE
        ,[acct_trm_id_2207_2214]                            AS ACCOUNT_TERMS_ID
        ,[acct_trms_id_chng_dt_2215_2222]                   AS ACCOUNT_TERMS_ID_CHANGEDATE
        ,[dt_pymnt_due_alt_2223_2230]                       AS DATE_PAYMENT_DUE_ALT
        ,[num_mnths_pst_due_2231_2231]                      AS NUMBER_MONTHS_PAST_DUE
        ,[nm_1_mddl_intl_2232_2232]                         AS NAME_1_MIDDLE_INITIAL
        ,[nm_1_sffx_2233_2236]                              AS NAME_1_SUFFIX
        ,[nm_2_mddl_intl_2237_2237]                         AS NAME_2_MIDDLE_INITIAL
        ,[nm_2_sffx_2238_2241]                              AS NAME_2_SUFFIX
        ,[nm_3_mddl_intl_2242_2242]                         AS NAME_3_MIDDLE_INITIAL
        ,[nm_3_sffx_2243_2246]                              AS NAME_3_SUFFIX
        ,[nm_4_mddl_intl_2247_2247]                         AS NAME_4_MIDDLE_INITIAL
        ,[nm_4_sffx_2248_2251]                              AS NAME_4_SUFFIX
        ,[num_dlnqnt_dys_2252_2254]                         AS NUMBER_OF_DELINQUENT_DAYS
        ,[insrnc_cd_2255_2255]                              AS INSURANCE_CODE
        ,[oldst_mssd_pymnt_dlnqnt_dt_2256_2263]             AS OLDEST_MISSED_PAYMENT_DELINQUENT_DATE
        ,[ctd_dvrtd_amt_2264_2276]                          AS CTD_DVRTD_AMOUNT
        ,[ovrlmt_amt_2277_2289]                             AS OVERLIMIT_AMOUNT
        ,[tot_pst_due_amt_2290_2302]                        AS TOTAL_PAST_DUE_AMOUNT
        ,[tot_clcltd_pymnt_due_2303_2315]                   AS TOTAL_CLCTD_PAYMENT_DUE
        ,[ccpi_sngl_mlt_indctr_2316_2316]                   AS CCPI_SINGLE_MULTI_INDICATOR
        ,[nm_1_mil_indctr_2317_2317]                        AS NAME_1_MIL_INDICATOR
        ,[nm_2_mil_indctr_2318_2318]                        AS NAME_2_MIL_INDICATOR
        ,[nm_3_mil_indctr_2319_2319]                        AS NAME_3_MIL_INDICATOR
        ,[nm_4_mil_indctr_2320_2320]                        AS NAME_4_MIL_INDICATOR
        ,[num_mnths_w_crdt_bal_2321_2323]                   AS NUMBER_OF_MONTHS_WITH_A_CREDIT_BALANCE
        ,[triad_strtgc_prtfl_id_num_2324_2326]              AS TRIAD_STRATEGIC_PORTFOLIO_IDNUMBER
        ,[triad_rndm_dgt_1_2327_2330]                       AS TRIAD_RANDOM_DIGIT_1
        ,[triad_rndm_dgt_2_2331_2334]                       AS TRIAD_RANDOM_DIGIT_2
        ,[triad_rndm_dgt_3_2335_2338]                       AS TRIAD_RANDOM_DIGIT_3
        ,[triad_rndm_dgt_4_2339_2342]                       AS TRIAD_RANDOM_DIGIT_4
        ,[triad_cllctn_scnr_id_2343_2346]                   AS TRIAD_COLLECTION_SCENARIOID
        ,[bnkrptcy_dt_2347_2354]                            AS BANKRUPTCY_DATE
        ,[nm_1_img_id_2355_2376]                            AS NAME_1_IMAGE_ID
        ,[nm_2_img_id_2377_2398]                            AS NAME_2_IMAGE_ID
        ,[nm_3_img_id_2399_2420]                            AS NAME_3_IMAGE_ID
        ,[nm_4_img_id_2421_2442]                            AS NAME_4_IMAGE_ID
        ,[prvs_mnl_re_age_dt_2443_2450]                     AS PREVIOUS_MANUAL_RE_AGE_DATE
        ,[co_brwr_indctr_2451_2451]                         AS CO_BORROWER_ADDRESS_INDICATOR
        ,[co_brwr_addrs_ln_1_2452_2481]                     AS CO_BORROWER_ADDRESS_LINE_1
        ,[co_brwr_addrs_ln_2_2482_2511]                     AS CO_BORROWER_ADDRESS_LINE_2
        ,[co_brwr_addrs_ln_3_2512_2541]                     AS CO_BORROWER_ADDRESS_LINE_3
        ,[co_brwr_cty_2542_2571]                            AS CO_BORROWER_CITY
        ,[co_brwr_st_2572_2574]                             AS CO_BORROWER_STATE
        ,[co_brwr_curr_zip_2575_2583]                       AS CO_BORROWER_CURRENT_ZIP
        ,[co_brwr_addrs_frgn_indctr_2584_2584]              AS CO_BORROWER_ADDRESS_FOREIGN_INDICATOR
        ,[co_brwr_cntry_cd_2585_2587]                       AS CO_BORROWER_COUNTRY_CODE
        ,[filler_2588_2600]                                 AS FILLER_2
        ,[created_dt]                                       AS CREATED_DT
        ,[updated_dt]                                       AS UPDATED_DT
        ,LAST_UPDATED_DATA                                  AS LAST_UPDATED_DATA
        ,DATE_OF_DATA                                       AS DATE_OF_DATA
        ,YEARMONTH                                          AS YEARMONTH
        ,LOADED_AT                                          AS LOADED_AT
    FROM {{ref('bronze_fis_cd300')}}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)
SELECT
    FUTURE_USE
    ,CORP_ID
    ,ACCOUNT_NUMBER
    ,CREDIT_LIMIT
    ,CURRENT_BALANCE
    ,AVAILABLE_CREDIT
    ,OUTSTANDING_AUTHORIZATION_AMOUNT
    ,OUTSTANDING_AUTHORIZATION_NUMBER
    ,BLOCK_CODE
    ,RECLASS_CODE
    ,RELATIONSHIP_ACCOUNT
    ,LTD_NUMBER_MONTHS_PASTDUE
    ,PRIMARY_NAME
    ,MONTH_TO_DATE_PAYMENT
    ,LAST_STATEMENT_BALANCE
    ,AMOUNT_LAST_PAYMENT
    ,DATE_OF_LAST_PAYMENT
    ,DATE_OF_LAST_PURCHASE
    ,DATE_OF_LAST_CASH_ADVANCE
    ,DELINQUENT_AMOUNT
    ,PAYMENT_DUE
    ,DATE_PAYMENT_DUE
    ,EXPIRATION_DATE
    ,PAST_DUE_HISTORY
    ,SSN_PRIMARY
    ,SSN_SECODARY
    ,VISA_PLASTICS_OUT
    ,MASTERCARD_PLASTICS_OUT
    ,CYCLE_DAY_CHANGE
    ,TYPE_PLASTIC_1
    ,TYPE_PLASTIC_2
    ,REISSUE_DENIAL_CODE
    ,SPECIAL_STATEMENT_GROUP_CODE
    ,PAYMENT_CODE
    ,CARD_FEE_INDICATOR
    ,CREDIT_LIFE_CODE
    ,AUTO_PAY_AC_TYPE
    ,BILL_DAY
    ,TOTAL_BALANCE_FORWARD_CASH
    ,CURRENT_BILL_CODE
    ,CURRENT_BILL_DATE
    ,CROSS_REFERENCE_NUMBER
    ,CURRENT_PAYMENT_FIXED
    ,DATE_LAST_FEE_CHARGED
    ,CREDIT_LIMIT_CHANGE_DATE_1
    ,DDA_ACCOUNT_NUMBER
    ,PREVIOUS_BILLING_DATE
    ,FIRST_USE_DATE
    ,LIFE_HIGH_BALANCE_AMOUNT
    ,LAST_ADDRESS_CHANGE_DATE
    ,DISPUTE_AMOUNT
    ,LAST_BLOCKED_DATE
    ,PRODUCT_CODE
    ,SUB_PRODUCT_CODE
    ,_005_DAYS_DELINQUENT
    ,_030_DAYS_DELINQUENT
    ,_060_DAYS_DELINQUENT
    ,_090_DAYS_DELINQUENT
    ,_120_DAYS_DELINQUENT
    ,_150_DAYS_DELINQUENT
    ,_180_DAYS_DELINQUENT
    ,_210_DAYS_DELINQUENT
    ,CHARGE_OFF_CODE
    ,SECURE_CARD_CURRENT_BALANCE
    ,USER_FIELD_1
    ,USER_FIELD_2
    ,USER_FIELD_3
    ,USER_FIELD_4
    ,USER_FIELD_5
    ,USER_FIELD_6
    ,USER_FIELD_7
    ,USER_FIELD_8
    ,TIMES_05_DAYS_DELINQUENT
    ,TIMES_30_DAYS_DELINQUENT
    ,TIMES_60_DAYS_DELINQUENT
    ,TIMES_90_DAYS_DELINQUENT
    ,TIMES_120_DAYS_DELINQUENT
    ,TIMES_150_DAYS_DELINQUENT
    ,TIMES_180_DAYS_DELINQUENT
    ,TIMES_210_DAYS_DELINQUENT
    ,CLIENT_CREDIT_SCORE
    ,PREVIOUS_CREDIT_SCORE
    ,ADDRESS_LINE_1
    ,ADDRESS_LINE_2
    ,ADDRESS_LINE_3
    ,CITY
    ,STATE
    ,ZIP_CODE_9
    ,ZIP_WALK_CODE
    ,PHONE
    ,BUSINESS_PHONE
    ,TOTAL_BALANCE_FORWARD
    ,NAME_1_BIRTH_DATE
    ,NAME_2_BIRTH_DATE
    ,NAME_1_CREDIT_ASSOCIATION
    ,NAME_2_CREDIT_ASSOCIATION
    ,CREDIT_LIFE_PREMIUM
    ,DATE_OF_LAST_FINANCIAL_ACTIVITY
    ,LTD_MONTHS_OVERLIMIT
    ,CARD_ACTIVATION_STATUS
    ,VISA_PLASTICS_ISSUE_DATE
    ,MC_PLASTICS_ISSUE_DATE
    ,LTD_NUMBER_RETURNED_CHECKS
    ,LAST_NSF_DATE
    ,LAST_NSF_AMOUNT
    ,AMOUNT_LAST_LATE_CHARGE
    ,DATE_ACCOUNT_OPENED
    ,CURRENT_TOTAL_DUE
    ,EMBOSSING_LINE_4
    ,TOTAL_YTD_FINANCE_CHARGE_PAID
    ,YTD_PURCHASES_AMOUNT
    ,YTD_PURCHASES_NUMBER
    ,YTD_LATE_FEES_PAID_FEES
    ,CTD_AMOUNT_CASH_ADV_FEE
    ,CTD_MISCELLANEOUS_FEE
    ,YTD_FEES_CHARGED
    ,TYPE_OF_PROCESSING
    ,LTD_LATE_CHARGE_AMOUNT
    ,LATE_CHARGE_YTD
    ,LIFETIME_PURCHASES
    ,LIFETIME_AMOUNT
    ,FILLER_1
    ,FINANCE_CHARGE_YTD
    ,LAST_STATEMENT_DATE
    ,NAME2
    ,NEXT_ANNUAL_RENEWALDATE
    ,INTEREST_PAID_LAST_YEAR
    ,ACHPAYAMOUNT
    ,ACH_EFFECTIVE_DATE
    ,NAME_3
    ,NAME_3_SOCIAL_SECURITY_NUMBER
    ,NAME_3_CREDIT_ASSOCIATION
    ,NAME_3_BIRTH_DATE
    ,NAME_4
    ,NAME_4_SOCIAL_SECURITY_NUMBER
    ,NAME_4_CREDIT_ASSOCIATION
    ,NAME_4_BIRTH_DATE
    ,PRIMARY_ADDRESS_COUNTRY_CODE
    ,PRIMARY_ADDRESS_FOREIGN_INDICATOR
    ,STATEMENT_MAIL_ADDRESS_LINE_1
    ,STATEMENT_MAIL_ADDRESS_LINE_2
    ,STATEMENT_MAIL_ADDRESS_LINE_3
    ,STATEMENT_MAIL_ADDRESS_CITY
    ,STATEMENT_MAIL_ADDRESS_STATE
    ,STATEMENT_MAIL_ADDRESS_ZIP_CODE
    ,EMAIL_ADDRESS
    ,FREE_FORM_MEMO
    ,PHONE_3
    ,PHONE_3_INDICATOR
    ,PHONE_4
    ,PHONE_4_INDICATOR
    ,PHONE_5
    ,PHONE_5_INDICATOR
    ,PERSONAL_CORP_REP
    ,RELATIONSHIP_MANAGER
    ,USER_NUMBER_1
    ,USER_NUMBER_2
    ,USER_FIELD_9
    ,USER_FIELD_10
    ,USER_FIELD_11
    ,USER_FIELD_12
    ,USER_FIELD_13
    ,USER_FIELD_14
    ,USER_FIELD_15
    ,USER_FIELD_16
    ,USER_FIELD_17
    ,USER_FIELD_18
    ,USER_FIELD_19
    ,USER_FIELD_20
    ,USER_FIELD_21
    ,USER_FIELD_22
    ,USER_FIELD_23
    ,YTD_NUMBER_RETURNED_CHECKS
    ,DATE_INTO_COLLECTIONS
    ,IN_COLLECTIONS_INDICATOR
    ,LAST_ANNUAL_FEE_AMOUNT
    ,DATE_LAST_ANNUAL_FEE_CHARGED
    ,DATE_OF_LAST_CREDIT_CHANGE
    ,AMOUNT_OF_LAST_CREDIT_CHANGE
    ,DATE_OF_LAST_CASH_LIMIT_CHANGE
    ,TEMPORARY_CREDIT_LIMIT
    ,DATE_LAST_TEMPORARY_CREDIT_LIMIT
    ,ORIGINAL_CREDIT_LIMIT
    ,CARD_ACTIVATION_DATE
    ,DATE_OF_LAST_DELINQUENCY
    ,DELINQUENCY_HISTORY_FLAGS
    ,FINANCE_CHARGE_INDICATOR
    ,EZCARD_ENROLLMENT_INDICATOR
    ,PREVIOUS_BILL_CODE
    ,PREVIOUS_BILL_DAY
    ,LAST_TRANSFER_OF_BALANCE_DATE
    ,OVERLIMIT_HISTORY_24_01
    ,AUTO_PAY_DAY
    ,AUTO_PAY_AMOUNT
    ,AUTO_PAY_PERCENT
    ,ABA_ROUTING_NUMBER
    ,TIMES_AUTO_RE_AGED
    ,LAST_MANUAL_RE_AGE
    ,TIMES_MANUAL_RE_AGED
    ,NEW_BALANCE_PURCHASED
    ,NEW_BALANCE_CASH
    ,NEW_BALANCE_SPECIAL
    ,CASH_ADVANCE_LIMIT
    ,CASH_ADVANCE_AVAILABLE
    ,CTD_PRINCIPLE_PURCHASES
    ,CTD_PRINCIPLE_CASH
    ,CTD_PRINCIPLE_SPECIAL
    ,CTD_PAYMENTS
    ,INSTITUTION_ID
    ,CORPORATE_RETAIL_INDICATOR
    ,ASSOCIATED_ACCOUNT_NUMBER
    ,CONSOLIDATED_ACCOUNT_TYPE
    ,COMMERCIAL_CARD_COMPANYID
    ,COMMERCIAL_CARD_SUB_LEVEL
    ,BUSINESS_CARD_INDICATOR
    ,PREVIOUS_ACCOUNT_NUMBER
    ,LAST_BEACON_SCORE
    ,ORIGINALBANKRUPTCY_SCORE
    ,LAST_BANKRUPTCY_SCORE
    ,ORIGINAL_BEACON_SCORE
    ,SOURCE
    ,CHARGE_OFF_AMOUNT
    ,CHARGE_OFF_DATE
    ,LAST_CREDIT_SCORE_DATE
    ,CONSOLIDATED_POST_OPTION
    ,TRIAD_SP_ID
    ,TRIAD_TEST_DIGIT
    ,TRIAD_COLLECTION_SCENARIO_ID
    ,TRIAD_COLLECTION_LETTER_ID
    ,TRIAD_ALIGNED_SCORE
    ,TRIAD_SCORED_TYPE
    ,RIAD_COLLECTION_INDICATOR
    ,TRIAD_BALANCE_AT_RIS
    ,CONVERTED_ACCOUNT_NUMBER
    ,USER_LTD_DEFERRED_INTEREST
    ,UNPAID_PRINCIPLE
    ,UNPAID_FINANCE_CHARGE
    ,UNPAID_ANNUAL_FEE
    ,UNPAID_OTHER_FEES
    ,UNPAID_INSURANCE
    ,ACCOUNT_TERMS_ID
    ,ACCOUNT_TERMS_ID_CHANGEDATE
    ,DATE_PAYMENT_DUE_ALT
    ,NUMBER_MONTHS_PAST_DUE
    ,NAME_1_MIDDLE_INITIAL
    ,NAME_1_SUFFIX
    ,NAME_2_MIDDLE_INITIAL
    ,NAME_2_SUFFIX
    ,NAME_3_MIDDLE_INITIAL
    ,NAME_3_SUFFIX
    ,NAME_4_MIDDLE_INITIAL
    ,NAME_4_SUFFIX
    ,NUMBER_OF_DELINQUENT_DAYS
    ,INSURANCE_CODE
    ,OLDEST_MISSED_PAYMENT_DELINQUENT_DATE
    ,CTD_DVRTD_AMOUNT
    ,OVERLIMIT_AMOUNT
    ,TOTAL_PAST_DUE_AMOUNT
    ,TOTAL_CLCTD_PAYMENT_DUE
    ,CCPI_SINGLE_MULTI_INDICATOR
    ,NAME_1_MIL_INDICATOR
    ,NAME_2_MIL_INDICATOR
    ,NAME_3_MIL_INDICATOR
    ,NAME_4_MIL_INDICATOR
    ,NUMBER_OF_MONTHS_WITH_A_CREDIT_BALANCE
    ,TRIAD_STRATEGIC_PORTFOLIO_IDNUMBER
    ,TRIAD_RANDOM_DIGIT_1
    ,TRIAD_RANDOM_DIGIT_2
    ,TRIAD_RANDOM_DIGIT_3
    ,TRIAD_RANDOM_DIGIT_4
    ,TRIAD_COLLECTION_SCENARIOID
    ,BANKRUPTCY_DATE
    ,NAME_1_IMAGE_ID
    ,NAME_2_IMAGE_ID
    ,NAME_3_IMAGE_ID
    ,NAME_4_IMAGE_ID
    ,PREVIOUS_MANUAL_RE_AGE_DATE
    ,CO_BORROWER_ADDRESS_INDICATOR
    ,CO_BORROWER_ADDRESS_LINE_1
    ,CO_BORROWER_ADDRESS_LINE_2
    ,CO_BORROWER_ADDRESS_LINE_3
    ,CO_BORROWER_CITY
    ,CO_BORROWER_STATE
    ,CO_BORROWER_CURRENT_ZIP
    ,CO_BORROWER_ADDRESS_FOREIGN_INDICATOR
    ,CO_BORROWER_COUNTRY_CODE
    ,FILLER_2
    ,CREATED_DT
    ,UPDATED_DT
    ,LAST_UPDATED_DATA
    ,DATE_OF_DATA
    ,YEARMONTH
    ,GETUTCDATE() AS LOADED_AT
FROM silver_data