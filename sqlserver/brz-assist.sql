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
        ,CONVERT(INT, CONVERT(nvarchar(6), DATEADD("m", -1, LOADED_AT), 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."ASSIST_CODFIL_REF"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data

        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_assist_codFil_ref"),'1970-01-01 00:00:00.000')

)





SELECT * FROM bronze_data


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
        ,CONVERT(INT, CONVERT(nvarchar(6), DATEADD("m", -1, LOADED_AT), 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."ASSIST_CUSTOMER_ADDL_FIELDS"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data

        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_assist_customer_addl_fields"),'1970-01-01 00:00:00.000')

)





SELECT * FROM bronze_data


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
        ,CONVERT(INT, CONVERT(nvarchar(6), DATEADD("m", -1, LOADED_AT), 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."ASSIST_CUSTOMER_CLASS"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data

        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_assist_customer_class"),'1970-01-01 00:00:00.000')

)





SELECT * FROM bronze_data


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
        ,CONVERT(INT, CONVERT(nvarchar(6), DATEADD("m", -1, LOADED_AT), 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."ASSIST_CUSTOMER_TBL"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data

        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_assist_customer_tbl"),'1970-01-01 00:00:00.000')

)





SELECT * FROM bronze_data


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
        ,CONVERT(INT, CONVERT(nvarchar(6), DATEADD("m", -1, LOADED_AT), 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."ASSIST_MASTER_ACCOUNT_TBL"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data

        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_assist_master_account_tbl"),'1970-01-01 00:00:00.000')

)





SELECT * FROM bronze_data


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
        ,CONVERT(INT, CONVERT(nvarchar(6), DATEADD("m", -1, LOADED_AT), 112)) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."ASSIST_OFFICERS_COSTCENTER"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data

        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_assist_officers_costcenter"),'1970-01-01 00:00:00.000')

)





SELECT * FROM bronze_data


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
        ,CAST(FORMAT(CONVERT(DATE, ASTRDA),'yyyyMM') as INTEGER) AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."ASSIST_TRANSACTION_TBL"
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
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data

        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_assist_transactions_tbl"),'1970-01-01 00:00:00.000')

)





SELECT * FROM bronze_data
