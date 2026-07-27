-- Databricks SQL for source: jh_cfofgn
-- Generated from sqlserver/brz-jh_cfofgn.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFORGN"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cfofgn (
    `FCIF__CS` STRING,
    `FPCITY` STRING,
    `FPPROV` STRING,
    `FPCODE` STRING,
    `FPCNTR` STRING,
    `FCNTRY` STRING,
    `FEXMPT` STRING,
    `FRECIP` STRING,
    `FCITZN` STRING,
    `FFORTIN` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cfofgn IS
'The JH CFOFGN landing table captures customer foreign address, citizenship, country, exemption, and tax-related attributes from Jack Henry for compliance validation and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_cfofgn;

INSERT INTO landing_jh.default.jh_cfofgn (
    `FCIF__CS`, `FPCITY`, `FPPROV`, `FPCODE`, `FPCNTR`, `FCNTRY`,
    `FEXMPT`, `FRECIP`, `FCITZN`, `FFORTIN`, `AsOfDate`, `YEARMONTH`,
    `LOADED_AT`
)
SELECT
    concat('FCIF__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `FCIF__CS`,
    concat('FPCITY_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPCITY`,
    concat('FPPROV_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPPROV`,
    concat('FPCODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPCODE`,
    concat('FPCNTR_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPCNTR`,
    concat('FCNTRY_', lpad(CAST(idx AS STRING), 2, '0')) AS `FCNTRY`,
    concat('FEXMPT_', lpad(CAST(idx AS STRING), 2, '0')) AS `FEXMPT`,
    concat('FRECIP_', lpad(CAST(idx AS STRING), 2, '0')) AS `FRECIP`,
    concat('FCITZN_', lpad(CAST(idx AS STRING), 2, '0')) AS `FCITZN`,
    concat('FFORTIN_', lpad(CAST(idx AS STRING), 2, '0')) AS `FFORTIN`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cfofgn' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cfofgn;
