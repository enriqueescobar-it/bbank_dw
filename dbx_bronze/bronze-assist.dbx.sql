-- Databricks SQL for bronze catalog
-- Rebuilt from dbx/bronze.dbx.sql

CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From bronze-assist.dbx.sql
-- Source model: bronze_assist_codfil_ref
CREATE OR REPLACE TABLE bronze.default.bronze_assist_codfil_ref AS
-- NAME: BRONZE_ASSIST_CODFIL_REF
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 26, 2024



WITH landing_data as (
    SELECT
        COD_COD
        ,COD_TYP
        ,COD_USD
        ,COD_DES
        ,COD_GR
        ,COD_SIG
        ,Cod_Risk
        ,TRY_CAST(TRY_CAST(add_months(LOADED_AT, -1) AS STRING) AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.assist_codfil_ref
),
-- The SQL order of execution will run the where command first, so we are
-- using the landing`s loaded_at on its run, this will capture new rows for us,
-- on otherhand the select clause is using a new loaded_at that will replace this
-- value with the loaded_at of this layer (bronze). Even if they have same names,
--they are different concepts.

bronze_data AS (
    SELECT
        COD_COD
        ,COD_TYP
        ,COD_USD
        ,COD_DES
        ,COD_GR
        ,COD_SIG
        ,Cod_Risk
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data


)





SELECT * FROM bronze_data;

-- From bronze-assist.dbx.sql
-- Source model: bronze_assist_customer_addl_fields
CREATE OR REPLACE TABLE bronze.default.bronze_assist_customer_addl_fields AS
-- NAME: BRONZE_ASSIST_CUSTOMER_ADDL_FIELDS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data as (
    SELECT
        cifno
	    ,fullName
	    ,firstName
	    ,middleName
	    ,lastName
	    ,class
	    ,officer_code
	    ,cifGroupID
	    ,cifGroupDesc
	    ,residenceCountryCode
	    ,residenceCountryDesc
	    ,customerSince
	    ,date_imported
		,TRY_CAST(TRY_CAST(add_months(LOADED_AT, -1) AS STRING) AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.assist_customer_addl_fields
),
-- The SQL order of execution will run the where command first, so we are
-- using the landing`s loaded_at on its run, this will capture new rows for us,
-- on otherhand the select clause is using a new loaded_at that will replace this
-- value with the loaded_at of this layer (bronze). Even if they have same names,
--they are different concepts.

bronze_data AS (
    SELECT
        cifno
	    ,fullName
	    ,firstName
	    ,middleName
	    ,lastName
	    ,class
	    ,officer_code
	    ,cifGroupID
	    ,cifGroupDesc
	    ,residenceCountryCode
	    ,residenceCountryDesc
	    ,customerSince
	    ,date_imported
		,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data


)





SELECT * FROM bronze_data;

-- From bronze-assist.dbx.sql
-- Source model: bronze_assist_customer_class
CREATE OR REPLACE TABLE bronze.default.bronze_assist_customer_class AS
-- NAME: BRONZE_ASSIST_CUSTOMER_CLASS
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data as (
    SELECT
        class_code
        ,class_description
        ,TRY_CAST(TRY_CAST(add_months(LOADED_AT, -1) AS STRING) AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.assist_customer_class
),
-- The SQL order of execution will run the where command first, so we are
-- using the landing`s loaded_at on its run, this will capture new rows for us,
-- on otherhand the select clause is using a new loaded_at that will replace this
-- value with the loaded_at of this layer (bronze). Even if they have same names,
--they are different concepts.

bronze_data AS (
    SELECT
        class_code
        ,class_description
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data


)





SELECT * FROM bronze_data;

-- From bronze-assist.dbx.sql
-- Source model: bronze_assist_customer_tbl
CREATE OR REPLACE TABLE bronze.default.bronze_assist_customer_tbl AS
-- NAME: BRONZE_ASSIST_CUSTOMER_TBL
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data as (
    SELECT
        ASCIFN
        ,ASCUSTYP
        ,ASFNAM
        ,ASLNAM
        ,ASCODE
        ,ASIDTYP
        ,ASDTBIR
        ,ASSTRDAT
        ,ASOCCUP
        ,ASCNTNAT
        ,ASCNTDOM
        ,ASCFNA2
        ,ASCFNA3
        ,ASCITDOM
        ,ASSTADOM
        ,ASZIPDOM
        ,ASPHONE1
        ,ASPHONE2
        ,ASEMAIL
        ,ASPOLEXP
        ,ASRISK
        ,ASSRCWEA
        ,ASTARGTP
        ,ASENDDAT
        ,ASECOGRP
        ,IMPYM
        ,LMODDT
        ,IMPDT
        ,TRY_CAST(TRY_CAST(add_months(LOADED_AT, -1) AS STRING) AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.assist_customer_tbl
),
-- The SQL order of execution will run the where command first, so we are
-- using the landing`s loaded_at on its run, this will capture new rows for us,
-- on otherhand the select clause is using a new loaded_at that will replace this
-- value with the loaded_at of this layer (bronze). Even if they have same names,
--they are different concepts.

bronze_data AS (
    SELECT
        ASCIFN
        ,ASCUSTYP
        ,ASFNAM
        ,ASLNAM
        ,ASCODE
        ,ASIDTYP
        ,ASDTBIR
        ,ASSTRDAT
        ,ASOCCUP
        ,ASCNTNAT
        ,ASCNTDOM
        ,ASCFNA2
        ,ASCFNA3
        ,ASCITDOM
        ,ASSTADOM
        ,ASZIPDOM
        ,ASPHONE1
        ,ASPHONE2
        ,ASEMAIL
        ,ASPOLEXP
        ,ASRISK
        ,ASSRCWEA
        ,ASTARGTP
        ,ASENDDAT
        ,ASECOGRP
        ,IMPYM
        ,LMODDT
        ,IMPDT
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data


)





SELECT * FROM bronze_data;

-- From bronze-assist.dbx.sql
-- Source model: bronze_assist_master_account_tbl
CREATE OR REPLACE TABLE bronze.default.bronze_assist_master_account_tbl AS
-- NAME: BRONZE_ASSIST_MASTER_ACCOUNT_TBL
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data as (
    SELECT
        ASACCT
        ,ASOFDT
        ,ASCIFN
        ,ASBRNC
        ,ASCURC
        ,ASOFFI
        ,ASCTYR
        ,ASCLAS
        ,ASDAOP
        ,ASDACL
        ,ASCODE
        ,ASTYPE
        ,ASBUST
        ,ASTARGTP
        ,ASCMCI
        ,ASCMCO
        ,ASBALA
        ,ASFNAME
        ,ASLNAME
        ,ASCTYP
        ,ASSTAT
        ,ASABLK
        ,ASCTYL
        ,IMPYM
        ,IMPDT
        ,TRY_CAST(TRY_CAST(add_months(LOADED_AT, -1) AS STRING) AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.assist_master_account_tbl
),
-- The SQL order of execution will run the where command first, so we are
-- using the landing`s loaded_at on its run, this will capture new rows for us,
-- on otherhand the select clause is using a new loaded_at that will replace this
-- value with the loaded_at of this layer (bronze). Even if they have same names,
--they are different concepts.

bronze_data AS (
    SELECT
        ASACCT
        ,ASOFDT
        ,ASCIFN
        ,ASBRNC
        ,ASCURC
        ,ASOFFI
        ,ASCTYR
        ,ASCLAS
        ,ASDAOP
        ,ASDACL
        ,ASCODE
        ,ASTYPE
        ,ASBUST
        ,ASTARGTP
        ,ASCMCI
        ,ASCMCO
        ,ASBALA
        ,ASFNAME
        ,ASLNAME
        ,ASCTYP
        ,ASSTAT
        ,ASABLK
        ,ASCTYL
        ,IMPYM
        ,IMPDT
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data


)





SELECT * FROM bronze_data;

-- From bronze-assist.dbx.sql
-- Source model: bronze_assist_officers_costcenter
CREATE OR REPLACE TABLE bronze.default.bronze_assist_officers_costcenter AS
-- NAME: BRONZE_ASSIST_OFFICERS_COSTCENTER
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data as (
    SELECT
        officer_code
        ,first_name
        ,last_name
        ,cost_center
        ,TRY_CAST(TRY_CAST(add_months(LOADED_AT, -1) AS STRING) AS INT) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.assist_officers_costcenter
),
-- The SQL order of execution will run the where command first, so we are
-- using the landing`s loaded_at on its run, this will capture new rows for us,
-- on otherhand the select clause is using a new loaded_at that will replace this
-- value with the loaded_at of this layer (bronze). Even if they have same names,
--they are different concepts.

bronze_data AS (
    SELECT
        officer_code
        ,first_name
        ,last_name
        ,cost_center
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data


)





SELECT * FROM bronze_data;

-- From bronze-assist.dbx.sql
-- Source model: bronze_assist_transactions_tbl
CREATE OR REPLACE TABLE bronze.default.bronze_assist_transactions_tbl AS
-- NAME: BRONZE_ASSIST_TRANSACTIONS_TBL
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY - 4TH BUSINESS DAY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data as (
    SELECT
        TRID
        ,ASTRCD
        ,ASAMTB
        ,ASTRDA
        ,ASACCT
        ,ASDESC
        ,ASAMTO
        ,ASCURC
        ,ASAPCO
        ,ASTIME
        ,ASORGI
        ,ASTOBK
        ,ASTIBK
        ,ASTBBK
        ,ASBENE
        ,ASTRCO
        ,ASORDE
        ,ASTRDE
        ,ASTVDA
        ,ASTBNK
        ,ASIBAN
        ,ASCNTR
        ,IMPYM
        ,IMPDT
        ,TRY_CAST(date_format(TRY_CAST(ASTRDA AS DATE),'yyyyMM') as INTEGER) AS YEARMONTH
        ,LOADED_AT
    FROM
        landing.default.assist_transaction_tbl
),
-- The SQL order of execution will run the where command first, so we are
-- using the landing`s loaded_at on its run, this will capture new rows for us,
-- on otherhand the select clause is using a new loaded_at that will replace this
-- value with the loaded_at of this layer (bronze). Even if they have same names,
--they are different concepts.

bronze_data AS (
    SELECT
        TRID
        ,ASTRCD
        ,ASAMTB
        ,ASTRDA
        ,ASACCT
        ,ASDESC
        ,ASAMTO
        ,ASCURC
        ,ASAPCO
        ,ASTIME
        ,ASORGI
        ,ASTOBK
        ,ASTIBK
        ,ASTBBK
        ,ASBENE
        ,ASTRCO
        ,ASORDE
        ,ASTRDE
        ,ASTVDA
        ,ASTBNK
        ,ASIBAN
        ,ASCNTR
        ,IMPYM
        ,IMPDT
        ,YEARMONTH
        ,current_timestamp() AS LOADED_AT
    FROM landing_data


)





SELECT * FROM bronze_data;
