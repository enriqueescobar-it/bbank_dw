-- Databricks SQL for source: jh_cfmlid
-- Generated from sqlserver/brz-jh_cfmlid.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFMLID"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cfmlid (
    `CFCIF__CS` STRING,
    `CFIDCD` STRING,
    `CFIDNO` INT,
    `CFPLIS` STRING,
    `CFIISD6` STRING,
    `CFIISD7` STRING,
    `CFIEXD6` STRING,
    `CFIEXD7` STRING,
    `CFICTD6` STRING,
    `CFICTD7` STRING,
    `CFVRYCD` STRING,
    `CFVTXST` STRING,
    `ExpirationDate` STRING,
    `IssuanceDate` STRING,
    `ContactDate` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cfmlid IS
'The JH CFMLID landing table captures customer mailing and identification attributes from Jack Henry for identity validation, contact review, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_cfmlid;

INSERT INTO landing_jh.default.jh_cfmlid (
    `CFCIF__CS`, `CFIDCD`, `CFIDNO`, `CFPLIS`, `CFIISD6`, `CFIISD7`,
    `CFIEXD6`, `CFIEXD7`, `CFICTD6`, `CFICTD7`, `CFVRYCD`, `CFVTXST`,
    `ExpirationDate`, `IssuanceDate`, `ContactDate`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CFCIF__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCIF__CS`,
    concat('CFIDCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFIDCD`,
    idx AS `CFIDNO`,
    concat('CFPLIS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFPLIS`,
    concat('CFIISD6_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFIISD6`,
    concat('CFIISD7_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFIISD7`,
    concat('CFIEXD6_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFIEXD6`,
    concat('CFIEXD7_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFIEXD7`,
    concat('CFICTD6_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFICTD6`,
    concat('CFICTD7_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFICTD7`,
    concat('CFVRYCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFVRYCD`,
    concat('CFVTXST_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFVTXST`,
    concat('EXPIRATIONDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ExpirationDate`,
    concat('ISSUANCEDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `IssuanceDate`,
    concat('CONTACTDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ContactDate`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cfmlid' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cfmlid;
