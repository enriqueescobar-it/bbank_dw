-- NAME: SILVER_REFERENCETABLE_DDPAR3
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: December 21, 2024

{{
   config(
		  tags=["jh_standard"]
        )
}}

WITH bronze_data AS (
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
        ,YEARMONTH
		,GETUTCDATE() AS LOADED_AT
    FROM {{ ref('bronze_jh_ddpar3') }}
	WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
)

SELECT * FROM bronze_data