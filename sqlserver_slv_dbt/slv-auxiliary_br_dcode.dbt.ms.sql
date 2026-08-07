-- NAME: SILVER_AUXILIARY_BR_DCODE
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: July 31, 2025

{{
   config(
          tags=["Monthly"]
        )
}}

WITH bronze_data AS (
    SELECT
        Mapping_Type,
        [Key],
        [Value],
        GETUTCDATE() AS LOADED_AT
    FROM
        {{ref('bronze_auxiliary_br_dcode')}}
)

SELECT * FROM bronze_data