-- Databricks SQL for source: jh_glhist_datsec
-- Generated from sqlserver/brz-jh_glhist_datsec.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_GLHIST_DATSEC"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_glhist_datsec (
    `TRBR` STRING,
    `TRACCT` STRING,
    `TRCOST` STRING,
    `TRPROD` STRING,
    `TRCODE` STRING,
    `TRDORC` STRING,
    `TRAFFT` STRING,
    `TRBAT` STRING,
    `TRSEQ` STRING,
    `TRSRC` STRING,
    `TRAMT` DECIMAL(38,10),
    `TRDESC` STRING,
    `TRDSEQ` STRING,
    `TROFCR` STRING,
    `TRGRP` STRING,
    `TRSYS` STRING,
    `TRIFC` STRING,
    `TRDAT6` STRING,
    `TRDAT7` STRING,
    `TREFF6` STRING,
    `TREFF7` STRING,
    `TRMUID` STRING,
    `IMAGE__CS` STRING,
    `ACFILK` STRING,
    `ACBATN` STRING,
    `ACSEQN` STRING,
    `TRREFF` STRING,
    `TRJXPD` STRING,
    `TRJXVD` STRING,
    `GUID__CS` STRING,
    `JHTRANID` STRING,
    `PostingDate` DATE,
    `EffectiveDate` DATE,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_glhist_datsec IS
'The JH_GLHIST_DATSEC landing table captures Jack Henry general ledger account, transaction, posting, balance, effective date, and reference attributes for ledger validation, reconciliation, and downstream reporting.';

TRUNCATE TABLE landing_jh.default.jh_glhist_datsec;

INSERT INTO landing_jh.default.jh_glhist_datsec (
    `TRBR`, `TRACCT`, `TRCOST`, `TRPROD`, `TRCODE`, `TRDORC`,
    `TRAFFT`, `TRBAT`, `TRSEQ`, `TRSRC`, `TRAMT`, `TRDESC`,
    `TRDSEQ`, `TROFCR`, `TRGRP`, `TRSYS`, `TRIFC`, `TRDAT6`,
    `TRDAT7`, `TREFF6`, `TREFF7`, `TRMUID`, `IMAGE__CS`, `ACFILK`,
    `ACBATN`, `ACSEQN`, `TRREFF`, `TRJXPD`, `TRJXVD`, `GUID__CS`,
    `JHTRANID`, `PostingDate`, `EffectiveDate`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRBR_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRBR`,
    concat('TRACCT_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRACCT`,
    concat('TRCOST_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRCOST`,
    concat('TRPROD_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRPROD`,
    concat('TRCODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRCODE`,
    concat('TRDORC_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRDORC`,
    concat('TRAFFT_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRAFFT`,
    concat('TRBAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRBAT`,
    concat('TRSEQ_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRSEQ`,
    concat('TRSRC_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRSRC`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `TRAMT`,
    concat('TRDESC_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRDESC`,
    concat('TRDSEQ_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRDSEQ`,
    concat('TROFCR_', lpad(CAST(idx AS STRING), 2, '0')) AS `TROFCR`,
    concat('TRGRP_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRGRP`,
    concat('TRSYS_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRSYS`,
    concat('TRIFC_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRIFC`,
    concat('TRDAT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRDAT6`,
    concat('TRDAT7_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRDAT7`,
    concat('TREFF6_', lpad(CAST(idx AS STRING), 2, '0')) AS `TREFF6`,
    concat('TREFF7_', lpad(CAST(idx AS STRING), 2, '0')) AS `TREFF7`,
    concat('TRMUID_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRMUID`,
    concat('IMAGE__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `IMAGE__CS`,
    concat('ACFILK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACFILK`,
    concat('ACBATN_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACBATN`,
    concat('ACSEQN_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACSEQN`,
    concat('TRREFF_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRREFF`,
    concat('TRJXPD_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRJXPD`,
    concat('TRJXVD_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRJXVD`,
    concat('GUID__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `GUID__CS`,
    concat('JHTRANID_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHTRANID`,
    date_add(DATE '2026-01-01', idx - 1) AS `PostingDate`,
    date_add(DATE '2026-01-01', idx - 1) AS `EffectiveDate`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_glhist_datsec' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_glhist_datsec;
