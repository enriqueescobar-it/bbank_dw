-- Databricks SQL for source: q2
-- Generated from sqlserver/brz-q2.sql

CREATE CATALOG IF NOT EXISTS landing;
USE CATALOG landing;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."Q2_CUSTOMER"
CREATE TABLE IF NOT EXISTS landing.default.q2_customer (
    CUSTOMER_ID BIGINT,
    GROUP_ID BIGINT,
    GROUP_NAME STRING,
    CUSTOMER_NAME STRING,
    TAX_ID STRING,
    IS_COMPANY STRING,
    IS_TREASURY STRING,
    PRIMARY_CIF STRING,
    SERVICE_CHARGE_PLAN_ID BIGINT,
    PLAN_NAME STRING,
    CHARGE_ACCOUNT STRING,
    CREATE_DATE TIMESTAMP,
    STREET_ADDRESS1 STRING,
    STREET_ADDRESS2 STRING,
    CITY STRING,
    STATE STRING,
    POSTAL_CODE STRING,
    PROVINCE STRING,
    IS_INTERNATIONAL STRING,
    ISO_CODE_A3 STRING,
    CUSTOMER_DELETED_DATE TIMESTAMP,
    YEARMONTH INT,
    LOADED_AT TIMESTAMP
);
COMMENT ON TABLE landing.default.q2_customer IS 
'The table contains detailed information about customers, including their identifiers, group associations, contact details, and tax information. This data can be used for customer segmentation, analyzing customer demographics, and understanding customer service requirements. Use cases include tracking customer activity over time, managing customer cohorts, and assessing service charge plans.';

TRUNCATE TABLE landing.default.q2_customer;

