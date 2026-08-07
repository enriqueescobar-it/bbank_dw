-- NAME: SILVER_CUSTOMER_COSTCENTER
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: AGGREGATION
-- DATE: April 10, 2025


{{
   config(
          tags=["Daily", "MIS_Reports"]
        )
}}



WITH source_01 AS (
    SELECT
        A.CFCIF__CS
        ,MAX(D.COST_CENTER) AS GLCOST
        ,A.AsOfDate
        ,A.YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM
        {{ ref('silver_customer_cfmast') }}  AS A INNER JOIN
        {{ ref('silver_account_cfacct') }}  AS B ON A.CFCIF__CS = B.CFCIF__CS INNER JOIN
        {{ ref('silver_all_bradesco_accounts') }}  AS D ON CONVERT(VARCHAR, B.CFCIF__CS) = CONVERT(VARCHAR, D.ACCOUNT_NUMBER)
    WHERE
        (D.STATUS NOT IN (2, 8)) AND (B.CFATYP IN ('D', 'L', 'T'))
    GROUP BY
        A.CFCIF__CS, A.YEARMONTH, A.AsOfDate
),

source_02 AS (
    SELECT
        A.CFCIF__CS
        ,MAX(D_1.GLCOST) AS GLCOST
        ,A.AsOfDate
        ,A.YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM
        {{ ref('silver_customer_cfmast') }}  AS A INNER JOIN
        {{ ref('silver_account_cfacct') }}  AS B ON A.CFCIF__CS = B.CFCIF__CS INNER JOIN
        {{ ref('silver_all_bradesco_accounts') }}  AS C ON CONVERT(VARCHAR, B.CFACC__CS) = CONVERT(VARCHAR, C.ACCOUNT_NUMBER) INNER JOIN
        (SELECT
            A.CFCGRP
            ,A.CFCCIF
            ,MAX(CC_GROUP.GLCOST) AS GLCOST
        FROM
            {{ ref('silver_referencetable_cfcrgp') }}  AS A INNER JOIN
            {{ ref('silver_customer_cfmast') }}  AS B ON A.CFCCIF = B.CFCIF__CS INNER JOIN
            {{ ref('silver_account_cfacct') }}  AS C ON A.CFCCIF = C.CFCIF__CS LEFT OUTER JOIN
            {{ ref('silver_all_bradesco_accounts') }}   AS D ON CONVERT(VARCHAR, C.CFACC__CS) = CONVERT(VARCHAR, D.ACCOUNT_NUMBER) INNER JOIN
                (SELECT
                A.CFCGRP
                ,MAX(D.COST_CENTER) AS GLCOST
                FROM
                    {{ ref('silver_referencetable_cfcrgp') }}  AS A INNER JOIN
                    {{ ref('silver_customer_cfmast') }}  AS B ON A.CFCCIF = B.CFCIF__CS INNER JOIN
                    {{ ref('silver_account_cfacct') }}  AS C ON A.CFCCIF = C.CFCIF__CS LEFT OUTER JOIN
                    {{ ref('silver_all_bradesco_accounts') }}  AS D ON CONVERT(VARCHAR, C.CFACC__CS) = CONVERT(VARCHAR, D.ACCOUNT_NUMBER)
                WHERE
                    (D.STATUS NOT IN (2, 8)) AND (C.CFATYP IN ('D', 'L', 'T'))
                GROUP BY
                    A.CFCGRP
            ) AS CC_GROUP
            ON
                A.CFCGRP = CC_GROUP.CFCGRP
        GROUP BY
            A.CFCGRP, A.CFCCIF
    ) AS D_1
    ON
        A.CFCIF__CS = D_1.CFCCIF
    WHERE
        A.CFCIF__CS NOT IN (SELECT
                                A.CFCIF__CS
                            FROM
                                {{ ref('silver_customer_cfmast') }}  AS A INNER JOIN
                                {{ ref('silver_account_cfacct') }}  AS B ON A.CFCIF__CS = B.CFCIF__CS INNER JOIN
                                {{ ref('silver_all_bradesco_accounts') }}  AS D ON CONVERT(VARCHAR, B.CFACC__CS) = CONVERT(VARCHAR, D.ACCOUNT_NUMBER)
                            WHERE (D.STATUS NOT IN (2, 8)) AND (B.CFATYP IN ('D', 'L', 'T')))
    GROUP BY
        A.CFCIF__CS, A.YEARMONTH, A.AsOfDate
),

source_union AS (
    SELECT * FROM source_01
    UNION ALL
    SELECT * FROM source_02
)

SELECT * FROM source_union