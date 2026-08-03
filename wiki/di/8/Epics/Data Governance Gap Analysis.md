# Data Governance Gap Analysis

# Epic:  Data Governance Gap Analysis

## 1. Epic Summary

**Epic ID:** ADF-16

**Owner:** @David Tatis  

**Technical Lead:** @Enrique Escobar  

**Status:** In Progress 

**Target Release:**  

**Created Date:**  

**Last Updated:** 

### 1.1 Executive Summary

This epic tracks the Data Governance Gap Analysis for Bradesco Bank as part of the broader Data Governance Assessment and cloud / Databricks modernization effort. The purpose of the epic is to establish a clear, evidence-based view of current governance maturity, identify gaps against the target-state governance model, and define the remediation path required to support trusted, compliant, scalable, and auditable data management.

The assessment scope includes current-state governance maturity, governance operating model, data ownership and stewardship, metadata and cataloging, lineage, data quality, classification and privacy, retention, architecture alignment, monitoring, and remediation planning. The expected deliverables include a current-state maturity assessment, governance framework and policy recommendations, target-state conceptual data architecture, enterprise gap matrix, risk register, prioritized remediation roadmap, 30/60/90-day action plan, and executive readout.

Based on the available RSM work breakdown structure, project plan, assessment backlog seed, and supporting templates, the engagement is currently in progress but the gap analysis itself is not yet complete. Discovery and project initiation activities are mostly complete, and stakeholder interviews have started. However, the maturity scorecard, evidence register, enterprise gap matrix, detailed findings, risk register, and prioritized remediation roadmap remain incomplete or not yet produced.

The current evidence indicates that Bradesco Bank has active data management, architecture, reporting, and Data Quality-related initiatives, but enterprise governance capabilities are not yet consistently formalized, measured, or operationalized across domains. Key gaps include incomplete data ownership and stewardship assignments, limited evidence-backed maturity scoring, immature metadata and business glossary coverage, inconsistent lineage documentation, incomplete Data Quality governance alignment, and pending classification, privacy, compliance, and governance reporting controls.

This epic should remain open until the assessment package is populated with Bradesco-specific findings, supported by documented evidence, reviewed with stakeholders, and approved by the appropriate governance and leadership groups. Completion should be measured by delivery and approval of the maturity assessment, gap matrix, risk register, target-state governance and architecture recommendations, and prioritized remediation roadmap.

## 2. Business Context

The Data Governance Gap Analysis supports Bradesco Bank’s broader cloud and data modernization strategy by assessing the current maturity of governance capabilities and defining the foundational improvements required before scaling governance across domains, platforms, and future Databricks-based architecture.
This assessment focuses on identifying gaps across governance operating model, data ownership, stewardship, metadata, lineage, data quality, classification, privacy, retention, architecture, and governance reporting. The outcome will provide a structured view of current-state maturity, target-state expectations, prioritized remediation actions, and a practical roadmap for moving toward a more governed, auditable, and scalable data environment.
Inputs for this assessment include RSM assessment deliverables, current-state governance and architecture artifacts, stakeholder interviews, data domain analysis, critical BR-file domain mapping, and existing Data Quality Framework materials.

### 2.1 Business Problem

- What pain point are we solving?
    - Data governance, ownership, standards, and metadata management are inconsistently applied across the organization.
- Who is impacted?
    - Business users, Data Intelligence teams, leadership, audit and compliance.
- Why does this matter now?
    - The bank is migrating to the cloud and needs governance foundations to ensure a successful transformation.
- What happens if we do nothing?
    - Data quality, accountability, compliance, and analytics challenges will continue and may increase during cloud adoption.

Bradesco Bank currently has several governance capabilities in progress, but they are not yet consistently formalized, measured, or operationalized across the enterprise. Data ownership, stewardship, metadata management, lineage, data quality controls, and governance decision rights are handled inconsistently across domains and systems.
Key pain points include:
Data ownership and stewardship roles are not consistently defined across critical data domains.
Governance policies, standards, decision rights, and escalation paths require formalization.
Metadata, business glossary, cataloging, and lineage capabilities are not consistently applied.
Critical data domains and data assets have started to be identified, but ownership, stewardship, and domain boundaries still need validation.
Data Quality practices exist through related initiatives, but enterprise-level alignment between governance, CDEs, rules, monitoring, and remediation is still incomplete.
Current-state maturity scores, evidence registers, findings, and remediation initiatives are not yet fully populated.
Target-state architecture and governance operating model need to be connected to the cloud / Databricks modernization strategy.
Without a structured gap analysis, governance improvements may remain fragmented, reactive, and difficult to prioritize.
This matters now because the bank is moving toward a cloud and Databricks-aligned architecture. Without a clear governance baseline and roadmap, data quality, accountability, compliance, lineage, and trusted analytics challenges may increase during migration and modernization.
If no action is taken:
Regulatory and audit traceability may remain manual and inconsistent.
Data quality issues may lack clear ownership and escalation.
Critical data domains may continue without approved owners and stewards.
Metadata and lineage gaps may limit impact analysis and control effectiveness.
Cloud modernization may replicate existing governance weaknesses in the target platform.
Future AI, BI, analytics, and data product initiatives may lack trusted governance foundations.

### 2.2 Business Goals

| Goal | Description | Success Indicator |
| --- | --- | --- |
| Data Governance Framework | Define governance domains, roles, responsibilities, and decision rights. | Data Governance Framework completed and approved. |
| Data Governance Policy | Develop a sample policy outlining governance principles and standards. | Sample Data Governance Policy delivered and reviewed. |
| Future-State Data Architecture | Define the target conceptual architecture aligned with cloud and data strategy. | Future-State Architecture Diagram completed and approved. |
| Action Plan & Roadmap | Define prioritized governance initiatives and next steps. | 30/60/90-Day Action Plan delivered and approved. |

