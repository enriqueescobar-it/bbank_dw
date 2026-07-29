-- NAME: BRONZE_JH_GLHIST
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: June 28, 2024



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
        ,CONVERT(DATE, dbo.ConvertJhDateJulianToDatetime(TREFF7), 112) as AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_GLHIST"

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
        ,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
)
SELECT * FROM bronze_data