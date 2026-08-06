-- NAME: SILVER_DMI_PRODUCT_TRANSACTION_CODES_MAPPING
-- CATEGORY: MODEL
-- LAYER: SILVER
-- FREQUENCY: MONTHLY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: March 26, 2026

{{
   config(
          tags=["Monthly"]
        )
}}

WITH bronze_data AS (
    SELECT
        SHEET,
        TRAN_CODE,
        CATEGORY,
        [DESCRIPTION],
        GETUTCDATE() AS LOADED_AT
    FROM
        {{ref('bronze_dmi_transaction_codes_mapping')}}
)

SELECT * FROM bronze_data