| Goal | Description | Success Indicator |
| --- | --- | --- |
| Establish Current-State Governance Baseline | Assess current data governance maturity across strategy, policies, roles, metadata, lineage, data quality, classification, retention, architecture, and monitoring. | Current-state maturity assessment completed, reviewed, and supported by documented evidence. |
| Identify Governance Gaps and Risks | Document gaps between current-state practices and the target-state governance framework, including operating model, ownership, metadata, lineage, data quality, security, privacy, and compliance gaps. | Enterprise gap matrix and risk register completed with prioritized findings, severity, impact, evidence, and recommended actions. |
| Define Target Governance Operating Model | Define governance roles, responsibilities, decision rights, stewardship model, RACI, escalation paths, and governance cadence. | Governance framework and policy recommendations reviewed and approved by stakeholders. |
| Align Governance With Cloud / Databricks Strategy | Connect governance recommendations to the target-state data architecture, including Databricks, Unity Catalog, medallion architecture, metadata, lineage, access controls, and Data Quality controls. | Target-state conceptual data architecture completed, reviewed, and approved. |
| Improve Data Ownership and Stewardship Readiness | Identify critical data domains, ownership gaps, stewardship gaps, and accountability needs for business data assets. | Data domain ownership gaps documented and linked to ownership / stewardship remediation actions. |
| Strengthen Metadata, Lineage, and Data Quality Foundations | Define the governance capabilities needed for business glossary, catalog coverage, lineage traceability, CDEs, DQ rules, monitoring, and remediation workflow. | Metadata, lineage, and Data Quality gaps documented with target-state recommendations and prioritized next steps. |
| Prioritize Remediation Roadmap | Sequence remediation initiatives by risk, business value, implementation effort, dependencies, and readiness. | Prioritized remediation roadmap and 30/60/90-day action plan completed and approved. |
| Support Executive Decision-Making | Provide leadership with a clear, evidence-based view of current maturity, governance risks, target-state recommendations, and investment priorities. | Executive readout completed and final documentation package published in the approved repository. |

## 3. Scope

This epic covers the assessment, analysis, and planning activities required to define Bradesco Bank’s Data Governance current-state baseline, identify governance gaps, and establish the recommended target-state direction. The scope is focused on producing assessment deliverables and implementation guidance, not executing the remediation work itself.

The work includes review of current governance practices, stakeholder input, data-domain and data-asset discovery, metadata and lineage readiness, Data Quality governance alignment, security / privacy / compliance considerations, target-state governance architecture, and prioritized remediation planning.

The epic should produce a complete assessment package that enables leadership and delivery teams to understand current governance maturity, approve the target-state operating model, and sequence follow-on implementation initiatives.

### 3.1 In Scope

- Assess current-state Data Governance maturity across the following dimensions:
  - Strategy & Vision
  - Policies & Standards
  - Organization & Roles
  - Metadata & Catalog
  - Data Lineage
  - Data Quality
  - Classification & Privacy
  - Retention & Records
  - Architecture & Platform
  - Monitoring & Reporting

- Assess the current governance operating model, including:
  - Executive sponsorship
  - Governance decision rights
  - Data ownership
  - Data stewardship
  - Escalation paths
  - Governance cadence and participation model

- Assess data domain and data asset governance readiness, including:
  - Candidate business data domains
  - Critical data domains
  - Critical Data Element readiness
  - Source system inventory gaps
  - Product / data asset inventory
  - Business glossary foundations
  - Ownership and stewardship gaps

- Assess metadata, catalog, lineage, and traceability capabilities, including:
  - Business metadata
  - Technical metadata
  - Data catalog coverage
  - Business glossary standardization
  - Source-to-landing lineage
  - Landing-to-warehouse lineage
  - Warehouse-to-reporting lineage
  - Regulatory traceability

- Assess Data Quality governance readiness, including:
  - Existing Data Quality framework maturity
  - Data Quality dimensions
  - Critical Data Element ownership
  - Rule definition readiness
  - Threshold and exception handling readiness
  - Monitoring, scorecard, and remediation workflow gaps

- Assess security, privacy, and compliance governance considerations, including:
  - Data classification model
  - Sensitive data handling
  - Access governance
  - Regulatory control alignment
  - Auditability and evidence expectations
  - Retention and records-management considerations

- Define the target-state Data Governance Framework, including:
  - Governance vision and principles
  - Governance council / decision body concept
  - Data ownership model
  - Stewardship model
  - RACI model
  - Decision rights framework
  - Escalation framework
  - Governance operating cadence

- Develop governance policy and standards recommendations, including:
  - Enterprise Data Governance Policy
  - Data Quality Management Standard
  - Data Classification & Security Standard
  - Metadata Management recommendations
  - Data Lifecycle / Retention recommendations
  - Data usage, access, and compliance considerations

- Define future-state conceptual data architecture alignment with cloud / Databricks strategy, including:
  - Medallion architecture alignment
  - Landing and Bronze governance controls
  - Unity Catalog governance considerations
  - Metadata and catalog architecture
  - Data Quality architecture
  - Lineage architecture
  - Security and access-control architecture
  - Domain-oriented governance alignment

- Create prioritized remediation planning outputs, including:
  - Enterprise gap matrix
  - Governance risk register
  - Prioritized remediation initiatives
  - 30/60/90-day action plan
  - Longer-term roadmap
  - Dependencies, risks, and recommended sequencing

- Prepare final assessment and executive-readout materials, including:
  - Current-state findings
  - Gap analysis summary
  - Target-state recommendations
  - Strategic remediation roadmap
  - Final documentation package

### 3.2 Out of Scope

- Implementation of governance tools, platforms, or technical solutions.
- Configuration or deployment of Databricks, Unity Catalog, cataloging tools, lineage tools, Data Quality tools, dashboards, or monitoring platforms.
- Production rollout of the target-state Data Governance operating model.
- Execution of roadmap initiatives beyond assessment, planning, and recommendations.
- Remediation of Data Quality issues identified during the assessment.
- Development or deployment of production Data Quality rules, tests, thresholds, alerts, or scorecards.
- Full implementation of Critical Data Element governance, including approved CDE inventories, thresholds, rule catalogs, monitoring, and remediation workflows.
- Full rollout of data ownership and stewardship assignments across all enterprise domains.
- Creation of a complete enterprise business glossary or metadata catalog.
- Production implementation of data classification, privacy controls, masking, encryption, retention automation, or access-control changes.
- Detailed data pipeline redesign, SQL Server migration execution, data migration, or production data-platform modernization work.
- Creation of source-to-target mappings for all enterprise systems.
- Operational support, production incident management, or ongoing data remediation.
- Formal audit remediation execution; this epic may identify audit-related gaps, but remediation should be handled through separate delivery initiatives.

## 4. Users and Stakeholders

