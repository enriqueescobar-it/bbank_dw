-- Databricks SQL for source: jh_lnpar3
-- Generated from sqlserver_brz/brz-jh_lnpar3.ms.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_LNPAR3"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_lnpar3 (
    `L3TRAN` STRING,
    `L3DORC` STRING,
    `L3AFFT` STRING,
    `L3AFNP` STRING,
    `L3TCDS` STRING,
    `L3STMD` STRING,
    `L3FPAY` DECIMAL(38,10),
    `L3STMT` STRING,
    `L3ANAL` STRING,
    `L3STPS` STRING,
    `L3ENCL` STRING,
    `L3OVZR` STRING,
    `L3STCD` STRING,
    `L3XADV` STRING,
    `L3LACD` STRING,
    `L3FEE__CS` DECIMAL(38,10),
    `L3PART` STRING,
    `L3EDRF` STRING,
    `L3MONE` STRING,
    `L3RCPT` STRING,
    `L3MAFE` STRING,
    `L3REAM` STRING,
    `L3WAIV` STRING,
    `L3SVRS` STRING,
    `L3CASH` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_lnpar3 IS
'The JH_LNPAR3 landing table captures Jack Henry loan account, transaction, position, payment, collateral, rate, date, and balance attributes for loan validation, reconciliation, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_lnpar3;

INSERT INTO landing_jh.default.jh_lnpar3 (
    `L3TRAN`, `L3DORC`, `L3AFFT`, `L3AFNP`, `L3TCDS`, `L3STMD`,
    `L3FPAY`, `L3STMT`, `L3ANAL`, `L3STPS`, `L3ENCL`, `L3OVZR`,
    `L3STCD`, `L3XADV`, `L3LACD`, `L3FEE__CS`, `L3PART`, `L3EDRF`,
    `L3MONE`, `L3RCPT`, `L3MAFE`, `L3REAM`, `L3WAIV`, `L3SVRS`,
    `L3CASH`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('L3TRAN_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3TRAN`,
    concat('L3DORC_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3DORC`,
    concat('L3AFFT_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3AFFT`,
    concat('L3AFNP_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3AFNP`,
    concat('L3TCDS_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3TCDS`,
    concat('L3STMD_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3STMD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `L3FPAY`,
    concat('L3STMT_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3STMT`,
    concat('L3ANAL_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3ANAL`,
    concat('L3STPS_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3STPS`,
    concat('L3ENCL_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3ENCL`,
    concat('L3OVZR_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3OVZR`,
    concat('L3STCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3STCD`,
    concat('L3XADV_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3XADV`,
    concat('L3LACD_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3LACD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `L3FEE__CS`,
    concat('L3PART_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3PART`,
    concat('L3EDRF_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3EDRF`,
    concat('L3MONE_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3MONE`,
    concat('L3RCPT_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3RCPT`,
    concat('L3MAFE_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3MAFE`,
    concat('L3REAM_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3REAM`,
    concat('L3WAIV_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3WAIV`,
    concat('L3SVRS_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3SVRS`,
    concat('L3CASH_', lpad(CAST(idx AS STRING), 2, '0')) AS `L3CASH`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_lnpar3' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_lnpar3;
