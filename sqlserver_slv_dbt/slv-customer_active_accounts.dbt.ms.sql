-- NAME: SILVER_CUSTOMER_ACTIVE_ACCOUNTS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: AGGREGATION
-- DATE: June 28, 2024

{{
   config(
          tags=["aggregation_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        CIFNO
        ,MAX(SNAME) AS SNAME
        ,YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM (
        SELECT
            'DD' AS APP
            ,ACCTNO
            ,CIFNO
            ,[STATUS]
            ,CLASS
            ,SCCODE
            ,SNAME
            ,YEARMONTH
            ,DateOpened
        FROM
            {{ ref('bronze_jh_ddmast') }}  AS A
        WHERE
            (STATUS NOT IN (2, 8))
        AND CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())

        UNION ALL

        SELECT
            'CD' AS APP
            ,ACCTNO
            ,CIFNO
            ,[STATUS]
            ,CLASS
            ,[TYPE]
            ,SNAME
            ,YEARMONTH
            ,DateIssued AS DateOpened
        FROM
            {{ ref('bronze_jh_cdmast') }}  AS A
        WHERE
            (STATUS NOT IN (2, 8))
        AND CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())

        UNION ALL

        SELECT
            'LN' AS APP
            ,ACCTNO
            ,CIFNO
            ,[STATUS]
            ,CLASS
            ,[TYPE]
            ,SNAME
            ,YEARMONTH
            ,ORGDT AS DateOpened
        FROM
            {{ ref('bronze_jh_lnmast') }}  AS A
        WHERE
            (STATUS NOT IN (2, 8))
        AND CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())

        UNION ALL

        SELECT
            'OT' AS APP
            ,ACCTNO
            ,CIFNO
            ,0 AS STATUS
            ,'' AS CLASS
            ,'' AS TYPE
            ,SNAME
            ,YEARMONTH
            ,'' AS DateOpened
        FROM
            {{ ref('bronze_jh_jhmast') }}
        WHERE CONVERT(date, LOADED_AT) = CONVERT(date, GETUTCDATE())
    ) AS RESULT
    GROUP BY CIFNO, YEARMONTH
)

SELECT * FROM bronze_data