| Role | Name / Team | Responsibility |
| --- | --- | --- |
| Executive Sponsor | Bradesco Leadership / Data Foundation Sponsor | Provides executive sponsorship, validates assessment direction, resolves escalations, and approves final recommendations. |
| Data Manager | @Michel Ferreira | Supervises alignment between the RSM team and Bradesco Bank teams, validates business expectations, and supports final review. |
| Technical Lead | @Enrique Escobar | Coordinates technical alignment, validates architecture and data-platform inputs, supports internal communication, and helps translate assessment findings into backlog items. |
| Data Analyst / Epic Owner | @David Tatis | Coordinates documentation, collects project inputs, supports assessment evidence gathering, and maintains epic deliverables. |
| RSM Assessment Team | RSM | Performs the Data Governance assessment, prepares maturity findings, defines governance framework recommendations, develops target-state architecture guidance, and produces roadmap deliverables. |
| Data Governance Lead | Data Foundation / Data Governance Team | Owns governance framework direction, reviews governance recommendations, and validates operating model feasibility. |
| Data Intelligence Team | Data Intelligence | Provides current-state data-platform context, source inventory knowledge, reporting and analytics context, and post-assessment ownership for selected remediation activities. |
| Architecture / Platform Team | Data Architecture / Infrastructure / Databricks Team | Reviews current and target-state architecture, platform constraints, Unity Catalog alignment, lineage, data quality, and security feasibility. |
| Infrastructure Team | Infrastructure | Supports server and database inventory validation, read-only access coordination, technical ownership mapping, and infrastructure-level discovery. |
| Business SMEs | Business and IT SMEs | Provide domain knowledge through interviews, validate current-state gaps, clarify data usage, and review governance recommendations. |
| Application / System Owners | Application Owners, Developers, Vendor Contacts | Explain business purpose, technical dependencies, integrations, reporting usage, operational status, and ownership for systems and databases in scope. |
| Data Owners | Assigned / Candidate Domain Owners | Accountable for business meaning, usage, quality, approval, and prioritization of data governance recommendations for assigned domains. |
| Data Stewards | Assigned / Candidate Domain Stewards | Support business definitions, metadata ownership, data quality expectations, glossary maintenance, and stewardship operating model design. |
| Risk, Compliance, and Audit | Risk / Compliance / Audit Stakeholders | Validate regulatory, auditability, classification, privacy, retention, and control expectations. |
| Security / Access Management | Information Security / IAM | Reviews access governance, security standards, classification, masking, sensitive data handling, and recommended control alignment. |
| Executive Readout Audience | Bradesco Leadership, Data Foundation, Business and IT Leadership | Reviews final findings, target-state recommendations, roadmap priorities, risks, and investment decisions. |

## 5. Current State

The current-state Data Governance assessment is in progress. Project initiation, stakeholder alignment, and initial discovery activities have been completed or are mostly complete, but the formal assessment outputs are still at an early stage. Available RSM planning materials indicate that the overall program is approximately 25% complete, with discovery activities mostly complete and analysis deliverables still limited.

Current evidence shows that Bradesco Bank has active data management, Data Intelligence, architecture, reporting, infrastructure, and Data Quality-related capabilities. However, these capabilities are not yet consistently connected through a formal enterprise Data Governance operating model. Governance activities appear to exist across teams and initiatives, but ownership, stewardship, decision rights, metadata standards, lineage, evidence tracking, and remediation processes are not yet fully documented or operationalized across domains.

The RSM work breakdown structure identifies several assessment workstreams currently in progress or pending, including governance operating model, data domains, data assets, metadata and catalog, data lineage, Data Quality, classification and privacy, current-state maturity scoring, gap analysis, target-state governance framework, target-state architecture, remediation roadmap, and executive readout.

At this stage, the strongest current-state evidence is project and inventory-oriented rather than findings-oriented. The available source files include WBS materials, project plan and milestone tracking, deliverable templates, SQL Server inventory and assessment workbooks, meeting notes, landing / bronze standardization frameworks, and a draft epic backlog seed. These sources establish assessment scope and methodology, but they do not yet provide a complete evidence register, maturity scorecard, enterprise gap matrix, risk register, or finalized Bradesco-specific findings.

Current-state completion by major area is summarized below:

| Assessment Area | Current-State Status | Evidence / Source |
| --- | --- | --- |
| Project Initiation and Planning | Mostly complete; kickoff, stakeholder alignment, methodology, and communication planning are complete or near complete. | RSM WBS; Project Plan workbook |
| Stakeholder Interviews | Started; initial interviews and coordination activities have occurred, with further validation still required. | Project Plan workbook; Infrastructure meeting summary |
| Current-State Governance Assessment | In progress; early analysis only, with limited Bradesco-specific findings visible. | RSM WBS; Epic Backlog Seed |
| Governance Operating Model | Early analysis; sponsorship, decision rights, stewardship, and ownership assessment are not yet fully populated. | RSM WBS; Governance Framework template |
| Data Domain Assessment | Started; candidate domains are identified, but ownership and stewardship assignment remains incomplete. | RSM WBS; Data Domains & Ownership epic |
| Data Asset / Source Inventory | In progress; SQL Server inventory and database discovery are underway, but access, ownership, business purpose, and scope validation remain incomplete. | SQL Assessment workbook; Infrastructure meeting summary |
| Metadata and Catalog Assessment | Started; business glossary, metadata standards, and catalog coverage require further evidence and definition. | RSM WBS; Target-State Architecture template |
| Data Lineage Assessment | Started; source-to-landing, landing-to-warehouse, warehouse-to-reporting, and regulatory traceability are not yet fully documented. | RSM WBS; Target-State Architecture template |
| Data Quality Assessment | Started; Data Quality dimensions and CDE concepts are identified, but rule inventory, thresholds, ownership, and remediation workflow are incomplete. | RSM WBS; Epic Backlog Seed |
| Security, Privacy, and Compliance Assessment | Started; classification and regulatory control assessment require additional evidence and stakeholder validation. | RSM WBS; Governance Policy template |
| Current-State Maturity Scorecard | Not produced; maturity scores across the ten governance dimensions are not yet populated. | RSM WBS; Current-State Maturity Assessment template |
| Enterprise Gap Analysis | Not produced; the formal gap matrix remains pending. | RSM WBS; Epic Backlog Seed |
| Risk Register | Not populated; governance risks are described directionally but not yet formalized into a register. | Epic Backlog Seed; Roadmap template |
| Target-State Architecture | Conceptual/template stage; detailed Bradesco-specific architecture decisions are not yet finalized. | Target-State Architecture template |
| Remediation Roadmap | Template only / early planning; prioritized initiatives and sequencing remain incomplete. | RSM WBS; Remediation Roadmap template |

### 5.1 Current-State Challenges

