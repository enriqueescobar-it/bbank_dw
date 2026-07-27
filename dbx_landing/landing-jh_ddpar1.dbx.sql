-- Databricks SQL for source: jh_ddpar1
-- Generated from sqlserver/brz-jh_ddpar1.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_DDPAR1"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_ddpar1 (
    `RECID` STRING,
    `LASTDT` STRING,
    `POSTDT` STRING,
    `NEXTDT` STRING,
    `LASTD7` STRING,
    `POSTD7` STRING,
    `NEXTD7` STRING,
    `RUNSTM` STRING,
    `ACCRDA` STRING,
    `CHEKDT` STRING,
    `CHEKD7` STRING,
    `DDEOMD` STRING,
    `NOPDAY` STRING,
    `ODPANS` STRING,
    `DATOPT` STRING,
    `PAYOPT` DECIMAL(38,10),
    `LastDate` STRING,
    `PostingDate` STRING,
    `NextBusinessDate` STRING,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_ddpar1 IS
'The JH demand deposit parameter landing table captures DDA product, transaction, service charge, and account reference attributes for validation, classification, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_ddpar1;

INSERT INTO landing_jh.default.jh_ddpar1 (
    `RECID`, `LASTDT`, `POSTDT`, `NEXTDT`, `LASTD7`, `POSTD7`,
    `NEXTD7`, `RUNSTM`, `ACCRDA`, `CHEKDT`, `CHEKD7`, `DDEOMD`,
    `NOPDAY`, `ODPANS`, `DATOPT`, `PAYOPT`, `LastDate`, `PostingDate`,
    `NextBusinessDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('RECID_', lpad(CAST(idx AS STRING), 2, '0')) AS `RECID`,
    concat('LASTDT_', lpad(CAST(idx AS STRING), 2, '0')) AS `LASTDT`,
    concat('POSTDT_', lpad(CAST(idx AS STRING), 2, '0')) AS `POSTDT`,
    concat('NEXTDT_', lpad(CAST(idx AS STRING), 2, '0')) AS `NEXTDT`,
    concat('LASTD7_', lpad(CAST(idx AS STRING), 2, '0')) AS `LASTD7`,
    concat('POSTD7_', lpad(CAST(idx AS STRING), 2, '0')) AS `POSTD7`,
    concat('NEXTD7_', lpad(CAST(idx AS STRING), 2, '0')) AS `NEXTD7`,
    concat('RUNSTM_', lpad(CAST(idx AS STRING), 2, '0')) AS `RUNSTM`,
    concat('ACCRDA_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACCRDA`,
    concat('CHEKDT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHEKDT`,
    concat('CHEKD7_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHEKD7`,
    concat('DDEOMD_', lpad(CAST(idx AS STRING), 2, '0')) AS `DDEOMD`,
    concat('NOPDAY_', lpad(CAST(idx AS STRING), 2, '0')) AS `NOPDAY`,
    concat('ODPANS_', lpad(CAST(idx AS STRING), 2, '0')) AS `ODPANS`,
    concat('DATOPT_', lpad(CAST(idx AS STRING), 2, '0')) AS `DATOPT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PAYOPT`,
    concat('LASTDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `LastDate`,
    concat('POSTINGDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `PostingDate`,
    concat('NEXTBUSINESSDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `NextBusinessDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_ddpar1' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_ddpar1;
