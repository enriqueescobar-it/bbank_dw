# SqlServerConsolidationEpic

#   

# SqlServerConsolidationEpic 

# Epic: Sql Server Consolidation

## 1. Epic Summary

**Epic ID:** \\\<Jira Epic Key / Reference\\\> 

**Owner:** Product Owner 

**Technical Lead:** @Enrique Escobar  

**Status:** Draft / In Review / Approved / In Progress / Blocked / Complete 

**Target Release:** Q3 

**Created Date:**  

**Last Updated:** 05-08-2026 (data refresh — see Section 23 Change Log)

### 1.1 Executive Summary

This epic establishes a governed current-state assessment for Bradesco Miami SQL Server databases so the team can make defensible consolidation, migration, retention, redesign, or retirement recommendations.

The current evidence shows 58 inventoried servers, of which 30 are now confirmed in scope for Microsoft SQL Server (revised down from a prior working figure of 48 following engine-level re-validation; 28 servers have been reclassified out of scope as MySQL, MongoDB, or MariaDB engines), 279 database records (up from 178 previously documented), approximately 4,032.5 GB of database footprint, and 178 databases still in pending analysis. No database is currently classified as migration-ready. Application/Functional Owner identification has advanced materially and is now effectively complete (278 of 279 databases, 99.6%), but Dependency Owner and Sources Owner fields remain largely unpopulated at the raw-data level, and a data-quality discrepancy between the assessment workbook's dashboard-reported owner KPIs and the underlying raw field values has been identified and requires reconciliation (see Section 5.2). The immediate blocker is not only connectivity: read-only SQL access can identify database metadata, but application owners, business owners, developers, and vendors are still required to validate purpose, integrations, reporting dependencies, criticality, operational status, and migration suitability.

This epic covers the discovery and readiness phase. It does not authorize production change, shutdown, decommissioning, or migration execution.

### 1.2 Source Evidence Used

- `BradescoSQLAssessmentv2shared 1.xlsx`
- `BradescoDatabasesCaddielCamposTechnicalOwnersv1.xlsx`
- `BradescoDatabasesRenanSilvaTechnicalOwnersv1.xlsx`
- `DetailedMeetingSummaryDBConsolidationInfra20260724_EN.docx`
- Bradesco\_SQL\_Assessment\_v10.xlsx
- Bradesco\_Tasks\_MSSQL\_Discovery\_v2.xlsx

## 2. Business Context

### 2.1 Business Problem

Bradesco Miami has a broad SQL Server estate with incomplete visibility into database ownership, usage, dependencies, criticality, and migration disposition. Infrastructure inventory identifies hosts, technologies, IPs, and some server-level attributes, but that does not explain why each database exists or what business, ETL, reporting, vendor, or operational workflows depend on it.

If this work is not completed, the organization risks:

- Making consolidation or cloud migration decisions from incomplete technical metadata.
- Migrating, retaining, or retiring databases without validated business ownership.
- Underestimating application, ETL, reporting, and vendor dependencies.
- Spending assessment effort on duplicate, inactive, non-SQL Server, or obsolete records.
- Leaving end-of-support SQL Server instances and access gaps unmanaged.

### 2.2 Business Goals

| Goal | Description | Success Indicator |
| --- | --- | --- |
| Establish a reliable SQL Server inventory | Validate which servers and databases are actually in scope for SQL Server assessment. | In-scope, out-of-scope, duplicate, inactive, and vendor-managed records are classified with evidence. |
| Complete ownership discovery | Map each in-scope server/database to technical, functional, application, business, or vendor contacts. | Each in-scope database has a named accountable contact or documented escalation path. |
| Enable defensible disposition recommendations | Collect enough context to recommend migration, consolidation, retention, redesign, retirement, or decommissioning. | Databases move from `Pending analysis` to an approved migration/disposition status. |
| Reduce assessment blockers | Resolve access and ownership gaps that prevent repeatable discovery across the estate. | Read-only access or authoritative database exports are available for remaining in-scope hosts |

## 3. Scope

### 3.1 In Scope

- SQL Server inventory and readiness assessment for Bradesco Miami.
- Server-level validation for Microsoft SQL Server hosts, including version, environment, criticality, support status, HA/DR indicator, access status, and review status.
- Database-level discovery for purpose, application ownership, technical ownership, source systems, ETL dependencies, reporting usage, consumers, operational status, and migration disposition.
- Read-only technical metadata collection or equivalent exported database lists for in-scope hosts.
- Ownership mapping using Infrastructure, DevOps/team leads, developers, business contacts, and vendor contacts.
- Classification of duplicate, inactive, non-SQL Server, SQL Compact, LocalDB, and "no business databases found" records.
- Prioritization of discovery interviews by database count, criticality, ownership clarity, and access availability.

### 3.2 Out of Scope

- Production migration execution.
- Production write access, configuration changes, shutdowns, or decommissioning actions.
- Final target-platform implementation until current-state discovery and disposition recommendations are approved.
- Non-SQL Server technologies such as MySQL or MongoDB, once validated as outside the SQL Server assessment scope.
- Application refactoring or vendor contract changes, except where required as dependencies for future planning.

## 4. Users and Stakeholders