| Challenge | Impact | Evidence / Source | Priority |
| --- | --- | --- | --- |
| Current-state maturity scores are not yet populated. | The assessment cannot provide a reliable maturity baseline or quantify gaps by governance dimension. | Current-State Maturity Assessment template; RSM WBS | High |
| The formal enterprise gap matrix has not yet been produced. | Governance gaps remain directional and cannot yet be prioritized consistently by severity, risk, effort, or dependency. | RSM WBS; Epic Backlog Seed | High |
| Evidence-to-finding traceability is incomplete. | Findings may be difficult to defend during stakeholder review, audit review, or executive decision-making. | Epic Backlog Seed | High |
| Data ownership and stewardship roles are not consistently assigned across critical domains. | Data issues lack clear accountability, slowing issue resolution and weakening governance adoption. | Data Domains & Ownership epic; RSM WBS Ownership Assessment | High |
| Governance decision rights and escalation paths are not fully documented. | Policy decisions, issue prioritization, and cross-domain conflicts may be handled inconsistently. | Governance Framework template; RSM WBS Decision Rights Assessment | High |
| Critical data domains and data assets are still being identified and refined. | Domain boundaries, ownership assignments, stewardship responsibilities, and governance scope remain incomplete. | Data Domains & Ownership epic; RSM WBS; SQL Assessment workbook | High |
| SQL Server inventory discovery is incomplete due to access and ownership gaps. | The team cannot fully validate database purpose, functional ownership, integrations, reporting dependencies, or migration relevance. | SQL Assessment workbook; Infrastructure meeting summary | High |
| Metadata and business glossary coverage are immature. | Business definitions, ownership, and technical metadata are difficult to standardize, reuse, and govern. | RSM WBS Metadata & Catalog Assessment; Target-State Architecture template | High |
| Data lineage and traceability are not consistently documented end to end. | Impact analysis, regulatory traceability, and audit evidence may require manual investigation. | RSM WBS Lineage Assessment; Target-State Architecture template | High |
| Data Quality practices are not yet governed through a complete enterprise operating model. | DQ rules, CDE mappings, thresholds, scorecards, ownership, and remediation responsibilities may vary by team or domain. | RSM WBS Data Quality Assessment; Epic Backlog Seed | High |
| Classification, privacy, and access governance require further validation. | Sensitive data handling, access controls, classification coverage, and regulatory alignment may be inconsistent across platforms. | RSM WBS Security, Privacy & Compliance Assessment; Governance Policy template | Medium-High |
| Target-state architecture is still conceptual. | Governance controls for Databricks, Unity Catalog, lineage, metadata, security, and Data Quality cannot yet be translated into implementation-ready requirements. | Target-State Architecture template; RSM WBS | Medium-High |
| Remediation roadmap is not yet populated with prioritized initiatives. | Leadership does not yet have a clear investment sequence, dependency view, or 30/60/90-day execution plan. | Remediation Roadmap template; RSM WBS | High |
| Governance metrics and reporting are not yet established. | Leadership cannot consistently monitor ownership coverage, metadata completeness, lineage coverage, DQ maturity, issue resolution, or roadmap progress. | RSM WBS Monitoring & Reporting dimension; Governance Framework template | Medium |

## 6. Target State

The target state establishes a formal, enterprise Data Governance capability that supports Bradesco Bank’s cloud and Databricks modernization strategy. Governance should move from fragmented, project-specific practices to a documented and repeatable operating model with clear ownership, stewardship, decision rights, evidence, controls, and measurable adoption.

In the target state, Bradesco Bank has an approved Data Governance Framework, documented policies and standards, defined roles and responsibilities, and an architecture-aligned governance model that can be applied across priority domains, data assets, platforms, and reporting use cases. Governance expectations are embedded into the data lifecycle from source discovery and ingestion through landing, bronze, curated, warehouse, reporting, and consumption layers.

The target state should support the following outcomes:

- Critical data domains are identified, documented, prioritized, and assigned accountable owners and stewards.
- Governance policies, standards, decision rights, and escalation paths are documented and approved.
- Metadata, glossary, catalog, lineage, classification, retention, and Data Quality expectations are defined and measurable.
- Current-state maturity and gaps are supported by an evidence register and reviewed stakeholder observations.
- Target-state architecture guidance aligns with Databricks, Unity Catalog, medallion architecture, landing and bronze controls, access governance, lineage, metadata, and Data Quality capabilities.
- Remediation initiatives are prioritized by risk, business value, effort, dependency impact, and implementation readiness.
- Leadership has a clear roadmap for 30/60/90-day actions and longer-term governance adoption.

The target state is not limited to producing static documentation. The assessment should create a practical governance baseline that can be converted into delivery backlog items, operating routines, ownership assignments, architecture guardrails, and measurable governance controls.

### 6.1 Target-State Capabilities

| Capability | Target-State Description | Success Indicator |
| --- | --- | --- |
| Governance Framework | A documented enterprise Data Governance Framework defines scope, principles, roles, responsibilities, decision rights, escalation paths, and operating cadence. | Framework reviewed and approved by stakeholders. |
| Governance Operating Model | Governance bodies, working groups, owners, stewards, custodians, and technical teams have clear responsibilities and participation expectations. | RACI and decision-rights model approved and ready for implementation planning. |
| Data Ownership and Stewardship | Critical domains and priority data assets have assigned or candidate Data Owners and Data Stewards. | Ownership / stewardship matrix completed for priority domains, with gaps and next actions documented. |
| Data Domain Register | Critical business data domains are defined, prioritized, and maintained in a centralized register. | Data Domain Register published for in-scope domains. |
| Current-State Maturity Baseline | Governance maturity is assessed across the defined maturity dimensions using evidence and stakeholder validation. | Maturity scorecard completed across all governance dimensions. |
| Evidence Register | Findings and maturity scores are traceable to interviews, documents, inventories, architecture artifacts, and technical evidence. | Evidence register completed and linked to findings. |
| Enterprise Gap Matrix | Current-state gaps are documented against target-state expectations, with severity, impact, owner, dependency, and recommended action. | Gap matrix completed and reviewed. |
| Risk Register | Governance risks are formally documented, prioritized, and linked to mitigation actions. | Risk register completed and accepted by assessment stakeholders. |
| Metadata and Business Glossary | Business metadata, technical metadata, glossary ownership, definition standards, and catalog coverage expectations are defined. | Metadata and glossary gaps documented with target-state recommendations. |
| Lineage and Traceability | Lineage expectations are defined from source through landing, warehouse, reporting, and regulatory traceability paths. | Lineage gaps documented and priority lineage use cases identified. |
| Data Quality Governance | Data Quality dimensions, CDE ownership, rule-definition approach, thresholds, exception handling, scorecards, and remediation workflow are defined. | DQ governance recommendations completed and linked to CDE / ownership remediation items. |
| Classification, Privacy, and Compliance | Classification model, sensitive data handling, access governance, retention, auditability, and regulatory control alignment are included in governance recommendations. | Security, privacy, and compliance recommendations reviewed by appropriate stakeholders. |
| Architecture Alignment | Governance recommendations are aligned with cloud / Databricks architecture, including Unity Catalog, medallion architecture, metadata, lineage, access controls, and Data Quality architecture. | Target-state conceptual data architecture completed and approved. |
| Landing and Bronze Governance Controls | Landing and Bronze layer expectations are defined for source fidelity, traceability, idempotency, schema visibility, quarantine, retention, observability, and ownership. | Landing / Bronze governance controls mapped to platform standards or remediation needs. |
| Monitoring and Reporting | Governance KPIs and reporting expectations are defined for maturity, ownership coverage, catalog completeness, lineage coverage, DQ issue resolution, and roadmap progress. | Governance reporting requirements documented and included in roadmap. |
| Remediation Roadmap | Remediation initiatives are sequenced across quick wins, foundation initiatives, governance program buildout, and enterprise expansion. | Prioritized roadmap and 30/60/90-day action plan completed and approved. |
| Executive Readout | Leadership receives a concise view of current maturity, major gaps, risk exposure, target-state recommendations, and investment priorities. | Executive presentation completed and delivered. |

