-- Databricks SQL for source: jh_ddhist
-- Generated from sqlserver/brz-jh_ddhist.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_DDHIST"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_ddhist (
    `ID` STRING,
    `TRSTAT` STRING,
    `TRACCT` STRING,
    `TRATYP` STRING,
    `TRANCD` STRING,
    `TRDATE` STRING,
    `TREFFD` STRING,
    `TRRATE` DECIMAL(38,10),
    `AMT` DECIMAL(38,10),
    `SERIAL` STRING,
    `RUN__CS` STRING,
    `BATCH` STRING,
    `SEQ` STRING,
    `RETDAY` STRING,
    `ATMCOD` STRING,
    `CHGFLG` DECIMAL(38,10),
    `NOBOOK` STRING,
    `TRDAT6` STRING,
    `TREFF6` STRING,
    `SOURCE` STRING,
    `DORC` STRING,
    `BORI` STRING,
    `DESSTM` STRING,
    `PSTSQ__CS` STRING,
    `IMAGE__CS` STRING,
    `ACFILK` STRING,
    `ACBATN` STRING,
    `ACSEQN` STRING,
    `ACHSEC` STRING,
    `KTRESCODE` STRING,
    `PASPNT` STRING,
    `PDCK21M` STRING,
    `PDIMSRC` STRING,
    `DDUSRID` STRING,
    `ACHCON` STRING,
    `ROUTE` STRING,
    `ACHCOI` STRING,
    `CKPAYEE` DECIMAL(38,10),
    `JXPROD` STRING,
    `JXVEND` STRING,
    `PDPAYEE` DECIMAL(38,10),
    `PSTTMSTMP` STRING,
    `JHTRANID` STRING,
    `TransactionDate` STRING,
    `EffectiveDate` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_ddhist IS
'The JH DDHIST landing table captures demand deposit transaction history attributes, including account identifiers, transaction codes, amounts, dates, balances, and posting metadata for reconciliation and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_ddhist;

INSERT INTO landing_jh.default.jh_ddhist (
    `ID`, `TRSTAT`, `TRACCT`, `TRATYP`, `TRANCD`, `TRDATE`,
    `TREFFD`, `TRRATE`, `AMT`, `SERIAL`, `RUN__CS`, `BATCH`,
    `SEQ`, `RETDAY`, `ATMCOD`, `CHGFLG`, `NOBOOK`, `TRDAT6`,
    `TREFF6`, `SOURCE`, `DORC`, `BORI`, `DESSTM`, `PSTSQ__CS`,
    `IMAGE__CS`, `ACFILK`, `ACBATN`, `ACSEQN`, `ACHSEC`, `KTRESCODE`,
    `PASPNT`, `PDCK21M`, `PDIMSRC`, `DDUSRID`, `ACHCON`, `ROUTE`,
    `ACHCOI`, `CKPAYEE`, `JXPROD`, `JXVEND`, `PDPAYEE`, `PSTTMSTMP`,
    `JHTRANID`, `TransactionDate`, `EffectiveDate`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('ID_', lpad(CAST(idx AS STRING), 2, '0')) AS `ID`,
    concat('TRSTAT_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRSTAT`,
    concat('TRACCT_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRACCT`,
    concat('TRATYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRATYP`,
    concat('TRANCD_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRANCD`,
    concat('TRDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRDATE`,
    concat('TREFFD_', lpad(CAST(idx AS STRING), 2, '0')) AS `TREFFD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `TRRATE`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `AMT`,
    concat('SERIAL_', lpad(CAST(idx AS STRING), 2, '0')) AS `SERIAL`,
    concat('RUN__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `RUN__CS`,
    concat('BATCH_', lpad(CAST(idx AS STRING), 2, '0')) AS `BATCH`,
    concat('SEQ_', lpad(CAST(idx AS STRING), 2, '0')) AS `SEQ`,
    concat('RETDAY_', lpad(CAST(idx AS STRING), 2, '0')) AS `RETDAY`,
    concat('ATMCOD_', lpad(CAST(idx AS STRING), 2, '0')) AS `ATMCOD`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CHGFLG`,
    concat('NOBOOK_', lpad(CAST(idx AS STRING), 2, '0')) AS `NOBOOK`,
    concat('TRDAT6_', lpad(CAST(idx AS STRING), 2, '0')) AS `TRDAT6`,
    concat('TREFF6_', lpad(CAST(idx AS STRING), 2, '0')) AS `TREFF6`,
    concat('SOURCE_', lpad(CAST(idx AS STRING), 2, '0')) AS `SOURCE`,
    concat('DORC_', lpad(CAST(idx AS STRING), 2, '0')) AS `DORC`,
    concat('BORI_', lpad(CAST(idx AS STRING), 2, '0')) AS `BORI`,
    concat('DESSTM_', lpad(CAST(idx AS STRING), 2, '0')) AS `DESSTM`,
    concat('PSTSQ__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `PSTSQ__CS`,
    concat('IMAGE__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `IMAGE__CS`,
    concat('ACFILK_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACFILK`,
    concat('ACBATN_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACBATN`,
    concat('ACSEQN_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACSEQN`,
    concat('ACHSEC_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACHSEC`,
    concat('KTRESCODE_', lpad(CAST(idx AS STRING), 2, '0')) AS `KTRESCODE`,
    concat('PASPNT_', lpad(CAST(idx AS STRING), 2, '0')) AS `PASPNT`,
    concat('PDCK21M_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDCK21M`,
    concat('PDIMSRC_', lpad(CAST(idx AS STRING), 2, '0')) AS `PDIMSRC`,
    concat('DDUSRID_', lpad(CAST(idx AS STRING), 2, '0')) AS `DDUSRID`,
    concat('ACHCON_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACHCON`,
    concat('ROUTE_', lpad(CAST(idx AS STRING), 2, '0')) AS `ROUTE`,
    concat('ACHCOI_', lpad(CAST(idx AS STRING), 2, '0')) AS `ACHCOI`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `CKPAYEE`,
    concat('JXPROD_', lpad(CAST(idx AS STRING), 2, '0')) AS `JXPROD`,
    concat('JXVEND_', lpad(CAST(idx AS STRING), 2, '0')) AS `JXVEND`,
    TRY_CAST(idx * 100.25 AS DECIMAL(38,10)) AS `PDPAYEE`,
    concat('PSTTMSTMP_', lpad(CAST(idx AS STRING), 2, '0')) AS `PSTTMSTMP`,
    concat('JHTRANID_', lpad(CAST(idx AS STRING), 2, '0')) AS `JHTRANID`,
    concat('TRANSACTIONDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `TransactionDate`,
    concat('EFFECTIVEDATE_', lpad(CAST(idx AS STRING), 2, '0')) AS `EffectiveDate`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_ddhist' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_ddhist;
