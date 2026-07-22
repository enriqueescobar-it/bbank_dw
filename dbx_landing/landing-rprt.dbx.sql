-- Databricks SQL for source: rprt
-- Generated from sqlserver/brz-rprt.sql

CREATE CATALOG IF NOT EXISTS landing;
USE CATALOG landing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."RPRT_sharing_agreement_exception"
CREATE TABLE IF NOT EXISTS landing.default.rprt_sharing_agreement_exception (
    ID BIGINT,
    CIF_NO STRING,
    ACTIVE STRING,
    YEARMONTH INT,
    LOADED_AT TIMESTAMP
);

TRUNCATE TABLE landing.default.rprt_sharing_agreement_exception;

INSERT INTO landing.default.rprt_sharing_agreement_exception (
    ID, CIF_NO, ACTIVE, YEARMONTH, LOADED_AT
)
VALUES
    (1, '100000001', 'Y', 202601, TIMESTAMP '2026-01-05 12:00:00'),
    (2, '100000002', 'Y', 202601, TIMESTAMP '2026-01-10 12:00:00'),
    (3, '100000003', 'N', 202602, TIMESTAMP '2026-02-01 12:00:00'),
    (4, '100000004', 'Y', 202602, TIMESTAMP '2026-02-14 12:00:00'),
    (5, '100000005', 'N', 202603, TIMESTAMP '2026-03-03 12:00:00'),
    (6, '100000006', 'Y', 202603, TIMESTAMP '2026-03-20 12:00:00'),
    (7, '100000007', 'Y', 202604, TIMESTAMP '2026-04-07 12:00:00'),
    (8, '100000008', 'N', 202604, TIMESTAMP '2026-04-22 12:00:00'),
    (9, '100000009', 'Y', 202605, TIMESTAMP '2026-05-05 12:00:00'),
    (10, '100000010', 'N', 202605, TIMESTAMP '2026-05-18 12:00:00');

SELECT 'rprt_sharing_agreement_exception' AS table_name, COUNT(*) AS record_count
FROM landing.default.rprt_sharing_agreement_exception;