## 7. Architecture and Design

The architecture and design scope for this epic defines how Data Governance capabilities should align with Bradesco Bank’s target cloud and Databricks data architecture. This section does not represent a production implementation design. It provides the conceptual governance architecture direction that should be validated through the RSM target-state architecture deliverable and translated into future implementation backlog items.

The target design should embed governance controls across the data lifecycle, from source discovery and ingestion through landing, bronze, curated, warehouse, reporting, and consumption layers. Governance should not operate as a separate documentation exercise only; it should be connected to platform controls, data-domain ownership, metadata capture, lineage, Data Quality monitoring, classification, access management, retention, and auditability.

At a conceptual level, the target architecture should include the following design components:

| Design Component | Target Design Intent | Governance Relevance |
| --- | --- | --- |
| Source and System Inventory | Maintain a validated inventory of in-scope systems, databases, data assets, owners, purpose, integrations, and operational status. | Establishes the evidence base for ownership, lineage, criticality, migration readiness, and governance scope. |
| Landing Layer | Preserve source deliveries with delivery identity, technical validation, schema visibility, quarantine, replay support, and controlled release. | Provides traceability and operational evidence before data enters downstream processing layers. |
| Bronze Layer | Store source-aligned, queryable raw history with load identity, record traceability, schema evolution controls, idempotency, and immutable historical evidence. | Supports auditability, reproducibility, lineage, and governance over raw source-aligned records. |
| Curated / Silver Layer | Apply approved cleansing, standardization, validation, and Data Quality controls for governed data assets. | Enables steward-reviewed quality expectations, CDE rules, exceptions, and remediation workflows. |
| Consumption / Gold Layer | Publish certified business-ready datasets, reporting objects, data products, aggregates, and analytical assets. | Supports trusted consumption, certified metrics, business ownership, and usage governance. |
| Unity Catalog / Catalog Layer | Provide centralized metadata, namespace management, access control, lineage visibility, table ownership, and sensitivity tagging. | Serves as a key enforcement and visibility point for governance controls in Databricks. |
| Metadata and Business Glossary | Define business terms, technical metadata, ownership fields, domain mappings, and catalog completeness expectations. | Improves shared understanding, impact analysis, governance accountability, and reuse. |
| Lineage and Traceability | Capture lineage from source through platform layers and downstream reporting or regulatory outputs. | Enables impact analysis, audit response, regulatory traceability, and change governance. |
| Data Quality Architecture | Define where profiling, validation rules, thresholds, exceptions, issue tracking, and scorecards should operate. | Connects quality controls to CDE ownership, steward review, and remediation accountability. |
| Classification and Access Controls | Apply data classification, sensitive data handling, RBAC / group-based access, masking, and audit logging where appropriate. | Supports privacy, security, compliance, and least-privilege access. |
| Governance Workflow and Evidence | Maintain approval records, issue logs, review outcomes, decision logs, evidence registers, and remediation tracking. | Ensures findings and governance decisions are defensible, auditable, and actionable. |
| Monitoring and Reporting | Track governance KPIs such as ownership coverage, glossary completeness, catalog coverage, lineage coverage, DQ rule coverage, open issues, and roadmap progress. | Provides leadership visibility into governance adoption and control effectiveness. |

The conceptual design should follow these architecture principles:

- Governance controls should be embedded into the data lifecycle rather than handled only through offline documentation.
- Ownership and stewardship should be assigned as close as possible to business domains and critical data assets.
- Metadata, lineage, classification, and quality controls should be captured consistently and reused across governance, architecture, compliance, and delivery processes.
- Landing and Bronze layers should preserve source fidelity, traceability, replayability, and evidence before downstream transformation.
- Curated and consumption layers should enforce approved quality, certification, and usage expectations.
- Target-state architecture should support current assessment needs while remaining scalable for future domain expansion, Databricks adoption, AI readiness, regulatory traceability, and enterprise reporting.

The final architecture package should include a target-state conceptual architecture diagram, governance-to-platform control mapping, domain / ownership alignment, key design decisions, major trade-offs, and dependencies that must be resolved before implementation.

## 8. Data Requirements

The Data Governance Gap Analysis requires a reliable evidence base across governance documentation, stakeholder interviews, system inventories, database inventories, ownership mappings, and current-state architecture inputs. The current evidence set includes RSM assessment materials, Bradesco project documentation, SQL Server inventory workbooks, and infrastructure coordination notes.

A key current-state finding is that technical inventory data alone is not sufficient to complete the governance assessment. The SQL Server assessment workbook provides server and database-level discovery fields, but several records still require validation of business purpose, technical owner, functional owner, application owner, vendor ownership, integrations, ETL dependencies, reporting usage, operational status, and migration relevance. The infrastructure meeting summary confirms that read-only technical access can identify databases and metadata, but stakeholder input is required to determine actual usage, ownership, dependencies, and governance accountability.

The data requirements for this epic therefore include both technical inventory data and business / governance validation data.

### 8.1 Source Data