INSERT INTO landing.default.q2_customer (
    CUSTOMER_ID, GROUP_ID, GROUP_NAME, CUSTOMER_NAME, TAX_ID, IS_COMPANY,
    IS_TREASURY, PRIMARY_CIF, SERVICE_CHARGE_PLAN_ID, PLAN_NAME,
    CHARGE_ACCOUNT, CREATE_DATE, STREET_ADDRESS1, STREET_ADDRESS2, CITY,
    STATE, POSTAL_CODE, PROVINCE, IS_INTERNATIONAL, ISO_CODE_A3,
    CUSTOMER_DELETED_DATE, YEARMONTH, LOADED_AT
)
VALUES
    (1001, 501, 'Commercial Banking', 'Atlas Trading LLC', '12-3456781', 'Y', 'N', '200000001', 10, 'Standard Analysis', '900001001', TIMESTAMP '2026-01-05 09:00:00', '101 Main St', 'Suite 100', 'Miami', 'FL', '33131', NULL, 'N', 'USA', NULL, 202601, TIMESTAMP '2026-01-05 12:00:00'),
    (1002, 501, 'Commercial Banking', 'Bluewater Imports Inc', '12-3456782', 'Y', 'N', '200000002', 10, 'Standard Analysis', '900001002', TIMESTAMP '2026-01-10 09:00:00', '202 Ocean Ave', NULL, 'Tampa', 'FL', '33602', NULL, 'N', 'USA', NULL, 202601, TIMESTAMP '2026-01-10 12:00:00'),
    (1003, 502, 'Treasury Clients', 'Cedar Finance Corp', '12-3456783', 'Y', 'Y', '200000003', 20, 'Treasury Plus', '900001003', TIMESTAMP '2026-02-01 09:00:00', '303 Market St', 'Floor 4', 'Charlotte', 'NC', '28202', NULL, 'N', 'USA', NULL, 202602, TIMESTAMP '2026-02-01 12:00:00'),
    (1004, 502, 'Treasury Clients', 'Delta Holdings LP', '12-3456784', 'Y', 'Y', '200000004', 20, 'Treasury Plus', '900001004', TIMESTAMP '2026-02-14 09:00:00', '404 King St', NULL, 'Atlanta', 'GA', '30303', NULL, 'N', 'USA', NULL, 202602, TIMESTAMP '2026-02-14 12:00:00'),
    (1005, 503, 'Retail Business', 'Evergreen Services', '12-3456785', 'Y', 'N', '200000005', 30, 'Business Basic', '900001005', TIMESTAMP '2026-03-03 09:00:00', '505 Lake Rd', 'Unit 5', 'Orlando', 'FL', '32801', NULL, 'N', 'USA', NULL, 202603, TIMESTAMP '2026-03-03 12:00:00'),
    (1006, 503, 'Retail Business', 'Fountain Supply Co', '12-3456786', 'Y', 'N', '200000006', 30, 'Business Basic', '900001006', TIMESTAMP '2026-03-20 09:00:00', '606 Pine St', NULL, 'Jacksonville', 'FL', '32202', NULL, 'N', 'USA', NULL, 202603, TIMESTAMP '2026-03-20 12:00:00'),
    (1007, 504, 'International', 'Granite Export SA', '98-7654321', 'Y', 'Y', '200000007', 40, 'International Treasury', '900001007', TIMESTAMP '2026-04-07 09:00:00', '707 Harbor Blvd', 'Office 7', 'San Juan', NULL, '00901', 'PR', 'Y', 'PRI', NULL, 202604, TIMESTAMP '2026-04-07 12:00:00'),
    (1008, 504, 'International', 'Harbor Global Ltd', '98-7654322', 'Y', 'Y', '200000008', 40, 'International Treasury', '900001008', TIMESTAMP '2026-04-22 09:00:00', '808 Trade Center', NULL, 'Toronto', NULL, 'M5H 2N2', 'ON', 'Y', 'CAN', NULL, 202604, TIMESTAMP '2026-04-22 12:00:00'),
    (1009, 505, 'Digital Banking', 'Ironwood Ventures', '12-3456789', 'Y', 'N', '200000009', 50, 'Digital Business', '900001009', TIMESTAMP '2026-05-05 09:00:00', '909 Brickell Ave', 'Suite 900', 'Miami', 'FL', '33131', NULL, 'N', 'USA', NULL, 202605, TIMESTAMP '2026-05-05 12:00:00'),
    (1010, 505, 'Digital Banking', 'Juniper Retail LLC', '12-3456790', 'Y', 'N', '200000010', 50, 'Digital Business', '900001010', TIMESTAMP '2026-05-18 09:00:00', '1010 Biscayne Blvd', NULL, 'Miami', 'FL', '33132', NULL, 'N', 'USA', NULL, 202605, TIMESTAMP '2026-05-18 12:00:00');

-- Source: "DQP_LANDING"."dbo"."Q2_USER"
CREATE TABLE IF NOT EXISTS landing.default.q2_user (
    USER_ID BIGINT,
    CUSTOMER_ID BIGINT,
    USER_ROLE_ID BIGINT,
    GROUP_ID BIGINT,
    ACTIVE_INACTIVE STRING,
    CREATED_DATE TIMESTAMP,
    DELETED_DATE TIMESTAMP,
    GROUP_NAME STRING,
    GROUP_DELETED_DATES TIMESTAMP,
    ZONE_ID BIGINT,
    ZONE_DESCRIPTION STRING,
    AUTO_GENERATED STRING,
    YEARMONTH INT,
    LOADED_AT TIMESTAMP
);
COMMENT ON TABLE landing.default.q2_user IS 
'The table captures user data for analysis related to user roles and group associations. It includes information about user status (active or inactive), creation and deletion timestamps, and group affiliations. This data can be used to manage user permissions, monitor user activity, and analyze group dynamics within the organization.';

TRUNCATE TABLE landing.default.q2_user;

