-- NAME: BRONZE_JH_LNPAR3
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: December 21, 2024



WITH landing_data AS (
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
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) AS AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_LNPAR3"
),

bronze_data AS (
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
        ,CONVERT(INT, CONVERT(nvarchar(6),AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_lnpar3"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data