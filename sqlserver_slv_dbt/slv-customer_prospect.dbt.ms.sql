-- NAME: SILVER_CUSTOMER_PROSPECT
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: June 28, 2024

{{
   config(
          tags=["cos_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        app_ref
        ,request_data
        ,[status]
        ,modifed_on
        ,modified_by
        ,created_on
        ,created_by
        ,contaCorrente
        ,agencia
        ,segmento
        ,cblc
        ,bbdid
        ,stage_prospect
        ,user_working
        ,bbdesk_version
        ,YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM
        {{ ref('bronze_cos_prospect') }}
    WHERE CONVERT(DATE,LOADED_AT) = CONVERT(DATE, GETUTCDATE())
)

SELECT * FROM bronze_data