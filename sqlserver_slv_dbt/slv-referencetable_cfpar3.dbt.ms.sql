-- NAME: SILVER_REFERENCETABLE_CFPAR3
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: MONTHLY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: November 24, 2025

{{
   config(
          tags=["Monthly"]
        )
}}

WITH bronze_data AS (
    SELECT
        CP3RID,
        CP3UIC,
        CP3UID,
        CP3UCD,
        CP3DSC,
        GETUTCDATE() AS LOADED_AT
    FROM
        {{ref('bronze_jh_cfpar3')}}
)

SELECT * FROM bronze_data