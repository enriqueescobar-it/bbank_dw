-- NAME: SILVER_REFERENCETABLE_LNPAR3
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
        L3TRAN
        ,L3DORC
        ,L3AFFT
        ,L3AFNP
        ,L3TCDS
        ,L3STMD
        ,L3FPAY
        ,L3STMT
        ,L3ANAL
        ,L3STPS
        ,L3ENCL
        ,L3OVZR
        ,L3STCD
        ,L3XADV
        ,L3LACD
        ,L3FEE__CS
        ,L3PART
        ,L3EDRF
        ,L3MONE
        ,L3RCPT
        ,L3MAFE
        ,L3REAM
        ,L3WAIV
        ,L3SVRS
        ,L3CASH
        ,AsOfDate
        ,YEARMONTH
		,GETUTCDATE() AS LOADED_AT
    FROM {{ ref('bronze_jh_lnpar3') }}
	WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data