-- Databricks SQL for source: pershing
-- Generated from sqlserver_dbt/landing-pers_pershing.dbt.ms.sql

CREATE CATALOG IF NOT EXISTS landing_pershing;
USE CATALOG landing_pershing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."PERS_PERSHING"
CREATE TABLE IF NOT EXISTS landing_pershing.default.pers_pershing (
    `PershingID` INT,
    `ACCTNO` STRING,
    `INVACC` STRING,
    `INVACT` STRING,
    `BRANCH` STRING,
    `GLPROD` STRING,
    `CFNA1` STRING,
    `CFNATITLE` STRING,
    `CFNA2` STRING,
    `CFNA3` STRING,
    `CFNA4` STRING,
    `CFCITY` STRING,
    `CFSTAT` STRING,
    `CFZIP` STRING,
    `CFCOUNTRY` STRING,
    `INVAMT` DECIMAL(38,10),
    `TEST1` STRING,
    `TEST2` STRING,
    `INVCIF` STRING,
    `INVTAXID` STRING,
    `OFFICR` STRING,
    `CBAL` DECIMAL(38,10),
    `INVDT6` TIMESTAMP,
    `CFHPHO` STRING,
    `CFBPHO` STRING,
    `CFFAX` STRING,
    `CLASS` STRING,
    `MMAMOUNT` DECIMAL(38,10),
    `CREATEDATE` TIMESTAMP,
    `ACCTSTATUS` STRING,
    `ACCTDATECLOSED` STRING,
    `IP` STRING,
    `RISKFACTORCODE` STRING,
    `INVESTOBJCODE` STRING,
    `NAMEINVESTPRO` STRING,
    `ACCTDATEOPEN` TIMESTAMP,
    `LASTREFRESHDATE` TIMESTAMP,
    `LOADED_AT` TIMESTAMP,
    `YEARMONTH` INT
);
COMMENT ON TABLE landing_pershing.default.pers_pershing IS
'The table contains Pershing account master records with account numbers, investor identifiers, branch and officer attributes, balances, status dates, and contact fields. It supports landing-layer validation for Pershing account onboarding, relationship maintenance, and downstream account reporting.';

TRUNCATE TABLE landing_pershing.default.pers_pershing;

INSERT INTO landing_pershing.default.pers_pershing (
    `PershingID`, `ACCTNO`, `INVACC`, `INVACT`, `BRANCH`, `GLPROD`,
    `CFNA1`, `CFNATITLE`, `CFNA2`, `CFNA3`, `CFNA4`, `CFCITY`,
    `CFSTAT`, `CFZIP`, `CFCOUNTRY`, `INVAMT`, `TEST1`, `TEST2`,
    `INVCIF`, `INVTAXID`, `OFFICR`, `CBAL`, `INVDT6`, `CFHPHO`,
    `CFBPHO`, `CFFAX`, `CLASS`, `MMAMOUNT`, `CREATEDATE`, `ACCTSTATUS`,
    `ACCTDATECLOSED`, `IP`, `RISKFACTORCODE`, `INVESTOBJCODE`, `NAMEINVESTPRO`, `ACCTDATEOPEN`,
    `LASTREFRESHDATE`, `LOADED_AT`, `YEARMONTH`
)
SELECT
    idx AS `PershingID`,
    concat('ACCTNO_', format_string('%02d', idx)) AS `ACCTNO`,
    concat('INVACC_', format_string('%02d', idx)) AS `INVACC`,
    concat('INVACT_', format_string('%02d', idx)) AS `INVACT`,
    concat('BRANCH_', format_string('%02d', idx)) AS `BRANCH`,
    concat('GLPROD_', format_string('%02d', idx)) AS `GLPROD`,
    concat('CFNA1_', format_string('%02d', idx)) AS `CFNA1`,
    concat('CFNATITLE_', format_string('%02d', idx)) AS `CFNATITLE`,
    concat('CFNA2_', format_string('%02d', idx)) AS `CFNA2`,
    concat('CFNA3_', format_string('%02d', idx)) AS `CFNA3`,
    concat('CFNA4_', format_string('%02d', idx)) AS `CFNA4`,
    concat('CFCITY_', format_string('%02d', idx)) AS `CFCITY`,
    concat('CFSTAT_', format_string('%02d', idx)) AS `CFSTAT`,
    concat('CFZIP_', format_string('%02d', idx)) AS `CFZIP`,
    concat('CFCOUNTRY_', format_string('%02d', idx)) AS `CFCOUNTRY`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `INVAMT`,
    concat('TEST1_', format_string('%02d', idx)) AS `TEST1`,
    concat('TEST2_', format_string('%02d', idx)) AS `TEST2`,
    concat('INVCIF_', format_string('%02d', idx)) AS `INVCIF`,
    concat('INVTAXID_', format_string('%02d', idx)) AS `INVTAXID`,
    concat('OFFICR_', format_string('%02d', idx)) AS `OFFICR`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CBAL`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `INVDT6`,
    concat('CFHPHO_', format_string('%02d', idx)) AS `CFHPHO`,
    concat('CFBPHO_', format_string('%02d', idx)) AS `CFBPHO`,
    concat('CFFAX_', format_string('%02d', idx)) AS `CFFAX`,
    concat('CLASS_', format_string('%02d', idx)) AS `CLASS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `MMAMOUNT`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `CREATEDATE`,
    concat('ACCTSTATUS_', format_string('%02d', idx)) AS `ACCTSTATUS`,
    concat('ACCTDATECLOSED_', format_string('%02d', idx)) AS `ACCTDATECLOSED`,
    concat('IP_', format_string('%02d', idx)) AS `IP`,
    concat('RISKFACTORCODE_', format_string('%02d', idx)) AS `RISKFACTORCODE`,
    concat('INVESTOBJCODE_', format_string('%02d', idx)) AS `INVESTOBJCODE`,
    concat('NAMEINVESTPRO_', format_string('%02d', idx)) AS `NAMEINVESTPRO`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `ACCTDATEOPEN`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LASTREFRESHDATE`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`,
    202601 AS `YEARMONTH`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'pers_pershing' AS table_name, COUNT(*) AS record_count
FROM landing_pershing.default.pers_pershing;