INSERT INTO landing.default.q2_user (
    USER_ID, CUSTOMER_ID, USER_ROLE_ID, GROUP_ID, ACTIVE_INACTIVE,
    CREATED_DATE, DELETED_DATE, GROUP_NAME, GROUP_DELETED_DATES, ZONE_ID,
    ZONE_DESCRIPTION, AUTO_GENERATED, YEARMONTH, LOADED_AT
)
VALUES
    (3001, 1001, 1, 501, 'A', TIMESTAMP '2026-01-05 10:00:00', NULL, 'Commercial Banking', NULL, 1, 'Eastern', 'N', 202601, TIMESTAMP '2026-01-05 12:05:00'),
    (3002, 1002, 2, 501, 'A', TIMESTAMP '2026-01-10 10:00:00', NULL, 'Commercial Banking', NULL, 1, 'Eastern', 'N', 202601, TIMESTAMP '2026-01-10 12:05:00'),
    (3003, 1003, 1, 502, 'A', TIMESTAMP '2026-02-01 10:00:00', NULL, 'Treasury Clients', NULL, 2, 'Treasury', 'N', 202602, TIMESTAMP '2026-02-01 12:05:00'),
    (3004, 1004, 3, 502, 'A', TIMESTAMP '2026-02-14 10:00:00', NULL, 'Treasury Clients', NULL, 2, 'Treasury', 'N', 202602, TIMESTAMP '2026-02-14 12:05:00'),
    (3005, 1005, 2, 503, 'A', TIMESTAMP '2026-03-03 10:00:00', NULL, 'Retail Business', NULL, 3, 'Business', 'N', 202603, TIMESTAMP '2026-03-03 12:05:00'),
    (3006, 1006, 2, 503, 'I', TIMESTAMP '2026-03-20 10:00:00', TIMESTAMP '2026-06-01 08:00:00', 'Retail Business', NULL, 3, 'Business', 'N', 202603, TIMESTAMP '2026-03-20 12:05:00'),
    (3007, 1007, 1, 504, 'A', TIMESTAMP '2026-04-07 10:00:00', NULL, 'International', NULL, 4, 'International', 'N', 202604, TIMESTAMP '2026-04-07 12:05:00'),
    (3008, 1008, 3, 504, 'A', TIMESTAMP '2026-04-22 10:00:00', NULL, 'International', NULL, 4, 'International', 'Y', 202604, TIMESTAMP '2026-04-22 12:05:00'),
    (3009, 1009, 1, 505, 'A', TIMESTAMP '2026-05-05 10:00:00', NULL, 'Digital Banking', NULL, 5, 'Digital', 'N', 202605, TIMESTAMP '2026-05-05 12:05:00'),
    (3010, 1010, 2, 505, 'A', TIMESTAMP '2026-05-18 10:00:00', NULL, 'Digital Banking', NULL, 5, 'Digital', 'Y', 202605, TIMESTAMP '2026-05-18 12:05:00');

-- Source: "DQP_LANDING"."dbo"."Q2_USER_PII"
CREATE TABLE IF NOT EXISTS landing.default.q2_user_pii (
    USER_ID BIGINT,
    PRIMARY_CIF STRING,
    LAST_NAME STRING,
    FIRST_NAME STRING,
    MIDDLE_NAME STRING,
    SALUTATION STRING,
    SUFFIX STRING,
    SOCIAL_SECURITY_NUMBER STRING,
    EMAIL_ADDRESS STRING,
    STREET_ADDRESS_1 STRING,
    STREET_ADDRESS_2 STRING,
    CITY STRING,
    STATE STRING,
    POSTAL_CODE STRING,
    PROVINCE STRING,
    IS_INTERNATIONAL STRING,
    ISO_CODE_A3 STRING,
    YEARMONTH INT,
    LOADED_AT TIMESTAMP
);
COMMENT ON TABLE landing.default.q2_user_pii IS 
'The table contains personally identifiable information (PII) related to users. It includes details such as names, contact information, and addresses. This data can be utilized for customer identification, verification processes, and communication activities. It is also useful for compliance purposes and ensuring data accuracy in user profiles.';

TRUNCATE TABLE landing.default.q2_user_pii;

