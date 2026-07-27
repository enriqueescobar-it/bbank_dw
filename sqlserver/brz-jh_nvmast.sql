-- NAME: BRONZE_JH_NVMAST
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: July 29, 2024



WITH landing_data AS (
    SELECT
        INVACC
	    ,INVACT
	    ,INVCIF
	    ,INVSNM
	    ,CMPAMT
	    ,IBFYON
	    ,YRBSCD
	    ,BLKAMT
	    ,INVRT__CS
	    ,INVCNT
	    ,INVTYP
	    ,INVABA
	    ,CRDACC
	    ,CRDACT
	    ,CURAMT
	    ,CURDT6
	    ,CURDT7
	    ,CURRTE
	    ,CURACC
	    ,CURBAL
	    ,PRVAMT
	    ,PRVDT6
	    ,PRVDT7
	    ,PRVRTE
	    ,PRVACC
	    ,PRVBAL
	    ,INVCOL
	    ,COLDSC
	    ,NXTMTH
	    ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
	        FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
		,NULL as YEARMONTH
	    ,LOADED_AT
FROM
    "DQP_LANDING"."dbo"."JH_NVMAST"
),

bronze_data AS (
    SELECT
        INVACC
	    ,INVACT
	    ,INVCIF
	    ,INVSNM
	    ,CMPAMT
	    ,IBFYON
	    ,YRBSCD
	    ,BLKAMT
	    ,INVRT__CS
	    ,INVCNT
	    ,INVTYP
	    ,INVABA
	    ,CRDACC
	    ,CRDACT
	    ,CURAMT
	    ,CURDT6
	    ,CURDT7
	    ,CURRTE
	    ,CURACC
	    ,CURBAL
	    ,PRVAMT
	    ,PRVDT6
	    ,PRVDT7
	    ,PRVRTE
	    ,PRVACC
	    ,PRVBAL
	    ,INVCOL
	    ,COLDSC
	    ,NXTMTH
	    ,AsOfDate
		,CONVERT(INT, CONVERT(nvarchar(6), AsofDate, 112)) AS YEARMONTH
		,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE AsOfDate > COALESCE((SELECT MAX(AsOfDate) FROM "DQP_BRONZE"."dbo"."bronze_jh_nvmast"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data