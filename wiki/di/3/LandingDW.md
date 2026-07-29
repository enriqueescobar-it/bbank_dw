# LandingDW

## Landing

The landing SQL code 

All pages have the SQL landing definitions

[2. Data Sources](https://bradescobank1.atlassian.net/wiki/spaces/DQP/pages/4358158/2.+Data+Sources#Children)

## Source Inconsistencies

### Source Columns

They all should be lower case (snake case like in Python)

`DATE_OF_DATA` is date enough or date time?

`YEARMONTH`(many sources) it should be `year_date`

`LOADED_AT`may cause confusion with other layers `staging_dt` or `staging_ts`

### Landing Operational Control Tables

Should we have tables for Audit, Control, and metadata?

```bash
landing_delivery_log
landing_replay_log
landing_file_registry
landing_schema_registry
landing_load_audit
landing_quarantine
landing_pipeline_run
```

### Landing Alignment Completion

| Assessment Area | Coverage |
| --- | --- |
| Metadata Columns Inside Tables | 75% |
| Delivery Registration Controls | 10% |
| Replay Controls | 0% |
| Quarantine Controls | 0% |
| Schema Drift Controls | 0% |
| Operational Metadata Model | 0% |

### Readiness 80/20

| Area | **Required** | **Description** | **Evidence** | Confidence |
| --- | --- | --- | --- | --- |
| Landing Architecture |  |  | Separate source domains (DMI, JH, SEI, APEX, AXIOM, IBKR) with source-preserving table structures. | High |
| Source Fidelity |  |  | Source-specific attributes retained across tables rather than conformed or standardized. | High |
| Naming Standards |  |  | `apex_*`, `axiom_*`, `bcp_ibkr_*`, `jh_*`, `sei_*`, `dmi_*`. | High |
| Metadata Standardization |  |  | Frequent use of `DATE_OF_DATA`, `YEARMONTH`, and `LOADED_AT`. | Medium |
| Governance Readiness |  |  | Extensive `COMMENT ON TABLE` statements observed. | Medium |
| Operational Controls | Airflow DAG, audit tables, run-log tables | No evidence of operational framework | No audit, delivery, run-log, checkpoint, or orchestration metadata tables reviewed. | Low |
| Replay Capability | Delivery registry, file registry, replay procedures | No evidence of failed loads impact consistency | No file registry, delivery registry, replay log, or checkpoint structure identified. | Low |
| Idempotency | Batch IDs, delivery IDs, load-tracking mechanism | Cannot determine if repeated loads cause duplication | No batch identifiers, delivery identifiers, or load-tracking controls observed. | Low |
| Quarantine Controls | Error tables, rejected-file process | No evidence of data handling. | No quarantine tables, error zones, or exception repositories reviewed. | Low |
| CDC Readiness | Watermarks, source timestamps, CDC architecture | Some metadata exists that could support future CDC implementation. | APEX includes ingestion and metadata attributes such as `source_file`, `_ingested_at`, `snapshot_timestamp`, and Kafka metadata fields. | Medium |

## Source Inventory

Tier 1: Jack Henry (69 tables) & SEI (42 tables), the largest footprint, likely dominant consumers, therefore most opportunity for metadata inconsistencies

Tier 2: DMI, Pershing, and Axiom have more than 8 table, medium-sized domains, likely reuse common ingestion patterns

Tier 3: The rest

### Count

| **Tier** | **Source** | **Landing Table Count** |
| --- | --- | --- |
| 3 | Apex | 6 |
| 3 | Assist | 7 |
| 3 | Auxiliary | 2 |
| 2 | Axiom | 8 |
| 3 | COS | 3 |
| 2 | DMI | 13 |
| 3 | FIS | 3 |
| 3 | IBKR | 3 |
| 3 | Invoice | 1 |
| 1 | Jack Henry | 69 |
| 3 | Manual | 12 |
| 3 | MIS | 2 |
| 3 | MuleSoft | 3 |
| 2 | Pershing | 8 |
| 3 | Promontory | 1 |
| 3 | Q2 | 3 |
| 3 | RPRT | 1 |
| 3 | SBLC | 2 |
| 1 | SEI | 42 |

### Detail

| **Source** | **Landing Table List** |
| --- | --- |
| Apex | apex\_daily\_accounts apex\_daily\_activities apex\_daily\_overnight\_balances apex\_daily\_positions apex\_daily\_stock\_record apex\_onboarding\_status |
| Assist | assist\_codfil\_ref assist\_customer\_addl\_fields assist\_customer\_class assist\_customer\_tbl assist\_master\_account\_tbl assist\_officers\_costcenter |
| Auxiliary | auxiliary\_br\_dcode auxiliary\_jha\_sei\_trans\_code |
| Axiom | axiom\_acct axiom\_cds axiom\_deposits axiom\_dmi\_chargeoffs axiom\_dmiloans axiom\_instmodelstg axiom\_loans axiom\_ovrntdep |
| COS | cos\_applicant cos\_prospect cos\_td\_treasury\_rate |
| DMI | dmi\_bacmast dmi\_disb dmi\_e006 dmi\_gl\_mapping dmi\_noncash dmi\_p110 dmi\_p132 dmi\_pmt dmi\_s2tt dmi\_s2tv dmi\_s5az dmi\_t69w dmi\_transaction\_codes\_mapping |
| FIS | fis\_cd300 fis\_ethos\_interchange\_fee\_data fis\_lp\_510 |
| IBKR | bcp\_ibkr\_account bcp\_ibkr\_acct\_holder bcp\_ibkr\_balance\_history |
| Invoice | file\_invoice\_requests |
| Jack Henry | jh\_acsret jh\_axidmiav jh\_bfgp0087 jh\_bfwt0085 jh\_bfwtmast jh\_br00009 jh\_br00014 jh\_cd2160petl jh\_cdhist jh\_cdmant jh\_cdmast jh\_cdmasteom jh\_cdpar2 jh\_cdpar3 jh\_cdpost jh\_cfacct jh\_cfaltn jh\_cfcrgp jh\_cffben jh\_cfmast jh\_cfmesg jh\_cfmlid jh\_cfofgn jh\_cfpar1 jh\_cfpar3 jh\_cfpard jh\_cfparg jh\_cfusrflds jh\_ddaams jh\_ddaat1 jh\_ddalis\_t jh\_ddetfh jh\_ddhist jh\_ddmant jh\_ddmast jh\_ddmasteom jh\_ddpar1 jh\_ddpar2 jh\_ddpar3 jh\_ddpar4 jh\_ddpost jh\_dmilay jh\_glhist jh\_glhist\_datbga jh\_glhist\_datsec jh\_glint1 jh\_glmast jh\_glpar9 jh\_jhclas jh\_jhctry jh\_jhmast jh\_jhoffr jh\_lcmast jh\_lnepos jh\_lnfpst jh\_lnhist jh\_lnmant jh\_lnmast jh\_lnmasteom jh\_lnpar2 jh\_lnpar3 jh\_lnpar9 jh\_lnpdue jh\_lnpost1 jh\_lnpost2 jh\_lnspos jh\_nvmast jh\_stdesc jh\_transaction |
| Manual | file\_apex\_monthly\_accounts file\_apex\_monthly\_credit file\_apex\_monthly\_execution file\_apex\_monthly\_fdic file\_apex\_monthly\_trades file\_bflcrtran file\_biu\_activity file\_fedlink\_inc file\_fedlink\_out file\_rdci file\_trailer\_fees file\_trailer\_fees\_accruals |
| MIS | file\_mis\_pershing\_officer\_code file\_mis\_team\_officers\_v2 |
| MuleSoft | mulesoft\_customer\_external\_id mulesoft\_party mulesoft\_prospect\_external\_data |
| Pershing | pershingdataprod\_caps\_hist pershingdataprod\_master\_asset pershingdataprod\_pershing pershingdataprod\_transfer pers\_accf pers\_pershing pershing\_aca2\_a pershing\_aca2\_d |
| Promontory | intrafi\_r4230 |
| Q2 | q2\_customer q2\_user q2\_user\_pii |
| RPRT | rprt\_sharing\_agreement\_exception |
| SBLC | sblc\_lcmaster sblc\_lctranx |
| SEI | sei\_ovn\_accountoptionalfields sei\_ovn\_accounts sei\_ovn\_activeblocks sei\_ovn\_assetinvclas sei\_ovn\_assetoptfields sei\_ovn\_assets sei\_ovn\_clientaccountlink sei\_ovn\_clients sei\_ovn\_contactdetails sei\_ovn\_custodynostropositions sei\_ovn\_eodchangedpositions sei\_ovn\_eodposvalaggr sei\_ovn\_eodpositions sei\_ovn\_eodpositionssupplemental sei\_ovn\_feecomputation sei\_ovn\_feegroup sei\_ovn\_feepackagerule sei\_ovn\_feepackageusage sei\_ovn\_fundcutoff sei\_ovn\_fxforward sei\_ovn\_interestratetypes sei\_ovn\_modelalloc sei\_ovn\_modelsintext sei\_ovn\_paidto sei\_ovn\_partyoptionalfields sei\_ovn\_portfoliogroups sei\_ovn\_portfolioperformance sei\_ovn\_reccashactivities sei\_ovn\_reference sei\_relationship\_mapping\_sei\_jha sei\_ovn\_relationships sei\_ovn\_roledetail sei\_ovn\_statementevents sei\_ovn\_statementinstance sei\_ovn\_statementpackage sei\_ovn\_transactiondetail sei\_ovn\_transactiondetailupd sei\_ovn\_transactionheader sei\_ovn\_transactionheaderupd sei\_ovn\_upcomingactivities sei\_ovn\_userdetail sei\_ovn\_userteamroledetail |

## UAC

### PROD

| DatabaseUser | UserType | LoginName | LoginType | DatabaseRole |
| --- | --- | --- | --- | --- |
| BFB\\dtatis | WINDOWS\_USER | BFB\\dtatis | WINDOWS\_LOGIN | db\_datareader |
| BFB\\eluis | WINDOWS\_USER | BFB\\eluis | WINDOWS\_LOGIN | db\_datareader |
| BFB\\eluis | WINDOWS\_USER | BFB\\eluis | WINDOWS\_LOGIN | db\_datawriter |
| BFB\\eluis | WINDOWS\_USER | BFB\\eluis | WINDOWS\_LOGIN | db\_ddladmin |
| BFB\\eluis | WINDOWS\_USER | BFB\\eluis | WINDOWS\_LOGIN | db\_owner |
| BFB\\jmarti | WINDOWS\_USER | BFB\\jmarti | WINDOWS\_LOGIN | db\_datareader |
| BFB\\MSSQL\_Consolidation | WINDOWS\_GROUP | BFB\\MSSQL\_Consolidation | WINDOWS\_GROUP | NULL |
| BFB\\ymalagon | WINDOWS\_USER | BFB\\ymalagon | WINDOWS\_LOGIN | db\_datareader |
| dataquality\_process | SQL\_USER | NULL | NULL | db\_datareader |
| dataquality\_process | SQL\_USER | NULL | NULL | db\_datawriter |
| dataquality\_process | SQL\_USER | NULL | NULL | db\_ddladmin |
| dataquality\_process | SQL\_USER | NULL | NULL | db\_owner |
| dataquality\_readonly | SQL\_USER | dataquality\_readonly | SQL\_LOGIN | db\_datareader |
| dquat\_readonly | SQL\_USER | NULL | NULL | db\_datareader |

## Files
