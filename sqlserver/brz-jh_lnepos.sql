-- NAME: BRONZE_JH_LNEPOS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: April 30, 2025




WITH landing_data AS (
    SELECT
        FPTYPE
        ,FPBR__CS
        ,FPACCT
        ,FPFTYP
        ,FPGRUP
        ,FPDESC
        ,FPNFEE
        ,FPFREP
        ,FPPAMT
        ,FPIDIF
        ,FPRATE
        ,FPYELD
        ,FPLNCR
        ,FPBGND
        ,FPENDD
        ,FPOBR__CS
        ,FPOGR__CS
        ,FPFEEM
        ,FPCOST
        ,FPPROD
        ,FPOCST
        ,FPOPRD
        ,FPBUEB
        ,FPEUEB
        ,FPNEWAM
        ,FPPRTYP
        ,FPGLBKT
        ,FPLNSTS
        ,FPSEQ__CS
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL as YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_LNEPOS"
),

bronze_data AS (
    SELECT
        FPTYPE
        ,FPBR__CS
        ,FPACCT
        ,FPFTYP
        ,FPGRUP
        ,FPDESC
        ,FPNFEE
        ,FPFREP
        ,FPPAMT
        ,FPIDIF
        ,FPRATE
        ,FPYELD
        ,FPLNCR
        ,FPBGND
        ,FPENDD
        ,FPOBR__CS
        ,FPOGR__CS
        ,FPFEEM
        ,FPCOST
        ,FPPROD
        ,FPOCST
        ,FPOPRD
        ,FPBUEB
        ,FPEUEB
        ,FPNEWAM
        ,FPPRTYP
        ,FPGLBKT
        ,FPLNSTS
        ,FPSEQ__CS
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6),  AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_lnepos"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data