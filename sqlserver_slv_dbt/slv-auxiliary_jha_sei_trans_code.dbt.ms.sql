-- NAME: SILVER_AUXILIARY_JHA_SEI_TRANS_CODE
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: MONTHY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: October 17, 2025

{{
   config(
          tags=["Monthly"]
        )
}}

WITH bronze_data AS (
    SELECT
        [TYPE],
        [CODE],
        [DEBIT_CREDIT],
        [AFFECT],
        [DESCRIPTION],
        [TRANSACTION_TYPE],
        [ACCOUNT_TYPE],
        [DESCRIPTION_CODE],
        [TREATMENT_CODE]
    FROM
        {{ref('bronze_auxiliary_jha_sei_trans_code')}}
)

SELECT *, GETUTCDATE() AS LOADED_AT FROM bronze_data