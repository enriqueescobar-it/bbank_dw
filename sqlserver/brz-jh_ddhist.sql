-- NAME: BRONZE_JH_DDHIST
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: June 28, 2024



with landing_data as (
    SELECT
        CONCAT(TRACCT,'-',TRANCD,'-',TRDATE,'-',PSTSQ__CS,'-',ATMCOD) AS ID
        ,TRSTAT
        ,TRACCT
        ,TRATYP
        ,TRANCD
        ,TRDATE
        ,TREFFD
        ,TRRATE
        ,AMT
        ,[SERIAL]
        ,RUN__CS
        ,BATCH
        ,SEQ
        ,RETDAY
        ,ATMCOD
        ,CHGFLG
        ,NOBOOK
        ,TRDAT6
        ,TREFF6
        ,SOURCE
        ,DORC
        ,BORI
        ,DESSTM
        ,PSTSQ__CS
        ,IMAGE__CS
        ,ACFILK
        ,ACBATN
        ,ACSEQN
        ,ACHSEC
        ,KTRESCODE
        ,PASPNT
        ,PDCK21M
        ,PDIMSRC
        ,DDUSRID
        ,ACHCON
        ,[ROUTE]
        ,ACHCOI
        ,CKPAYEE
        ,JXPROD
        ,JXVEND
        ,PDPAYEE
        ,PSTTMSTMP
        ,JHTRANID
        ,dbo.ConvertJhDateJulianToDatetime(TRDATE) as TransactionDate
        ,dbo.ConvertJhDateJulianToDatetime(TREFFD) as EffectiveDate
        ,CONVERT(DATE, dbo.ConvertJhDateJulianToDatetime(TREFFD), 23) AS AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_DDHIST"
),


bronze_data AS (
    SELECT
        ID
        ,TRSTAT
        ,TRACCT
        ,TRATYP
        ,TRANCD
        ,TRDATE
        ,TREFFD
        ,TRRATE
        ,AMT
        ,[SERIAL]
        ,RUN__CS
        ,BATCH
        ,SEQ
        ,RETDAY
        ,ATMCOD
        ,CHGFLG
        ,NOBOOK
        ,TRDAT6
        ,TREFF6
        ,SOURCE
        ,DORC
        ,BORI
        ,DESSTM
        ,PSTSQ__CS
        ,IMAGE__CS
        ,ACFILK
        ,ACBATN
        ,ACSEQN
        ,ACHSEC
        ,KTRESCODE
        ,PASPNT
        ,PDCK21M
        ,PDIMSRC
        ,DDUSRID
        ,ACHCON
        ,[ROUTE]
        ,ACHCOI
        ,CKPAYEE
        ,JXPROD
        ,JXVEND
        ,PDPAYEE
        ,PSTTMSTMP
        ,JHTRANID
        ,TransactionDate
        ,EffectiveDate
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) as YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
)

SELECT * FROM bronze_data