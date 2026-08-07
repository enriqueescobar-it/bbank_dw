-- NAME: SILVER_CUSTOMER_PWM_DIGITAL
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: AGGREGATION
-- DATE: November 26, 2025

{{
   config(
          materialized='incremental',
          incremental_strategy='append',
          tags=["aggregation_standard"]
        )
}}

WITH ACCOUNT_INFORMATION AS (
    SELECT
        *
    FROM
        {{ref('silver_account_cfacct')}}
    WHERE
        CONVERT(DATE, LOADED_AT) = CONVERT(DATE, (SELECT MAX(LOADED_AT) FROM {{ref('silver_account_cfacct')}}))
),

COSTCENTER_INFORMATION AS (
    SELECT
        ACCTNO,
        GLCOST,
        'CD' AS source
    FROM
        {{ref('silver_product_cdmast')}}
    WHERE
        GLCOST IN (7500, 7505, 7550,7540,7560)

    UNION ALL

    SELECT
        ACCTNO,
        GLCOST,
        'DD' AS source
    FROM
        {{ref('silver_product_ddmast')}}
    WHERE
        GLCOST IN (7500, 7505, 7550,7540,7560)

    UNION ALL

    SELECT
        ACCTNO,
        GLCOST,
        'LN' AS source
    FROM
        {{ref('silver_product_lnmast')}}
    WHERE
        GLCOST IN (7500, 7505, 7550,7540,7560)
),

PWM_DIGITAL_CLIENTS AS (
    SELECT
        *
    FROM
        ACCOUNT_INFORMATION ai
    INNER JOIN
        COSTCENTER_INFORMATION ci
        ON ai.CFACC__CS = CONVERT(VARCHAR(50), ci.ACCTNO)
),

PWM_DIGITAL_PATTERN AS (
    SELECT
        A.CFCIF__CS     AS 'CIF',
        C.[FFORTIN],
        CFSSNO,
        CASE
            WHEN CFSSNO ='0' AND C.[FFORTIN] = ''
                THEN
                RIGHT(
                    REPLICATE('0', 9) + CAST(
                        CONCAT(
                            (ASCII(SUBSTRING(A.CFCIF__CS,1,1)) - 65) * 676 +
                            (ASCII(SUBSTRING(A.CFCIF__CS,2,1)) - 65) * 26 +
                            (ASCII(SUBSTRING(A.CFCIF__CS,3,1)) - 65), SUBSTRING(A.CFCIF__CS,4,4)) AS varchar(9)),9)
            WHEN CFSSNO ='0' AND C.[FFORTIN] <>''
                THEN RIGHT(REPLICATE('0',9) + trim(SUBSTRING(C.[FFORTIN],0,10)),9)
            ELSE
                RIGHT(
                    REPLICATE('0', 9) + CAST(CAST(CFSSNO AS decimal(9,0)) AS varchar(9)),9)
        END             AS 'TaxID SSN',
        CFNA1           AS 'Customer Name',
        CFFNA           AS 'First Name',
        CFMNA           AS 'Middle Name',
        CFLNA           AS 'Last Name',
        CFHPHO          AS 'Home Phone',
        CFBPHO          AS 'Business Phone',
        CASE
            WHEN CFCEL1 =0 AND CFBPHO <>'0'
                THEN CFBPHO
                ELSE CFCEL1
            END         AS 'Mobile Phone',
        CFEML1          AS 'Email address',
        CFNA2           AS 'Address1',
        CFNA3           AS 'Address2',
        CFCITY          AS 'City',
        CFSTAT          AS 'State',
        CFZIP           AS 'ZipCode',
        FCNTRY          AS 'Country Code',
        DateOfBirth     AS 'Date of Birth',
        B.GROUP_NAME    AS 'Group'

    FROM {{ref('silver_customer_cfmast')}} A
    INNER JOIN {{ref('silver_customer_q2')}} B
        ON A.CFCIF__CS = B.[PRIMARY_CIF]
    LEFT JOIN {{ref('silver_referencetable_cforgn')}} C
        ON a.CFCIF__CS = C.FCIF__CS
    INNER JOIN PWM_DIGITAL_CLIENTS D
        ON A.CFCIF__CS = D.CFCIF__CS
    WHERE A.CFCLAS ='A'
),

