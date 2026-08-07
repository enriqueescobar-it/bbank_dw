-- NAME: SILVER_NICE_REFERENCE_BSA_PARTY_SEGMENT
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: MONTHLY
-- LOAD TYPE: FULL LOAD
-- TYPE: SOURCE
-- DATE: July 21, 2026

{{
   config(
          tags=["Monthly"]
        )
}}

SELECT
  CLASSIFICATION_CD,
  DESCRIPTION,
  SCORE,
	GETUTCDATE() AS LOADED_AT
FROM
  {{ ref('bronze_nice_reference_bsa_party_segment') }}