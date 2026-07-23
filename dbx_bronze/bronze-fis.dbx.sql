-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From bronze-fis.dbx.sql
-- Source model: bronze_fis_cd300
CREATE OR REPLACE TABLE bronze.default.bronze_fis_cd300 AS
-- NAME: BRONZE_FIS_CD300
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: January 27, 2026



WITH landing_data AS (
    SELECT
        future_use_1_4,
        corp_id_5_6,
        TRY_CAST(acct_num_7_22_masked AS bigint) AS acct_num_7_22_masked,
        TRY_CAST(crdt_lmt_23_35 AS DOUBLE) AS crdt_lmt_23_35,
        TRY_CAST(curr_bal_36_48 AS DOUBLE) AS curr_bal_36_48,
        TRY_CAST(avail_credit_49_61 AS DOUBLE) AS avail_credit_49_61,
        TRY_CAST(outstanding_auth_amt_62_74 AS DOUBLE) AS outstanding_auth_amt_62_74,
        TRY_CAST(outstanding_auth_num_75_77 AS int) AS outstanding_auth_num_75_77,
        block_code_78_78,
        reclass_code_79_79,
        TRY_CAST(rltnshp_acct_80_95 AS bigint) AS rltnshp_acct_80_95,
        TRY_CAST(ltd_num_mnths_pst_due_96_98 AS int) AS ltd_num_mnths_pst_due_96_98,
        primary_nm_99_124,
        TRY_CAST(mnth_to_dt_pymnt_125_137 AS DOUBLE) AS mnth_to_dt_pymnt_125_137,
        TRY_CAST(lst_stmnt_bal_138_150 AS DOUBLE) AS lst_stmnt_bal_138_150,
        TRY_CAST(amt_of_lst_pymnt_151_163 AS DOUBLE) AS amt_of_lst_pymnt_151_163,
        TRY_CAST(dt_of_lst_pymnt_164_171 AS int) AS dt_of_lst_pymnt_164_171,
        TRY_CAST(dt_lst_purch_172_179 AS int) AS dt_lst_purch_172_179,
        TRY_CAST(dt_lst_csh_advnc_180_187 AS int) AS dt_lst_csh_advnc_180_187,
        TRY_CAST(dlnqntamt_188_200 AS int) AS dlnqntamt_188_200,
        TRY_CAST(pymnt_due_201_213 AS DOUBLE) AS pymnt_due_201_213,
        TRY_CAST(dt_pymnt_due_214_221 AS int) AS dt_pymnt_due_214_221,
        TRY_CAST(exprtn_dt_222_227 AS int) AS exprtn_dt_222_227,
        pst_due_hstry_12_01_228_239,
        ssn_prmry_240_252,
        ssn_scndry_253_265,
        TRY_CAST(visa_plstc_out_266_267 AS int) AS visa_plstc_out_266_267,
        TRY_CAST(mc_pstc_out_268_269 AS int) AS mc_pstc_out_268_269,
        cycle_dy_chng_270_271,
        typ_plstc_1_272_272,
        typ_plstc_273_273,
        rss_dnl_code_274_275,
        spcl_sttmnt_grp_cd_276_276,
        pymn_cd_277_277,
        crd_fee_indctr_278_278,
        crd_lf_cd_279_279,
        auto_py_ac_typ_280_280,
        TRY_CAST(bill_day_281_282 AS int) AS bill_day_281_282,
        TRY_CAST(tot_bal_fwd_csh_283_295 AS DOUBLE) AS tot_bal_fwd_csh_283_295,
        curr_bill_cd_296_303,
        TRY_CAST(curr_bill_dt_304_311 AS int) AS curr_bill_dt_304_311,
        TRY_CAST(crss_ref_num_312_327 AS bigint) AS crss_ref_num_312_327,
        TRY_CAST(curr_pymnt_fxd_328_340 AS DOUBLE) AS curr_pymnt_fxd_328_340,
        TRY_CAST(dt_lst_fee_chrgd_341_348 AS int) AS dt_lst_fee_chrgd_341_348,
        TRY_CAST(crd_lmt_chng_dt_1_349_356 AS int) AS crd_lmt_chng_dt_1_349_356,
        TRY_CAST(dda_acct_num_357_373 AS bigint) AS dda_acct_num_357_373,
        TRY_CAST(prev_bllng_dt_374_381 AS int) AS prev_bllng_dt_374_381,
        TRY_CAST(frst_us_dt_382_389 AS int) AS frst_us_dt_382_389,
        TRY_CAST(lf_hgh_bal_amt_390_402 AS DOUBLE) AS lf_hgh_bal_amt_390_402,
        TRY_CAST(lst_addrss_chng_dt_403_410 AS int) AS lst_addrss_chng_dt_403_410,
        TRY_CAST(dspt_amt_411_423 AS DOUBLE) AS dspt_amt_411_423,
        TRY_CAST(lst_blckd_dt_424_431 AS int) AS lst_blckd_dt_424_431,
        prdct_cd_432_434,
        TRY_CAST(sub_prdct_cd_432_434 AS int) AS sub_prdct_cd_432_434,
        TRY_CAST(`_005_dys_dlnqnt_438_450` AS int) AS _005_dys_dlnqnt_438_450,
        TRY_CAST(`_030_dys_dlnqnt_451_463` AS int) AS _030_dys_dlnqnt_451_463,
        TRY_CAST(`_060_dys_dlnqnt_464_476` AS int) AS _060_dys_dlnqnt_464_476,
        TRY_CAST(`_090_dys_dlnqnt_477_489` AS int) AS _090_dys_dlnqnt_477_489,
        TRY_CAST(`_120_dys_dlnqnt_490_502` AS int) AS _120_dys_dlnqnt_490_502,
        TRY_CAST(`_150_dys_dlnqnt_503_515` AS int) AS _150_dys_dlnqnt_503_515,
        TRY_CAST(`_180_dys_dlnqnt_516_528` AS int) AS _180_dys_dlnqnt_516_528,
        TRY_CAST(`_210_dys_dlnqnt_529_541` AS int) AS _210_dys_dlnqnt_529_541,
        TRY_CAST(chrg_off_cd_542_542 AS int) AS chrg_off_cd_542_542,
        TRY_CAST(secr_crd_crr_bal_543_555 AS DOUBLE) AS secr_crd_crr_bal_543_555,
        TRY_CAST(usr_fld_1_556_558 AS int) AS usr_fld_1_556_558,
        usr_fld_2_559_561,
        usr_fld_3_562_564,
        usr_fld_4_565_567,
        usr_fld_5_568_570,
        usr_fld_6_571_573,
        urs_fld_7_574_576,
        usr_fld_8_577_579,
        TRY_CAST(tms_5_dys_dlnqnt_580_582 AS int) AS tms_5_dys_dlnqnt_580_582,
        TRY_CAST(tms_30_dys_dlnqnt_583_585 AS int) AS tms_30_dys_dlnqnt_583_585,
        TRY_CAST(tms_60_dys_dlnqnt_586_588 AS int) AS tms_60_dys_dlnqnt_586_588,
        TRY_CAST(tms_90_dys_dlnqnt_589_591 AS int) AS tms_90_dys_dlnqnt_589_591,
        TRY_CAST(tms_120_dys_dlnqnt_592_594 AS int) AS tms_120_dys_dlnqnt_592_594,
        TRY_CAST(tms_150_dys_dlnqnt_595_597 AS int) AS tms_150_dys_dlnqnt_595_597,
        TRY_CAST(tms_180_dys_dlnqnt_598_600 AS int) AS tms_180_dys_dlnqnt_598_600,
        TRY_CAST(tms_210_dys_dlnqnt_601_603 AS int) AS tms_210_dys_dlnqnt_601_603,
        clnt_crd_scr_604_606,
        prev_crd_scr_607_609,
        addrss_ln_1_610_634,
        addrss_ln_2_635_659,
        addrss_ln_3_660_684,
        city_685_709,
        state_710_712,
        zp_code_9_713_721,
        TRY_CAST(zp_walk_cd_722_723 AS int) AS zp_walk_cd_722_723,
        TRY_CAST(phone_724_733 AS bigint) AS phone_724_733,
        TRY_CAST(bsnss_phn_734_743 AS bigint) AS bsnss_phn_734_743,
        TRY_CAST(tot_bal_frwrd_744_756 AS DOUBLE) AS tot_bal_frwrd_744_756,
        TRY_CAST(nm_1_brth_dt_757_764 AS int) AS nm_1_brth_dt_757_764,
        TRY_CAST(nm_2_brth_dt_765_772 AS int) AS nm_2_brth_dt_765_772,
        TRY_CAST(nm_1_crdt_assctn_773_773 AS int) AS nm_1_crdt_assctn_773_773,
        TRY_CAST(nm_2_crdt_assctn_774_774 AS int) AS nm_2_crdt_assctn_774_774,
        TRY_CAST(crdt_lf_prem_775_787 AS DOUBLE) AS crdt_lf_prem_775_787,
        TRY_CAST(dt_lst_fin_actvty_788_795 AS int) AS dt_lst_fin_actvty_788_795,
        TRY_CAST(ltd_mnths_ovrlmt_796_798 AS int) AS ltd_mnths_ovrlmt_796_798,
        crd_actvtn_status_799_799,
        TRY_CAST(vs_plstcs_iss_dt_800_807 AS int) AS vs_plstcs_iss_dt_800_807,
        TRY_CAST(mc_plstcs_iss_dt_808_815 AS int) AS mc_plstcs_iss_dt_808_815,
        TRY_CAST(ltd_num_rtrnd_chks_816_818 AS int) AS ltd_num_rtrnd_chks_816_818,
        TRY_CAST(lst_nsf_dt_819_826 AS int) AS lst_nsf_dt_819_826,
        TRY_CAST(lst_nsf_amt_827_839 AS DOUBLE) AS lst_nsf_amt_827_839,
        TRY_CAST(amt_lst_lt_chrg_840_852 AS DOUBLE) AS amt_lst_lt_chrg_840_852,
        TRY_CAST(dt_acct_opnd_853_860 AS int) AS dt_acct_opnd_853_860,
        TRY_CAST(curr_tot_due_861_873 AS DOUBLE) AS curr_tot_due_861_873,
        embssng_ln_4_874_898,
        TRY_CAST(tot_ytd_fin_chrg_pd_899_911 AS DOUBLE) AS tot_ytd_fin_chrg_pd_899_911,
        TRY_CAST(ytd_purch_amt_912_924 AS DOUBLE) AS ytd_purch_amt_912_924,
        TRY_CAST(ytd_purch_num_925_929 AS int) AS ytd_purch_num_925_929,
        TRY_CAST(ytd_lt_fee_pd_fees_930_942 AS DOUBLE) AS ytd_lt_fee_pd_fees_930_942,
        TRY_CAST(ctd_amnt_csh_adv_fee_943_955 AS DOUBLE) AS ctd_amnt_csh_adv_fee_943_955,
        TRY_CAST(ctd_misc_fee_956_968 AS DOUBLE) AS ctd_misc_fee_956_968,
        TRY_CAST(ytd_fees_chrgd_969_981 AS DOUBLE) AS ytd_fees_chrgd_969_981,
        TRY_CAST(typ_prcssng_982_983 AS int) AS typ_prcssng_982_983,
        TRY_CAST(ltd_lt_chrg_amt_984_996 AS DOUBLE) AS ltd_lt_chrg_amt_984_996,
        TRY_CAST(lt_chrg_ytd_997_1009 AS DOUBLE) AS lt_chrg_ytd_997_1009,
        TRY_CAST(lftm_purch_num_1010_1014 AS int) AS lftm_purch_num_1010_1014,
        TRY_CAST(lftm_purch_amt_1015_1027 AS bigint) AS lftm_purch_amt_1015_1027,
        TRY_CAST(filler_1028_1040 AS int) AS filler_1028_1040,
        TRY_CAST(fin_chrg_ytd_1041_1053 AS DOUBLE) AS fin_chrg_ytd_1041_1053,
        TRY_CAST(lst_sttmnt_dt_1054_1061 AS int) AS lst_sttmnt_dt_1054_1061,
        name_2_1062_1087,
        TRY_CAST(nxt_annl_rnwl_dt_1088_1094 AS int) AS nxt_annl_rnwl_dt_1088_1094,
        TRY_CAST(intrst_pd_lst_yr_1095_1107 AS DOUBLE) AS intrst_pd_lst_yr_1095_1107,
        TRY_CAST(ach_py_amt_1108_1120 AS DOUBLE) AS ach_py_amt_1108_1120,
        TRY_CAST(ach_effctv_dt_1121_1128 AS int) AS ach_effctv_dt_1121_1128,
        nm_3_1129_1154,
        nm_3_ss_num_1155_1167,
        TRY_CAST(nm_3_crdt_assctn_1168_1168 AS int) AS nm_3_crdt_assctn_1168_1168,
        TRY_CAST(nm_3_brth_dt_1169_1176 AS int) AS nm_3_brth_dt_1169_1176,
        nm_4_1117_1215,
        nm_4_ss_num_1203_1215,
        TRY_CAST(nm_4_crdt_assctn_1216_1261 AS int) AS nm_4_crdt_assctn_1216_1261,
        TRY_CAST(nm_4_brth_dt_1217_1224 AS int) AS nm_4_brth_dt_1217_1224,
        prmry_addrss_cntry_cd_1225_1227,
        prmry_addrss_frgn_indctr_1228_1228,
        sttmnt_ml_addrss_ln_1_1229_1258,
        sttmnt_ml_addrss_ln_2_1259_1288,
        sttmnt_ml_addrss_ln_3_1289_1318,
        sttmnt_ml_addrss_cty_1319_1348,
        sttmnt_ml_addrss_st_1349_1351,
        sttmnt_ml_addrss_zip_code_1352_1360,
        eml_addrss_1361_1430,
        free_frm_memo_1431_1460,
        TRY_CAST(phn_3_1461_1476 AS bigint) AS phn_3_1461_1476,
        phn_3_indctr_1477_1477,
        TRY_CAST(phn_4_1478_1493 AS bigint) AS phn_4_1478_1493,
        phn_4_indctr_1494_1494,
        TRY_CAST(phn_1495_1510 AS bigint) AS phn_1495_1510,
        phn_5_indctr_1511_1511,
        prsnl_crp_rep_1512_1521,
        rltnshp_mngr_1522_1528,
        TRY_CAST(usr_num_1_1529_1536 AS int) AS usr_num_1_1529_1536,
        TRY_CAST(usr_num_2_1537_1544 AS int) AS usr_num_2_1537_1544,
        usr_fld_9_1545_1564,
        usr_fld_10_1565_1584,
        usr_fld_11_1585_1609,
        usr_fld_12_1610_1612,
        usr_fld_13_1613_1615,
        usr_fld_14_1616_1618,
        usr_fld_15_1619_1621,
        usr_fld_16_1622_1624,
        usr_fld_17_1625_1627,
        usr_fld_18_1628_1630,
        usr_fld_19_1631_1633,
        usr_fld_20_1634_1635,
        usr_fld_21_1636_1637,
        usr_fld_22_1638_1639,
        usr_fld_23_1640_1641,
        TRY_CAST(ytd_num_rtrnd_chks_1642_1644 AS int) AS ytd_num_rtrnd_chks_1642_1644,
        TRY_CAST(dt_into_cllctns_1645_1652 AS int) AS dt_into_cllctns_1645_1652,
        in_cllctns_indctr_1653_1653,
        TRY_CAST(lst_annl_fee_amt_1654_1666 AS DOUBLE) AS lst_annl_fee_amt_1654_1666,
        TRY_CAST(dt_lst_annl_fee_chrgd_1667_1674 AS int) AS dt_lst_annl_fee_chrgd_1667_1674,
        TRY_CAST(dt_lst_crdt_chng_1675_1682 AS int) AS dt_lst_crdt_chng_1675_1682,
        TRY_CAST(amt_lst_crdt_chng_1683_1691 AS int) AS amt_lst_crdt_chng_1683_1691,
        TRY_CAST(dt_lst_csh_lmt_chng_1692_1699 AS int) AS dt_lst_csh_lmt_chng_1692_1699,
        TRY_CAST(tmp_crdt_lmt_1700_1712 AS DOUBLE) AS tmp_crdt_lmt_1700_1712,
        TRY_CAST(dt_lst_tmp_crd_lmt_1713_1720 AS int) AS dt_lst_tmp_crd_lmt_1713_1720,
        TRY_CAST(orgnl_crd_lmt_1721_1733 AS DOUBLE) AS orgnl_crd_lmt_1721_1733,
        TRY_CAST(crd_actvtn_dt_1734_1741 AS int) AS crd_actvtn_dt_1734_1741,
        TRY_CAST(dt_lst_dlnqncy_1742_1749 AS int) AS dt_lst_dlnqncy_1742_1749,
        dlnqncy_hstry_flgs_24_13_1750_1761,
        fin_chr_indctr_1762_1762,
        ezcrd_enrllmnt_indctr_1763_1763,
        prvs_bill_cd_1764_1771,
        TRY_CAST(prvs_bill_day_1772_1779 AS int) AS prvs_bill_day_1772_1779,
        TRY_CAST(lst_trnsfr_bal_dt_1780_1787 AS int) AS lst_trnsfr_bal_dt_1780_1787,
        TRY_CAST(ovrlm_hstry_24_01_1788_1811 AS DOUBLE) AS ovrlm_hstry_24_01_1788_1811,
        TRY_CAST(auto_py_dy_1812_1813 AS int) AS auto_py_dy_1812_1813,
        TRY_CAST(auto_py_amt_1814_1826 AS DOUBLE) AS auto_py_amt_1814_1826,
        TRY_CAST(auto_py_prcnt_1827_1829 AS int) AS auto_py_prcnt_1827_1829,
        TRY_CAST(aba_rtng_num_1830_1838 AS int) AS aba_rtng_num_1830_1838,
        TRY_CAST(lst_auto_re_age_1839_1846 AS int) AS lst_auto_re_age_1839_1846,
        TRY_CAST(tms_auto_re_aged_1847_1848 AS int) AS tms_auto_re_aged_1847_1848,
        TRY_CAST(lst_manl_re_age_1849_1856 AS int) AS lst_manl_re_age_1849_1856,
        TRY_CAST(tms_manl_re_aged_1857_1858 AS int) AS tms_manl_re_aged_1857_1858,
        TRY_CAST(new_bal_purch_1859_1871 AS DOUBLE) AS new_bal_purch_1859_1871,
        TRY_CAST(new_bal_csh_1872_1884 AS DOUBLE) AS new_bal_csh_1872_1884,
        TRY_CAST(new_bal_specl_1885_1897 AS DOUBLE) AS new_bal_specl_1885_1897,
        TRY_CAST(csh_adv_lmt_1898_1910 AS DOUBLE) AS csh_adv_lmt_1898_1910,
        TRY_CAST(csh_adv_avail_1911_1923 AS DOUBLE) AS csh_adv_avail_1911_1923,
        TRY_CAST(ctd_prncpl_purch_1924_1936 AS DOUBLE) AS ctd_prncpl_purch_1924_1936,
        TRY_CAST(ctd_prncpl_csh_1937_1949 AS DOUBLE) AS ctd_prncpl_csh_1937_1949,
        TRY_CAST(ctd_prncpl_spcl_1950_1962 AS DOUBLE) AS ctd_prncpl_spcl_1950_1962,
        TRY_CAST(ctd_pymnt_1963_1975 AS DOUBLE) AS ctd_pymnt_1963_1975,
        TRY_CAST(inst_id_1976_1984 AS int) AS inst_id_1976_1984,
        corp_rtl_indctr_1985_1985,
        TRY_CAST(assctd_acct_num_1986_2001 AS bigint) AS assctd_acct_num_1986_2001,
        cnsldtd_acct_typ_2002_2002,
        TRY_CAST(comm_crd_cmpny_id_2003_2010 AS int) AS comm_crd_cmpny_id_2003_2010,
        TRY_CAST(comm_crd_sub_lvl_2011_2018 AS int) AS comm_crd_sub_lvl_2011_2018,
        bus_crd_indctr_2019_2019,
        TRY_CAST(pvs_acct_num_2020_2035 AS bigint) AS pvs_acct_num_2020_2035,
        TRY_CAST(lst_bcn_scr_2036_2038 AS int) AS lst_bcn_scr_2036_2038,
        TRY_CAST(orgnl_bnkrptcy_scr_2039_2041 AS int) AS orgnl_bnkrptcy_scr_2039_2041,
        TRY_CAST(lst_bnkrptcy_scr_2042_2044 AS int) AS lst_bnkrptcy_scr_2042_2044,
        TRY_CAST(orgnl_bcn_scr_2045_2047 AS int) AS orgnl_bcn_scr_2045_2047,
        TRY_CAST(src_2048_2053 AS int) AS src_2048_2053,
        TRY_CAST(chrg_off_amt_2054_2066 AS DOUBLE) AS chrg_off_amt_2054_2066,
        TRY_CAST(chrg_off_dt_2067_2074 AS int) AS chrg_off_dt_2067_2074,
        TRY_CAST(lst_crdt_scr_dt_2075_2082 AS int) AS lst_crdt_scr_dt_2075_2082,
        cnsldtd_pst_optn_2083_2083,
        TRY_CAST(triad_sp_id_2084_2085 AS int) AS triad_sp_id_2084_2085,
        TRY_CAST(triad_tst_dgts_2086_2087 AS int) AS triad_tst_dgts_2086_2087,
        TRY_CAST(triad_cllctn_scnr_id_2088_2090 AS int) AS triad_cllctn_scnr_id_2088_2090,
        triad_cllctn_scnr_id_2091_2095,
        TRY_CAST(triad_algnd_scr_2096_2099 AS int) AS triad_algnd_scr_2096_2099,
        TRY_CAST(triad_scr_typ_2100_2100 AS int) AS triad_scr_typ_2100_2100,
        TRY_CAST(triad_cllctn_indctr_2101_2103 AS int) AS triad_cllctn_indctr_2101_2103,
        TRY_CAST(triad_blnc_at_rsk_2104_2112 AS int) AS triad_blnc_at_rsk_2104_2112,
        TRY_CAST(cnvrtd_acct_num_2113_2128 AS int) AS cnvrtd_acct_num_2113_2128,
        TRY_CAST(usr_ltd_defrrd_intrst_2129_2141 AS int) AS usr_ltd_defrrd_intrst_2129_2141,
        TRY_CAST(unpd_prncpl_2142_2154 AS int) AS unpd_prncpl_2142_2154,
        TRY_CAST(unpd_fnnc_chrg_2155_2167 AS int) AS unpd_fnnc_chrg_2155_2167,
        TRY_CAST(unpd_annl_fee_2168_2180 AS int) AS unpd_annl_fee_2168_2180,
        TRY_CAST(unpd_othr_fee_2181_2193 AS int) AS unpd_othr_fee_2181_2193,
        TRY_CAST(unpd_insrnc_2194_2206 AS int) AS unpd_insrnc_2194_2206,
        acct_trm_id_2207_2214,
        TRY_CAST(acct_trms_id_chng_dt_2215_2222 AS int) AS acct_trms_id_chng_dt_2215_2222,
        TRY_CAST(dt_pymnt_due_alt_2223_2230 AS int) AS dt_pymnt_due_alt_2223_2230,
        TRY_CAST(num_mnths_pst_due_2231_2231 AS int) AS num_mnths_pst_due_2231_2231,
        nm_1_mddl_intl_2232_2232,
        nm_1_sffx_2233_2236,
        nm_2_mddl_intl_2237_2237,
        nm_2_sffx_2238_2241,
        nm_3_mddl_intl_2242_2242,
        nm_3_sffx_2243_2246,
        nm_4_mddl_intl_2247_2247,
        nm_4_sffx_2248_2251,
        TRY_CAST(num_dlnqnt_dys_2252_2254 AS int) AS num_dlnqnt_dys_2252_2254,
        insrnc_cd_2255_2255,
        TRY_CAST(oldst_mssd_pymnt_dlnqnt_dt_2256_2263 AS int) AS oldst_mssd_pymnt_dlnqnt_dt_2256_2263,
        TRY_CAST(ctd_dvrtd_amt_2264_2276 AS int) AS ctd_dvrtd_amt_2264_2276,
        TRY_CAST(ovrlmt_amt_2277_2289 AS DOUBLE) AS ovrlmt_amt_2277_2289,
        TRY_CAST(tot_pst_due_amt_2290_2302 AS DOUBLE) AS tot_pst_due_amt_2290_2302,
        TRY_CAST(tot_clcltd_pymnt_due_2303_2315 AS DOUBLE) AS tot_clcltd_pymnt_due_2303_2315,
        ccpi_sngl_mlt_indctr_2316_2316,
        nm_1_mil_indctr_2317_2317,
        nm_2_mil_indctr_2318_2318,
        nm_3_mil_indctr_2319_2319,
        nm_4_mil_indctr_2320_2320,
        TRY_CAST(num_mnths_w_crdt_bal_2321_2323 AS int) AS num_mnths_w_crdt_bal_2321_2323,
        TRY_CAST(triad_strtgc_prtfl_id_num_2324_2326 AS int) AS triad_strtgc_prtfl_id_num_2324_2326,
        TRY_CAST(triad_rndm_dgt_1_2327_2330 AS int) AS triad_rndm_dgt_1_2327_2330,
        TRY_CAST(triad_rndm_dgt_2_2331_2334 AS int) AS triad_rndm_dgt_2_2331_2334,
        TRY_CAST(triad_rndm_dgt_3_2335_2338 AS int) AS triad_rndm_dgt_3_2335_2338,
        TRY_CAST(triad_rndm_dgt_4_2339_2342 AS int) AS triad_rndm_dgt_4_2339_2342,
        TRY_CAST(triad_cllctn_scnr_id_2343_2346 AS int) AS triad_cllctn_scnr_id_2343_2346,
        TRY_CAST(bnkrptcy_dt_2347_2354 AS int) AS bnkrptcy_dt_2347_2354,
        nm_1_img_id_2355_2376,
        nm_2_img_id_2377_2398,
        nm_3_img_id_2399_2420,
        nm_4_img_id_2421_2442,
        TRY_CAST(prvs_mnl_re_age_dt_2443_2450 AS int) AS prvs_mnl_re_age_dt_2443_2450,
        co_brwr_indctr_2451_2451,
        co_brwr_addrs_ln_1_2452_2481,
        co_brwr_addrs_ln_2_2482_2511,
        co_brwr_addrs_ln_3_2512_2541,
        co_brwr_cty_2542_2571,
        co_brwr_st_2572_2574,
        co_brwr_curr_zip_2575_2583,
        co_brwr_addrs_frgn_indctr_2584_2584,
        co_brwr_cntry_cd_2585_2587,
        TRY_CAST(filler_2588_2600 AS int) AS filler_2588_2600,
        created_dt,
        updated_dt,
        COALESCE(updated_dt,created_dt) AS LAST_UPDATED_DATA,
        current_date() AS DATE_OF_DATA,
        TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH,
        TRY_CAST(LOADED_AT AS TIMESTAMP) AS LOADED_AT
    FROM
        landing.default.fis_cd300
),

