-- NAME: SILVER_NICE_REFERENCE_ACCOUNT_STATUS
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
      ACCOUNT_STATUS_CD,
      TENANT_CD,
      ACCOUNT_STATUS_DESC,
      IS_TO_BE_DELETED,
      SHORT_NAME,
      [DEFINITION],
      CUSTOM_BOOLEAN_01,
      CUSTOM_MEDIUM_STRING_01,
      CUSTOM_SMALL_STRING_01,
      CUSTOM_SMALL_STRING_02,
      CUSTOM_SMALL_STRING_03
  FROM
    {{ ref('bronze_nice_reference_account_status') }}
)

select *, GETUTCDATE() as LOADED_AT FROM cte_data