-- NAME: SILVER_CUSTOMER_CIF_DAILY
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: AGGREGATION
-- DATE: April 14, 2025


{{
   config(
          tags=["jh_standard", "MIS_Reports"]
        )
}}

WITH distinct_cfcrgp_cfmast AS (
    SELECT
        DISTINCT
            A.CFCCIF
            ,A.CFCGRP
        FROM
            (SELECT CFCCIF,MAX(cfcgrp) as cfcgrp from {{ ref('silver_referencetable_cfcrgp') }} group by CFCCIF) A
        INNER JOIN
            {{ ref('silver_customer_cfmast') }} B ON A.CFCCIF = B.CFCIF__CS
),

distinct_cfusrflds AS (
    SELECT
        RESULT.CFCIF__CS
        ,MAX(RESULT.AGENCIA)AS AGENCIA
        ,MAX(RESULT.CONTA) AS CONTA
        ,MAX(RESULT.BBDID) AS BBDID
    FROM (
        SELECT
            CFCIF__CS,
            CASE WHEN USFNAM = 'IN15N1' THEN USFNUM15 END AS AGENCIA,
            CASE WHEN USFNAM = 'IN15N2' THEN USFNUM15 END AS CONTA,
            CASE WHEN USFNAM = 'IN10A1' THEN USFVAL END AS BBDID
        FROM {{ ref('silver_referencetable_cfusrflds') }}
        WHERE USFNAM IN ('IN15N1','IN15N2','IN10A1')
            ) RESULT
	    GROUP BY RESULT.CFCIF__CS
),

silver_data AS (
	SELECT
		A.CFCIF__CS
		,A.CFBRNN
		,A.CFOFFR
		,A.CFNA1
		,A.DateOfBirth AS 'Date of Birth'
		,CASE WHEN CFINDI = 'Y' THEN 'IND' ELSE 'BUS' END AS 'Cif Type'
		,A.CFNA2 AS Add1
		,A.CFNA3 AS Add2
		,A.CFNA4 AS Add3
		,A.CFCITY AS 'City'
		,A.CFSTAT AS 'State', A.CFZIP AS ZipCode
		,B.FPCNTR AS Country
		,CASE WHEN CFSSCD IN ('X', 'C', 'B', 'G', 'U', 'D', 'V', 'F') THEN 'I'
		      WHEN CFSSCD IN ('T', 'I') THEN 'D'
			  WHEN CFSSCD IN ('N', 'A', 'M') AND   CFSSNO = 0 THEN 'I'
			  WHEN CFSSCD IN ('N', 'A', 'M') AND CFSSNO <> 0 THEN 'D' END AS DOM_INT_FLAG
		,A.CFEML1 AS 'Primary Email'
		,A.CFEML2 AS 'Secondary Email'
		,COALESCE (DATEDIFF(YEAR, A.DateOfBirth,GETUTCDATE()), N'') AS Age
		,A.CFOCPCD
		,A.CFSEX AS Gender
		,A.OriginalCustomerDate
		,COALESCE (DATEDIFF(YEAR, A.OriginalCustomerDate, GETUTCDATE()), N'') AS 'Client Since'
		,F1.CFCGRP AS [Group]
		,COALESCE (F.CPGRPD, '') AS [Group Description]
		,B.FFORTIN AS 'Foreign Tax Id'
		,G.AGENCIA AS  Agencia
		,G.CONTA   AS    Conta
		,A.CFCLAS AS 'Class'
		,G.BBDID AS 'BBDID'
		,CASE WHEN A.CFLANG ='' THEN 'ENG' ELSE A.CFLANG END AS 'Preferred Language Code'
	    ,A.AsOfDate
	    ,A.YEARMONTH
	    ,GETUTCDATE() AS LOADED_AT
	FROM
		{{ ref('silver_customer_cfmast') }} A
	LEFT OUTER JOIN
		{{ ref('silver_referencetable_cforgn') }}  B ON A.CFCIF__CS = B.FCIF__CS
	LEFT OUTER JOIN
		distinct_cfcrgp_cfmast  F1 ON F1.CFCCIF = A.CFCIF__CS
	LEFT OUTER JOIN
		{{ ref('silver_referencetable_cfparg') }}  F ON F1.CFCGRP = F.CPGRP__CS
	LEFT JOIN
	    distinct_cfusrflds G ON A.CFCIF__CS = G.CFCIF__CS
)

SELECT * FROM silver_data