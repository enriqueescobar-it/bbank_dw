-- NAME: SILVER_NICE_REFERENCE_BALANCE_TYPE
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
      BALANCE_TYPE_CD,
      TENANT_CD,
      BALANCE_TYPE_DESC,
      SHORT_NAME,
      [DEFINITION],
      BALANCE_TYPE_DV,
      CUSTOM_BOOLEAN_01,
      CUSTOM_MEDIUM_STRING_01,
      CUSTOM_SMALL_STRING_01,
      CUSTOM_SMALL_STRING_02,
      CUSTOM_SMALL_STRING_03
  FROM
    {{ ref('bronze_nice_reference_balance_type') }}
)

select *, GETUTCDATE() as LOADED_AT FROM cte_data