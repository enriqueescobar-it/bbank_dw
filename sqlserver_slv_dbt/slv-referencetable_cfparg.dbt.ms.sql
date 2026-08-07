-- NAME: SILVER_REFERENCETABLE_CFPARG
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: July 01, 2024

{{
   config(
		  tags=["jh_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        CPGRP__CS
        ,CPGRPD
        ,CPGOF1
        ,CPGOF2
        ,CPGBR__CS
        ,CPGCIF
        ,CPGRTCD
        ,CPGTYP
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM {{ ref('bronze_jh_cfparg') }}
    WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data