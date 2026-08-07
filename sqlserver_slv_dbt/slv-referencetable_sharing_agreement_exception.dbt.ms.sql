-- NAME: SILVER_REFERENCETABLE_SHARING_AGREEMENT_EXCEPTION
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: July 01, 2024

{{
   config(
		  tags=["rprt_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        id
        ,cif_no
        ,active
        ,CONVERT(INT, CONVERT(nvarchar(6), LOADED_AT, 112)) AS YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM {{ ref('bronze_rprt_sharing_agreement_exception') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data