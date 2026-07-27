-- Databricks SQL for source: jh_lnepos
-- Generated from sqlserver/brz-jh_lnepos.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_LNEPOS"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_lnepos (
    `FPTYPE` STRING,
    `FPBR__CS` STRING,
    `FPACCT` STRING,
    `FPFTYP` STRING,
    `FPGRUP` STRING,
    `FPDESC` STRING,
    `FPNFEE` DECIMAL(38,10),
    `FPFREP` STRING,
    `FPPAMT` DECIMAL(38,10),
    `FPIDIF` STRING,
    `FPRATE` DECIMAL(38,10),
    `FPYELD` STRING,
    `FPLNCR` STRING,
    `FPBGND` STRING,
    `FPENDD` DECIMAL(38,10),
    `FPOBR__CS` STRING,
    `FPOGR__CS` STRING,
    `FPFEEM` DECIMAL(38,10),
    `FPCOST` STRING,
    `FPPROD` STRING,
    `FPOCST` STRING,
    `FPOPRD` STRING,
    `FPBUEB` STRING,
    `FPEUEB` STRING,
    `FPNEWAM` STRING,
    `FPPRTYP` STRING,
    `FPGLBKT` STRING,
    `FPLNSTS` STRING,
    `FPSEQ__CS` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_lnepos IS
'The JH_LNEPOS landing table captures Jack Henry loan account, transaction, position, payment, collateral, rate, date, and balance attributes for loan validation, reconciliation, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_lnepos;

INSERT INTO landing_jh.default.jh_lnepos (
    `FPTYPE`, `FPBR__CS`, `FPACCT`, `FPFTYP`, `FPGRUP`, `FPDESC`,
    `FPNFEE`, `FPFREP`, `FPPAMT`, `FPIDIF`, `FPRATE`, `FPYELD`,
    `FPLNCR`, `FPBGND`, `FPENDD`, `FPOBR__CS`, `FPOGR__CS`, `FPFEEM`,
    `FPCOST`, `FPPROD`, `FPOCST`, `FPOPRD`, `FPBUEB`, `FPEUEB`,
    `FPNEWAM`, `FPPRTYP`, `FPGLBKT`, `FPLNSTS`, `FPSEQ__CS`, `AsOfDate`,
    `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('FPTYPE_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPTYPE`,
    concat('FPBR__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPBR__CS`,
    concat('FPACCT_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPACCT`,
    concat('FPFTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPFTYP`,
    concat('FPGRUP_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPGRUP`,
    concat('FPDESC_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPDESC`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `FPNFEE`,
    concat('FPFREP_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPFREP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `FPPAMT`,
    concat('FPIDIF_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPIDIF`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `FPRATE`,
    concat('FPYELD_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPYELD`,
    concat('FPLNCR_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPLNCR`,
    concat('FPBGND_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPBGND`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `FPENDD`,
    concat('FPOBR__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPOBR__CS`,
    concat('FPOGR__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPOGR__CS`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `FPFEEM`,
    concat('FPCOST_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPCOST`,
    concat('FPPROD_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPPROD`,
    concat('FPOCST_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPOCST`,
    concat('FPOPRD_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPOPRD`,
    concat('FPBUEB_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPBUEB`,
    concat('FPEUEB_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPEUEB`,
    concat('FPNEWAM_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPNEWAM`,
    concat('FPPRTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPPRTYP`,
    concat('FPGLBKT_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPGLBKT`,
    concat('FPLNSTS_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPLNSTS`,
    concat('FPSEQ__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `FPSEQ__CS`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_lnepos' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_lnepos;
