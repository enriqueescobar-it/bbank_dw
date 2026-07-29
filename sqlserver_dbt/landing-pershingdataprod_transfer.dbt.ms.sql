-- NAME: BRONZE_PERSHINGDATAPROD_TRANSFER
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024

{{
   config(
          materialized='incremental',
          incremental_strategy='append',
          tags=["pershing_standard"]
        )
}}

with landing_data as (
    SELECT
        ID
        ,DATA_DT
        ,RUN_DT
        ,TYPE
        ,SEQUENCE
        ,ACCOUNT
        ,IP
        ,TYPE2
        ,STATUS
        ,DAYS
        ,CB_NUMBER
        ,CB_NAME
        ,CA_NUMBER
        ,RETIREMENT
        ,CREATION_DT
        ,CREATION_USER
        ,UPDATE_DT
        ,UPDATE_USER
        ,AMOUNT
        ,SOURCE
        ,SMA
        ,CUSTOMER
        ,TAX_ID
        ,JSON_DATA
        ,REJECT
        ,COMMENTS
        ,REQUEST_ID
        ,LOADED_AT
        ,CONVERT(INT, CONVERT(nvarchar(6), LOADED_AT, 112)) AS YEARMONTH
    FROM
        {{ source("pershing", "PERSHINGDATAPROD_TRANSFER") }}
),

bronze_data AS (
    SELECT
        ID
        ,DATA_DT
        ,RUN_DT
        ,TYPE
        ,SEQUENCE
        ,ACCOUNT
        ,IP
        ,TYPE2
        ,STATUS
        ,DAYS
        ,CB_NUMBER
        ,CB_NAME
        ,CA_NUMBER
        ,RETIREMENT
        ,CREATION_DT
        ,CREATION_USER
        ,UPDATE_DT
        ,UPDATE_USER
        ,AMOUNT
        ,SOURCE
        ,SMA
        ,CUSTOMER
        ,TAX_ID
        ,JSON_DATA
        ,REJECT
        ,COMMENTS
        ,REQUEST_ID
        ,GETUTCDATE() AS LOADED_AT
        ,YEARMONTH
    FROM landing_data
    {% if is_incremental() %}
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM {{ this }}),'1970-01-01 00:00:00.000')
    {% endif %}
)

{% if execute %}
{{
    log("Running incrementally: " ~ is_incremental(), info=True)
}}
{% endif %}

SELECT * FROM bronze_data
