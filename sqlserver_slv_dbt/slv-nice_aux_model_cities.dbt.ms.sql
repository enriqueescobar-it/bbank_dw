-- NAME: SILVER_NICE_AUX_MODEL_CITIES
-- CATEGORY: EPHEMERAL MODEL
-- LAYER: SILVER
-- FREQUENCY: None
-- LOAD TYPE: None
-- TYPE: SOURCE
-- DATE: Feb 26, 2026

{{
   config(
        materialized='table',
        tags=["Monthly"]
    )
}}

SELECT DISTINCT
    CAST(A3.[CIFNO] AS NVARCHAR(50)) AS [CFCIF__CS],
    CAST(C3.City AS NVARCHAR(50)) AS City
FROM (
    SELECT
        A2.[CFRELA],
        A2.[CFCIF__CS] AS CIFNO
    FROM (
        SELECT DISTINCT
            A1.[CFRELA],
            A1.CFCIF__CS,
            CAST(A1.[CFACC__CS] AS VARCHAR(16)) AS [CFACC__CS],
            A1.[CFATYP]
        FROM {{ ref('bronze_jh_cfacct') }} AS A1
    ) AS A2
) AS A3
LEFT JOIN (
    SELECT
        A2.[CFCIF__CS],
        A2.[CFNA1],
        A2.[CFNA2],
        A2.[CFNA3],
        A2.[CFNA4],
        A2.[CFSNME],
        A2.[FPCITY],
        A2.[CFCITY],
        A2.[CFIRSC],
        A2.[CFPFCY],
        A2.[CFCASS],
        A2.[Complete_City],
        RTRIM(
            LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(A2.City, '-', ''), '_', ''), '(', ''), ')', ''), '.', ''), '"', ''), ',', ''), '|', ' '), '\', ''), '/', ''), ':', ''))
        ) AS City
    FROM
        (
            SELECT
                A1.*,
                LTRIM(RTRIM(REPLACE(TRANSLATE(A1.Complete_City, '0123456789', REPLICATE(CHAR(7), 10)), CHAR(7), ''))) AS City
            FROM
                (
                    SELECT
                        A1.[CFCIF__CS],
                        A1.[CFNA1],
                        A1.[CFNA2],
                        A1.[CFNA3],
                        A1.[CFNA4],
                        A1.[CFSNME],
                        B1.[FPCITY],
                        A1.[CFCITY],
                        A1.[CFIRSC],
                        A1.[CFPFCY],
                        A1.[CFCASS],
                        (CASE
                            WHEN NULLIF(LTRIM(RTRIM(A1.[CFCITY])), '') IS NOT NULL
                                THEN
                                    LTRIM(RTRIM(A1.[CFCITY]))
                            WHEN CHARINDEX(',', A1.[CFNA4]) > 0
                                THEN
                                    LEFT(A1.[CFNA4], CHARINDEX(',', A1.[CFNA4]) - 1)
                            ELSE A1.[CFNA4]
                        END) AS Complete_City
                    FROM {{ ref('bronze_jh_cfmast') }} AS A1
                    LEFT JOIN {{ ref('bronze_jh_cforgn') }} B1 ON A1.[CFCITY] = B1.[FCIF__CS]
                ) AS A1
        ) AS A2
) C3 ON A3.[CIFNO] = C3.[CFCIF__CS]