| Role | Name / Team | Responsibility |
| --- | --- | --- |
| Business Owner | TBD | Owns business value, prioritization, and final business acceptance. |
| Product Owner | TBD | Owns backlog, sequencing, and acceptance criteria. |
| Technical Lead / Architect | TBD | Owns assessment approach, target-state design inputs, and technical recommendations. |
| Assessment Team | NTT Assessment Team (Franco Rafael, Gustavo David Flores, Felipe Leocadio) | Builds current-state view, conducts discovery, and prepares readiness recommendations. |
| Infrastructure Lead | Rodney Laurent / Infrastructure; Fabiano Rodrigues and Gustavo Oliveira (Infra) confirmed as active task owners | Supports server identification, access change request, and owner/team-lead routing. |
| Data Sponsor | Eric Luis (Data); Michel Ferreira confirmed as Sponsor in the task tracker | Owns the MSSQL Databases discovery epic and functional/business owner identification. |
| Program / Coordination | Enrique Escobar | Participates in coordination and may be included in follow-up review meetings. |
| Technical Contacts | Rafael, Igor, Renan Silva, Gregory, Eric Luis, Yanniel, Andres Paulino, Ivan Sanchez, Caddiel Campos, Rodney Laurent, Victor De Souza Conte, Juan Grass, Mariane, Marina Daibs, Ramon Cambrelen, others TBD | Validate technical ownership, application usage, sources, dependencies, and operational context. |
| Vendor Contacts | Ocean System, Prologue, others TBD | Support vendor-managed system validation and future change coordination. |
| Data / Application Owners | Devs, IT Operations Team, DataWarehouse, Operations Department, BSA, Finance, Corporate Security, vendors | Explain business usage, criticality, reporting, integrations, and disposition constraints. |
| QA / Validation | TBD | Validates assessment completeness, data quality checks, and business sign-off evidence. |

**Update note:** Names above reflect stakeholders now explicitly named in the operational task tracker (`BradescoTasksMSSQLDiscoveryv2.xlsx`) and the `Application / Functional Owner` field of the assessment workbook. Role assignments (Business Owner, Product Owner, Technical Lead/Architect, QA/Validation) remain unconfirmed and are still tracked as open items under Section 18.

## 5. Current State

The current assessment workbook contains server and database views used to track SQL Server consolidation readiness. The server inventory originated from infrastructure input and includes server identifiers, host names, IP information, installed database technologies, environments, ownership fields, in-scope flags, access status, and review status. The database sheet links database records to server IDs and includes fields for SQL version, state, size, backup information, ownership, purpose, sources, dependencies, migration status, recommendation, and discovery source.

This section has been refreshed against the latest versions of `BradescoSQLAssessmentv10.xlsx`* and the operational discovery tracker (*`BradescoTasksMSSQLDiscovery_v2.xlsx`, referred to elsewhere as `Discovery.xlsx`). The comparison below is against the current-state figures previously documented in this epic.

### 5.1 Current-State Metrics

| Metric | Previous Value | Current Value | Change |
| --- | --- | --- | --- |
| Total server rows | 58 | 58 | No change |
| In-scope MSSQL rows | 48 | 30 | -18 (engine-level re-validation; see below) |
| Out-of-scope / non-MSSQL rows | 10 | 28 | +18 |
| Total database records | 178 | 279 | +101 (new inventory identified) |
| Total database size | 4,032.5 GB | 4,032.5 GB | No material change |
| Servers with database records | 13 | 23 | +10 |
| Migration-ready databases | 0 | 0 | No change |
| Databases pending analysis | 176 | 178 | +2 |
| Databases marked retire | 2 | 2 | No change |
| Servers with access marked Yes | 7 | 19 | +12 |
| Servers with access marked No | 51 | 39 | -12 |
| Servers reviewed Yes | 2 | 2 | No change |
| Servers reviewed No | 56 | 54 | -2 |

**Note on scope reclassification:** The in-scope MSSQL count has been revised from 48 to 30 following engine-level validation against the `Engine / Product` field. The 28 servers now classified out of scope run MySQL, MongoDB, or MariaDB engines and have been formally excluded from the SQL Server assessment. This is a data-quality correction, not a reduction in assessment coverage — total server rows (58) and total database records tracked (279) both remain, or increase, under the corrected classification.

### 5.2 Current-State Challenges

