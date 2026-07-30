-- NAME: BRONZE_PERSHINGDATAPROD_MASTER_ASSET
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024

{{
   config(
          materialized='incremental',
          incremental_strategy='append',
          tags=["Monthly_4BD", "BR00009"]
        )
}}


WITH landing_data AS (
SELECT
     ID
    ,TRANSFER_ID
    ,DATA_DT
    ,RUN_DT
    ,TRANSFER_TYPE
    ,SEQUENCE
    ,ACCOUNT
    ,IP
    ,ASSET_TYPE
    ,ASSET_TYPE_ID
    ,NUMBER
    ,DESCRIPTION
    ,STATUS
    ,QUANTITY
    ,VALUE
    ,CASH_MARGIN
    ,DELIVERY
    ,JSON_DATA
    ,REQUEST_ID
    --,CONVERT(INT, CONVERT(nvarchar(6), DATEADD("m", -1, LOADED_AT), 112)) AS YEARMONTH
    ,CAST(FORMAT(DATA_DT,'yyyyMM') as INTEGER) AS YEARMONTH
    ,LOADED_AT
FROM
    {{ source("pershing", "PERSHINGDATAPROD_MASTER_ASSET") }}
),

bronze_data AS (
SELECT
     ID
    ,TRANSFER_ID
    ,DATA_DT
    ,RUN_DT
    ,TRANSFER_TYPE
    ,SEQUENCE
    ,ACCOUNT
    ,IP
    ,ASSET_TYPE
    ,ASSET_TYPE_ID
    ,NUMBER
    ,DESCRIPTION
    ,STATUS
    ,QUANTITY
    ,VALUE
    ,CASH_MARGIN
    ,DELIVERY
    ,JSON_DATA
    ,REQUEST_ID
    ,YEARMONTH
    ,GETUTCDATE() LOADED_AT
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