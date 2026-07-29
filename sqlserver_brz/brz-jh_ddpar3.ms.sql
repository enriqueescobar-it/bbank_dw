-- NAME: BRONZE_JH_DDPAR3
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: December 21, 2024



WITH landing_data AS (
    SELECT
        TRANCD
        ,REVRTC
        ,DORC
        ,BORI
        ,EFTTYP
        ,FPAY
        ,STOPS
        ,STMT
        ,SCITEM
        ,TIMNSF
        ,MMDDR
        ,LISTPO
        ,PSTSEQ
        ,CNTENC
        ,DESC__CS
        ,STMDSC
        ,DESSTM
        ,RECID
        ,UPDTDLA
        ,P3ARPNTPRT
        ,P3ARPEXTRC
        ,P3TRKREFND
        ,P3AFFNSF
        ,P3UPDNSF
        ,P3COBAL
        ,P3RNDCHG
        ,P3TSA1
        ,P3TSA2
        ,P3TSA3
        ,P3TSA4
        ,P3IEODO
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) AS AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_DDPAR3"
),

bronze_data AS (
    SELECT
        TRANCD
        ,REVRTC
        ,DORC
        ,BORI
        ,EFTTYP
        ,FPAY
        ,STOPS
        ,STMT
        ,SCITEM
        ,TIMNSF
        ,MMDDR
        ,LISTPO
        ,PSTSEQ
        ,CNTENC
        ,DESC__CS
        ,STMDSC
        ,DESSTM
        ,RECID
        ,UPDTDLA
        ,P3ARPNTPRT
        ,P3ARPEXTRC
        ,P3TRKREFND
        ,P3AFFNSF
        ,P3UPDNSF
        ,P3COBAL
        ,P3RNDCHG
        ,P3TSA1
        ,P3TSA2
        ,P3TSA3
        ,P3TSA4
        ,P3IEODO
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6),AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_ddpar3"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data