- Read-only access exists for only a limited portion of the SQL Server estate; access is now confirmed for 19 of 58 servers (32.8%), up from 7 previously, but coverage remains a blocker for the majority of the estate.
- Application/Functional Owner identification is now effectively complete: only 1 of 279 database records (0.4%) has a blank `Application / Functional Owner`, a marked improvement from 159 of 178 (89.3%) previously blank. This item can be considered substantially closed pending final validation.
- Dependency Owner and Sources Owner identification remain significant gaps at the raw-data level: 257 of 279 database records (92.1%) have a blank `Dependency Owner` field, and 250 of 279 (89.6%) have a blank `Sources Owner` field.
- **New data-quality finding:** The assessment workbook's own Dashboard tab reports "Dependency Owners Databases" as 122 of 279 (43.7%) and "Sources Owners Databases" as 124 of 279 (44.4%) — figures materially higher than the raw field counts above. This discrepancy between dashboard-reported KPIs and underlying raw data must be reconciled before either figure is quoted externally or used to gate migration decisions.
- 178 of 279 database records (63.8%) remain in `Pending analysis` migration status (99 additional records have no migration status populated at all).
- 143 of 279 database records (51.3%) have `Environment` as `Pending validation`, improved from 128 of 178 (71.9%) previously, though still a majority-scale gap.
- 146 of 279 database records (52.3%) have blank `Criticality`, improved from 160 of 178 (89.9%) previously.
- 182 of 279 database records (65.2%) have blank `Recommendation`.
- Only 2 of 30 in-scope servers (6.7%) have been technically reviewed, unchanged since the prior assessment cycle — this remains the critical-path constraint on producing defensible disposition recommendations.
- Support Status is unpopulated for 13 of 30 in-scope servers (43.3%); of the 17 servers with a populated value, only 2 are flagged `End of Support (EOS)` in the tracker. Cross-referencing installed engine versions independently shows 11 of 30 in-scope servers (36.7%) — hosting 115 databases, including all 4 `Critical`-rated databases — run SQL Server 2016 or 2012, both past Microsoft's mainstream/extended support windows. This represents a 9-server under-reporting gap between the tracker's `Support Status` field and the actual installed-version evidence, and should be treated as a confirmed risk pending Support Status field correction (see Section 14).
- Some records appear duplicate or inconsistent across server/product classification.
- Some servers are marked with SQL installed but no business databases found, while related database counts still require clarification.
- SQL Compact and LocalDB entries require explicit scope validation.
- Vendor-managed databases require separate engagement and approval paths.
- HA/DR relationships are not yet mapped to specific paired servers.

### 5.3 Current Systems

The inventory of servers hosting databases has expanded from 13 to 23 following the corrected scope classification and continued discovery. The table below reflects the current top systems by database count (in-scope, MSSQL-confirmed servers only).

| Server ID | Host / System | Engine / Version | Environment | Database Count | Access | Support Status | Technical Owner | Business Owner | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| SRV-002 | BACBPTRANSDB1 | SQL Server 2016 (64-bit) | Production | 40 | No | End of Support (EOS) | IT Operations Team, Renan Silva | Devs | Hosted in the DMZ; contains databases used for development. |
| SRV-026 | BFBNAPDB | SQL Server 2016 (64-bit) | Production | 36 | Yes | Information not currently available in the assessment data. | IT Operations Team, Renan Silva | Devs | High criticality; not yet technically reviewed. |
| SRV-052 | UATSYNDB | SQL Server 2019 (64-bit) | Staging/UAT | 35 | No | Information not currently available in the assessment data. | IT Operations Team, Renan Silva | Devs | Duplicate noted in server inventory (see Open Question Q1). |
| SRV-038 | BFBORLDB | SQL Server 2016 (64-bit) | DR | 27 | Yes | Information not currently available in the assessment data. | IT Operations Team, Renan Silva | Devs | New to top-tier inventory; DR pairing not yet confirmed (see Open Question Q6). |
| SRV-048 | BFBSYNDB | SQL Server 2019 (64-bit) | Production | 24 | Yes | Supported | IT Operations Team | Operations Department | New to top-tier inventory. |
| SRV-006 | BACSANSRV | SQL Server 2017 (64-bit) | Production | 23 | Yes | Information not currently available in the assessment data. | IT Operations Team | IT Operations Team | Data warehouse databases; open question on "no business databases found" note (Q2). |
| SRV-035 | BFBJXSERVERDB\\\\JXCHANGE | SQL Server 2019 (64-bit) | Production | 21 | Yes | Supported | IT Operations Team, Caddiel Campos | Operations Department | New to top-tier inventory. |
| SRV-017 | BB-VV-BD-004 | SQL Server 2019 (64-bit) | Production | 10 | Yes | Supported | IT Operations Team | Operations Department | New to top-tier inventory. |
| SRV-057 | sqlserver-7db9877b68-6h74t | SQL Server 2022 (64-bit) | Development | 10 | Yes | Information not currently available in the assessment data. | Renan Silva | Devs | Kubernetes-pattern instance; discovery source: Devs NiFi. |
| SRV-029 | BFBDSNAP | SQL Server 2022 (64-bit) | Production | 8 | Yes | Supported | IT Operations Team, Renan Silva | Devs | Database owner details still incomplete. |
| SRV-036 | BFBJXWORKFLOWDB | SQL Server 2019 (64-bit) | Production | 7 | Yes | Supported | IT Operations Team | Operations Department | JX/workflow area requires owner validation. |
| SRV-053 | BB-VV-BD-006 | SQL Server 2022 (64-bit) | Production | 6 | Yes | Supported | IT Operations Team, Renan Silva | DataWarehouse | Includes large DQP databases (medallion-pattern data platform cluster). |
| SRV-015 | BB-VV-BD-001 | SQL Server 2019 (64-bit) | Production | 5 | Yes | Supported | IT Operations Team, Eric | DataWarehouse | Notes mention SQLEXPRESS 2017 version detected. |
| SRV-056 | BB-VV-BD-008 | SQL Server 2022 (64-bit) | Development | 5 | No | Information not currently available in the assessment data. | Renan Silva | Devs | Linked Server from NiFi Dev; access still pending. |
| SRV-058 | sqlserver-6d45bcd4bf-vz9k2 | SQL Server 2022 (64-bit) | Development | 5 | Yes | Information not currently available in the assessment data. | Renan Silva | Devs | Kubernetes-pattern instance; discovery source: Devs NiFi. |

