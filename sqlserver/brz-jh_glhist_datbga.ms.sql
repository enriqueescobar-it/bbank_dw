-- NAME: BRONZE_JH_GLHIST_DATBGA
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: April 22, 2025



WITH landing_data AS (
    SELECT
        TRBR
        ,TRACCT
        ,TRCOST
        ,TRPROD
        ,TRCODE
        ,TRDORC
        ,TRAFFT
        ,TRBAT
        ,TRSEQ
        ,TRSRC
        ,TRAMT
        ,TRDESC
        ,TRDSEQ
        ,TROFCR
        ,TRGRP
        ,TRSYS
        ,TRIFC
        ,TRDAT6
        ,TRDAT7
        ,TREFF6
        ,TREFF7
        ,TRMUID
        ,IMAGE__CS
        ,ACFILK
        ,ACBATN
        ,ACSEQN
        ,TRREFF
        ,TRJXPD
        ,TRJXVD
        ,GUID__CS
        ,JHTRANID
        ,dbo.ConvertJhDateJulianToDatetime(TRDAT7) AS PostingDate
        ,dbo.ConvertJhDateToDatetime(TREFF6) AS EffectiveDate
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), dbo.ConvertJhDateJulianToDatetime(TREFF7), 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_GLHIST_DATBGA"

),

bronze_data AS (
    SELECT
        TRBR
        ,TRACCT
        ,TRCOST
        ,TRPROD
        ,TRCODE
        ,TRDORC
        ,TRAFFT
        ,TRBAT
        ,TRSEQ
        ,TRSRC
        ,TRAMT
        ,TRDESC
        ,TRDSEQ
        ,TROFCR
        ,TRGRP
        ,TRSYS
        ,TRIFC
        ,TRDAT6
        ,TRDAT7
        ,TREFF6
        ,TREFF7
        ,TRMUID
        ,IMAGE__CS
        ,ACFILK
        ,ACBATN
        ,ACSEQN
        ,TRREFF
        ,TRJXPD
        ,TRJXVD
        ,GUID__CS
        ,JHTRANID
        ,PostingDate
        ,EffectiveDate
        ,AsOfDate
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
)
SELECT * FROM bronze_data