| Source | Object / Artifact | Description | Current Gap / Validation Need | Refresh Frequency | Owner |
| --- | --- | --- | --- | --- | --- |
| RSM Assessment Materials | WBS, project plan, deliverable templates, methodology artifacts | Defines assessment phases, deliverables, milestones, and expected governance outputs. | Must be reconciled with actual completed deliverables, evidence, and stakeholder-reviewed findings. | As updated by project team | RSM / Bradesco Team |
| SQL Server Assessment Workbook | Server inventory tab | Inventory of servers, hostnames, IPs, locations, database technologies, environments, in-scope flags, support status, criticality, and review status. | In-scope classification, duplicate server handling, support status, ownership, access status, and SQL Server scope require validation. | During assessment waves | Data Intelligence / Infrastructure |
| SQL Server Assessment Workbook | Database inventory tab | Database-level records linked to servers, including database name, version, state, size, backup information, environment, and discovery fields. | Business purpose, technical use, integrations, ETL dependencies, reports, operational status, functional owner, technical owner, vendor owner, and migration recommendation require validation. | During assessment waves | Data Intelligence / Infrastructure / Application Owners |
| SQL Server Assessment Workbook | Questions tab | Open discovery questions related to duplicates, database scope, access, ownership, SQL Compact scope, Data Quality, and HA / DR. | Questions require assigned owners, answers, decisions, and closure status. | Weekly during discovery | Data Intelligence / Infrastructure |
| Infrastructure Meeting Summary | DB Consolidation - Infrastructure Coordination notes | Captures current blocker, ownership discovery needs, access coordination, and proposed infrastructure support model. | Follow-up required for read-only access, owner mapping, vendor-managed systems, and validation of inactive / legacy records. | As meetings occur | Infrastructure / Data Intelligence |
| Stakeholder Interviews | Interview notes and validation outcomes | Business and technical input used to confirm database purpose, dependencies, ownership, reporting usage, and governance accountability. | Interview coverage is incomplete; additional SMEs, application owners, vendors, and business contacts must be identified. | Per interview wave | RSM / Bradesco Team |
| Governance Assessment Templates | Current-state maturity assessment, governance framework, target architecture, remediation roadmap | Defines required assessment outputs and target-state structure. | Templates contain placeholders and must be populated with Bradesco-specific evidence, scores, findings, risks, and remediation actions. | Per deliverable cycle | RSM |
| Data Domains & Ownership Epic | Data domain ownership and stewardship scope | Defines ownership/stewardship objectives and target of assigning owners/stewards for critical domains. | Candidate domains, owners, stewards, approval status, and domain boundaries require validation. | During domain assessment | Data Governance / Data Intelligence |
| Landing and Bronze Frameworks | LND and BRZ standardization frameworks | Provides governance control expectations for source fidelity, traceability, idempotency, schema visibility, quarantine, retention, observability, and ownership. | Must be mapped to Bradesco target-state architecture and implementation readiness. | As standards evolve | Data Architecture / Data Governance |

### 8.2 Source Inventory and Ownership Requirements

The assessment must produce or validate a source inventory that supports governance decision-making, not only infrastructure tracking. Each in-scope system, server, database, or data asset should be enriched with the fields needed to determine accountability, business relevance, criticality, migration readiness, and governance control needs.

| Requirement Area | Required Information | Purpose | Current Status |
| --- | --- | --- | --- |
| Server Identification | Server ID, hostname, IP address, location, network, installed database engine, SQL Server version, environment, support status. | Establishes the technical estate and confirms SQL Server assessment scope. | Partially available in SQL Server assessment workbook. |
| Database Identification | Database ID, linked server ID, database name, SQL version, state, size, backup information, file locations, environment. | Establishes database-level inventory and technical discovery baseline. | Partially available in SQL Server assessment workbook. |
| Scope Classification | In-scope / out-of-scope flag, scope rationale, SQL Server vs non-SQL Server validation, SQL Compact disposition. | Prevents irrelevant assets from inflating the assessment backlog. | Partially available; requires validation. |
| Business Purpose | Functional description, business process supported, active / legacy / inactive status, business criticality. | Determines whether the database is governed, migrated, consolidated, retired, or further analyzed. | Incomplete; requires application and business owner input. |
| Ownership Mapping | Technical owner, functional owner, application owner, infrastructure owner, vendor contact, business SME. | Establishes accountability for validation, decisions, quality issues, and remediation. | Incomplete; identified as a current blocker. |
| Integration and ETL Dependencies | Inbound feeds, outbound feeds, ETL jobs, file exchanges, application dependencies, reporting dependencies. | Supports lineage, impact analysis, migration planning, and operational risk assessment. | Incomplete; requires stakeholder interviews. |
| Reporting and Consumption | Reports, dashboards, extracts, regulatory outputs, operational workflows, downstream consumers. | Supports criticality, lineage, data quality prioritization, and governance scope. | Incomplete; requires business validation. |
| Operational Status | Active, inactive, legacy, closed, DR, unknown, pending validation. | Helps prioritize assessment effort and avoid unnecessary interviews or migration work. | Partially available; requires validation. |
| Access and Discovery Status | Read-only access status, discovery source, reviewed flag, pending access actions. | Determines whether technical metadata can be independently validated. | Incomplete; infrastructure support required. |
| Data Governance Relevance | Candidate data domain, data owner, data steward, CDE relevance, classification, retention, lineage priority, DQ priority. | Connects technical inventory to governance framework and roadmap actions. | Mostly incomplete; should be produced through the assessment. |

### 8.3 Target Data Products

| Data Product | Description | Consumer | SLA / Timing | Owner |
| --- | --- | --- | --- | --- |
| Validated Source Inventory | Consolidated inventory of in-scope systems, servers, databases, owners, purpose, scope status, and discovery status. | Data Governance, Data Intelligence, Infrastructure, Architecture, RSM | Updated through assessment waves | Data Intelligence / Infrastructure |
| Ownership and Contact Matrix | Mapping of databases, systems, domains, application owners, functional owners, technical owners, vendors, and SMEs. | RSM, Data Governance, Data Intelligence, Business and IT stakeholders | Required before findings validation | Data Intelligence / Infrastructure / Business SMEs |
| Open Questions and Decisions Register | Tracked questions, assigned owners, answers, decisions, status, and closure dates. | Project team and assessment stakeholders | Reviewed weekly during discovery | RSM / Data Intelligence |
| Evidence Register | Traceability from findings to source files, interviews, inventory records, meeting notes, and technical evidence. | RSM, Bradesco stakeholders, audit / compliance reviewers | Required before final assessment approval | RSM |
| Current-State Maturity Scorecard | Scored maturity baseline across governance dimensions. | Leadership, Data Governance, Data Foundation, RSM | Targeted for current-state review milestone | RSM / Bradesco Team |
| Enterprise Gap Matrix | Documented gaps between current state and target-state expectations, with severity, impact, evidence, owner, and recommended action. | Leadership, Data Governance, delivery teams | Required for target-state and roadmap review | RSM |
| Risk Register | Governance, ownership, metadata, lineage, DQ, compliance, architecture, and delivery risks with mitigations. | Leadership, Risk / Compliance, project team | Required for target-state review | RSM / Bradesco Team |
| Prioritized Remediation Roadmap | Sequenced remediation actions including quick wins, foundation work, 30/60/90-day plan, dependencies, and longer-term roadmap. | Leadership, Data Governance, delivery teams | Required before executive readout | RSM / Bradesco Team |

## 9. Functional Requirements

The functional requirements for this epic are mapped to the RSM assessment WBS work packages for Current State Maturity Assessment, Gap Analysis, Target State Governance Framework, Target State Data Architecture, and Prioritized Remediation Roadmap. These requirements define what must be produced, reviewed, and approved for the Data Governance Gap Analysis epic to be considered complete.

