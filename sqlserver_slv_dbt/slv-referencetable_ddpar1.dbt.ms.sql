-- NAME: SILVER_REFERENCETABLE_DDPAR1
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: SILVER
-- FREQUENCY: DAILY
-- LOAD TYPE: FULL LOAD
-- TYPE: REPLICATION
-- DATE: July 01, 2024

{{
   config(
		  tags=["jh_standard"]
        )
}}

WITH bronze_data AS (
    SELECT
        RECID
        ,LASTDT
        ,POSTDT
        ,NEXTDT
        ,LASTD7
        ,POSTD7
        ,NEXTD7
        ,RUNSTM
        ,ACCRDA
        ,CHEKDT
        ,CHEKD7
        ,DDEOMD
        ,NOPDAY
        ,ODPANS
        ,DATOPT
        ,PAYOPT
        ,LastDate
        ,PostingDate
        ,NextBusinessDate
        ,CONVERT(INT, CONVERT(nvarchar(6), LOADED_AT, 112)) AS YEARMONTH
        ,GETUTCDATE() LOADED_AT
    FROM
        {{ ref('bronze_jh_ddpar1') }}
)

SELECT * FROM bronze_data