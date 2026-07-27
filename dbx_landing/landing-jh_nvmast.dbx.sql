-- Databricks SQL for source: jh_nvmast
-- Generated from sqlserver/brz-jh_nvmast.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_NVMAST"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_nvmast (
    `INVACC` STRING,
    `INVACT` STRING,
    `INVCIF` STRING,
    `INVSNM` STRING,
    `CMPAMT` DECIMAL(38,10),
    `IBFYON` STRING,
    `YRBSCD` STRING,
    `BLKAMT` DECIMAL(38,10),
    `INVRT__CS` STRING,
    `INVCNT` INT,
    `INVTYP` STRING,
    `INVABA` STRING,
    `CRDACC` STRING,
    `CRDACT` STRING,
    `CURAMT` DECIMAL(38,10),
    `CURDT6` STRING,
    `CURDT7` STRING,
    `CURRTE` STRING,
    `CURACC` STRING,
    `CURBAL` DECIMAL(38,10),
    `PRVAMT` DECIMAL(38,10),
    `PRVDT6` STRING,
    `PRVDT7` STRING,
    `PRVRTE` STRING,
    `PRVACC` STRING,
    `PRVBAL` DECIMAL(38,10),
    `INVCOL` STRING,
    `COLDSC` STRING,
    `NXTMTH` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_nvmast IS
'The JH NVMAST landing table captures Jack Henry note or non-vehicle master attributes for account validation, operational review, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_nvmast;

INSERT INTO landing_jh.default.jh_nvmast (
    `INVACC`, `INVACT`, `INVCIF`, `INVSNM`, `CMPAMT`, `IBFYON`,
    `YRBSCD`, `BLKAMT`, `INVRT__CS`, `INVCNT`, `INVTYP`, `INVABA`,
    `CRDACC`, `CRDACT`, `CURAMT`, `CURDT6`, `CURDT7`, `CURRTE`,
    `CURACC`, `CURBAL`, `PRVAMT`, `PRVDT6`, `PRVDT7`, `PRVRTE`,
    `PRVACC`, `PRVBAL`, `INVCOL`, `COLDSC`, `NXTMTH`, `AsOfDate`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('INVACC_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVACC`,
    concat('INVACT_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVACT`,
    concat('INVCIF_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVCIF`,
    concat('INVSNM_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVSNM`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CMPAMT`,
    concat('IBFYON_', lpad(CAST(idx AS STRING), 2, '0')) AS `IBFYON`,
    concat('YRBSCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `YRBSCD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `BLKAMT`,
    concat('INVRT__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVRT__CS`,
    idx AS `INVCNT`,
    concat('INVTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVTYP`,
    concat('INVABA_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVABA`,
    concat('CRDACC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CRDACC`,
    concat('CRDACT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CRDACT`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CURAMT`,
    concat('CURDT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `CURDT6`,
    concat('CURDT7_', lpad(CAST(idx AS STRING), 2, '0')) AS `CURDT7`,
    concat('CURRTE_', lpad(CAST(idx AS STRING), 2, '0')) AS `CURRTE`,
    concat('CURACC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CURACC`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CURBAL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PRVAMT`,
    concat('PRVDT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `PRVDT6`,
    concat('PRVDT7_', lpad(CAST(idx AS STRING), 2, '0')) AS `PRVDT7`,
    concat('PRVRTE_', lpad(CAST(idx AS STRING), 2, '0')) AS `PRVRTE`,
    concat('PRVACC_', lpad(CAST(idx AS STRING), 2, '0')) AS `PRVACC`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PRVBAL`,
    concat('INVCOL_', lpad(CAST(idx AS STRING), 2, '0')) AS `INVCOL`,
    concat('COLDSC_', lpad(CAST(idx AS STRING), 2, '0')) AS `COLDSC`,
    concat('NXTMTH_', lpad(CAST(idx AS STRING), 2, '0')) AS `NXTMTH`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_nvmast' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_nvmast;
