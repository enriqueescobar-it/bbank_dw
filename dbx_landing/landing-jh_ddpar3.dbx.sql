-- Databricks SQL for source: jh_ddpar3
-- Generated from sqlserver/brz-jh_ddpar3.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_DDPAR3"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_ddpar3 (
    `TRANCD` STRING,
    `REVRTC` STRING,
    `DORC` STRING,
    `BORI` STRING,
    `EFTTYP` STRING,
    `FPAY` DECIMAL(38,10),
    `STOPS` STRING,
    `STMT` STRING,
    `SCITEM` STRING,
    `TIMNSF` STRING,
    `MMDDR` STRING,
    `LISTPO` STRING,
    `PSTSEQ` STRING,
    `CNTENC` STRING,
    `DESC__CS` STRING,
    `STMDSC` STRING,
    `DESSTM` STRING,
    `RECID` STRING,
    `UPDTDLA` STRING,
    `P3ARPNTPRT` STRING,
    `P3ARPEXTRC` STRING,
    `P3TRKREFND` STRING,
    `P3AFFNSF` STRING,
    `P3UPDNSF` STRING,
    `P3COBAL` DECIMAL(38,10),
    `P3RNDCHG` DECIMAL(38,10),
    `P3TSA1` STRING,
    `P3TSA2` STRING,
    `P3TSA3` STRING,
    `P3TSA4` STRING,
    `P3IEODO` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_ddpar3 IS
'The JH demand deposit parameter landing table captures DDA product, transaction, service charge, and account reference attributes for validation, classification, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_ddpar3;

INSERT INTO landing_jh.default.jh_ddpar3 (
    `TRANCD`, `REVRTC`, `DORC`, `BORI`, `EFTTYP`, `FPAY`,
    `STOPS`, `STMT`, `SCITEM`, `TIMNSF`, `MMDDR`, `LISTPO`,
    `PSTSEQ`, `CNTENC`, `DESC__CS`, `STMDSC`, `DESSTM`, `RECID`,
    `UPDTDLA`, `P3ARPNTPRT`, `P3ARPEXTRC`, `P3TRKREFND`, `P3AFFNSF`, `P3UPDNSF`,
    `P3COBAL`, `P3RNDCHG`, `P3TSA1`, `P3TSA2`, `P3TSA3`, `P3TSA4`,
    `P3IEODO`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('TRANCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRANCD`,
    concat('REVRTC_', lpad(CAST(idx AS STRING), 2, '0')) AS `REVRTC`,
    concat('DORC_', lpad(CAST(idx AS STRING), 2, '0')) AS `DORC`,
    concat('BORI_', lpad(CAST(idx AS STRING), 2, '0')) AS `BORI`,
    concat('EFTTYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `EFTTYP`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `FPAY`,
    concat('STOPS_', lpad(CAST(idx AS STRING), 2, '0')) AS `STOPS`,
    concat('STMT_', lpad(CAST(idx AS STRING), 2, '0')) AS `STMT`,
    concat('SCITEM_', lpad(CAST(idx AS STRING), 2, '0')) AS `SCITEM`,
    concat('TIMNSF_', lpad(CAST(idx AS STRING), 2, '0')) AS `TIMNSF`,
    concat('MMDDR_', lpad(CAST(idx AS STRING), 2, '0')) AS `MMDDR`,
    concat('LISTPO_', lpad(CAST(idx AS STRING), 2, '0')) AS `LISTPO`,
    concat('PSTSEQ_', lpad(CAST(idx AS STRING), 2, '0')) AS `PSTSEQ`,
    concat('CNTENC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CNTENC`,
    concat('DESC__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `DESC__CS`,
    concat('STMDSC_', lpad(CAST(idx AS STRING), 2, '0')) AS `STMDSC`,
    concat('DESSTM_', lpad(CAST(idx AS STRING), 2, '0')) AS `DESSTM`,
    concat('RECID_', lpad(CAST(idx AS STRING), 2, '0')) AS `RECID`,
    concat('UPDTDLA_', lpad(CAST(idx AS STRING), 2, '0')) AS `UPDTDLA`,
    concat('P3ARPNTPRT_', lpad(CAST(idx AS STRING), 2, '0')) AS `P3ARPNTPRT`,
    concat('P3ARPEXTRC_', lpad(CAST(idx AS STRING), 2, '0')) AS `P3ARPEXTRC`,
    concat('P3TRKREFND_', lpad(CAST(idx AS STRING), 2, '0')) AS `P3TRKREFND`,
    concat('P3AFFNSF_', lpad(CAST(idx AS STRING), 2, '0')) AS `P3AFFNSF`,
    concat('P3UPDNSF_', lpad(CAST(idx AS STRING), 2, '0')) AS `P3UPDNSF`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `P3COBAL`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `P3RNDCHG`,
    concat('P3TSA1_', lpad(CAST(idx AS STRING), 2, '0')) AS `P3TSA1`,
    concat('P3TSA2_', lpad(CAST(idx AS STRING), 2, '0')) AS `P3TSA2`,
    concat('P3TSA3_', lpad(CAST(idx AS STRING), 2, '0')) AS `P3TSA3`,
    concat('P3TSA4_', lpad(CAST(idx AS STRING), 2, '0')) AS `P3TSA4`,
    concat('P3IEODO_', lpad(CAST(idx AS STRING), 2, '0')) AS `P3IEODO`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_ddpar3' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_ddpar3;
