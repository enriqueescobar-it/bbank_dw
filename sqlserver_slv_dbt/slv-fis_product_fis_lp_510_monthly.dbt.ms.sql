-- NAME: SILVER_PRODUCT_FIS_LP_510_MONTHLY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: February 26, 2026

{{
   config(
          materialized='incremental',
          incremental_strategy='append',
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
        YEARMONTH
	FROM
        {{ref('bronze_fis_lp_510')}}
),

filter_data AS (
    {% if not is_incremental() %}
        SELECT
            * ,GETUTCDATE() AS LOADED_AT
        FROM bronze_data
    {% endif %}
    {% if is_incremental() %}
        SELECT *, GETUTCDATE() AS LOADED_AT FROM bronze_data
        WHERE
            DATE_OF_DATA NOT IN (SELECT DISTINCT DATE_OF_DATA FROM {{this}})
    {% endif %}
)

{% if execute %}
{{
    log("Running incrementally: " ~ is_incremental(), info=True)
}}
{% endif %}

SELECT * FROM filter_data