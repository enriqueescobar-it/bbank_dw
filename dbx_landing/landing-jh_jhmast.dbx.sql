-- Databricks SQL for source: jh_jhmast
-- Generated from sqlserver/brz-jh_jhmast.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_JHMAST"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_jhmast (
    `BRANCH` INT,
    `ACCTNO` INT,
    `ACTYPE` INT,
    `SNAME` STRING,
    `CIFNO` INT,
    `ADDNAM` STRING,
    `ALTNAM` STRING,
    `ALTADD` STRING,
    `MALHLD` STRING,
    `CBAL` DECIMAL(38,10),
    `GLCOST` INT,
    `GLPROD` INT,
    `SECURE` STRING,
    `JHBPAS` STRING,
    `JHBDT1` STRING,
    `JHBDT2` STRING,
    `JHBDT3` STRING,
    `JHBDT4` STRING,
    `JHBDT5` STRING,
    `JHBDT6` STRING,
    `JHBD61` STRING,
    `JHBD62` STRING,
    `JHBD63` STRING,
    `JHBD64` STRING,
    `JHBD65` STRING,
    `JHBD66` STRING,
    `JHBAM1` STRING,
    `JHBAM2` STRING,
    `JHBAM3` STRING,
    `JHBAM4` STRING,
    `JHBAM5` STRING,
    `JHBAM6` STRING,
    `JHBDS1` STRING,
    `JHBDS2` STRING,
    `JHBDS3` STRING,
    `JHBDS4` STRING,
    `JHBDS5` STRING,
    `JHBDS6` STRING,
    `JHPIC1` STRING,
    `JHPIC2` STRING,
    `JHPDT1` STRING,
    `JHPD61` STRING,
    `JHPDT2` STRING,
    `JHPD62` STRING,
    `JHPAM1` STRING,
    `JHPAM2` STRING,
    `ACTYPE_FLAG` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_jhmast IS
'The JH_JHMAST landing table captures Jack Henry institution, class, country, officer, or master reference attributes for source validation, classification, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_jhmast;

INSERT INTO landing_jh.default.jh_jhmast (
    `BRANCH`, `ACCTNO`, `ACTYPE`, `SNAME`, `CIFNO`, `ADDNAM`,
    `ALTNAM`, `ALTADD`, `MALHLD`, `CBAL`, `GLCOST`, `GLPROD`,
    `SECURE`, `JHBPAS`, `JHBDT1`, `JHBDT2`, `JHBDT3`, `JHBDT4`,
    `JHBDT5`, `JHBDT6`, `JHBD61`, `JHBD62`, `JHBD63`, `JHBD64`,
    `JHBD65`, `JHBD66`, `JHBAM1`, `JHBAM2`, `JHBAM3`, `JHBAM4`,
    `JHBAM5`, `JHBAM6`, `JHBDS1`, `JHBDS2`, `JHBDS3`, `JHBDS4`,
    `JHBDS5`, `JHBDS6`, `JHPIC1`, `JHPIC2`, `JHPDT1`, `JHPD61`,
    `JHPDT2`, `JHPD62`, `JHPAM1`, `JHPAM2`, `ACTYPE_FLAG`, `AsOfDate`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    idx AS `BRANCH`,
    idx AS `ACCTNO`,
    idx AS `ACTYPE`,
    concat('SNAME_', lpad(CAST(idx AS STRING), 2, '0')) AS `SNAME`,
    idx AS `CIFNO`,
    concat('ADDNAM_', lpad(CAST(idx AS STRING), 2, '0')) AS `ADDNAM`,
    concat('ALTNAM_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALTNAM`,
    concat('ALTADD_', lpad(CAST(idx AS STRING), 2, '0')) AS `ALTADD`,
    concat('MALHLD_', lpad(CAST(idx AS STRING), 2, '0')) AS `MALHLD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CBAL`,
    idx AS `GLCOST`,
    idx AS `GLPROD`,
    concat('SECURE_', lpad(CAST(idx AS STRING), 2, '0')) AS `SECURE`,
    concat('JHBPAS_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBPAS`,
    concat('JHBDT1_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDT1`,
    concat('JHBDT2_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDT2`,
    concat('JHBDT3_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDT3`,
    concat('JHBDT4_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDT4`,
    concat('JHBDT5_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDT5`,
    concat('JHBDT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDT6`,
    concat('JHBD61_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBD61`,
    concat('JHBD62_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBD62`,
    concat('JHBD63_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBD63`,
    concat('JHBD64_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBD64`,
    concat('JHBD65_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBD65`,
    concat('JHBD66_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBD66`,
    concat('JHBAM1_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBAM1`,
    concat('JHBAM2_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBAM2`,
    concat('JHBAM3_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBAM3`,
    concat('JHBAM4_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBAM4`,
    concat('JHBAM5_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBAM5`,
    concat('JHBAM6_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBAM6`,
    concat('JHBDS1_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDS1`,
    concat('JHBDS2_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDS2`,
    concat('JHBDS3_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDS3`,
    concat('JHBDS4_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDS4`,
    concat('JHBDS5_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDS5`,
    concat('JHBDS6_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHBDS6`,
    concat('JHPIC1_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHPIC1`,
    concat('JHPIC2_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHPIC2`,
    concat('JHPDT1_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHPDT1`,
    concat('JHPD61_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHPD61`,
    concat('JHPDT2_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHPDT2`,
    concat('JHPD62_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHPD62`,
    concat('JHPAM1_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHPAM1`,
    concat('JHPAM2_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHPAM2`,
    concat('ACTYPE_FLAG_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACTYPE_FLAG`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_jhmast' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_jhmast;
