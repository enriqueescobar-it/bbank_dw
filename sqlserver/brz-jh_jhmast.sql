-- NAME: BRONZE_JH_JHMAST
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
	    BRANCH
        ,ACCTNO
        ,ACTYPE
        ,SNAME
        ,CIFNO
        ,ADDNAM
        ,ALTNAM
        ,ALTADD
        ,MALHLD
        ,CBAL
        ,GLCOST
        ,GLPROD
        ,SECURE
        ,JHBPAS
        ,JHBDT1
        ,JHBDT2
        ,JHBDT3
        ,JHBDT4
        ,JHBDT5
        ,JHBDT6
        ,JHBD61
        ,JHBD62
        ,JHBD63
        ,JHBD64
        ,JHBD65
        ,JHBD66
        ,JHBAM1
        ,JHBAM2
        ,JHBAM3
        ,JHBAM4
        ,JHBAM5
        ,JHBAM6
        ,JHBDS1
        ,JHBDS2
        ,JHBDS3
        ,JHBDS4
        ,JHBDS5
        ,JHBDS6
        ,JHPIC1
        ,JHPIC2
        ,JHPDT1
        ,JHPD61
        ,JHPDT2
        ,JHPD62
        ,JHPAM1
        ,JHPAM2
        ,CASE WHEN ACTYPE In ('U','R') THEN
            CASE WHEN JHBDS1 IS NULL THEN 0 ELSE 1 END
            ELSE 0
        END ACTYPE_FLAG
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
	        FROM dqp_landing.dbo.jh_ddpar1) as AsOfDate
        ,NULL as YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_JHMAST"
),

bronze_data AS (
    SELECT
	    BRANCH
        ,ACCTNO
        ,ACTYPE
        ,SNAME
        ,CIFNO
        ,ADDNAM
        ,ALTNAM
        ,ALTADD
        ,MALHLD
        ,CBAL
        ,GLCOST
        ,GLPROD
        ,SECURE
        ,JHBPAS
        ,JHBDT1
        ,JHBDT2
        ,JHBDT3
        ,JHBDT4
        ,JHBDT5
        ,JHBDT6
        ,JHBD61
        ,JHBD62
        ,JHBD63
        ,JHBD64
        ,JHBD65
        ,JHBD66
        ,JHBAM1
        ,JHBAM2
        ,JHBAM3
        ,JHBAM4
        ,JHBAM5
        ,JHBAM6
        ,JHBDS1
        ,JHBDS2
        ,JHBDS3
        ,JHBDS4
        ,JHBDS5
        ,JHBDS6
        ,JHPIC1
        ,JHPIC2
        ,JHPDT1
        ,JHPD61
        ,JHPDT2
        ,JHPD62
        ,JHPAM1
        ,JHPAM2
        ,ACTYPE_FLAG
        ,AsOfDate
		,CONVERT(INT, CONVERT(nvarchar(6), AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE AsOfDate > COALESCE((SELECT MAX(AsOfDate) FROM "DQP_BRONZE"."dbo"."bronze_jh_jhmast"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data