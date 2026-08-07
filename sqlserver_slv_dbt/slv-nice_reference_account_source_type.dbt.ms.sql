-- NAME: SILVER_NICE_REFERENCE_ACCOUNT_PRODUCT
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: MONTHLY
-- LOAD TYPE: FULL LOAD
-- TYPE: SOURCE
-- DATE: December 23, 2025

{{
   config(
          tags=["Monthly"]
        )
}}

WITH cte_data AS (
  SELECT
      PRODUCT_CD,
      TENANT_CD,
      PRODUCT_DESC,
      CUSTOM_BOOLEAN_01,
      CUSTOM_BOOLEAN_02,
      CUSTOM_SMALL_STRING_01,
      CUSTOM_SMALL_STRING_02,
      CUSTOM_SMALL_STRING_03,
      CUSTOM_SMALL_STRING_04
  FROM
    {{ ref('bronze_nice_reference_account_product') }}
)

select *, GETUTCDATE() as LOADED_AT FROM cte_data