**Newly surfaced in this cycle:** SRV-038 (BFBORLDB, 27 databases), SRV-048 (BFBSYNDB, 24 databases), SRV-035 (BFBJXSERVERDB\\\\JXCHANGE, 21 databases), and SRV-017 (BB-VV-BD-004, 10 databases) were not present in the previously documented top-system view and now rank among the highest-density hosts in the estate.

### 5.4 Known Ownership Inputs

Application/Functional Owner data is now captured directly and natively within `BradescoSQLAssessment_v10.xlsx` (Tab 3, `Application / Functional Owner` field) rather than requiring cross-reference against the separate Caddiel Campos and Renan Silva owner-mapping workbooks referenced in the prior assessment cycle. Coverage from the live workbook is summarized below; the supplemental owner workbooks were not provided for this refresh cycle and could not be independently reconciled.

| Owner / Contact (as recorded in Tab 3) | Database Records Mapped |
| --- | --- |
| Renan Silva | 55 |
| Yanniel / Eric | 30 |
| Andres Paulino | 27 |
| Caddiel Campos, Rodney Laurent | 24 |
| Fabiano | 23 |
| Caddiel Campos | 21 |
| Victor De Souza Conte | 15 |
| Eric | 14 |
| Yanniel / Eric / Juan Grass | 11 |
| Mariane | 11 |
| Juan Grass | 10 |
| Caddiel Campos, Rodney Laurent, Infra | 10 |
| Yanniel | 9 |
| Rodney Laurent | 7 |
| Other / partial (Yanniel / Eric / Ivan Sanchez; Juan Grass "?"; Eric / Juan Grass; Vendor; unresolved "?") | 10 |

**Data quality note:** Application/Functional Owner coverage (278 of 279, 99.6%) should not be read as equivalent to validated business ownership. These are named contacts recorded during discovery and have not yet been confirmed through the formal stakeholder interview process required under FR-003/FR-004. Dependency Owner and Sources Owner — the fields needed to assess integration and reporting impact — remain largely unpopulated (see Section 5.2).

## 6. Target State

The target state is a validated SQL Server readiness baseline that can support later architecture and migration decisions. Each in-scope server and database should have technical visibility, ownership, functional context, criticality, usage/dependency data, and an approved disposition recommendation.

### 6.1 Target-State Capabilities

- Evidence-based scope classification for SQL Server, non-SQL Server, duplicate, inactive, and vendor-managed records.
- Read-only access or authoritative exported inventory for every remaining in-scope SQL Server host.
- Database-level owner map including technical owner, functional/application owner, business contact, and vendor contact where applicable.
- Discovery interview model that captures purpose, sources, ETL, reports, consumers, execution frequency, dependencies, operational status, and criticality.
- Migration/disposition framework covering lift and shift, rehost, replatform, refactor, repurchase, retain, retire, decommission, investigate, and pending validation.
- Prioritized backlog of servers/databases for consolidation or migration planning.
- Data quality and reconciliation checks for inventory completeness and classification consistency.

### 6.2 Target Architecture Summary

The final target architecture is TBD. This epic prepares the input needed for architecture decisions by building a governed current-state baseline. After discovery is complete, the team can group databases by application, owner, criticality, version, support status, environment, dependency pattern, and migration suitability to define future waves for consolidation, modernization, or retirement

## 7. Architecture and Design

### 7.1 High-Level Discovery Flow

### 7.2 Design Principles

- Treat technical metadata as evidence of what exists, not why it exists.
- Require stakeholder validation before recommending migration, retirement, or decommissioning.
- Keep assessment access read-only and non-invasive.
- Classify non-SQL Server and irrelevant hosts out of scope only after validation.
- Separate infrastructure ownership from application, functional, and business ownership.
- Use vendor-specific engagement paths for vendor-managed databases.

## 8. Data Requirements

### 8.1 Source Data

| Source System | Object / Table / API | Description | Refresh Frequency | Owner |
| --- | --- | --- | --- | --- |
| Infrastructure inventory | Server list | Server ID, hostname, IP, location, network, installed engine/product, environment, owner fields, scope flags. | As inventory changes / assessment refresh | Infrastructure Team |
| SQL Server instances | Database metadata | Database name, version, state, size, last backup, data/log file locations, server linkage. | During discovery and before final recommendation | Infrastructure / SQL access owners |
| Assessment workbook | Servers and Databases tabs | Working tracker for scope, access, ownership, migration status, and recommendations. | Active assessment updates | NTT Assessment Team |
| Owner mapping workbooks | Caddiel and Renan database owner files | Supplemental owner mapping by server/database. | As owner mapping is updated | Named technical/functional contacts |
| Discovery interviews | Stakeholder responses | Purpose, usage, sources, ETL, reports, consumers, dependencies, operational status, criticality, and vendor context. | Per discovery wave | Assessment Team + application/business contacts |

### 8.2 Target Data Products

| Data Product | Description | Consumer | SLA | Owner |
| --- | --- | --- | --- | --- |
| SQL Server current-state inventory | Validated server and database inventory with scope, access, ownership, and metadata. | Assessment Team, Infrastructure, application teams | TBD | NTT Assessment Team |
| Ownership and dependency map | Mapping of databases to owners, vendors, source systems, ETL, reports, consumers, and dependencies. | Assessment Team, business/application owners | TBD | TBD |
| Migration readiness backlog | Prioritized list of databases and servers with disposition recommendations and blockers. | Program leadership, architecture, delivery teams | TBD | TBD |
| Open question / blocker log | Questions that must be resolved before approval. | Assessment Team and stakeholders | TBD | NTT Assessment Team |

