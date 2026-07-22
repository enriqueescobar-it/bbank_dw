-- Databricks SQL for source: mis
-- Generated from sqlserver/brz-mis.sql

CREATE CATALOG IF NOT EXISTS mis;
USE CATALOG mis;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."FILE_MIS_PERSHING_OFFICER_CODE"
CREATE TABLE IF NOT EXISTS mis.default.file_mis_pershing_officer_code (
    IP_CODE STRING,
    OFFICER_CODE STRING,
    NAME STRING,
    COST_CENTER STRING,
    TEAM STRING,
    DATA_OF_DATA DATE,
    YEARMONTH INT,
    LOADED_AT TIMESTAMP
);

TRUNCATE TABLE mis.default.file_mis_pershing_officer_code;

INSERT INTO mis.default.file_mis_pershing_officer_code (
    IP_CODE, OFFICER_CODE, NAME, COST_CENTER, TEAM, DATA_OF_DATA, YEARMONTH,
    LOADED_AT
)
VALUES
    ('IP001', 'OC001', 'Ana Rivera', 'CC100', 'Private Banking', DATE '2026-01-31', 202601, TIMESTAMP '2026-01-31 12:00:00'),
    ('IP002', 'OC002', 'Michael Chen', 'CC100', 'Private Banking', DATE '2026-01-31', 202601, TIMESTAMP '2026-01-31 12:00:00'),
    ('IP003', 'OC003', 'Nisha Patel', 'CC200', 'Wealth Advisory', DATE '2026-02-28', 202602, TIMESTAMP '2026-02-28 12:00:00'),
    ('IP004', 'OC004', 'James Walker', 'CC200', 'Wealth Advisory', DATE '2026-02-28', 202602, TIMESTAMP '2026-02-28 12:00:00'),
    ('IP005', 'OC005', 'Maria Lopez', 'CC300', 'Trust Services', DATE '2026-03-31', 202603, TIMESTAMP '2026-03-31 12:00:00'),
    ('IP006', 'OC006', 'David Brown', 'CC300', 'Trust Services', DATE '2026-03-31', 202603, TIMESTAMP '2026-03-31 12:00:00'),
    ('IP007', 'OC007', 'Lucia Santos', 'CC400', 'Brokerage', DATE '2026-04-30', 202604, TIMESTAMP '2026-04-30 12:00:00'),
    ('IP008', 'OC008', 'Grace Miller', 'CC400', 'Brokerage', DATE '2026-04-30', 202604, TIMESTAMP '2026-04-30 12:00:00'),
    ('IP009', 'OC009', 'Luis Garcia', 'CC500', 'Operations', DATE '2026-05-31', 202605, TIMESTAMP '2026-05-31 12:00:00'),
    ('IP010', 'OC010', 'Sophia Nguyen', 'CC500', 'Operations', DATE '2026-05-31', 202605, TIMESTAMP '2026-05-31 12:00:00');

-- Source: "DQP_LANDING"."dbo"."FILE_MIS_TEAM_OFFICERS_V2"
CREATE TABLE IF NOT EXISTS mis.default.file_mis_team_officers_v2 (
    OFFICER_CODE STRING,
    FULL_NAME STRING,
    SHORT_NAME STRING,
    TITLE STRING,
    PHONE_NUMBER STRING,
    EMAIL STRING,
    BUSINESS_LINE STRING,
    TEAM STRING,
    TEAM_CODE STRING,
    COST_CENTER STRING,
    ACTIVEOFFICER STRING,
    DATA_OF_DATA DATE,
    YEARMONTH INT,
    LOADED_AT TIMESTAMP
);

TRUNCATE TABLE mis.default.file_mis_team_officers_v2;

INSERT INTO mis.default.file_mis_team_officers_v2 (
    OFFICER_CODE, FULL_NAME, SHORT_NAME, TITLE, PHONE_NUMBER, EMAIL,
    BUSINESS_LINE, TEAM, TEAM_CODE, COST_CENTER, ACTIVEOFFICER,
    DATA_OF_DATA, YEARMONTH, LOADED_AT
)
VALUES
    ('OC001', 'Ana Rivera', 'ARivera', 'Relationship Manager', '305-555-0101', 'ana.rivera@example.com', 'Wealth', 'Private Banking', 'PB01', 'CC100', 'Y', DATE '2026-01-31', 202601, TIMESTAMP '2026-01-31 12:05:00'),
    ('OC002', 'Michael Chen', 'MChen', 'Senior Advisor', '305-555-0102', 'michael.chen@example.com', 'Wealth', 'Private Banking', 'PB01', 'CC100', 'Y', DATE '2026-01-31', 202601, TIMESTAMP '2026-01-31 12:05:00'),
    ('OC003', 'Nisha Patel', 'NPatel', 'Portfolio Advisor', '305-555-0103', 'nisha.patel@example.com', 'Wealth', 'Wealth Advisory', 'WA01', 'CC200', 'Y', DATE '2026-02-28', 202602, TIMESTAMP '2026-02-28 12:05:00'),
    ('OC004', 'James Walker', 'JWalker', 'Investment Officer', '305-555-0104', 'james.walker@example.com', 'Wealth', 'Wealth Advisory', 'WA01', 'CC200', 'Y', DATE '2026-02-28', 202602, TIMESTAMP '2026-02-28 12:05:00'),
    ('OC005', 'Maria Lopez', 'MLopez', 'Trust Officer', '305-555-0105', 'maria.lopez@example.com', 'Trust', 'Trust Services', 'TS01', 'CC300', 'Y', DATE '2026-03-31', 202603, TIMESTAMP '2026-03-31 12:05:00'),
    ('OC006', 'David Brown', 'DBrown', 'Estate Specialist', '305-555-0106', 'david.brown@example.com', 'Trust', 'Trust Services', 'TS01', 'CC300', 'N', DATE '2026-03-31', 202603, TIMESTAMP '2026-03-31 12:05:00'),
    ('OC007', 'Lucia Santos', 'LSantos', 'Brokerage Officer', '305-555-0107', 'lucia.santos@example.com', 'Brokerage', 'Brokerage', 'BR01', 'CC400', 'Y', DATE '2026-04-30', 202604, TIMESTAMP '2026-04-30 12:05:00'),
    ('OC008', 'Grace Miller', 'GMiller', 'Trading Specialist', '305-555-0108', 'grace.miller@example.com', 'Brokerage', 'Brokerage', 'BR01', 'CC400', 'Y', DATE '2026-04-30', 202604, TIMESTAMP '2026-04-30 12:05:00'),
    ('OC009', 'Luis Garcia', 'LGarcia', 'Operations Officer', '305-555-0109', 'luis.garcia@example.com', 'Operations', 'Operations', 'OP01', 'CC500', 'Y', DATE '2026-05-31', 202605, TIMESTAMP '2026-05-31 12:05:00'),
    ('OC010', 'Sophia Nguyen', 'SNguyen', 'Operations Analyst', '305-555-0110', 'sophia.nguyen@example.com', 'Operations', 'Operations', 'OP01', 'CC500', 'Y', DATE '2026-05-31', 202605, TIMESTAMP '2026-05-31 12:05:00');

SELECT 'file_mis_pershing_officer_code' AS table_name, COUNT(*) AS record_count
FROM mis.default.file_mis_pershing_officer_code
UNION ALL
SELECT 'file_mis_team_officers_v2' AS table_name, COUNT(*) AS record_count
FROM mis.default.file_mis_team_officers_v2;