| ID | WBS ID | Requirement | Priority | Acceptance Criteria |
| --- | --- | --- | --- | --- |
| FR-001 | 7.0 | Complete the Current State Maturity Assessment across the defined Data Governance dimensions. | Must | Maturity assessment is completed across Strategy & Vision, Policies & Standards, Organization & Roles, Metadata & Catalog, Data Lineage, Data Quality, Classification & Privacy, Retention & Records, Architecture & Platform, and Monitoring & Reporting. |
| FR-002 | 7.1 | Assess Strategy & Vision maturity. | Must | Governance mandate, executive sponsorship, strategic objectives, program scope, and alignment with cloud / Databricks modernization are scored and documented. |
| FR-003 | 7.2 | Assess Policies & Standards maturity. | Must | Existing policy, standard, control, regulatory, and data-management documentation is reviewed; policy gaps and required standards are documented. |
| FR-004 | 7.3 | Assess Organization & Roles maturity. | Must | Data ownership, stewardship, custodianship, governance participation, accountability, and role-definition gaps are documented. |
| FR-005 | 7.4 | Assess Metadata & Catalog maturity. | Must | Business glossary, business metadata, technical metadata, catalog coverage, ownership fields, and metadata standards are assessed and scored. |
| FR-006 | 7.5 | Assess Data Lineage maturity. | Must | Source-to-landing, landing-to-warehouse, warehouse-to-reporting, and regulatory traceability capabilities are assessed and scored. |
| FR-007 | 7.6 | Assess Data Quality maturity. | Must | Data Quality dimensions, CDE readiness, rule definition, thresholds, monitoring, scorecards, issue management, and remediation ownership are assessed and scored. |
| FR-008 | 7.7 | Assess Classification & Privacy maturity. | Must | Classification model, sensitive data handling, privacy controls, access governance, and regulatory alignment are assessed and scored. |
| FR-009 | 7.8 | Assess Retention & Records maturity. | Should | Retention expectations, records-management alignment, lifecycle controls, and retention gaps are assessed and documented. |
| FR-010 | 7.9 | Assess Architecture & Platform maturity. | Must | Current and target architecture alignment, Databricks readiness, Unity Catalog considerations, platform controls, and governance architecture gaps are assessed. |
| FR-011 | 7.10 | Assess Monitoring & Reporting maturity. | Should | Governance KPI, dashboard, scorecard, issue tracking, lineage coverage, catalog completeness, and roadmap-progress reporting gaps are assessed. |
| FR-012 | 8.0 | Produce the Enterprise Gap Matrix. | Must | Gap matrix is completed with governance, technology, organizational, metadata, lineage, and Data Quality gaps, including severity, impact, evidence, owner, priority, and recommended action. |
| FR-013 | 8.1 | Document Governance Gaps. | Must | Governance operating model, sponsorship, decision rights, policy, stewardship, ownership, and escalation gaps are documented. |
| FR-014 | 8.2 | Document Technology Gaps. | Must | Platform, tooling, catalog, lineage, access-control, Databricks / Unity Catalog, landing, bronze, and architecture-control gaps are documented. |
| FR-015 | 8.3 | Document Organizational Gaps. | Must | Role clarity, ownership coverage, stewardship capacity, stakeholder participation, operating cadence, and decision accountability gaps are documented. |
| FR-016 | 8.4 | Document Metadata Gaps. | Must | Business glossary, metadata standards, catalog completeness, ownership metadata, source inventory, and domain mapping gaps are documented. |
| FR-017 | 8.5 | Document Lineage Gaps. | Must | End-to-end lineage, regulatory traceability, source-to-report mapping, integration visibility, and impact-analysis gaps are documented. |
| FR-018 | 8.6 | Document Data Quality Gaps. | Must | CDE inventory, DQ ownership, rule catalog, thresholds, scorecards, monitoring, exception handling, and remediation workflow gaps are documented. |
| FR-019 | 9.0 | Define the Target State Governance Framework. | Must | Governance operating model is documented, reviewed, and aligned with target-state governance principles and Bradesco stakeholder expectations. |
| FR-020 | 9.1 | Define Governance Vision. | Must | Governance vision statement and guiding principles are documented and reviewed. |
| FR-021 | 9.2 | Design Governance Council / Decision Body. | Must | Governance council or equivalent decision body is defined with purpose, participants, authority, cadence, and escalation role. |
| FR-022 | 9.3 | Design Stewardship Model. | Must | Data Owner, Data Steward, Technical Steward, Data Custodian, and supporting governance roles are defined with responsibilities. |
| FR-023 | 9.4 | Develop RACI Matrix. | Must | RACI matrix is completed for policy, ownership, metadata, lineage, Data Quality, access, issue management, and roadmap execution decisions. |
| FR-024 | 9.5 | Define Escalation Framework. | Must | Escalation paths are documented for unresolved data issues, policy exceptions, ownership conflicts, cross-domain decisions, and compliance concerns. |
| FR-025 | 9.6 | Define Decision Rights Framework. | Must | Decision areas, accountable roles, approval authorities, consulted stakeholders, and informed groups are documented. |
| FR-026 | 10.0 | Define Target State Data Architecture. | Must | Target architecture package is completed with conceptual architecture, governance-to-platform control mapping, and key design decisions. |
| FR-027 | 10.1 | Define Enterprise Domain Model. | Should | Candidate enterprise domains, domain boundaries, ownership alignment, and relationship to data products / platform namespaces are documented. |
| FR-028 | 10.2 | Define Governance Architecture. | Must | Governance architecture describes how metadata, lineage, classification, access, DQ, ownership, and monitoring controls are embedded in the platform. |
| FR-029 | 10.2.1 | Define Unity Catalog Architecture. | Must | Unity Catalog role in metadata, namespace hierarchy, permissions, ownership, classification, and lineage is documented. |
| FR-030 | 10.2.2 | Define Metadata Architecture. | Must | Metadata capture, glossary integration, catalog coverage, ownership metadata, and completeness expectations are documented. |
| FR-031 | 10.2.3 | Define Data Quality Architecture. | Must | DQ control points, rule execution approach, CDE alignment, scorecards, exception handling, and remediation workflow are documented. |
| FR-032 | 10.2.4 | Define Lineage Architecture. | Must | Lineage capture approach, source-to-consumption traceability, regulatory traceability, and impact-analysis support are documented. |
| FR-033 | 10.2.5 | Define Security Architecture. | Must | Classification, access-control model, sensitive data handling, RBAC / group-based permissions, masking, audit logging, and compliance controls are documented. |
| FR-034 | 10.3 | Define Medallion Architecture Design. | Should | Landing, Bronze, Silver, and Gold responsibilities are described with governance control expectations and handoff points. |
| FR-035 | 11.0 | Produce the Prioritized Remediation Roadmap. | Must | Roadmap is completed with prioritized initiatives, effort, dependency impact, sequencing, owners, timing, and implementation phases. |
| FR-036 | 11.1 | Define Quick Wins for 0-90 Days. | Must | 30/60/90-day action plan is documented with actions, owners, deliverables, dependencies, and status. |
| FR-037 | 11.2 | Define Foundation Initiatives for 3-6 Months. | Should | Foundational governance initiatives are documented, prioritized, and sequenced after quick wins. |
| FR-038 | 11.3 | Define Governance Program Initiatives for 6-12 Months. | Should | Program-level operating model, stewardship, metadata, lineage, DQ, and reporting initiatives are sequenced. |
| FR-039 | 11.4 | Define Enterprise Expansion Roadmap for 12-24 Months. | Should | Longer-term domain expansion, platform enablement, governance automation, and maturity growth roadmap is documented. |
| FR-040 | 7.0 / 8.0 / 11.0 | Maintain traceability from maturity scores to gaps and remediation actions. | Must | Each major finding links to maturity dimension, evidence source, gap, risk, recommended action, and roadmap initiative. |

