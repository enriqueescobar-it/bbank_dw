-- NAME: SILVER_REFERENCETABLE_CUSTOMER_INFO
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: October 08, 2024

{{
   config(
		  tags=["jh_standard"]
        )
}}

with cte_silver_customer_cfmast AS(
    SELECT
		CFCIF__CS, CFINDI, CFSNME, CFOFFR, CFEMPL, CFNA1, CFNA2, CFNA3, CFNA4, CFCITY, CFSTAT, CFCNTY, CFZIP, CFSIC6, CFBIRD, CFCLAS, CFBUST, CFBRNN
    FROM {{ ref('silver_customer_cfmast') }}
),

cte_silver_referencetable_cforgn AS(
    SELECT
         FCIF__CS
		,FPCITY
		,FPPROV
		,FPCODE
		,FPCNTR
		,FCNTRY
		,FEXMPT
		,FRECIP
		,FCITZN
		,COALESCE(LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(FFORTIN,'-',''),';',''),',',''),'.',''),'/',''),'\',''),'|',''),' ',''))),'') as FFORTIN
    FROM {{ ref('silver_referencetable_cforgn') }}
),

cte_silver_referencetable_cfusrflds AS(
    SELECT
        RESULT.CFCIF,
        MAX(RESULT.AGENCIA) AS AGENCIA,
        MAX(RESULT.CONTA) AS CONTA,
        MAX(RESULT.BBDID) AS BBDID
    FROM (
           SELECT
            [CFCIF__CS] as CFCIF,
            CASE WHEN USFNAM = 'IN15N1' THEN USFNUM15 END AS AGENCIA,
            CASE WHEN USFNAM = 'IN15N2' THEN USFNUM15 END AS CONTA,
            CASE WHEN USFNAM = 'IN10A1' THEN USFVAL END AS BBDID
           FROM {{ ref('silver_referencetable_cfusrflds') }}
           WHERE USFNAM IN ('IN15N1','IN15N2','IN10A1')
         ) RESULT
    GROUP BY RESULT.CFCIF
),

cte_join AS(
	SELECT * FROM cte_silver_customer_cfmast A
    LEFT JOIN cte_silver_referencetable_cforgn C
            ON A.[CFCIF__CS] = C.[FCIF__CS]
    LEFT JOIN cte_silver_referencetable_cfusrflds F
            ON A.CFCIF__CS = F.CFCIF
    --WHERE (A.CFBRNN in ('60','61','62','64','65') OR (F.BBDID ='1111133333') OR (F.BBDID <> ''))
)
SELECT
	CFCIF__CS
	,CFINDI
	,CASE
        WHEN FFORTIN LIKE '%[^0-9]%' THEN ''
        ELSE FFORTIN
    END AS FFORTIN
    ,COALESCE(BBDID,'') as BBDID
    ,AGENCIA
	,CONTA
	,COALESCE(IIF(AGENCIA IS NOT NULL, CONCAT('1',  RIGHT('00000'+CONVERT(VARCHAR, AGENCIA), 5), RIGHT('0000000000000'+CAST(CONTA AS VARCHAR),13)), NULL),'') AS BradescoAgoraAccount
    ,CFBRNN
	,CFSNME
	,CFOFFR
	,CFEMPL
	,CFNA1
	,CFNA2
	,CFNA3
	,CFNA4
	,CFCITY
	,CFSTAT
	,CFCNTY
	,CFZIP
	,CFSIC6
	,CFBIRD
	,CFCLAS
	,CFBUST
	,GETUTCDATE() AS LOADED_AT
FROM cte_join