INSERT INTO landing.default.q2_user_pii (
    USER_ID, PRIMARY_CIF, LAST_NAME, FIRST_NAME, MIDDLE_NAME, SALUTATION,
    SUFFIX, SOCIAL_SECURITY_NUMBER, EMAIL_ADDRESS, STREET_ADDRESS_1,
    STREET_ADDRESS_2, CITY, STATE, POSTAL_CODE, PROVINCE, IS_INTERNATIONAL,
    ISO_CODE_A3, YEARMONTH, LOADED_AT
)
VALUES
    (3001, '200000001', 'Rivera', 'Ana', 'M', 'Ms', NULL, '111-22-3001', 'ana.rivera@example.com', '101 Main St', 'Suite 100', 'Miami', 'FL', '33131', NULL, 'N', 'USA', 202601, TIMESTAMP '2026-01-05 12:10:00'),
    (3002, '200000002', 'Chen', 'Michael', 'J', 'Mr', NULL, '111-22-3002', 'michael.chen@example.com', '202 Ocean Ave', NULL, 'Tampa', 'FL', '33602', NULL, 'N', 'USA', 202601, TIMESTAMP '2026-01-10 12:10:00'),
    (3003, '200000003', 'Patel', 'Nisha', 'R', 'Ms', NULL, '111-22-3003', 'nisha.patel@example.com', '303 Market St', 'Floor 4', 'Charlotte', 'NC', '28202', NULL, 'N', 'USA', 202602, TIMESTAMP '2026-02-01 12:10:00'),
    (3004, '200000004', 'Walker', 'James', 'T', 'Mr', 'Jr', '111-22-3004', 'james.walker@example.com', '404 King St', NULL, 'Atlanta', 'GA', '30303', NULL, 'N', 'USA', 202602, TIMESTAMP '2026-02-14 12:10:00'),
    (3005, '200000005', 'Lopez', 'Maria', 'E', 'Ms', NULL, '111-22-3005', 'maria.lopez@example.com', '505 Lake Rd', 'Unit 5', 'Orlando', 'FL', '32801', NULL, 'N', 'USA', 202603, TIMESTAMP '2026-03-03 12:10:00'),
    (3006, '200000006', 'Brown', 'David', 'A', 'Mr', NULL, '111-22-3006', 'david.brown@example.com', '606 Pine St', NULL, 'Jacksonville', 'FL', '32202', NULL, 'N', 'USA', 202603, TIMESTAMP '2026-03-20 12:10:00'),
    (3007, '200000007', 'Santos', 'Lucia', 'C', 'Ms', NULL, '111-22-3007', 'lucia.santos@example.com', '707 Harbor Blvd', 'Office 7', 'San Juan', NULL, '00901', 'PR', 'Y', 'PRI', 202604, TIMESTAMP '2026-04-07 12:10:00'),
    (3008, '200000008', 'Miller', 'Grace', 'K', 'Ms', NULL, '111-22-3008', 'grace.miller@example.com', '808 Trade Center', NULL, 'Toronto', NULL, 'M5H 2N2', 'ON', 'Y', 'CAN', 202604, TIMESTAMP '2026-04-22 12:10:00'),
    (3009, '200000009', 'Garcia', 'Luis', 'P', 'Mr', NULL, '111-22-3009', 'luis.garcia@example.com', '909 Brickell Ave', 'Suite 900', 'Miami', 'FL', '33131', NULL, 'N', 'USA', 202605, TIMESTAMP '2026-05-05 12:10:00'),
    (3010, '200000010', 'Nguyen', 'Sophia', 'L', 'Ms', NULL, '111-22-3010', 'sophia.nguyen@example.com', '1010 Biscayne Blvd', NULL, 'Miami', 'FL', '33132', NULL, 'N', 'USA', 202605, TIMESTAMP '2026-05-18 12:10:00');

SELECT 'q2_customer' AS table_name, COUNT(*) AS record_count
FROM landing.default.q2_customer
UNION ALL
SELECT 'q2_user' AS table_name, COUNT(*) AS record_count
FROM landing.default.q2_user
UNION ALL
SELECT 'q2_user_pii' AS table_name, COUNT(*) AS record_count
FROM landing.default.q2_user_pii;