### 8.3 Key Business Entities

| Entity | Definition | Source of Truth | Notes |
| --- | --- | --- | --- |
| Server | Host or instance container where database technologies are installed. | 1. `Servers` tab | One server can have multiple products/instances and duplicate records requiring validation. |
| SQL Server Instance | Independent SQL Server installation on a server. | Infrastructure inventory / SQL Server access | Versions include SQL Server 2008/R2, 2012, 2016, 2017, 2019, 2022, LocalDB, and Compact variants. |
| Database | Named data collection linked to a server ID. | 1. `Databases` tab | One row equals one database record. |
| Owner | Technical, functional, application, business, or vendor contact accountable for knowledge or decisions. | Owner workbooks and discovery interviews | Many database owner fields remain blank or pending. |
| Dependency | Source, ETL, report, workflow, consumer, vendor, or application relying on a database. | Discovery interviews and documentation | Required before migration disposition is defensible. |
| Migration Disposition | Recommended path such as migrate, rehost, replatform, retain, retire, decommission, or investigate. | Assessment workbook after validation | Currently mostly pending analysis. |

## 9. Functional Requirements

| ID | Requirement | Priority | Acceptance Criteria |
| --- | --- | --- | --- |
| FR-001 | Validate the SQL Server assessment scope across all inventoried server rows. | Must | Each server row is classified as in scope, out of scope, duplicate, inactive, vendor-managed, or pending with evidence. |
| FR-002 | Obtain read-only SQL access or authoritative exported database listings for in-scope hosts. | Must | Remaining in-scope hosts have either read-only access available or an approved exported inventory alternative. |
| FR-003 | Map server and database ownership. | Must | Each in-scope database has a technical, functional, business, application, or vendor owner, or a documented escalation path. |
| FR-004 | Conduct targeted discovery interviews. | Must | Interviews capture purpose, sources, ETL, reports, consumers, execution frequency, dependencies, operational status, and criticality. |
| FR-005 | Update migration status and recommendations. | Must | Databases move out of `Pending analysis` only when supporting technical and functional evidence exists. |
| FR-006 | Validate duplicate and inconsistent inventory records. | Must | Duplicate records and conflicting product/scope notes are resolved or documented as open blockers. |
| FR-007 | Identify vendor-managed systems. | Should | Vendor-managed databases have vendor name, contact path, and engagement constraints documented. |
| FR-008 | Prioritize next assessment waves. | Should | Databases are grouped by server, owner, application, criticality, access availability, and complexity. |
| FR-009 | Maintain an open question and blocker log. | Must | Open questions have owner, status, and resolution notes. |

## 10. Non-Functional Requirements

| Category | Requirement | Target |
| --- | --- | --- |
| Performance | Assessment queries must be read-only and avoid production impact. | Non-invasive metadata collection only. |
| Availability | Assessment activities must not require downtime. | No production shutdown, restart, or configuration change in this epic. |
| Security | Access must be limited to named assessment participants and read-only permissions. | Formal change request or approved access process. |
| Data Quality | Inventory fields must be validated before use in recommendations. | No assumptions for owner, purpose, criticality, environment, or disposition. |
| Observability | Blockers, access status, review status, and open questions must remain visible. | Workbook/backlog reflects current status. |
| Scalability | Discovery process must scale across high-density servers. | Group interviews by owner/application/server and prioritize by complexity. |
| Compliance | Sensitive data handling and approval requirements must be confirmed before deeper analysis. | PII, retention, audit, and access rules documented before implementation planning. |

## 11. Data Quality and Validation

### 11.1 Data Quality Rules

| Rule ID | Rule Description | Severity | Validation Method |
| --- | --- | --- | --- |
| DQ-001 | Every in-scope SQL Server row must have access status and review status. | High | Workbook completeness check. |
| DQ-002 | Every in-scope database must have a validated owner or escalation path. | Critical | Owner workbook reconciliation and stakeholder confirmation. |
| DQ-003 | Database migration status cannot move from `Pending analysis` without owner, purpose, dependency, and operational status evidence. | Critical | Assessment review and approval checkpoint. |
| DQ-004 | Duplicate server/database records must be confirmed using hostname, engine/product, instance, and database evidence. | High | Inventory reconciliation. |
| DQ-005 | Non-SQL Server, SQL Compact, LocalDB, and no-business-database records must be explicitly classified. | High | Infrastructure validation and owner confirmation. |
| DQ-006 | Criticality cannot remain blank for databases that are candidates for migration or retirement. | High | Discovery interview evidence. |
| DQ-007 | Last backup and database state must be captured before migration readiness assessment. | Medium | SQL metadata query or authoritative export. |

### 11.2 Reconciliation Requirements

- Source-to-target record count validation: reconcile server rows, SQL Server in-scope rows, and database counts against SQL Server metadata exports.
- Balance / amount reconciliation: not applicable unless a database-specific financial data migration is later approved.
- Duplicate detection: validate duplicate server and database records using hostname, instance, engine, IP, and owner input.
- Null checks: owner, environment, criticality, purpose, source, dependency, migration status, and recommendation fields must be reviewed for blanks.
- Referential integrity: every database row must map to a valid server ID in the server inventory.
- Business-rule validation: migration status and recommendation must be based on validated purpose, usage, owner, dependency, and operational status.

