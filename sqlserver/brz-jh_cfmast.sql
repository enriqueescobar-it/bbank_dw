-- NAME: BRONZE_JH_CFMAST
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: DAILY
-- LOAD TYPE: INCREMENTAL
-- TYPE: REPLICATION
-- DATE: June 28, 2024



WITH landing_data AS (
    SELECT
	    CFRECI
        ,CFRETN
        ,CFBNKN
        ,CFBRNN
        ,CFCIF__CS
        ,dbo.ReplaceSpecialChars(CFSNME,'') CFSNME
        ,CFSEQ__CS
        ,CFSNPH
        ,CFSNP2
        ,CFINQC
        ,CFOFFR
        ,CFEMPL
        ,CFINSC
        ,CFVIPC
        ,CFDEAD
        ,CFBADA
        ,CFHLDM
        ,CFPROA
        ,CFFORN
        ,CFSIC1
        ,CFSIC2
        ,CFSIC3
        ,CFSIC4
        ,CFSIC5
        ,CFSIC6
        ,CFSIC7
        ,CFSIC8
        ,CFNA1
        ,CFNA2
        ,CFNA3
        ,CFNA4
        ,CFCITY
        ,CFSTAT
        ,CFCRAS
        ,CFCNTY
        ,CFZIP
        ,CFZIPD
        ,dbo.ReplaceSpecialChars(CFNAME,'') CFNAME
        ,CFFNA
        ,CFFNAL
        ,CFMNA
        ,CFMNAL
        ,CFMNIN
        ,CFLNA
        ,CFLNAL
        ,CFSFX
        ,CFSFXL
        ,CFNAMC
        ,CFEXTTL
        ,CFORGD
        ,CFORG6
        ,CFDLM
        ,CFDLM6
        ,CFHPHO
        ,CFBPHO
        ,CFFSDT
        ,CFFSD6
        ,CFSSNO
        ,CFSSCD
        ,CFSSFX
        ,CFBIRD
        ,CFBIR6
        ,CFSEX
        ,CFCLAS
        ,CFINDI
        ,CFINCL
        ,CFSMSA
        ,CFCRAL
        ,CFCENS
        ,CFBUST
        ,CFNAICS
        ,CFSCLA
        ,CFGRUP
        ,CFCCYC
        ,CFTINS
        ,CFTND6
        ,CFTNDT
        ,CFWHCD
        ,CFWHPR
        ,CFWHDT
        ,CFWHD6
        ,CFBNOT
        ,CFBND6
        ,CFBNDT
        ,CFAFLG
        ,CFADT6
        ,CFADAT
        ,CFDDE6
        ,CFDDEA
        ,CFUIC1
        ,CFUIC2
        ,CFUIC3
        ,CFUIC4
        ,CFUIC5
        ,CFUIC6
        ,CFUIC7
        ,CFUIC8
        ,CFPIC1
        ,CFPIC2
        ,CFPDT1
        ,CFPD61
        ,CFPDT2
        ,CFPD62
        ,CFPAM1
        ,CFPAM2
        ,CFGRP__CS
        ,CFCFSD
        ,CFCFS6
        ,CFLTDT
        ,CFLTD6
        ,CFWRTH
        ,CFWVCD
        ,CFWVDT
        ,CFWVD6
        ,CFTXRT
        ,CFTXR6
        ,CFTXET
        ,CFTXE6
        ,CFIRSA
        ,CFIRSC
        ,CFIRSS
        ,CFIRSZ
        ,CFIRSD
        ,CFIRSF
        ,CFCASS
        ,CFLEAS
        ,CFFAX1
        ,CFFAX2
        ,CFCEL1
        ,CFCEL2
        ,CFEML1
        ,CFEML2
        ,CFREGP
        ,CFRPD6
        ,CFRPD7
        ,CFNOCALL
        ,CFNCLEX6
        ,CFNCLEX7
        ,CFRSKRT
        ,CFRSKD6
        ,CFRSKD7
        ,CFRSKBY
        ,CFOCPCD
        ,CFAFLOPT
        ,CFAFLEXD6
        ,CFAFLEXD7
        ,CFAFLECD6
        ,CFAFLECD7
        ,CFAFLEXCD
        ,SALESCF
        ,CFBPHX
        ,CFLANG
        ,CFFORC
        ,CFIRSFC
        ,CFAEDT6
        ,CFAEDAT
        ,W8STAT
        ,W8TYPE
        ,W8LLDT6
        ,W8LLDAT
        ,W8STS
        ,CFDTO6
        ,CFDTO7
        ,CFPFA1
        ,CFPFA2
        ,CFPFCY
        ,CFPFST
        ,CFPFZC
        ,CFPFDP
        ,CFDLAC6
        ,CFDLAC7
        ,CFPFFD
        ,CFPFFC
        ,CFPFFR
        ,CFTINMATCH
        ,CASE WHEN (CFSSNO = 0 OR CFSSNO IS NULL) AND CFINDI = 'Y' THEN
            CASE WHEN  CFSSCD IN ('X','C','B','G','U','D','V','F') THEN 0
                WHEN  CFSSCD IN ('T','I') THEN 1
                WHEN  CFSSCD IN ('N','A','M') AND CFSSNO = 0 THEN 0
                WHEN  CFSSCD IN ('N','A','M') AND CFSSNO <> 0 THEN 1
            END
            ELSE 0
        END CFSSNO_FLAG
        ,CONVERT(DATE,dbo.ConvertJhDateToDatetimeWithCentury(CFORG6,YEAR(GetDate())-2000))  AS OriginalCustomerDate
        ,CONVERT(DATE,dbo.ConvertDateofBirthJhDateToDatetimeWithCentury(CFBIR6,CFBIRD))     AS DateOfBirth
        ,CONVERT(DATE,dbo.ConvertJhDateToDatetimeWithCentury(CFADT6,YEAR(GetDate())-2000))  AS LastAlienCertificationDate
        ,CONVERT(DATE,dbo.ConvertJhDateToDatetimeWithCentury(CFAEDT6,YEAR(GetDate())-2000)) AS AlienCertificationExpirationDate
        ,(SELECT CONVERT(DATE,dqp_landing.dbo.ConvertJhDateJulianToDatetime(POSTD7))
            FROM dqp_landing.dbo.jh_ddpar1) AS AsOfDate
        ,NULL AS YEARMONTH
        ,LOADED_AT
    FROM
        "DQP_LANDING"."dbo"."JH_CFMAST"
),