## 10. Non-Functional Requirements

| Category | Requirement | Target |
| --- | --- | --- |
| Performance | Deliver assessment outputs within project timeline. | 10 weeks |
| Availability | Governance artifacts accessible to stakeholders. | 100% availability in approved folder. |
| Security | Documentation follows bank security standards. | No unauthorized access to project artifacts. |
| Data Quality | Recommendations are based on validated information. | Stakeholder review and approval obtained. |
| Observability | Progress and decisions are tracked. | Status updates and meeting notes maintained. |
| Scalability | Framework supports future governance/cloud expansion. | Applicable across multiple business domains. |
| Compliance | Governance recommendations align with regulatory requirements. | Compliance and risk stakeholders review deliverables. |

## 11. Data Quality and Validation

### 11.1 Data Quality Rules

N/A

## 12. Security, Governance, and Compliance

### 12.1 Access Control

| Role / Group | Access Level | Data Scope |
| --- | --- | --- |
| RSM Assessment Team | Read | Governance, Architecture, and project documentation |
| Data Intelligence Team | Read / Write | Assessment Artifacts and Deliverables |
| Business Stakeholders | Read / Write | Governance Framework and policy Documents |

### 12.2 Governance Requirements

- Data classification: Consider data classification requirements in governance recommendations
- PII / sensitive data handling: Align recommendations with existing regulatory and security requirements
- Data retention: Review current retention practices and identify governance gaps
- Audit logging: Include auditability considerations in governance recommendations
- Lineage: Assess current lineage capabilities and future-state requirements
- Approval workflow: Define governance decision-making and approval processes
- Business glossary updates: Recommend ownership and maintenance approach

## 13. Dependencies

| Dependency | Type | Owner | Status | Notes |
| --- | --- | --- | --- | --- |
| Stakeholder Interviews | Team | Business & IT SMEs | Open | Required for assessment validation |
| RSM Deliverables | Vendor | RSM | Open | Framework, Policy, Architecture, and Action Plan |
| Executive Review & Approval | Team | Sponsors | Open | Required for final sign-off |

## 14. Risks and Mitigations

| Risk | Impact | Probability | Mitigation | Owner |
| --- | --- | --- | --- | --- |
| Delayed stakeholder participation | High | Medium | Schedule interviews early and track attendance | Project Team |
| Incomplete documentation | High | Medium | Identify document gaps and request alternatives | Data Intelligence |
| Delays in deliverable reviews | High | Medium | Establish review deadlines and escalation path | RSM |

## 15. Delivery Plan

### 15.1 Milestones

| Milestone | Target Date | Owner | Status |
| --- | --- | --- | --- |
| Project Kickoff Complete |  | RSM / Bradesco | Complete |
| Current-State assessment |  | RSM | In progress |
| DG Framework draft |  | RSM | Not Started |
| Sample DG Policy |  | RSM | Not Started |
| Future Architecture | Sept 04, 2026 | RSM | Not Started |
| 30/60/90 Action Plan | Sept 18, 2026 | RSM | Not Started |
| Final review | Sept 30, 2026 | RSM / Bradesco | Not Started |

## 16. Jira / Backlog Links

| Item Type | Key / Link | Description |
| --- | --- | --- |
| Epic |  | Gap analysis Jira Epic |
| Story |  |  |
| Spike |  |  |
| Defect |  |  |

## 17. Acceptance Criteria

The epic is complete when:

- Current-state assessment is completed and reviewed.
- Data Governance Framework is documented.
- Sample Data Governance Policy is delivered and reviewed.
- Future-State Conceptual Data Architecture Diagram is completed.
- 30/60/90-Day Action Plan is documented.
- Key stakeholders have reviewed and provided feedback on deliverables.
- Executive readout has been completed.
- Final project documentation has been published and stored in the approved repository.

## 18. Operational Readiness

| Area | Requirement | Status |
| --- | --- | --- |
| Monitoring | N/A | N/A |
| Alerting | N/A | N/A |
| Runbook | Final deliverables stored in approved place | Not Started |
| Support Model | DI owns post-assessment activities | Not Started |
| SLA / SLO | N/A | N/A |

## 19. Open Questions

| Question | Owner | Due Date | Status |
| --- | --- | --- | --- |
|  |  |  | Open |

## 20. Decision Log

| Date | Decision | Owner | Notes |
| --- | --- | --- | --- |
| Jul 2026 | Engage RSM to perform Data Governance Assessment | Bradesco | Approved |
| Jul 2026 | Adopt governance assessment and roadmap approach | Bradesco | Approved |
| TBD | Approve Data Governance Framework | Data foundation / RSM | Pending |
| TBD | Approve Future State Architecture | IT | Pending |
| TBD | Approve 30/60/90 action plan | Data foundation | Pending |

## 21. Related Documents

- RSM Share folder: [https://rsmnet.sharepoint.com/teams/td\_7191464/00024/SitePages/NewHome.aspx](https://rsmnet.sharepoint.com/teams/td_7191464/00024/SitePages/NewHome.aspx)

## 22. Change Log

| Date | Change | Author |
| --- | --- | --- |
|  | Initial draft |  |

## Recommended Confluence Labels

Add these labels to the page:

- text
- epic template
- data-platform
- architecture
- delivery
- governance

## RSM Deliverables

### RSM List

| Deliverable | Description |
| --- | --- |
| Current-state maturity assessment | Scored baseline across all governance components, with prioritized observations based on the assessment framework |
| Governance framework & policy recommendations | Policy sample draft, standards, and stewardship model to sustain governance |
| Target-state conceptual data architecture | Conceptual data architecture on Cloud / Databricks and a governance operating model |
| Prioritized remediation roadmap | Risk-based, sequenced actions with effort and dependency guidance, along with a 30/60/90-day action plan |
| Final readout | Leadership-ready summary of findings, target state, and the path forward, which can be leveraged for the business plan |

# Epic Children
