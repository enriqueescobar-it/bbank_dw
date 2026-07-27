-- Databricks SQL for source: jh_cfmesg
-- Generated from sqlserver/brz-jh_cfmesg.sql

CREATE CATALOG IF NOT EXISTS landing_jh;
USE CATALOG landing_jh;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."JH_CFMESG"
CREATE TABLE IF NOT EXISTS landing_jh.default.jh_cfmesg (
    `CFMSID` STRING,
    `CFATYP` STRING,
    `CFACC__CS` STRING,
    `CFMSEQ` STRING,
    `CFCOLM` STRING,
    `CFMSG` STRING,
    `CFCIF__CS` STRING,
    `CFALTA` STRING,
    `CFEXPD` STRING,
    `CFEXP6` STRING,
    `CFMPDT` STRING,
    `CFMPD6` STRING,
    `CFMUIC` STRING,
    `CFMPLN` STRING,
    `AsOfDate` DATE,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE landing_jh.default.jh_cfmesg IS
'The JH CFMESG landing table captures customer message and note attributes from Jack Henry for operational review, customer servicing, and downstream processing.';

TRUNCATE TABLE landing_jh.default.jh_cfmesg;

INSERT INTO landing_jh.default.jh_cfmesg (
    `CFMSID`, `CFATYP`, `CFACC__CS`, `CFMSEQ`, `CFCOLM`, `CFMSG`,
    `CFCIF__CS`, `CFALTA`, `CFEXPD`, `CFEXP6`, `CFMPDT`, `CFMPD6`,
    `CFMUIC`, `CFMPLN`, `AsOfDate`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('CFMSID_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFMSID`,
    concat('CFATYP_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFATYP`,
    concat('CFACC__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFACC__CS`,
    concat('CFMSEQ_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFMSEQ`,
    concat('CFCOLM_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCOLM`,
    concat('CFMSG_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFMSG`,
    concat('CFCIF__CS_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFCIF__CS`,
    concat('CFALTA_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFALTA`,
    concat('CFEXPD_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFEXPD`,
    concat('CFEXP6_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFEXP6`,
    concat('CFMPDT_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFMPDT`,
    concat('CFMPD6_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFMPD6`,
    concat('CFMUIC_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFMUIC`,
    concat('CFMPLN_', lpad(CAST(idx AS STRING), 2, '0')) AS `CFMPLN`,
    date_add(DATE '2026-01-01', idx - 1) AS `AsOfDate`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT 'jh_cfmesg' AS table_name, COUNT(*) AS record_count
FROM landing_jh.default.jh_cfmesg;