bronze_data AS (
    SELECT
        CFRECI
        ,CFRETN
        ,CFBNKN
        ,CFBRNN
        ,CFCIF__CS
        ,CFSNME
        ,CFSEQ__CS
        ,CFSNPH
        ,CFSNP2
        ,CFINQC
        ,CFOFFR
        ,CFEMPL
        ,CFINSC
        ,CFVIPC
        ,CFDEAD
        ,CFBADA
        ,CFHLDM
        ,CFPROA
        ,CFFORN
        ,CFSIC1
        ,CFSIC2
        ,CFSIC3
        ,CFSIC4
        ,CFSIC5
        ,CFSIC6
        ,CFSIC7
        ,CFSIC8
        ,CFNA1
        ,CFNA2
        ,CFNA3
        ,CFNA4
        ,CFCITY
        ,CFSTAT
        ,CFCRAS
        ,CFCNTY
        ,CFZIP
        ,CFZIPD
        ,CFNAME
        ,CFFNA
        ,CFFNAL
        ,CFMNA
        ,CFMNAL
        ,CFMNIN
        ,CFLNA
        ,CFLNAL
        ,CFSFX
        ,CFSFXL
        ,CFNAMC
        ,CFEXTTL
        ,CFORGD
        ,CFORG6
        ,CFDLM
        ,CFDLM6
        ,CFHPHO
        ,CFBPHO
        ,CFFSDT
        ,CFFSD6
        ,CFSSNO
        ,CFSSCD
        ,CFSSFX
        ,CFBIRD
        ,CFBIR6
        ,CFSEX
        ,CFCLAS
        ,CFINDI
        ,CFINCL
        ,CFSMSA
        ,CFCRAL
        ,CFCENS
        ,CFBUST
        ,CFNAICS
        ,CFSCLA
        ,CFGRUP
        ,CFCCYC
        ,CFTINS
        ,CFTND6
        ,CFTNDT
        ,CFWHCD
        ,CFWHPR
        ,CFWHDT
        ,CFWHD6
        ,CFBNOT
        ,CFBND6
        ,CFBNDT
        ,CFAFLG
        ,CFADT6
        ,CFADAT
        ,CFDDE6
        ,CFDDEA
        ,CFUIC1
        ,CFUIC2
        ,CFUIC3
        ,CFUIC4
        ,CFUIC5
        ,CFUIC6
        ,CFUIC7
        ,CFUIC8
        ,CFPIC1
        ,CFPIC2
        ,CFPDT1
        ,CFPD61
        ,CFPDT2
        ,CFPD62
        ,CFPAM1
        ,CFPAM2
        ,CFGRP__CS
        ,CFCFSD
        ,CFCFS6
        ,CFLTDT
        ,CFLTD6
        ,CFWRTH
        ,CFWVCD
        ,CFWVDT
        ,CFWVD6
        ,CFTXRT
        ,CFTXR6
        ,CFTXET
        ,CFTXE6
        ,CFIRSA
        ,CFIRSC
        ,CFIRSS
        ,CFIRSZ
        ,CFIRSD
        ,CFIRSF
        ,CFCASS
        ,CFLEAS
        ,CFFAX1
        ,CFFAX2
        ,CFCEL1
        ,CFCEL2
        ,CFEML1
        ,CFEML2
        ,CFREGP
        ,CFRPD6
        ,CFRPD7
        ,CFNOCALL
        ,CFNCLEX6
        ,CFNCLEX7
        ,CFRSKRT
        ,CFRSKD6
        ,CFRSKD7
        ,CFRSKBY
        ,CFOCPCD
        ,CFAFLOPT
        ,CFAFLEXD6
        ,CFAFLEXD7
        ,CFAFLECD6
        ,CFAFLECD7
        ,CFAFLEXCD
        ,SALESCF
        ,CFBPHX
        ,CFLANG
        ,CFFORC
        ,CFIRSFC
        ,CFAEDT6
        ,CFAEDAT
        ,W8STAT
        ,W8TYPE
        ,W8LLDT6
        ,W8LLDAT
        ,W8STS
        ,CFDTO6
        ,CFDTO7
        ,CFPFA1
        ,CFPFA2
        ,CFPFCY
        ,CFPFST
        ,CFPFZC
        ,CFPFDP
        ,CFDLAC6
        ,CFDLAC7
        ,CFPFFD
        ,CFPFFC
        ,CFPFFR
        ,CFTINMATCH
        ,CFSSNO_FLAG
        ,OriginalCustomerDate
        ,DateOfBirth
        ,LastAlienCertificationDate
        ,AlienCertificationExpirationDate
        ,AsOfDate
        ,CONVERT(INT, CONVERT(nvarchar(6),AsOfDate, 112)) AS YEARMONTH
        ,GETUTCDATE() AS LOADED_AT
    FROM landing_data
    
        WHERE LOADED_AT > COALESCE((SELECT MAX(LOADED_AT) FROM "DQP_BRONZE"."dbo"."bronze_jh_cfmast"),'1970-01-01 00:00:00.000')
    
)





SELECT * FROM bronze_data