### 11.3 Open Questions From Assessment Workbook

| ID | Topic | Question | Status |
| --- | --- | --- | --- |
| Q1 | Duplicates / Engine | For duplicates, was the engine/product taken into account when identifying them? | Open |
| Q2 | Databases in Scope | For "no business databases found", does this mean databases do not exist, are not used, or are not managed by Bradesco? BACSANSRV has 23 DBs and needs ownership/purpose clarification. | Open |
| Q3 | Access & Ownership | How will server access be granted, escalated, and mapped to database owners? | Open |
| Q4 | Scope / SQL Compact | Can SQL Compact instances be treated as out of scope, or do they contain application-used databases? | Open |
| Q5 | Data Quality | BFBWEBDEV runs MSSQL 2019 but has a note saying "Non-MSSQL product detected"; which value is correct? | Open |
| Q6 | HA / DR | Which servers are actual DR pairs, for example BBFBDBVIEW and related systems? | Open |

**Status as of this refresh:** All six open questions remain unanswered and unowned in the `5. Questions` tab (no `Owner` or `Answer` value populated for any row). No change since the previously documented cycle. These should be escalated given their direct bearing on scope classification (Q1, Q4, Q5) and access/ownership routing (Q2, Q3, Q6).

## 12. Security, Governance, and Compliance

### 12.1 Access Control

| Role / Group | Access Level | Data Scope |
| --- | --- | --- |
| NTT Assessment Team | Read-only | SQL Server metadata for approved in-scope hosts. |
| Infrastructure Team | Admin / provisioning per existing role | Server identification, connectivity, access request support, and technical validation. |
| Application / Functional Owners | Read / review | Application purpose, dependencies, reports, and operational context for owned databases. |
| Vendor Contacts | TBD | Vendor-managed databases only, subject to contract and approval path. |
| Business Owners | Review / approve | Business validation, criticality, disposition, and sign-off. |

### 12.2 Governance Requirements

- Data classification: TBD per database; must be confirmed before implementation planning.
- PII / sensitive data handling: TBD; discovery must identify sensitive datasets and access constraints.
- Data retention: TBD; retention requirements must be captured before retirement or decommissioning decisions.
- Audit logging: access requests and assessment actions should be traceable through the formal change process.
- Lineage: source systems, ETL jobs, reports, and downstream consumers must be documented during discovery.
- Approval workflow: production changes, migration, retirement, and decommissioning require separate approval outside this epic.
- Business glossary updates: glossary terms and disposition definitions should remain aligned with the assessment workbook.

## 13. Dependencies

| Dependency | Type | Owner | Status | Notes |
| --- | --- | --- | --- | --- |
| Read-only SQL access / exported database lists | System / Access | Rodney Laurent / Infrastructure | Open | Required for remaining in-scope SQL Server hosts. |
| Named assessment participants for access request | Team | NTT Assessment Team | Open | Meeting notes state names must be provided. |
| Server/database owner mapping | Team / Data | Rodney Laurent / Infrastructure / team leads | Open | Needed to route focused interviews. |
| Application and functional owner interviews | Team | Application owners / business contacts | Open | Required to validate purpose, dependencies, consumers, and criticality. |
| Vendor-managed database contacts | Vendor | Infrastructure / business owner / vendor | Open | Ocean System and Prologue referenced as vendor paths needing validation. |
| Duplicate and scope classification | Data | Infrastructure + Assessment Team | Open | Required for SQL Compact, LocalDB, duplicate, inactive, and non-SQL records. |
| Target architecture decision | Architecture | TBD | Open | Depends on completed current-state assessment and disposition recommendations. |

## 14. Risks and Mitigations

| Risk | Impact | Probability | Mitigation | Owner |
| --- | --- | --- | --- | --- |
| Access provisioning is delayed or incomplete. | High | High | Track formal change request; use authoritative exported database lists as interim evidence. | Infrastructure |
| Owner information remains incomplete or outdated. | High | High | Use Infrastructure, DevOps leads, developers, business contacts, and vendor contacts to triangulate ownership. | Assessment Team / Infrastructure |
| Legacy or inactive databases remain mixed with active workloads. | High | Medium | Validate operational status through owner confirmation, usage evidence, and recent activity. | Application Owners |
| Vendor-managed databases require external coordination. | Medium | Medium | Identify vendors early and establish separate engagement and approval path. | Business / Vendor Owner |
| Database volume is uneven across servers. | Medium | Medium | Prioritize high-density servers and group interviews by owner/application. | Assessment Team |
| Inconsistent inventory values lead to wrong scope decisions. | High | Medium | Resolve open workbook questions before final classification. | Assessment Team / Infrastructure |
| End-of-support SQL versions remain in production, and the assessment tracker under-reports the exposure. | High | High | Confirmed: 11 of 30 in-scope servers (36.7%) run SQL Server 2016 or 2012 — versions past Microsoft's extended support window — hosting 115 databases including all 4 `Critical`-rated databases. The tracker's `Support Status` field flags only 2 of these 11 as End of Support. Correct the tracker field and prioritize EOS remediation planning. | Architecture / Infrastructure |
| Dashboard-reported ownership KPIs materially overstate raw-data coverage. | Medium | High | Confirmed data-quality gap: the workbook Dashboard reports Dependency Owner coverage at 43.7% and Sources Owner coverage at 44.4%, while the underlying raw fields show 7.9% and 10.4% populated respectively. Reconcile the dashboard formulas against source columns before either figure informs planning or is shared externally. | Assessment Team |

