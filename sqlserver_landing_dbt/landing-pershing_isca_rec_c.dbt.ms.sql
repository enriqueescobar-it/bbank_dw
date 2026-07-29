-- NAME: BRONZE_PERSHING_ISCA_REC_C
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: January 06, 2026

{{
   config(
          materialized='incremental',
          incremental_strategy='append',
          tags=["pershing_standard"]
        )
}}

WITH landing_data AS (
    SELECT DISTINCT
        RECORD_INDICATOR_VALUE,
        CONVERT(INT, RECORD_ID_SEQUENCE_NUMBER) AS RECORD_ID_SEQUENCE_NUMBER,
        CUSIP_NUMBER,
        STATE_TAX_INDICATOR,
        FEDERAL_TAXABLE_STATUS_INDICATOR,
        AMT_INDICATOR,
        RIC_INDICATOR,
        NUMBER_OF_DESCRIPTION_LINES,
        SECURITY_DESCRIPTION_LINE_1,
        SECURITY_DESCRIPTION_LINE_2,
        SECURITY_DESCRIPTION_LINE_3,
        SECURITY_DESCRIPTION_LINE_4,
        SECURITY_DESCRIPTION_LINE_5,
        USER_CUSIP_IDENTIFIER,
        CONVERT(INT, PRICE_PURGE_DATE) PRICE_PURGE_DATE,
        TAXABLE_INDICATOR,
        CONVERT(DATE, DATE_OF_DATA) AS DATE_OF_DATA,
        YEARMONTH
    FROM
        {{ source("pershing", "PERSHING_ISCA_C") }}
    {% if is_incremental() %}
        WHERE DATE_OF_DATA NOT IN (SELECT DISTINCT DATE_OF_DATA FROM {{ this }})
    {% endif %}
)

{% if execute %}
{{
    log("Running incrementally: " ~ is_incremental(), info=True)
}}
{% endif %}

SELECT *, GETUTCDATE() AS LOADED_AT FROM landing_data