bronze_data AS(
    SELECT
        future_use_1_4
        ,corp_id_5_6
        ,acct_num_7_22_masked
        ,crdt_lmt_23_35
        ,curr_bal_36_48
        ,avail_credit_49_61
        ,outstanding_auth_amt_62_74
        ,outstanding_auth_num_75_77
        ,block_code_78_78
        ,reclass_code_79_79
        ,rltnshp_acct_80_95
        ,ltd_num_mnths_pst_due_96_98
        ,primary_nm_99_124
        ,mnth_to_dt_pymnt_125_137
        ,lst_stmnt_bal_138_150
        ,amt_of_lst_pymnt_151_163
        ,dt_of_lst_pymnt_164_171
        ,dt_lst_purch_172_179
        ,dt_lst_csh_advnc_180_187
        ,dlnqntamt_188_200
        ,pymnt_due_201_213
        ,dt_pymnt_due_214_221
        ,exprtn_dt_222_227
        ,pst_due_hstry_12_01_228_239
        ,ssn_prmry_240_252
        ,ssn_scndry_253_265
        ,visa_plstc_out_266_267
        ,mc_pstc_out_268_269
        ,cycle_dy_chng_270_271
        ,typ_plstc_1_272_272
        ,typ_plstc_273_273
        ,rss_dnl_code_274_275
        ,spcl_sttmnt_grp_cd_276_276
        ,pymn_cd_277_277
        ,crd_fee_indctr_278_278
        ,crd_lf_cd_279_279
        ,auto_py_ac_typ_280_280
        ,bill_day_281_282
        ,tot_bal_fwd_csh_283_295
        ,curr_bill_cd_296_303
        ,curr_bill_dt_304_311
        ,crss_ref_num_312_327
        ,curr_pymnt_fxd_328_340
        ,dt_lst_fee_chrgd_341_348
        ,crd_lmt_chng_dt_1_349_356
        ,dda_acct_num_357_373
        ,prev_bllng_dt_374_381
        ,frst_us_dt_382_389
        ,lf_hgh_bal_amt_390_402
        ,lst_addrss_chng_dt_403_410
        ,dspt_amt_411_423
        ,lst_blckd_dt_424_431
        ,prdct_cd_432_434
        ,sub_prdct_cd_432_434
        ,_005_dys_dlnqnt_438_450
        ,_030_dys_dlnqnt_451_463
        ,_060_dys_dlnqnt_464_476
        ,_090_dys_dlnqnt_477_489
        ,_120_dys_dlnqnt_490_502
        ,_150_dys_dlnqnt_503_515
        ,_180_dys_dlnqnt_516_528
        ,_210_dys_dlnqnt_529_541
        ,chrg_off_cd_542_542
        ,secr_crd_crr_bal_543_555
        ,usr_fld_1_556_558
        ,usr_fld_2_559_561
        ,usr_fld_3_562_564
        ,usr_fld_4_565_567
        ,usr_fld_5_568_570
        ,usr_fld_6_571_573
        ,urs_fld_7_574_576
        ,usr_fld_8_577_579
        ,tms_5_dys_dlnqnt_580_582
        ,tms_30_dys_dlnqnt_583_585
        ,tms_60_dys_dlnqnt_586_588
        ,tms_90_dys_dlnqnt_589_591
        ,tms_120_dys_dlnqnt_592_594
        ,tms_150_dys_dlnqnt_595_597
        ,tms_180_dys_dlnqnt_598_600
        ,tms_210_dys_dlnqnt_601_603
        ,clnt_crd_scr_604_606
        ,prev_crd_scr_607_609
        ,addrss_ln_1_610_634
        ,addrss_ln_2_635_659
        ,addrss_ln_3_660_684
        ,city_685_709
        ,state_710_712
        ,zp_code_9_713_721
        ,zp_walk_cd_722_723
        ,phone_724_733
        ,bsnss_phn_734_743
        ,tot_bal_frwrd_744_756
        ,nm_1_brth_dt_757_764
        ,nm_2_brth_dt_765_772
        ,nm_1_crdt_assctn_773_773
        ,nm_2_crdt_assctn_774_774
        ,crdt_lf_prem_775_787
        ,dt_lst_fin_actvty_788_795
        ,ltd_mnths_ovrlmt_796_798
        ,crd_actvtn_status_799_799
        ,vs_plstcs_iss_dt_800_807
        ,mc_plstcs_iss_dt_808_815
        ,ltd_num_rtrnd_chks_816_818
        ,lst_nsf_dt_819_826
        ,lst_nsf_amt_827_839
        ,amt_lst_lt_chrg_840_852
        ,dt_acct_opnd_853_860
        ,curr_tot_due_861_873
        ,embssng_ln_4_874_898
        ,tot_ytd_fin_chrg_pd_899_911
        ,ytd_purch_amt_912_924
        ,ytd_purch_num_925_929
        ,ytd_lt_fee_pd_fees_930_942
        ,ctd_amnt_csh_adv_fee_943_955
        ,ctd_misc_fee_956_968
        ,ytd_fees_chrgd_969_981
        ,typ_prcssng_982_983
        ,ltd_lt_chrg_amt_984_996
        ,lt_chrg_ytd_997_1009
        ,lftm_purch_num_1010_1014
        ,lftm_purch_amt_1015_1027
        ,filler_1028_1040
        ,fin_chrg_ytd_1041_1053
        ,lst_sttmnt_dt_1054_1061
        ,name_2_1062_1087
        ,nxt_annl_rnwl_dt_1088_1094
        ,intrst_pd_lst_yr_1095_1107
        ,ach_py_amt_1108_1120
        ,ach_effctv_dt_1121_1128
        ,nm_3_1129_1154
        ,nm_3_ss_num_1155_1167
        ,nm_3_crdt_assctn_1168_1168
        ,nm_3_brth_dt_1169_1176
        ,nm_4_1117_1215
        ,nm_4_ss_num_1203_1215
        ,nm_4_crdt_assctn_1216_1261
        ,nm_4_brth_dt_1217_1224
        ,prmry_addrss_cntry_cd_1225_1227
        ,prmry_addrss_frgn_indctr_1228_1228
        ,sttmnt_ml_addrss_ln_1_1229_1258
        ,sttmnt_ml_addrss_ln_2_1259_1288
        ,sttmnt_ml_addrss_ln_3_1289_1318
        ,sttmnt_ml_addrss_cty_1319_1348
        ,sttmnt_ml_addrss_st_1349_1351
        ,sttmnt_ml_addrss_zip_code_1352_1360
        ,eml_addrss_1361_1430
        ,free_frm_memo_1431_1460
        ,phn_3_1461_1476
        ,phn_3_indctr_1477_1477
        ,phn_4_1478_1493
        ,phn_4_indctr_1494_1494
        ,phn_1495_1510
        ,phn_5_indctr_1511_1511
        ,prsnl_crp_rep_1512_1521
        ,rltnshp_mngr_1522_1528
        ,usr_num_1_1529_1536
        ,usr_num_2_1537_1544
        ,usr_fld_9_1545_1564
        ,usr_fld_10_1565_1584
        ,usr_fld_11_1585_1609
        ,usr_fld_12_1610_1612
        ,usr_fld_13_1613_1615
        ,usr_fld_14_1616_1618
        ,usr_fld_15_1619_1621
        ,usr_fld_16_1622_1624
        ,usr_fld_17_1625_1627
        ,usr_fld_18_1628_1630
        ,usr_fld_19_1631_1633
        ,usr_fld_20_1634_1635
        ,usr_fld_21_1636_1637
        ,usr_fld_22_1638_1639
        ,usr_fld_23_1640_1641
        ,ytd_num_rtrnd_chks_1642_1644
        ,dt_into_cllctns_1645_1652
        ,in_cllctns_indctr_1653_1653
        ,lst_annl_fee_amt_1654_1666
        ,dt_lst_annl_fee_chrgd_1667_1674
        ,dt_lst_crdt_chng_1675_1682
        ,amt_lst_crdt_chng_1683_1691
        ,dt_lst_csh_lmt_chng_1692_1699
        ,tmp_crdt_lmt_1700_1712
        ,dt_lst_tmp_crd_lmt_1713_1720
        ,orgnl_crd_lmt_1721_1733
        ,crd_actvtn_dt_1734_1741
        ,dt_lst_dlnqncy_1742_1749
        ,dlnqncy_hstry_flgs_24_13_1750_1761
        ,fin_chr_indctr_1762_1762
        ,ezcrd_enrllmnt_indctr_1763_1763
        ,prvs_bill_cd_1764_1771
        ,prvs_bill_day_1772_1779
        ,lst_trnsfr_bal_dt_1780_1787
        ,ovrlm_hstry_24_01_1788_1811
        ,auto_py_dy_1812_1813
        ,auto_py_amt_1814_1826
        ,auto_py_prcnt_1827_1829
        ,aba_rtng_num_1830_1838
        ,lst_auto_re_age_1839_1846
        ,tms_auto_re_aged_1847_1848
        ,lst_manl_re_age_1849_1856
        ,tms_manl_re_aged_1857_1858
        ,new_bal_purch_1859_1871
        ,new_bal_csh_1872_1884
        ,new_bal_specl_1885_1897
        ,csh_adv_lmt_1898_1910
        ,csh_adv_avail_1911_1923
        ,ctd_prncpl_purch_1924_1936
        ,ctd_prncpl_csh_1937_1949
        ,ctd_prncpl_spcl_1950_1962
        ,ctd_pymnt_1963_1975
        ,inst_id_1976_1984
        ,corp_rtl_indctr_1985_1985
        ,assctd_acct_num_1986_2001
        ,cnsldtd_acct_typ_2002_2002
        ,comm_crd_cmpny_id_2003_2010
        ,comm_crd_sub_lvl_2011_2018
        ,bus_crd_indctr_2019_2019
        ,pvs_acct_num_2020_2035
        ,lst_bcn_scr_2036_2038
        ,orgnl_bnkrptcy_scr_2039_2041
        ,lst_bnkrptcy_scr_2042_2044
        ,orgnl_bcn_scr_2045_2047
        ,src_2048_2053
        ,chrg_off_amt_2054_2066
        ,chrg_off_dt_2067_2074
        ,lst_crdt_scr_dt_2075_2082
        ,cnsldtd_pst_optn_2083_2083
        ,triad_sp_id_2084_2085
        ,triad_tst_dgts_2086_2087
        ,triad_cllctn_scnr_id_2088_2090
        ,triad_cllctn_scnr_id_2091_2095
        ,triad_algnd_scr_2096_2099
        ,triad_scr_typ_2100_2100
        ,triad_cllctn_indctr_2101_2103
        ,triad_blnc_at_rsk_2104_2112
        ,cnvrtd_acct_num_2113_2128
        ,usr_ltd_defrrd_intrst_2129_2141
        ,unpd_prncpl_2142_2154
        ,unpd_fnnc_chrg_2155_2167
        ,unpd_annl_fee_2168_2180
        ,unpd_othr_fee_2181_2193
        ,unpd_insrnc_2194_2206
        ,acct_trm_id_2207_2214
        ,acct_trms_id_chng_dt_2215_2222
        ,dt_pymnt_due_alt_2223_2230
        ,num_mnths_pst_due_2231_2231
        ,nm_1_mddl_intl_2232_2232
        ,nm_1_sffx_2233_2236
        ,nm_2_mddl_intl_2237_2237
        ,nm_2_sffx_2238_2241
        ,nm_3_mddl_intl_2242_2242
        ,nm_3_sffx_2243_2246
        ,nm_4_mddl_intl_2247_2247
        ,nm_4_sffx_2248_2251
        ,num_dlnqnt_dys_2252_2254
        ,insrnc_cd_2255_2255
        ,oldst_mssd_pymnt_dlnqnt_dt_2256_2263
        ,ctd_dvrtd_amt_2264_2276
        ,ovrlmt_amt_2277_2289
        ,tot_pst_due_amt_2290_2302
        ,tot_clcltd_pymnt_due_2303_2315
        ,ccpi_sngl_mlt_indctr_2316_2316
        ,nm_1_mil_indctr_2317_2317
        ,nm_2_mil_indctr_2318_2318
        ,nm_3_mil_indctr_2319_2319
        ,nm_4_mil_indctr_2320_2320
        ,num_mnths_w_crdt_bal_2321_2323
        ,triad_strtgc_prtfl_id_num_2324_2326
        ,triad_rndm_dgt_1_2327_2330
        ,triad_rndm_dgt_2_2331_2334
        ,triad_rndm_dgt_3_2335_2338
        ,triad_rndm_dgt_4_2339_2342
        ,triad_cllctn_scnr_id_2343_2346
        ,bnkrptcy_dt_2347_2354
        ,nm_1_img_id_2355_2376
        ,nm_2_img_id_2377_2398
        ,nm_3_img_id_2399_2420
        ,nm_4_img_id_2421_2442
        ,prvs_mnl_re_age_dt_2443_2450
        ,co_brwr_indctr_2451_2451
        ,co_brwr_addrs_ln_1_2452_2481
        ,co_brwr_addrs_ln_2_2482_2511
        ,co_brwr_addrs_ln_3_2512_2541
        ,co_brwr_cty_2542_2571
        ,co_brwr_st_2572_2574
        ,co_brwr_curr_zip_2575_2583
        ,co_brwr_addrs_frgn_indctr_2584_2584
        ,co_brwr_cntry_cd_2585_2587
        ,filler_2588_2600
        ,created_dt
        ,updated_dt
        ,LAST_UPDATED_DATA
        ,DATE_OF_DATA
        ,YEARMONTH
    FROM landing_data
    
    
)





