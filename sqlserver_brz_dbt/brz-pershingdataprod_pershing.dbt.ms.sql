-- NAME: BRONZE_PERSHINGDATAPROD_PERSHING
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
          tags=["pershing_bbdata", "BR00009"]
        )
}}


WITH landing_data AS (
SELECT
     PERSHINGID
    ,ACCTNO
    ,INVACC
    ,INVACT
    ,BRANCH
    ,GLPROD
    ,CFNA1
    ,CFNATITLE
    ,CFNA2
    ,CFNA3
    ,CFNA4
    ,CFCITY
    ,CFSTAT
    ,CFZIP
    ,CFCOUNTRY
    ,INVAMT
    ,TEST1
    ,TEST2
    ,INVCIF
    ,INVTAXID
    ,OFFICR
    ,CBAL
    ,INVDT6
    ,CFHPHO
    ,CFBPHO
    ,CFFAX
    ,CLASS
    ,MMAMOUNT
    ,CREATEDATE
    ,ACCTSTATUS
    ,ACCTDATECLOSED
    ,IP
    ,RISKFACTORCODE
    ,INVESTOBJCODE
    ,NAMEINVESTPRO
    ,CONVERT(INT, CONVERT(nvarchar(6), DATEADD("m", -1, LOADED_AT), 112)) AS YEARMONTH
    ,LOADED_AT

FROM
    {{ source("pershing", "PERSHINGDATAPROD_PERSHING") }}
),

bronze_data AS (
SELECT
  PERSHINGID
    ,ACCTNO
    ,INVACC
    ,INVACT
    ,BRANCH
    ,GLPROD
    ,CFNA1
    ,CFNATITLE
    ,CFNA2
    ,CFNA3
    ,CFNA4
    ,CFCITY
    ,CFSTAT
    ,CFZIP
    ,CFCOUNTRY
    ,INVAMT
    ,TEST1
    ,TEST2
    ,INVCIF
    ,INVTAXID
    ,OFFICR
    ,CBAL
    ,INVDT6
    ,CFHPHO
    ,CFBPHO
    ,CFFAX
    ,CLASS
    ,MMAMOUNT
    ,CREATEDATE
    ,ACCTSTATUS
    ,ACCTDATECLOSED
    ,IP
    ,RISKFACTORCODE
    ,INVESTOBJCODE
    ,NAMEINVESTPRO
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