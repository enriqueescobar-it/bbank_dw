-- NAME: SILVER_PRODUCT_FIS_LP_510
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: February 26, 2026

{{
   config(
          tags=["Monthly_4BD", "BR00009"]
        )
}}

WITH bronze_data AS (
	SELECT
        acct_num,
        [status],
        pt,
        beg_bal,
        base_pts,
        promo_pts_earned,
        scoremore_pts_earned,
        relation_pts_earned,
        curr_adjusted,
        curr_redeemed,
        curr_exp,
        curr_avail,
        anticipated_to_exp,
        non_statused_acct_to,
        grand_tot,
        processed_at,
        DATE_OF_DATA,
        YEARMONTH,
        GETUTCDATE() AS LOADED_AT
	FROM
        {{ref('bronze_fis_lp_510')}}
	WHERE
        DATE_OF_DATA = (SELECT MAX(DATE_OF_DATA) FROM {{ ref('bronze_fis_lp_510')}})
)

SELECT * FROM bronze_data