SELECT bd.*, current_timestamp() AS LOADED_AT FROM bronze_data bd;
COMMENT ON TABLE bronze.default.bronze_fis_cd300 IS
'Bronze table bronze_fis_cd300 contains standardized data loaded from the landing layer for Databricks validation and downstream processing.';


-- From bronze-fis.dbx.sql
-- Source model: bronze_fis_ethos_interchange_fee_data
CREATE OR REPLACE TABLE bronze.default.bronze_fis_ethos_interchange_fee_data AS
-- NAME: FIS_ETHOS_INTERCHANGE_FEE_DATA
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
        Index__CS
        ,Account_Number
        ,Customer_Number
        ,BIN
        ,Product
        ,Block_Reclass_Desc
        ,Transaction_Code
        ,Trans_Reason_Code
        ,Trans_Reason_Desc
        ,Sub_Product
        ,Interchange_Fee
        ,Transaction_Amount
        ,Merchant_Name
        ,Merchant_Country_Code
        ,Transaction_Date
        ,Posting_Date
        ,SIC_4_Code
        ,SIC_Description
        ,Posting_Date AS DATE_OF_DATA
        ,TRY_CAST(date_format(LOADED_AT, 'yyyyMM') AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
    landing.default.fis_ethos_interchange_fee_data
),