EXTRACT_CITY AS (
        SELECT
            A1.[CFCIF__CS]
            ,A1.[CFNA1]
            ,A1.[CFNA2]
            ,A1.[CFNA3]
            ,A1.[CFNA4]
            ,A1.[CFSNME]
            ,B1.[FPCITY]
            ,A1.[CFCITY]
            ,A1.[CFIRSC]
            ,A1.[CFPFCY]
            ,A1.[CFCASS]
            ,(CASE
                WHEN NULLIF(LTRIM(RTRIM(A1.[CFCITY])), '') IS NOT NULL
                    THEN LTRIM(RTRIM(A1.[CFCITY]))
                WHEN CHARINDEX(',', A1.[CFNA4]) > 0
                    THEN LEFT(A1.[CFNA4], CHARINDEX(',', A1.[CFNA4]) - 1)
                ELSE A1.[CFNA4]
            END) AS Complete_City
        FROM {{ref('silver_customer_cfmast')}} AS A1
        LEFT JOIN {{ref('silver_referencetable_cforgn')}} B1 on A1.[CFCITY] = B1.FCIF__CS
        --WHERE A1.CFCLAS <>'A'
),

FINE_TUNING_CITY AS (
    SELECT
        A2.CFCIF__CS
        ,A2.[CFNA1]
        ,A2.[CFNA2]
        ,A2.[CFNA3]
        ,A2.[CFNA4]
        ,A2.[CFSNME]
        ,A2.[FPCITY]
        ,A2.[CFCITY]
        ,A2.[CFIRSC]
        ,A2.[CFPFCY]
        ,A2.[CFCASS]
        ,A2.[Complete_City]
        ,RTRIM(LTRIM(
               REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(A2.City,'-',''),'_',''),'(',''),')',''),'.',''),'"',''),',',''),'|', ' '),'\',''),'/',''),':','')
               )) AS City
    FROM(
        SELECT
            A1.*
            ,LTRIM(RTRIM(REPLACE(TRANSLATE(A1.Complete_City, '0123456789', REPLICATE(CHAR(7), 10)), CHAR(7), ''))) AS City
        FROM EXTRACT_CITY AS A1
    ) AS A2
),

CTE_CITIES AS (
    SELECT
        CAST(A3.[CIFNO] AS NVARCHAR(50)) AS [CFCIF__CS]
        ,CAST(C3.City AS NVARCHAR(50)) AS City
    FROM(
        SELECT
            A2.[CFRELA]
            ,A2.CFCIF__CS AS CIFNO
        FROM(
            SELECT DISTINCT
                A1.[CFRELA]
                ,A1.CFCIF__CS
                ,CAST(A1.[CFACC__CS] AS VARCHAR(16)) AS [CFACC__CS]
                ,A1.[CFATYP]
            FROM {{ref('silver_account_cfacct')}} AS A1
        ) AS A2
    ) AS A3
    LEFT JOIN FINE_TUNING_CITY C3 on A3.[CIFNO] = C3.CFCIF__CS
),

Final_Query AS (
    SELECT DISTINCT
        CIF,
        [TaxID SSN],
        [Customer Name],
        [First Name],
        [Middle Name],
        [Last Name],
        [Home Phone],
        [Business Phone],
        [Mobile Phone],
        [Email address],
        Address1,
        Address2,
        CASE
            WHEN A.City =''
              THEN B.City
            ELSE A.City
        END AS City,
        CASE
            WHEN [State] =''
              THEN [Country Code]
            ELSE [State]
        END AS State,
        ZipCode,
        [Country Code],
        [Date of Birth],
        [Group]
        --CONVERT(DATE,GETDATE()) AS LOADED_AT
    FROM PWM_DIGITAL_PATTERN A
    LEFT JOIN CTE_CITIES B
        ON A.CIF = B.CFCIF__CS
)

--SELECT *, GETUTCDATE() AS LOADED_AT FROM Final_Query
SELECT * FROM Final_Query