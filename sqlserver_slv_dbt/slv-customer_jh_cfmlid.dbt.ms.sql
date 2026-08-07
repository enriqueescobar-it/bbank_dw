-- NAME: SILVER_CUSTOMER_JH_CFMLID
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: December 29, 2025

{{
   config(
        tags=["jh_standard"]
    )
}}

WITH bronze_data AS (
	SELECT
        CFCIF__CS,
        CFIDCD,
        CFIDNO,
        CFPLIS,
        CFIISD6,
        CFIISD7,
        CFIEXD6,
        CFIEXD7,
        CFICTD6,
        CFICTD7,
        CFVRYCD,
        CFVTXST,
        ExpirationDate,
        IssuanceDate,
        ContactDate,
		AsOfDate,
		YEARMONTH,
		LOADED_AT
	FROM {{ ref('bronze_jh_cfmlid')}}
	WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data