## 15. Delivery Plan

### 15.1 Milestones

| Milestone | Target Date | Owner | Status |
| --- | --- | --- | --- |
| Infrastructure coordination meeting completed | 2026-07-24 | NTT Assessment Team / Infrastructure | Complete |
| Initial Infrastructure owner/access update | 2026-07-27 12:00 PM, timezone not stated | Rodney Laurent | Planned / Needs confirmation |
| Monday review meeting | 2026-07-27 2:00 PM, timezone not stated | NTT Assessment Team + Infrastructure | Planned / Needs confirmation |
| Read-only access or exported database lists available | TBD | Infrastructure | In Progress — 19 of 58 servers now have confirmed access (up from 7) |
| Owner mapping first pass complete | TBD | Infrastructure / team leads | In Progress — Application/Functional Owner now populated for 278 of 279 databases (99.6%); Dependency/Sources Owner still open |
| Discovery interviews completed for priority wave | TBD | Assessment Team | Not Started |
| Scope and duplicate classifications approved | TBD | Assessment Team / Infrastructure | In Progress — engine-level scope re-validation completed (30 in-scope / 28 out-of-scope); duplicate questions (Q1) remain open |
| Migration/disposition recommendations drafted | TBD | Assessment Team / Architecture | Not Started |
| Business validation complete | TBD | Business / Application owners | Not Started |
| Assessment target end date | 2026-09-18 | Assessment Team | 44 calendar days remaining as of this update (05-Aug-2026); On Track per workbook threshold (\>30 days) |

### 15.2 Work Breakdown

Status below reflects the current task tracker (`BradescoTasksMSSQLDiscoveryv2.xlsx`, Tasks sheet) as of this refresh: 0 of 11 tasks Completed, 4 In Progress, 7 Pending, 0 Blocked; 6 of 11 tasks (54.5%) carry an External/Third-Party dependency. Overall weighted discovery progress is 16%.

| Workstream | Description | Owner | Status |
| --- | --- | --- | --- |
| Inventory validation | Confirm server and database inventory accuracy, scope, duplicates, inactive records, and product classification. | Assessment Team / Infrastructure | In Progress — "Consolidation Servers" task is In Review (96.7% complete, Fabiano Rodrigues); "Validate Server Inventory" is To Do |
| Access enablement | Submit and track read-only SQL access request or collect authoritative database exports. | Rodney Laurent / Infrastructure | Open — access confirmed for 19 of 58 servers (32.8%) to date |
| Ownership mapping | Map each server/database to technical, functional, business, application, or vendor contacts. | Infrastructure / team leads | In Progress — "Identify Business Owners" task at 30% (Eric Luis, Data); Application/Functional Owner field now 99.6% populated |
| Discovery interviews | Capture database purpose, sources, ETL, reports, consumers, execution frequency, dependencies, and operational status. | Assessment Team | In Progress — "Discover with Technical Owners for DBs" task at 30% (IT Operationals); "Database Functional Discovery" not yet started |
| Data quality | Resolve blanks and inconsistent fields in owner, environment, criticality, recommendation, status, and scope. | Assessment Team | Open — Dependency/Sources Owner and Criticality remain the largest gaps; dashboard-vs-raw KPI discrepancy identified this cycle (see Section 14) |
| Migration readiness | Convert validated evidence into disposition recommendations and prioritized backlog. | Assessment Team / Architecture | Not Started — "Consolidation Databases" task at 42.6% (Eric Luis, Data) is the immediate precursor |
| Governance | Confirm access, classification, retention, lineage, and approval requirements. | Security / Governance / Business | Not Started |

## 16. Jira / Backlog Links

| Item Type | Key / Link | Description |
| --- | --- | --- |
| Epic | TBD | SQL Server Consolidation Readiness Assessment |
| Story | TBD | Validate server scope and duplicate records. |
| Story | TBD | Obtain read-only SQL access or exported database lists. |
| Story | TBD | Complete owner mapping for in-scope databases. |
| Story | TBD | Conduct discovery interviews for priority database groups. |
| Story | TBD | Produce migration/disposition recommendations. |
| Spike | TBD | Evaluate target-state consolidation / cloud migration architecture options after discovery. |
| Defect | TBD | Resolve inconsistent inventory classifications such as BFBWEBDEV. |

## 17. Acceptance Criteria

The epic is complete when:

- Business requirements are reviewed and approved.
- Architecture and design inputs are reviewed and approved for the next delivery phase.
- Required source data is available and validated.
- All in-scope SQL Server hosts have read-only access or an approved exported inventory alternative.
- Server scope classifications are complete for SQL Server, non-SQL Server, duplicate, inactive, SQL Compact, LocalDB, and vendor-managed records.
- Each in-scope database has an owner or documented escalation path.
- Database purpose, source systems, ETL dependencies, reporting consumers, execution frequency, operational status, and criticality are captured for in-scope databases.
- Open workbook questions are answered or formally carried as approved exceptions.
- Migration/disposition recommendations are populated and supported by evidence.
- Security and access controls are documented.
- Governance requirements for data classification, PII/sensitive data, retention, audit, lineage, and approvals are documented.
- Documentation is complete and traceable to the assessment workbook, owner mapping workbooks, and meeting summary.
- Business validation is complete.
- Monitoring and support handoff requirements for the next phase are documented.

