-- Databricks SQL for source: jh_cdhist
-- Generated from sqlserver/brz-jh_cdhist.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CDHIST"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cdhist (
    `CHACCT` STRING,
    `CHATYP` STRING,
    `CHTRAN` STRING,
    `CHDORC` STRING,
    `CHAFFT` STRING,
    `CHPSTD` STRING,
    `CHPST6` STRING,
    `CHEFDT` STRING,
    `CHEFD6` STRING,
    `CHAMT` DECIMAL(38,10),
    `CHBAT__CS` STRING,
    `CHSEQ__CS` STRING,
    `CHSERL` STRING,
    `CHSRC` STRING,
    `CHISRC` STRING,
    `CHORAT` STRING,
    `CHNRAT` STRING,
    `IMAGE__CS` STRING,
    `ACFILK` STRING,
    `ACBATN` STRING,
    `ACSEQN` STRING,
    `CHUSER` STRING,
    `CHJXPD` STRING,
    `CHJXVD` STRING,
    `TRCLOSEDRS` STRING,
    `AC5CED` STRING,
    `AC5COM` STRING,
    `CHMREM` STRING,
    `PostingDate` STRING,
    `EffectiveDate` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cdhist IS
'The JH CDHIST landing table captures certificate of deposit history activity, including account identifiers, transaction details, balances, effective dates, and load metadata for transaction validation and reconciliation.';

TRUNCATE TABLE landing_jh.default.jh_cdhist;

INSERT INTO landing_jh.default.jh_cdhist (
    `CHACCT`, `CHATYP`, `CHTRAN`, `CHDORC`, `CHAFFT`, `CHPSTD`,
    `CHPST6`, `CHEFDT`, `CHEFD6`, `CHAMT`, `CHBAT__CS`, `CHSEQ__CS`,
    `CHSERL`, `CHSRC`, `CHISRC`, `CHORAT`, `CHNRAT`, `IMAGE__CS`,
    `ACFILK`, `ACBATN`, `ACSEQN`, `CHUSER`, `CHJXPD`, `CHJXVD`,
    `TRCLOSEDRS`, `AC5CED`, `AC5COM`, `CHMREM`, `PostingDate`, `EffectiveDate`,
    `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CHACCT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHACCT`,
    concat('CHATYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHATYP`,
    concat('CHTRAN_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHTRAN`,
    concat('CHDORC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHDORC`,
    concat('CHAFFT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHAFFT`,
    concat('CHPSTD_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHPSTD`,
    concat('CHPST6_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHPST6`,
    concat('CHEFDT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHEFDT`,
    concat('CHEFD6_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHEFD6`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CHAMT`,
    concat('CHBAT__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHBAT__CS`,
    concat('CHSEQ__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHSEQ__CS`,
    concat('CHSERL_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHSERL`,
    concat('CHSRC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHSRC`,
    concat('CHISRC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHISRC`,
    concat('CHORAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHORAT`,
    concat('CHNRAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHNRAT`,
    concat('IMAGE__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `IMAGE__CS`,
    concat('ACFILK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACFILK`,
    concat('ACBATN_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACBATN`,
    concat('ACSEQN_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACSEQN`,
    concat('CHUSER_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHUSER`,
    concat('CHJXPD_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHJXPD`,
    concat('CHJXVD_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHJXVD`,
    concat('TRCLOSEDRS_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRCLOSEDRS`,
    concat('AC5CED_', lpad(CAST(idx AS STRING), 2, '0')) AS `AC5CED`,
    concat('AC5COM_', lpad(CAST(idx AS STRING), 2, '0')) AS `AC5COM`,
    concat('CHMREM_', lpad(CAST(idx AS STRING), 2, '0')) AS `CHMREM`,
    concat('POSTINGDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `PostingDate`,
    concat('EFFECTIVEDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `EffectiveDate`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cdhist' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cdhist;