bronze_data AS(
    SELECT
         Index__CS
        ,Account_Number
        ,Customer_Number
        ,BIN
        ,Product
        ,Block_Reclass_Desc
        ,Transaction_Code
        ,Trans_Reason_Code
        ,Trans_Reason_Desc
        ,Sub_Product
        ,Interchange_Fee
        ,Transaction_Amount
        ,Merchant_Name
        ,Merchant_Country_Code
        ,Transaction_Date
        ,Posting_Date
        ,SIC_4_Code
        ,SIC_Description
        ,DATE_OF_DATA
        ,YEARMONTH
        ,LOADED_AT as LOADED_AT_NIFI_BASE
    FROM landing_data
)





SELECT *,current_timestamp() AS LOADED_AT FROM bronze_data;
COMMENT ON TABLE bronze.default.bronze_fis_ethos_interchange_fee_data IS
'Bronze table bronze_fis_ethos_interchange_fee_data contains standardized data loaded from the landing layer for Databricks validation and downstream processing.';


-- From bronze-fis.dbx.sql
-- Source model: bronze_fis_lp_510
CREATE OR REPLACE TABLE bronze.default.bronze_fis_lp_510 AS
-- NAME: BRONZE_FIS_LP_510
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: February 25, 2026



WITH landing_data AS (
    SELECT
        acct_num,
        `status`,
        pt,
        TRY_CAST(beg_bal AS INT) AS beg_bal,
        TRY_CAST(base_pts AS INT) AS base_pts,
        TRY_CAST(promo_pts_earned AS INT) AS promo_pts_earned,
        TRY_CAST(scoremore_pts_earned AS INT) AS scoremore_pts_earned,
        TRY_CAST(relation_pts_earned AS INT) AS relation_pts_earned,
        TRY_CAST(curr_adjusted AS INT) AS curr_adjusted,
        TRY_CAST(curr_redeemed AS INT) AS curr_redeemed,
        TRY_CAST(curr_exp AS INT) AS curr_exp,
        TRY_CAST(curr_avail AS INT) AS curr_avail,
        TRY_CAST(anticipated_to_exp AS INT) AS anticipated_to_exp,
        non_statused_acct_to,
        grand_tot,
        TRY_CAST(processed_at AS DATE) as processed_at,
        TRY_CAST(data_date AS DATE) AS DATE_OF_DATA,
        TRY_CAST(date_format(TRY_CAST(data_date AS DATE), 'yyyyMM') AS INT) AS YEARMONTH
    FROM
        landing.default.fis_lp_510
    
    
)





SELECT *, current_timestamp() AS LOADED_AT FROM landing_data;
COMMENT ON TABLE bronze.default.bronze_fis_lp_510 IS
'Bronze table bronze_fis_lp_510 contains standardized data loaded from the landing layer for Databricks validation and downstream processing.';