## 18. Known Information Still Needed

- Jira Epic key / reference.
- Business Owner and Product Owner.
- Technical Lead / Architect.
- Target release / PI / quarter.
- Confirmed final status after stakeholder review.
- Confirmed assessment participant names for access request.
- Confirmed July 27, 2026 follow-up outcomes.
- Final access decision per in-scope host.
- Final owner map per database.
- Final target architecture / platform decision.
- Security groups, approval workflow, data retention, and sensitive-data classification.
- Final business acceptance and sign-off process.

## 19. Operational Readiness

| Area | Requirement | Status |
| --- | --- | --- |
| Monitoring | Track access status, reviewed status, pending analysis count, owner mapping completeness, and open blocker resolution. | Not Started |
| Alerting | TBD for future implementation phase; no production alerting changes are authorized by this discovery epic. | Not Started |
| Runbook | Document read-only assessment process, owner interview process, evidence requirements, and disposition approval steps. | Not Started |
| Support Model | Infrastructure supports access and technical status checks; application/business/vendor owners support usage validation. | Draft |
| SLA / SLO | TBD after target architecture and disposition recommendations are approved. | Not Started |

## 20. Open Questions

| Question | Owner | Due Date | Status |
| --- | --- | --- | --- |
| Were duplicate records identified using both hostname and engine/product? | Infrastructure / Assessment Team | TBD | Open |
| Does "no business databases found" mean absent, unused, unmanaged, or pending ownership validation? | Infrastructure / Application Owners | TBD | Open |
| Who should receive read-only access, and what is the approved access path per in-scope host? | NTT Assessment Team / Rodney Laurent | TBD | Open |
| Are SQL Compact and LocalDB instances in scope when no application-used databases are present? | Infrastructure / Application Owners | TBD | Open |
| Which value is correct for inconsistent records such as BFBWEBDEV where MSSQL is listed but notes say non-MSSQL? | Infrastructure / Assessment Team | TBD | Open |
| What are the confirmed HA/DR server pairings? | Infrastructure | TBD | Open |
| Which databases are vendor-managed, and who owns vendor engagement for Ocean System, Prologue, and any other vendors? | Business Owners / Infrastructure | TBD | Open |

## 21. Decision Log

| Date | Decision | Owner | Notes |
| --- | --- | --- | --- |
| 2026-07-24 | Limit the current assessment to SQL Server databases. | NTT Assessment Team / Infrastructure | MySQL and other non-SQL Server technologies may be classified out of scope after validation. |
| 2026-07-24 | Use read-only access or authoritative exported database lists for technical discovery. | Rodney Laurent / Infrastructure | No write, configuration, shutdown, or production change permissions were requested. |
| 2026-07-24 | Combine technical metadata with stakeholder interviews before producing migration recommendations. | NTT Assessment Team | Metadata explains what exists; owners explain usage, criticality, dependencies, and business impact. |
| 2026-07-24 | Use Infrastructure, team leads, developers, business contacts, and vendors to route ownership discovery. | Rodney Laurent / Infrastructure | Infrastructure ownership alone is not sufficient for database disposition decisions. |

## 22. Related Documents

- Architecture diagram: TBD
- Data dictionary: `BradescoSQLAssessmentv2shared 1.xlsx`, `6. Glossary` tab
- Source-to-target mapping: TBD after target architecture is approved
- Business glossary: `BradescoSQLAssessmentv2shared 1.xlsx`, `6. Glossary` tab
- Assessment workbook: `BradescoSQLAssessmentv2shared 1.xlsx`
- Owner mapping: `BradescoDatabasesCaddielCamposTechnicalOwnersv1.xlsx`
- Owner mapping: `BradescoDatabasesRenanSilvaTechnicalOwnersv1.xlsx`
- Meeting summary: `DetailedMeetingSummaryDBConsolidationInfra20260724_EN.docx`
- Security review: TBD
- Test plan: TBD
- Release plan: TBD

## 23. Change Log

| Date | Change | Author |
| --- | --- | --- |
| 14-07-2026 | Initial draft |  |
| 04-08-2026 | First draft |  |
| 05-08-2026 | Data refresh against latest `BradescoSQLAssessment_v10.xlsx` and `Discovery.xlsx`: corrected in-scope MSSQL count (48→30) following engine-level re-validation; updated database record count (178→279), server/database metrics, and top-system inventory (Sections 5.1–5.3); refreshed ownership coverage from live workbook data (Section 5.4); identified and flagged a confirmed EOS under-reporting gap and a dashboard-vs-raw-data ownership KPI discrepancy (Section 14); updated discovery task status and workstream progress against the current task tracker (Section 15.2); confirmed no change to the six open assessment questions (Section 11.3); updated stakeholder names now confirmed in source data (Section 4). | Automatic by Franco |

## Provided Files

## Recommended Confluence Labels

Add these labels to the page:

- sql-server
- consolidation
- readiness-assessment
- database-inventory
- infrastructure
- data-governance
- migration-planning

# Epic Children
