# DataGovernanceGapAnalysis

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

The Data Governance Gap Analysis supports Bradesco Bank’s broader cloud and data modernization strategy by assessing the current maturity of governance capabilities and defining the foundational improvements required before scaling governance across domains, platforms, and future Databricks-based architecture. This assessment focuses on identifying gaps across governance operating model, data ownership, stewardship, metadata, lineage, data quality, classification, privacy, retention, architecture, and governance reporting. The outcome will provide a structured view of current-state maturity, target-state expectations, prioritized remediation actions, and a practical roadmap for moving toward a more governed, auditable, and scalable data environment. Inputs for this assessment include RSM assessment deliverables, current-state governance and architecture artifacts, stakeholder interviews, data domain analysis, critical BR-file domain mapping, and existing Data Quality Framework materials.

### 2.1 Business Problem

- What pain point are we solving?
    - Data governance, ownership, standards, and metadata management are inconsistently applied across the organization.
- Who is impacted?
    - Business users, Data Intelligence teams, leadership, audit and compliance.
- Why does this matter now?
    - The bank is migrating to the cloud and needs governance foundations to ensure a successful transformation.
- What happens if we do nothing?
    - Data quality, accountability, compliance, and analytics challenges will continue and may increase during cloud adoption.

Bradesco Bank currently has several governance capabilities in progress, but they are not yet consistently formalized, measured, or operationalized across the enterprise. Data ownership, stewardship, metadata management, lineage, data quality controls, and governance decision rights are handled inconsistently across domains and systems. Key pain points include: Data ownership and stewardship roles are not consistently defined across critical data domains. Governance policies, standards, decision rights, and escalation paths require formalization. Metadata, business glossary, cataloging, and lineage capabilities are not consistently applied. Critical data domains and data assets have started to be identified, but ownership, stewardship, and domain boundaries still need validation. Data Quality practices exist through related initiatives, but enterprise-level alignment between governance, CDEs, rules, monitoring, and remediation is still incomplete. Current-state maturity scores, evidence registers, findings, and remediation initiatives are not yet fully populated. Target-state architecture and governance operating model need to be connected to the cloud / Databricks modernization strategy. Without a structured gap analysis, governance improvements may remain fragmented, reactive, and difficult to prioritize. This matters now because the bank is moving toward a cloud and Databricks-aligned architecture. Without a clear governance baseline and roadmap, data quality, accountability, compliance, lineage, and trusted analytics challenges may increase during migration and modernization. If no action is taken: Regulatory and audit traceability may remain manual and inconsistent. Data quality issues may lack clear ownership and escalation. Critical data domains may continue without approved owners and stewards. Metadata and lineage gaps may limit impact analysis and control effectiveness. Cloud modernization may replicate existing governance weaknesses in the target platform. Future AI, BI, analytics, and data product initiatives may lack trusted governance foundations.

### 2.2 Business Goals

| Goal | Description | Success Indicator |
| --- | --- | --- |
| Data Governance Framework | Define governance domains, roles, responsibilities, and decision rights. | Data Governance Framework completed and approved. |
| Data Governance Policy | Develop a sample policy outlining governance principles and standards. | Sample Data Governance Policy delivered and reviewed. |
| Future-State Data Architecture | Define the target conceptual architecture aligned with cloud and data strategy. | Future-State Architecture Diagram completed and approved. |
| Action Plan & Roadmap | Define prioritized governance initiatives and next steps. | 30/60/90-Day Action Plan delivered and approved. |
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

At this stage, the strongest current-state evidence is planning- and template-oriented rather than findings-oriented. The available local source files include WBS materials, project plan and milestone tracking, deliverable templates, workbook metrics, the WBS hierarchy export, the Data Domains & Ownership epic, and a draft epic backlog seed. These sources establish assessment scope and methodology, but they do not yet provide a complete evidence register, maturity scorecard, enterprise gap matrix, risk register, or finalized Bradesco-specific findings.

Current-state completion by major area is summarized below:

| Assessment Area | Current-State Status | Evidence / Source |
| --- | --- | --- |
| Project Initiation and Planning | Mostly complete; kickoff, stakeholder alignment, methodology, and communication planning are complete or near complete. | RSM WBS; Project Plan workbook |
| Stakeholder Interviews | Started; initial interviews and coordination activities have occurred, with further validation still required. | Project Plan workbook |
| Current-State Governance Assessment | In progress; early analysis only, with limited Bradesco-specific findings visible. | RSM WBS; Epic Backlog Seed |
| Governance Operating Model | Early analysis; sponsorship, decision rights, stewardship, and ownership assessment are not yet fully populated. | RSM WBS; Governance Framework template |
| Data Domain Assessment | Started; candidate domains are identified, but ownership and stewardship assignment remains incomplete. | RSM WBS; Data Domains & Ownership epic |
| Data Asset / Source Inventory | In progress per WBS; source inventory, ownership, business purpose, and scope validation remain incomplete. | RSM WBS; Project Plan workbook |
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
| Critical data domains and data assets are still being identified and refined. | Domain boundaries, ownership assignments, stewardship responsibilities, and governance scope remain incomplete. | Data Domains & Ownership epic; RSM WBS | High |
| Source inventory validation is incomplete due to ownership and business-purpose gaps. | The team cannot fully validate data asset purpose, functional ownership, integrations, reporting dependencies, or migration relevance. | RSM WBS Source System Inventory; Data Domains & Ownership epic | High |
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

### High-Level Architecture

**To be attached:** Future-State Conceptual Data Architecture Diagram (RSM Deliverable).

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

The Data Governance Gap Analysis requires a reliable evidence base across governance documentation, stakeholder interviews, system inventories, database inventories, ownership mappings, and current-state architecture inputs. The current local evidence set includes RSM assessment materials, WBS exports, project milestone tracking, governance deliverable templates, and related domain ownership documentation.

A key current-state finding is that technical inventory data alone will not be sufficient to complete the governance assessment. The WBS identifies source system inventory and data asset assessment workstreams, but those workstreams still require validation of business purpose, technical owner, functional owner, application owner, vendor ownership where applicable, integrations, ETL dependencies, reporting usage, operational status, and governance relevance. Stakeholder input is required to determine actual usage, ownership, dependencies, and governance accountability.

The data requirements for this epic therefore include both technical inventory data and business / governance validation data.

### 8.1 Source Data

| Source | Object / Artifact | Description | Current Gap / Validation Need | Refresh Frequency | Owner |
| --- | --- | --- | --- | --- | --- |
| RSM Assessment Materials | WBS, project plan, deliverable templates, methodology artifacts | Defines assessment phases, deliverables, milestones, and expected governance outputs. | Must be reconciled with actual completed deliverables, evidence, and stakeholder-reviewed findings. | As updated by project team | RSM / Bradesco Team |
| Source System Inventory Workstream | WBS 2.3.1 Source System Inventory | Required inventory of source systems, servers, databases, ownership, purpose, scope, access status, and governance relevance. | Inventory content is not visible in the local source package and must be produced or linked before final findings. | During assessment waves | Data Intelligence / Infrastructure |
| Data Asset Assessment Workstream | WBS 2.3 Data Asset Assessment | Required review of source inventory, product inventory, and business glossary seed. | Business purpose, technical use, integrations, reports, operational status, owner mapping, and governance criticality require validation. | During assessment waves | Data Intelligence / Infrastructure / Application Owners |
| Open Questions Register | Assessment open questions from this epic | Questions related to access, ownership, scope, operational status, business purpose, integrations, reporting, DQ, HA / DR, classification, CDEs, and repository location. | Questions require assigned owners, answers, decisions, and closure status. | Weekly during discovery | RSM / Data Intelligence |
| Stakeholder Interviews | Interview notes and validation outcomes | Business and technical input used to confirm database purpose, dependencies, ownership, reporting usage, and governance accountability. | Interview coverage is incomplete; additional SMEs, application owners, vendors, and business contacts must be identified. | Per interview wave | RSM / Bradesco Team |
| Governance Assessment Templates | Current-state maturity assessment, governance framework, target architecture, remediation roadmap | Defines required assessment outputs and target-state structure. | Templates contain placeholders and must be populated with Bradesco-specific evidence, scores, findings, risks, and remediation actions. | Per deliverable cycle | RSM |
| Data Domains & Ownership Epic | Data domain ownership and stewardship scope | Defines ownership/stewardship objectives and target of assigning owners/stewards for critical domains. | Candidate domains, owners, stewards, approval status, and domain boundaries require validation. | During domain assessment | Data Governance / Data Intelligence |

### 8.2 Source Inventory and Ownership Requirements

The assessment must produce or validate a source inventory that supports governance decision-making, not only infrastructure tracking. Each in-scope system, server, database, or data asset should be enriched with the fields needed to determine accountability, business relevance, criticality, migration readiness, and governance control needs.

| Requirement Area | Required Information | Purpose | Current Status |
| --- | --- | --- | --- |
| Server Identification | Server ID, hostname, IP address, location, network, installed database engine, database version, environment, support status. | Establishes the technical estate and confirms assessment scope. | Required by source inventory workstream; not visible in local source package. |
| Database Identification | Database ID, linked server ID, database name, database version, state, size, backup information, file locations, environment. | Establishes database-level inventory and technical discovery baseline. | Required by source inventory workstream; not visible in local source package. |
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

### 8.4 Evidence Coverage Register

The current local source package is sufficient to improve the epic structure, requirements, acceptance criteria, and provisional backlog. It is not sufficient to close the epic because several source files are templates or planning artifacts rather than completed assessment outputs.

| Evidence Source | What It Contributes | Current Usability | Remaining Gap |
| --- | --- | --- | --- |
| 01\_Current\_State\_Maturity\_Assessment.docx | Defines ten governance maturity dimensions, 1-5 maturity scale, scorecard format, detailed findings format, stakeholder appendix, and documents-reviewed appendix. | Strong for required structure and acceptance criteria. | Does not contain populated Bradesco maturity scores, observations, evidence references, or stakeholder interview results. |
| 02\_Governance\_Framework\_Policy\_Recommendations.docx | Defines governance principles, operating model roles, RACI areas, policy hierarchy, recommended policies, stewardship cadence, escalation path, and success metrics. | Strong for target governance model requirements. | Requires Bradesco-specific role names, decision rights, council membership, policy decisions, and approval path. |
| 03\_Target\_State\_Data\_Architecture.docx | Defines Databricks / cloud layers, Unity Catalog, DQ framework, lineage, security, governance-to-architecture mapping, domain model, and design-decision register. | Strong for target architecture control mapping. | Requires actual Bradesco architecture diagrams, domain-to-catalog mapping, platform decisions, and migration constraints. |
| 04\_Prioritized\_Remediation\_Roadmap.docx | Defines prioritization criteria, effort sizing, initiative register, 30/60/90 action plan, two-year roadmap, and roadmap risk model. | Strong for remediation roadmap format. | Requires validated initiatives, owners, effort scores, dependencies, investment ranges, and leadership prioritization. |
| BradescoRSM\_AssessmentWBS\_ProjectPlan07292026.xlsx | Provides the ten-week project plan and milestone dates M1-M6. | Strong for milestone correction and dependency tracking. | Requires current milestone status confirmation after July 29, 2026. |
| BradescoRSM.xlsx / BradescoRSM.csv | Provides WBS detail, work packages, completion percentages, and overall program metrics. | Strong for current-state completion framing. | Does not include findings, scoring rationale, or evidence-to-finding traceability. |
| RSM-US\_WBS.md / RSM-US\_WBS\_h.md | Provides deliverable-oriented WBS, dashboard status, completion estimates, and confidence levels. | Strong for status, scope, and workstream coverage. | Uses planning estimates; must be reconciled with final RSM deliverables. |
| BradescoRSM\_AssessmentEpicBacklog.md | Provides proposed governance backlog areas and missing items across operating model, metadata, lineage, DQ, classification, CDEs, domains, and AI readiness. | Strong for child epic candidates and missing-item framing. | Requires product-owner validation, prioritization, sizing, and Jira creation. |
| Data Domains & Ownership.md | Defines related ownership and stewardship epic, target of 80% critical domain owner/steward coverage, and BR 9 file domain-discovery input. | Strong for dependency and ownership acceptance criteria. | Domain register, owners, stewards, boundaries, and approval status remain incomplete. |

### 8.5 Missing Items Required Before Final Closure

| Missing Item | Why It Is Required | Owner / Resolver | Target Milestone |
| --- | --- | --- | --- |
| Populated maturity scorecard | Establishes evidence-backed current-state baseline across the ten governance dimensions. | RSM / Bradesco Team | M1 - Aug 12, 2026 |
| Evidence register | Makes findings defensible for stakeholder, leadership, audit, and compliance review. | RSM | M1 / M3 |
| Stakeholder interview notes and reviewer feedback | Validates current-state statements and resolves assumptions. | RSM / Bradesco Team | M1 |
| Enterprise gap matrix | Converts directional concerns into prioritized governance, technology, organization, metadata, lineage, DQ, and compliance gaps. | RSM | M3 - Aug 26, 2026 |
| Governance risk register | Documents probability, impact, mitigation, owner, and roadmap linkage for material governance risks. | RSM / Bradesco Team | M3 - Aug 26, 2026 |
| Bradesco-specific governance operating model | Defines council, roles, RACI, decision rights, escalation path, cadence, and policy authority. | Data Governance / RSM | M2 / M3 |
| Target-state architecture decisions | Confirms Databricks, Unity Catalog, medallion controls, metadata, lineage, DQ, security, and access-control direction. | Architecture / Platform / Data Governance | M3 |
| Validated source inventory and ownership/contact matrix | Establishes accountability and scope for systems, databases, domains, reports, and data assets. | Data Intelligence / Infrastructure / Business SMEs | M1 / M3 |
| Candidate CDE inventory and DQ rule-readiness assessment | Links Data Quality controls to critical elements, owners, rules, thresholds, scorecards, and remediation workflow. | Data Governance / RSM / Business SMEs | M3 / M4 |
| Classification, privacy, retention, and compliance review | Ensures sensitive banking data governance and regulatory traceability are reviewed by appropriate stakeholders. | Risk / Compliance / Security | M3 / M4 |
| Prioritized remediation roadmap and 30/60/90 action plan | Converts validated gaps into executable phases, owners, dependencies, and outcomes. | RSM / Bradesco Team | M4 - Sept 8, 2026 |
| Executive readout and final package publication | Provides leadership approval and a durable handoff package for implementation. | RSM / Bradesco Team | M5 / M6 |

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

The non-functional requirements for this epic define the quality, traceability, reviewability, security, and readiness expectations for the Data Governance Gap Analysis deliverables. Because this epic produces assessment and planning outputs rather than production software, the key non-functional measures are evidence quality, stakeholder validation, completeness, auditability, and usability for executive decision-making and follow-on implementation.

| Category | Requirement | Target / Measure |
| --- | --- | --- |
| Completeness | The assessment package must include all required deliverables: current-state maturity assessment, evidence register, enterprise gap matrix, risk register, target-state governance framework, target-state architecture, prioritized roadmap, 30/60/90-day action plan, and executive readout. | 100% of required deliverables produced or explicitly marked as out of scope with rationale. |
| Evidence Traceability | Every material finding must be traceable to at least one evidence source, such as stakeholder interview notes, RSM artifacts, system inventory, database inventory, architecture document, policy template, meeting summary, or technical assessment artifact. | Evidence register completed with evidence source, finding ID, governance dimension, confidence level, and source reference for each material finding. |
| Maturity Scoring | The current-state maturity scorecard must be populated across the ten defined governance dimensions. | 100% of maturity dimensions scored: Strategy & Vision, Policies & Standards, Organization & Roles, Metadata & Catalog, Data Lineage, Data Quality, Classification & Privacy, Retention & Records, Architecture & Platform, Monitoring & Reporting. |
| Gap Coverage | The enterprise gap matrix must cover the WBS-defined gap categories. | Gap matrix includes Governance, Technology, Organizational, Metadata, Lineage, and Data Quality gaps. |
| Risk Documentation | Risks identified during the assessment must be formally recorded and linked to mitigation actions. | Risk register completed with risk, impact, probability, severity, owner, mitigation, dependency, and status. |
| Roadmap Completion | Remediation actions must be sequenced into practical implementation horizons. | Roadmap includes quick wins / 0-90 days, 3-6 month foundation initiatives, 6-12 month governance program initiatives, and 12-24 month enterprise expansion items. |
| 30/60/90-Day Actionability | Short-term remediation planning must be specific enough to support execution planning. | Each 30/60/90-day item includes action, owner or candidate owner, deliverable, dependency, status, and expected outcome. |
| Reviewability | Stakeholders must be able to review and challenge findings, scores, risks, and recommendations. | Each major deliverable has a documented review status, reviewer group, review date or target date, and disposition of feedback. |
| Auditability | Assessment conclusions must be defensible for audit, compliance, and leadership review. | No critical finding is accepted without evidence reference, confidence level, and documented rationale. |
| Consistency | Terminology, governance dimensions, statuses, priorities, owners, and dates must be consistent across the epic, WBS, roadmap, scorecard, and final readout. | No unresolved conflicts between the epic, WBS, milestone plan, evidence register, and executive readout. |
| Data Accuracy | Source inventory and ownership data must be validated before being used as the basis for final findings. | In-scope systems / databases used in findings have validated scope status, owner or owner gap, discovery source, and review status. |
| Ownership Coverage | Priority domains and in-scope assets should have accountable owners or documented ownership gaps. | Ownership matrix completed for priority domains and in-scope assessment assets; unknown ownership explicitly tracked as a gap. |
| Security | Assessment artifacts must follow bank security and access-control expectations. | Artifacts stored in approved repository or folder with access limited to authorized stakeholders. |
| Confidentiality | Sensitive infrastructure, system, database, ownership, and assessment information must be handled as confidential project information. | No unauthorized distribution of workbooks, meeting notes, system inventories, or draft findings. |
| Availability | Approved assessment artifacts must be accessible to authorized reviewers and project stakeholders. | Final deliverables available in the approved repository with clear naming, versioning, and ownership. |
| Version Control | Assessment outputs must maintain clear version history and change traceability. | Change log populated with date, author, change summary, and version / status for material updates. |
| Decision Traceability | Key governance and assessment decisions must be documented. | Decision log includes decision date, decision, owner / approver, rationale, and related deliverable or finding. |
| Usability | The final package must be understandable by leadership and actionable by implementation teams. | Executive readout summarizes current maturity, top gaps, risk exposure, recommended target state, roadmap priorities, and near-term actions. |
| Timeliness | Deliverables must align to the active project milestone schedule or clearly document slippage and impact. | Milestones tracked against target dates for maturity assessment, policy draft, target architecture / gap matrix / risk register, roadmap, and executive presentation. |
| Confidence Rating | Findings and completion statements must include confidence levels based on evidence quality. | Each material finding uses a confidence rating such as High, Medium, Low, or Not Assessable. |
| Acceptance Readiness | The epic should only be marked complete when deliverables are populated, reviewed, approved, and linked to follow-on actions. | Final acceptance criteria satisfied and approval / publication recorded. |

## 11. Data Quality and Validation

Data Quality is a core assessment area for this epic and should not be marked as N/A. The RSM work breakdown structure includes a dedicated Data Quality Assessment workstream covering Data Quality framework review, quality dimensions, Critical Data Element readiness, CDE ownership, and quality rule definition. The current evidence indicates that Data Quality practices and related initiatives exist, but enterprise-level governance alignment is incomplete.

For this gap analysis, Data Quality and validation requirements apply to the assessment outputs and to the target-state governance recommendations. The epic must assess whether Bradesco Bank has the governance capabilities needed to define, own, monitor, escalate, and remediate Data Quality issues across critical domains and data assets.

### 11.1 Data Quality Rules

| ID | Assessment Requirement | Current Gap / Concern | Acceptance Criteria |
| --- | --- | --- | --- |
| DQ-001 | Assess the current Data Quality framework and operating model. | Current DQ practices are not yet clearly connected to enterprise governance roles, decision rights, stewardship, and remediation accountability. | Data Quality framework assessment completed and linked to governance operating model gaps. |
| DQ-002 | Assess Data Quality dimensions, including completeness, accuracy, consistency, timeliness, and validity. | DQ dimensions are identified in the WBS, but evidence-backed findings and maturity scores are not yet populated. | Each DQ dimension is reviewed, scored, and documented with evidence, observations, and gaps. |
| DQ-003 | Identify Critical Data Elements in scope for governance assessment. | CDE inventory is incomplete or not yet visible in the available assessment artifacts. | Candidate CDE inventory is documented for priority domains or explicitly tracked as a gap. |
| DQ-004 | Assess CDE ownership. | CDE owners are not consistently assigned or validated. | CDE ownership gaps are documented and linked to domain ownership / stewardship remediation actions. |
| DQ-005 | Assess DQ rule definition readiness. | Rule catalog, thresholds, severity, exceptions, and approval process are not yet defined at enterprise level. | DQ rule-definition approach is documented, including owner, steward, threshold, severity, exception handling, and approval expectations. |
| DQ-006 | Assess DQ monitoring and reporting readiness. | Scorecards, dashboards, issue tracking, and governance KPIs are not yet established or not evidenced. | DQ monitoring requirements are documented and linked to target-state reporting / observability recommendations. |
| DQ-007 | Assess DQ issue remediation workflow. | Remediation ownership, escalation paths, SLAs, and closure criteria are not consistently documented. | DQ issue workflow is documented with roles, escalation path, status model, and closure expectations. |
| DQ-008 | Assess linkage between DQ and metadata / lineage. | DQ rules may not be traceable to CDEs, business definitions, owners, lineage paths, or downstream reports. | Recommendations define how DQ rules link to glossary terms, CDEs, catalog metadata, lineage, and reporting impact. |
| DQ-009 | Assess DQ controls in the target cloud / Databricks architecture. | Target-state DQ architecture is conceptual and requires validation against platform design. | Target-state architecture identifies where DQ checks, exceptions, scorecards, and remediation workflows should operate. |
| DQ-010 | Maintain evidence-backed DQ findings. | Current DQ conclusions are directional and not yet fully supported by an evidence register. | Each material DQ finding includes evidence source, confidence level, impact, priority, and recommended remediation action. |

### 11.2 Critical Data Element Requirements

| Requirement Area | Required Information | Purpose | Current Status |
| --- | --- | --- | --- |
| CDE Inventory | List of candidate CDEs by domain, system, data asset, report, or business process. | Establishes which data elements require stronger governance, quality rules, lineage, and ownership. | Not yet complete / not visible. |
| CDE Business Definition | Approved business meaning, acceptable values, calculation logic where applicable, and usage context. | Supports consistency, glossary alignment, stewardship, and quality rule design. | Incomplete; requires business SME and steward validation. |
| CDE Owner | Accountable Data Owner for meaning, quality expectations, and prioritization. | Ensures business accountability for quality and remediation decisions. | Incomplete; ownership gaps must be tracked. |
| CDE Steward | Operational Data Steward responsible for definitions, rule review, issue triage, and metadata maintenance. | Enables ongoing stewardship and DQ governance execution. | Incomplete; stewardship gaps must be tracked. |
| Source System / Data Asset Mapping | System, database, table, field, report, or data product where the CDE is captured, transformed, or consumed. | Supports lineage, impact analysis, and DQ rule placement. | Partially dependent on source inventory and database discovery. |
| DQ Rules | Rule name, description, dimension, logic, threshold, severity, owner, exception handling, and approval status. | Defines measurable DQ controls for critical data. | Rule catalog not yet produced. |
| Monitoring and Scorecard | Frequency, metric, threshold result, trend, owner, issue status, and remediation outcome. | Provides visibility into DQ performance and governance adoption. | Not yet established or not evidenced. |
| Issue Management | Issue ID, affected CDE, severity, owner, root cause, remediation action, due date, status, and closure evidence. | Creates accountable remediation workflow. | Not yet formalized or not evidenced. |
| Lineage Linkage | Source-to-consumption lineage for CDEs used in critical reports, controls, or business processes. | Supports regulatory traceability, change impact analysis, and root-cause investigation. | Incomplete; tied to lineage workstream gaps. |

### 11.3 Validation Rules for Assessment Outputs

| Validation Rule | Description | Pass Criteria |
| --- | --- | --- |
| Evidence Required | DQ findings must be supported by interview notes, documents, inventory records, existing DQ artifacts, system evidence, or stakeholder validation. | No material DQ finding is marked final without evidence and confidence rating. |
| CDE Gap Transparency | Missing CDE inventory, missing ownership, or missing rule catalog must be classified as a documented gap, not ignored. | CDE gaps appear in the enterprise gap matrix and remediation roadmap. |
| Traceability Required | DQ findings should link to related maturity dimension, evidence source, gap, risk, and remediation action. | Each DQ finding can be traced from maturity score to gap matrix to roadmap item. |
| Ownership Required | DQ rules, issues, and CDEs should identify a Data Owner or Data Steward; unknown ownership must be captured as a gap. | Ownership matrix includes assigned owners or explicit owner gaps. |
| Platform Alignment Required | DQ recommendations must identify where controls belong in the target architecture, such as ingestion, Bronze, Silver, Gold, reporting, or governance workflow. | Target-state architecture includes DQ control placement and operating responsibilities. |
| Stakeholder Review Required | DQ findings, CDE gaps, and remediation priorities must be reviewed with appropriate business, Data Governance, Data Intelligence, and technical stakeholders. | Review status and feedback disposition are documented. |

### 11.4 Data Quality Success Indicators

| Success Indicator | Target |
| --- | --- |
| Data Quality assessment completed | DQ framework, DQ dimensions, CDE readiness, ownership, rule definition, monitoring, and remediation workflow assessed. |
| CDE inventory gap documented | Candidate CDE inventory produced or missing CDE inventory formally captured as a high-priority gap. |
| CDE ownership gap documented | CDE ownership and stewardship gaps linked to Data Domains & Ownership remediation. |
| DQ rule catalog readiness assessed | Rule-definition approach and missing rule inventory documented. |
| DQ scorecard requirements defined | Monitoring and scorecard needs included in target-state recommendations. |
| DQ findings traceable to evidence | Each major DQ conclusion linked to evidence, impact, confidence, and remediation action. |
| DQ roadmap items created | DQ-related gaps translated into prioritized remediation initiatives. |

## 12. Security, Governance, and Compliance

Security, governance, and compliance are core assessment areas for this epic. The RSM WBS includes a dedicated Security, Privacy & Compliance Assessment workstream covering data classification and regulatory controls. The gap analysis must assess whether Bradesco Bank has the policies, ownership, controls, metadata, evidence, and operating processes needed to govern sensitive and regulated data across current platforms and the target cloud / Databricks architecture.

The current-state assessment should determine how data classification, privacy expectations, access governance, retention, auditability, and regulatory control alignment are currently defined and enforced. The target-state recommendations should define how these capabilities should be embedded into governance roles, architecture controls, metadata, lineage, Data Quality processes, and remediation planning.

### 12.1 Access Control

Access to assessment artifacts and source inventories must be controlled because the materials may include system names, database names, infrastructure details, ownership information, risk findings, architecture direction, and governance gaps. Access should follow least-privilege principles and should be limited to authorized project stakeholders.

| Role / Group | Access Level | Data Scope | Notes |
| --- | --- | --- | --- |
| RSM Assessment Team | Read / Write | Assessment workpapers, maturity assessment, gap matrix, risk register, roadmap, and executive readout drafts. | Responsible for producing assessment deliverables and incorporating review feedback. |
| Data Intelligence Team | Read / Write | Source inventory, database discovery, assessment artifacts, technical findings, and remediation backlog inputs. | Supports current-state validation and post-assessment action planning. |
| Data Governance / Data Foundation Team | Read / Write / Approve | Governance framework, policies, ownership model, stewardship model, classification requirements, and remediation priorities. | Owns governance direction and validates target-state feasibility. |
| Infrastructure Team | Read / Write for assigned inventory fields | Server inventory, access status, infrastructure owner mapping, SQL Server scope validation, and technical discovery support. | Provides access coordination and infrastructure-level validation. |
| Architecture / Platform / Databricks Team | Read / Write for architecture inputs | Current-state architecture, target-state architecture, Unity Catalog, metadata, lineage, security, and platform-control recommendations. | Validates architecture alignment and implementation feasibility. |
| Business SMEs / Application Owners | Read / Write for assigned assets | Business purpose, functional owner, application owner, operational status, integrations, reports, and data usage validation. | Confirms business relevance and accountability. |
| Data Owners / Data Stewards | Read / Write for assigned domains | Domain definitions, ownership, stewardship, CDEs, DQ expectations, glossary terms, classification, and issue workflow. | Accountable for governance validation within assigned domains. |
| Risk, Compliance, and Audit Stakeholders | Read / Comment / Approve where applicable | Regulatory control alignment, auditability, privacy, classification, retention, and risk findings. | Validates compliance expectations and risk treatment. |
| Security / IAM | Read / Write for security controls | Access governance, group-based permissions, sensitive data controls, masking, audit logging, and security standards. | Reviews control design and access recommendations. |
| Executive Stakeholders | Read / Approve | Executive summary, major gaps, risk exposure, roadmap priorities, and final recommendations. | Supports decision-making and investment prioritization. |

### 12.2 Governance Requirements

| Governance Area | Requirement | Assessment Focus | Target-State Expectation |
| --- | --- | --- | --- |
| Data Classification | Assess whether classification levels are defined, consistently applied, and connected to access, privacy, retention, and handling expectations. | Public, Internal, Confidential, Restricted classification maturity; classification coverage; classification ownership; classification metadata gaps. | Approved classification model with ownership, metadata tagging, handling rules, and platform enforcement path. |
| Privacy and Sensitive Data Handling | Assess how PII, confidential, restricted, and regulated data are identified, protected, used, shared, retained, and monitored. | Sensitive data inventory, PII identification, masking needs, privacy controls, data sharing restrictions, and evidence gaps. | Sensitive data handling requirements documented and mapped to governance roles, catalog metadata, access controls, and remediation actions. |
| Access Governance | Assess whether access is granted, reviewed, and revoked using approved roles, groups, policies, and least-privilege principles. | Current access-control model, manual access processes, ownership of access approvals, access review cadence, and audit trail availability. | Role-based / group-based access model aligned with data classification, ownership, Unity Catalog, IAM, and audit expectations. |
| Regulatory Control Alignment | Assess whether governance controls support applicable banking, audit, compliance, privacy, and records-management expectations. | Regulatory control mapping, evidence availability, ownership of controls, gaps in traceability, and review process. | Regulatory control expectations documented, assigned, and traceable to policies, data assets, lineage, and evidence. |
| Retention and Records | Assess whether data retention, records-management, lifecycle, archival, and disposal requirements are documented and enforceable. | Retention policy coverage, data lifecycle controls, records classification, disposal evidence, and platform retention gaps. | Retention requirements documented by data class / domain / asset and linked to platform controls and ownership. |
| Auditability and Evidence | Assess whether governance decisions, approvals, access changes, DQ issues, lineage, classifications, and remediation actions are evidenced. | Evidence register, decision log, audit trail availability, approval workflow, issue history, and finding traceability. | Material findings, risks, decisions, and control recommendations have evidence references and confidence levels. |
| Metadata and Catalog Governance | Assess whether classification, owner, steward, criticality, retention, glossary, and lineage metadata are captured in a governed catalog. | Catalog coverage, mandatory metadata fields, ownership fields, glossary linkage, classification tags, and completeness metrics. | Metadata requirements defined and aligned to Unity Catalog / target catalog architecture. |
| Data Quality Governance | Assess whether DQ expectations are governed through CDE ownership, rule approval, thresholds, monitoring, escalation, and remediation. | CDE ownership, DQ rule catalog, issue workflow, scorecards, exception handling, and remediation accountability. | DQ governance model linked to ownership, stewardship, metadata, lineage, and roadmap actions. |
| Lineage and Traceability | Assess whether lineage supports impact analysis, regulatory traceability, audit response, and root-cause analysis. | Source-to-landing, landing-to-warehouse, warehouse-to-reporting, and regulatory lineage gaps. | Priority lineage requirements documented and mapped to target architecture and remediation roadmap. |
| Governance Approval Workflow | Assess whether policy, classification, ownership, access, DQ, metadata, and architecture decisions have defined approval paths. | Current approval gaps, decision rights, escalation paths, review cadence, and responsible roles. | Decision rights and approval workflow documented in the governance operating model. |

### 12.3 Classification and Privacy Assessment Requirements

| ID | WBS Alignment | Requirement | Priority | Acceptance Criteria |
| --- | --- | --- | --- | --- |
| SG-001 | 6.1 | Assess the current data classification model. | Must | Classification levels, definitions, handling expectations, ownership, and known coverage gaps are documented. |
| SG-002 | 6.1.1 | Assess Public classification practices. | Should | Criteria for public data and evidence of public classification usage are documented or classified as not evidenced. |
| SG-003 | 6.1.2 | Assess Internal classification practices. | Must | Criteria for internal data and evidence of internal classification usage are documented or classified as not evidenced. |
| SG-004 | 6.1.3 | Assess Confidential classification practices. | Must | Criteria for confidential data, handling requirements, access expectations, and evidence gaps are documented. |
| SG-005 | 6.1.4 | Assess Restricted classification practices. | Must | Criteria for restricted data, sensitive-data controls, access requirements, masking / encryption considerations, and evidence gaps are documented. |
| SG-006 | 6.2 | Assess regulatory control alignment. | Must | Regulatory, audit, privacy, retention, access, lineage, and evidence-control expectations are documented and mapped to governance gaps. |
| SG-007 | 6.0 / 10.2.5 | Align security and privacy recommendations with target-state architecture. | Must | Security architecture recommendations include classification tagging, access model, audit logging, sensitive data handling, and Unity Catalog / IAM alignment. |
| SG-008 | 6.0 / 8.0 | Include security, privacy, and compliance gaps in the enterprise gap matrix. | Must | Gap matrix includes classification, privacy, access, retention, auditability, and regulatory-control gaps with severity, impact, evidence, and recommended action. |
| SG-009 | 6.0 / 11.0 | Translate security, privacy, and compliance gaps into roadmap items. | Must | Roadmap includes prioritized remediation actions for classification, access governance, sensitive data handling, regulatory traceability, and audit evidence. |

### 12.4 Compliance Validation Rules

| Validation Rule | Description | Pass Criteria |
| --- | --- | --- |
| Evidence Required | Security, privacy, and compliance findings must be supported by documents, interviews, inventories, architecture artifacts, policy references, or stakeholder validation. | No material security / compliance finding is marked final without evidence and confidence rating. |
| Missing Evidence Classification | Lack of evidence must be recorded as “not evidenced” or as a documented gap, not treated as proof of compliance. | Evidence gaps appear in the evidence register, gap matrix, or open questions register. |
| Ownership Required | Classification, access approval, sensitive data handling, retention, and control remediation must have accountable owners or owner gaps. | Owner or owner gap is documented for each material control area. |
| Target Architecture Alignment | Security recommendations must be connected to the target cloud / Databricks architecture. | Target architecture includes security, access, classification, metadata, lineage, and auditability controls. |
| Regulatory Review Required | Compliance-sensitive findings and recommendations must be reviewed by Risk, Compliance, Audit, or Security stakeholders as applicable. | Review status, reviewer group, and feedback disposition are documented. |
| Roadmap Traceability | Security and compliance gaps must be translated into sequenced remediation actions. | Each material gap links to a roadmap item or documented rationale for deferral. |

## 13. Dependencies

The Data Governance Gap Analysis epic depends on the completion and review of several RSM assessment deliverables and Bradesco validation activities. These dependencies are tied to the active project plan milestones and must be tracked because delays in current-state validation, policy review, target architecture, gap matrix, risk register, roadmap, or executive readout will delay final epic acceptance.

| Dependency | Type | Owner | Target Date | Status | Notes |
| --- | --- | --- | --- | --- | --- |
| Stakeholder Interviews and Data Collection | Team / Evidence | RSM & Bradesco Team | Before Aug 12, 2026 | In Progress | Required to complete the current-state maturity assessment and validate findings. |
| Current State Maturity Assessment | Deliverable | RSM & Bradesco Team | Aug 12, 2026 | Pending Scheduling | Milestone M1. Required before finalizing maturity scores, evidence-backed findings, and gap analysis. |
| Sample Data Governance Policy Draft | Deliverable | RSM & Bradesco Team | Aug 18, 2026 | Not Started / Pending Review | Milestone M2. Required to compare current-state practices against target governance policy expectations. |
| Target State Data Governance Definition | Deliverable / Design Input | RSM & Bradesco Team | Aug 11, 2026 | Pending Scheduling | Required to establish the target governance model used by the gap analysis. |
| Target State DG Architecture, Gap Analysis Matrix, and Risk Register | Deliverable Package | RSM & Bradesco Team | Aug 26, 2026 | Not Started / Pending Scheduling | Milestone M3. Core dependency for this epic; includes the target architecture, formal enterprise gap matrix, and risk register. |
| Prioritized Implementation Roadmap and 30/60/90-Day Action Plan | Deliverable | RSM Team / Bradesco Team | Sept 8, 2026 | Not Started / Pending Scheduling | Milestone M4. Required to translate findings and risks into sequenced remediation actions. |
| Executive Presentation | Deliverable | RSM Team / Bradesco Team | Sept 17, 2026 | Not Started / Pending Scheduling | Milestone M5. Required for leadership review, final readout, and decision-making. |
| SQL Server Source Inventory Validation | Data / Technical | Data Intelligence / Infrastructure / Application Owners | During assessment waves | In Progress | Required to validate source inventory, ownership, business purpose, operational status, integrations, and reporting dependencies. |
| Read-Only SQL Access or Authoritative Database Exports | Technical / Access | Infrastructure | During assessment waves | Open | Required where the assessment team cannot independently enumerate databases or collect comparable metadata. |
| Ownership and Contact Mapping | Team / Governance | Infrastructure / Data Intelligence / Business SMEs | Before findings validation | Open | Required to route discovery questions to the correct application owners, functional owners, technical owners, vendors, and SMEs. |
| Data Domain and Stewardship Validation | Governance | Data Governance / Data Intelligence / Business SMEs | Before roadmap finalization | In Progress | Required to link governance gaps to data ownership, stewardship, CDE readiness, and domain remediation actions. |
| Classification, Privacy, Risk, and Compliance Review | Compliance / Governance | Risk, Compliance, Audit, Security / IAM | Before final recommendations | Open | Required to validate classification, sensitive data handling, access governance, auditability, retention, and regulatory-control recommendations. |
| Final Documentation Repository / Publication Location | Operational | Data Intelligence / Data Governance | Before epic closure | Open | Required so final deliverables are stored in an approved location with versioning and controlled access. |

## 14. Risks and Mitigations

| Risk | Impact | Probability | Mitigation | Owner |
| --- | --- | --- | --- | --- |
| Missing or incomplete evidence register | Findings may be difficult to defend during stakeholder, executive, audit, or compliance review. | High | Create an evidence register linking each material finding to documents, interviews, inventory records, meeting notes, technical evidence, and confidence level. | RSM |
| Maturity scorecard not populated | The assessment cannot establish a reliable baseline or quantify current-state gaps by governance dimension. | High | Complete scoring across all ten governance dimensions and document scoring rationale, evidence, reviewer, and confidence. | RSM / Bradesco Team |
| Enterprise gap matrix not produced | Governance gaps remain directional and cannot be prioritized consistently. | High | Produce the formal gap matrix covering governance, technology, organizational, metadata, lineage, and Data Quality gaps. | RSM |
| Placeholder deliverables remain unpopulated | The final package may appear complete structurally but lack Bradesco-specific findings, decisions, risks, and roadmap actions. | High | Track placeholder sections as open items; require each deliverable to pass a completeness review before approval. | RSM / Data Intelligence |
| Source inventory ownership gaps | Databases, systems, reports, and data assets may lack accountable technical, functional, application, or business owners. | High | Use infrastructure owner mapping, application owner validation, vendor contacts, and SME interviews to populate the ownership and contact matrix. | Data Intelligence / Infrastructure |
| Read-only access gaps | The assessment team may be unable to independently validate database inventories, technical metadata, operational status, and scope. | Medium-High | Provide read-only SQL access or authoritative database exports for in-scope hosts; track unavailable access as evidence gaps. | Infrastructure |
| Incomplete business-purpose validation | Technical inventory may identify databases but not explain business use, integrations, reports, operational workflows, or migration relevance. | High | Conduct targeted interviews with application owners, functional owners, developers, business SMEs, and vendors. | RSM / Data Intelligence |
| Incorrect in-scope / out-of-scope classification | Non-SQL Server, SQL Compact, inactive, legacy, DR, duplicate, or irrelevant records may inflate or distort assessment scope. | Medium | Validate scope rationale, engine type, operational status, duplicate handling, and business relevance in the source inventory. | Data Intelligence / Infrastructure |
| Delayed stakeholder participation | Maturity scoring, findings validation, ownership mapping, and roadmap approval may slip. | Medium | Schedule interviews and review checkpoints early; escalate missing participation through project governance. | Project Team |
| Delayed target architecture, gap matrix, or risk register | Core inputs required for this epic may not be ready for review by the planned milestone. | Medium-High | Track the Aug 26, 2026 milestone; split unresolved items into open questions, assumptions, and roadmap dependencies. | RSM / Bradesco Team |
| Roadmap remains template-only | Leadership may not have actionable sequencing, ownership, effort, or dependency information for remediation. | High | Convert validated gaps and risks into prioritized roadmap items with phase, owner, effort, dependency, and expected outcome. | RSM |
| Data ownership and stewardship assignments remain incomplete | Data Quality, glossary, metadata, lineage, and remediation actions may lack business accountability. | High | Link gap analysis to the Data Domains & Ownership epic and track owner / steward gaps as remediation items. | Data Governance / Data Intelligence |
| Classification, privacy, and compliance evidence gaps | Sensitive data handling, access governance, retention, and regulatory traceability recommendations may lack sufficient validation. | Medium-High | Review findings with Risk, Compliance, Audit, Security / IAM, and Data Governance stakeholders. | Risk / Compliance / Security |
| Data Quality and CDE gaps are under-defined | DQ rules, thresholds, ownership, monitoring, and remediation workflow may not be actionable. | High | Document DQ and CDE gaps explicitly; link them to the DQ assessment, ownership matrix, target architecture, and roadmap. | RSM / Data Governance |
| Inconsistent terminology or status across artifacts | Epic, WBS, project plan, templates, and roadmap may present conflicting completion levels, dates, or statuses. | Medium | Normalize terms, statuses, owners, dates, and completion percentages across documents before final review. | Data Intelligence / RSM |
| Executive readout depends on incomplete inputs | Leadership presentation may overstate confidence or omit unresolved gaps. | Medium-High | Include confidence levels, open questions, unresolved evidence gaps, and decision points in the executive readout. | RSM / Bradesco Team |

## 15. Delivery Plan

### 15.1 Milestones

| Milestone | Phase | Target Date | Owner | Status | Dependency |
| --- | --- | --- | --- | --- | --- |
| Kickoff meeting and stakeholder alignment | 1 | Jul 16, 2026 | RSM Team | Complete | Project start |
| Current State Maturity Assessment | 2 | Aug 12, 2026 | RSM & Bradesco Team | Pending Scheduling | Interviews and data complete |
| Sample Data Governance Policy Draft | 2 | Aug 18, 2026 | RSM & Bradesco Team | Not Started / Pending Review | Current state validated |
| Target State DG Architecture, Gap Analysis Matrix, Risk Register | 3 | Aug 26, 2026 | RSM & Bradesco Team | Not Started / Pending Scheduling | Policy draft reviewed |
| Prioritized Implementation Roadmap and 30/60/90-Day Action Plan | 4 | Sept 8, 2026 | RSM Team / Bradesco Team | Not Started / Pending Scheduling | Findings validated |
| Executive Presentation | 5 | Sept 17, 2026 | RSM Team / Bradesco Team | Pending Scheduling | Roadmap approved |
| Deliverable package and project close | 5 | Sept 18, 2026 | RSM Team / Bradesco Team | Not Started | Final presentation delivered |

### 15.2 Provisional Remediation Roadmap

The roadmap below is a provisional planning view based on the available WBS, backlog seed, and RSM roadmap template. It should be replaced or confirmed when the formal enterprise gap matrix and risk register are completed.

| ID | Initiative | Dimension | Effort | Phase | Dependencies | Expected Outcome |
| --- | --- | --- | --- | --- | --- | --- |
| REM-001 | Complete evidence register and documents-reviewed appendix. | Evidence / Assessment Quality | S | 0-30 days | Source files, interview notes, inventory extracts | Material findings become traceable and reviewable. |
| REM-002 | Populate maturity scorecard across ten governance dimensions. | Current-State Maturity | M | 0-30 days | Interviews, evidence register, RSM maturity template | Current-state baseline is measurable and defensible. |
| REM-003 | Validate priority domains and ownership gaps. | Organization & Roles | M | 0-60 days | Data Domains & Ownership epic, stakeholder validation | Domain owner/steward gaps are known and ready for remediation. |
| REM-004 | Build enterprise gap matrix and risk register. | Gap Analysis / Risk | M | 31-60 days | Maturity scorecard, evidence register, target-state expectations | Governance gaps are prioritized by impact, severity, evidence, and owner gap. |
| REM-005 | Define governance operating model, RACI, decision rights, and escalation path. | Governance Framework | M | 31-60 days | Governance framework template, leadership input | Policy decisions and issue escalation have clear accountability. |
| REM-006 | Define target architecture control mapping for Databricks / Unity Catalog / medallion layers. | Architecture & Platform | M | 31-90 days | Target architecture template, platform stakeholder review | Governance controls are mapped to platform layers and future backlog items. |
| REM-007 | Establish metadata, glossary, catalog, and lineage priority backlog. | Metadata / Lineage | M | 61-90 days | Gap matrix, domain priorities, source inventory | Metadata and lineage work can be sequenced by priority domain and critical asset. |
| REM-008 | Establish DQ and CDE governance backlog. | Data Quality | M | 61-90 days | Domain priorities, CDE candidates, DQ framework review | DQ rules, thresholds, owners, scorecards, and remediation workflow become actionable. |
| REM-009 | Validate classification, privacy, access, retention, and compliance recommendations. | Security / Compliance | M | 61-90 days | Security / IAM / Compliance review | Sensitive data and regulatory-control gaps are reviewed before roadmap approval. |
| REM-010 | Publish final roadmap, executive readout, and follow-on implementation backlog. | Roadmap / Closure | S | 90 days | Gap matrix, risk register, stakeholder signoff | Leadership has approved remediation sequence and next implementation epics. |

### 15.3 30/60/90-Day Action Plan

| Window | Focus | Actions | Owner | Deliverables | Exit Criteria |
| --- | --- | --- | --- | --- | --- |
| Days 1-30 | Foundation and evidence | Complete evidence register, populate maturity scorecard, confirm reviewer groups, validate source inventory questions, identify domain owner/steward gaps. | RSM / Data Intelligence / Infrastructure | Evidence register, maturity scorecard draft, open questions register, ownership gap list. | Maturity review is ready and unresolved gaps are assigned owners. |
| Days 31-60 | Build and operationalize | Produce enterprise gap matrix, risk register, governance operating model, RACI, policy draft, and target-state control mapping. | RSM / Data Governance / Architecture | Gap matrix, risk register, policy draft, RACI, decision rights, architecture control map. | Core findings and recommendations are reviewable by stakeholders. |
| Days 61-90 | Scale and measure | Prioritize roadmap, validate DQ/CDE backlog, validate metadata/lineage backlog, review security/compliance gaps, prepare executive readout and closure package. | RSM / Bradesco Team | 30/60/90 action plan, two-year roadmap, executive readout, follow-on backlog, closure package. | Leadership can approve roadmap, residual risks, and follow-on implementation work. |

## 16. Jira / Backlog Links

| Item Type | Key / Link | Description |
| --- | --- | --- |
| Epic |  | Gap analysis Jira Epic |
| Story |  |  |
| Spike |  |  |
| Defect |  |  |

## 17. Acceptance Criteria

The epic is complete only when the Data Governance Gap Analysis is evidence-backed, reviewed, and actionable. Completion should not be based on the presence of template sections alone. Each required deliverable must be populated with Bradesco-specific content, linked to supporting evidence, reviewed by the appropriate stakeholders, and approved or explicitly accepted with documented open items.

| ID | Acceptance Criteria | Evidence Required | Owner / Approver |
| --- | --- | --- | --- |
| AC-001 | Current-state maturity assessment is completed across all defined governance dimensions. | Scored maturity matrix covering Strategy & Vision, Policies & Standards, Organization & Roles, Metadata & Catalog, Data Lineage, Data Quality, Classification & Privacy, Retention & Records, Architecture & Platform, and Monitoring & Reporting. | RSM / Bradesco Team |
| AC-002 | Each maturity score has documented rationale and evidence. | Score rationale, evidence source, reviewer feedback, and confidence rating for each maturity dimension. | RSM / Bradesco Team |
| AC-003 | Evidence register is completed. | Evidence register linking findings to source documents, interview notes, inventory records, meeting summaries, architecture artifacts, policy templates, and technical evidence. | RSM |
| AC-004 | Enterprise gap matrix is completed. | Gap matrix covering governance, technology, organizational, metadata, lineage, Data Quality, classification / privacy, compliance, architecture, and monitoring gaps. | RSM |
| AC-005 | Each material gap is prioritized and actionable. | Gap records include severity, impact, probability or risk level, owner or owner gap, dependency, confidence level, and recommended remediation action. | RSM / Data Governance |
| AC-006 | Risk register is completed and reviewed. | Risk register with risk, impact, probability, severity, owner, mitigation, dependency, status, and linkage to roadmap items where applicable. | RSM / Bradesco Team |
| AC-007 | Target-state governance framework is documented and reviewed. | Governance framework including vision, principles, operating model, roles, stewardship model, RACI, decision rights, escalation paths, and governance cadence. | Data Governance / Bradesco Leadership |
| AC-008 | Target-state conceptual data architecture is documented and reviewed. | Architecture package or section covering Databricks / cloud alignment, Unity Catalog, medallion architecture, metadata, lineage, Data Quality, classification, access controls, landing / bronze controls, and governance-to-platform mapping. | Architecture / Platform / Data Governance |
| AC-009 | Data ownership and stewardship gaps are documented. | Ownership / stewardship matrix or gap list for priority domains, systems, databases, data assets, CDEs, and governance roles. | Data Governance / Data Intelligence |
| AC-010 | Source inventory and ownership gaps are reflected in the assessment. | Validated source inventory updates, open ownership gaps, access gaps, business-purpose gaps, and related open questions from SQL Server discovery. | Data Intelligence / Infrastructure |
| AC-011 | Data Quality and CDE gaps are documented and linked to remediation. | DQ assessment findings covering DQ dimensions, CDE inventory, CDE ownership, DQ rule catalog, thresholds, scorecards, issue workflow, and remediation ownership. | RSM / Data Governance |
| AC-012 | Security, privacy, classification, and compliance gaps are documented. | Findings and recommendations for classification model, sensitive data handling, access governance, retention, auditability, regulatory traceability, and compliance review. | Risk / Compliance / Security |
| AC-013 | Prioritized remediation roadmap is completed and approved. | Roadmap with quick wins, 0-90 day actions, 3-6 month foundation initiatives, 6-12 month governance program initiatives, and 12-24 month enterprise expansion items. | RSM / Bradesco Leadership |
| AC-014 | 30/60/90-day action plan is actionable. | Each action includes owner or candidate owner, deliverable, dependency, target timing, expected outcome, and status. | RSM / Data Governance / Data Intelligence |
| AC-015 | Stakeholder review and signoff are completed. | Review log showing reviewer group, date, feedback received, disposition, approval status, and unresolved open items. | RSM / Bradesco Team |
| AC-016 | Executive readout is completed. | Final presentation or executive summary covering maturity baseline, top gaps, risk exposure, target-state recommendations, roadmap priorities, decisions required, and next steps. | RSM / Bradesco Leadership |
| AC-017 | Open questions and assumptions are documented. | Open questions register with owner, due date, status, decision needed, and impact if unresolved. | Project Team |
| AC-018 | Decision log is populated. | Decision log with date, decision, owner / approver, rationale, and related deliverable or finding. | Project Team |
| AC-019 | Final documentation package is published in the approved repository. | Published files or links for final maturity assessment, evidence register, gap matrix, risk register, target-state recommendations, roadmap, and executive readout. | Data Intelligence / Data Governance |
| AC-020 | Epic closure is approved with known residual risks documented. | Closure note confirming accepted deliverables, stakeholder signoff, unresolved items, residual risks, and follow-on backlog items. | Epic Owner / Data Governance / Bradesco Leadership |

## 18. Operational Readiness

Operational readiness for this epic means the assessment outputs are not only completed, but also stored, owned, reviewable, reusable, and ready to drive follow-on governance implementation. Because this epic produces governance assessment and planning deliverables, readiness focuses on artifact management, ownership, review cadence, handoff, decision tracking, and KPI reporting rather than production monitoring or application support.

| Area | Requirement | Target / Readiness Criteria | Status |
| --- | --- | --- | --- |
| Artifact Repository | Final and working assessment artifacts must be stored in an approved project repository or folder with controlled access. | Repository location confirmed; final files published with clear naming, versioning, and access permissions. | Not Started |
| Artifact Ownership | Each assessment artifact must have an accountable owner responsible for maintenance, updates, and publication. | Owner assigned for maturity assessment, evidence register, gap matrix, risk register, governance framework, target architecture, roadmap, and executive readout. | Not Started |
| Version Control | Material updates to assessment artifacts must be tracked. | Change log includes date, author, version/status, change summary, and impacted section or deliverable. | Not Started |
| Evidence Register Maintenance | Evidence used for findings must remain accessible and traceable after the assessment. | Evidence register published with finding ID, evidence source, source location, confidence level, and reviewer status. | Not Started |
| Decision Log Maintenance | Key assessment, governance, architecture, ownership, and roadmap decisions must be documented. | Decision log includes decision date, decision, owner / approver, rationale, related finding or deliverable, and status. | Not Started |
| Open Questions Management | Open questions, assumptions, and unresolved evidence gaps must be actively tracked through closure or accepted deferral. | Open questions register includes question, owner, due date, impact, status, and disposition. | Not Started |
| Review Cadence | Deliverables must be reviewed on a defined cadence until final signoff. | Weekly working review during active assessment; milestone reviews for maturity assessment, policy draft, target architecture / gap matrix / risk register, roadmap, and executive readout. | In Progress |
| Stakeholder Signoff | Final deliverables must be reviewed and accepted by the appropriate stakeholder groups. | Review log captures reviewer group, date, feedback, disposition, approval status, and residual open items. | Not Started |
| Support / Handoff Model | Ownership of post-assessment actions must be handed off from RSM / project team to Bradesco operating teams. | Handoff completed for governance framework, roadmap items, ownership gaps, DQ gaps, metadata / lineage gaps, and architecture dependencies. | Not Started |
| Follow-On Backlog Creation | Accepted gaps and remediation actions must be converted into actionable backlog items or project initiatives. | Roadmap items linked to candidate epics, stories, owners, dependencies, and implementation phases. | Not Started |
| Governance KPI Tracking | Metrics must be defined to monitor governance adoption and remediation progress after the assessment. | KPI definitions documented for ownership coverage, stewardship coverage, evidence completeness, maturity score improvement, gap closure, roadmap progress, catalog completeness, lineage coverage, DQ rule coverage, and issue remediation. | Not Started |
| Reporting Cadence | Governance progress reporting must have a defined cadence and audience. | Monthly governance progress review recommended for roadmap execution; executive updates aligned to major milestones or steering committee cadence. | Not Started |
| Access Control | Assessment artifacts must be accessible only to authorized stakeholders. | Access reviewed for RSM, Data Intelligence, Data Governance, Infrastructure, Architecture, Risk / Compliance, Security, business SMEs, and leadership. | Not Started |
| Security and Confidentiality | Infrastructure, database, ownership, risk, and assessment information must be handled as confidential project material. | Sensitive workbooks, meeting notes, system inventories, and risk findings stored in controlled-access location. | In Progress |
| Knowledge Transfer | RSM and project team must transfer assessment rationale, open issues, and recommended next steps to Bradesco owners. | KT session completed; walkthrough covers evidence register, gap matrix, risk register, roadmap, open questions, and handoff owners. | Not Started |
| Closure Package | Epic closure must include accepted deliverables, residual risks, open items, and follow-on actions. | Closure note completed and approved by epic owner, Data Governance, Data Intelligence, and leadership as applicable. | Not Started |

### 18.1 Governance KPI Tracking

The following KPIs should be defined as part of operational readiness so Bradesco can monitor governance adoption after the assessment closes.

| KPI | Description | Suggested Measurement |
| --- | --- | --- |
| Ownership Coverage | Percentage of priority domains, systems, databases, data assets, or CDEs with assigned Data Owner. | Assigned owners / total priority items. |
| Stewardship Coverage | Percentage of priority domains, assets, or CDEs with assigned Data Steward. | Assigned stewards / total priority items. |
| Evidence Completeness | Percentage of material findings linked to evidence and confidence rating. | Findings with evidence / total material findings. |
| Maturity Score Completion | Percentage of governance dimensions with completed score, rationale, evidence, and reviewer status. | Completed scored dimensions / 10 dimensions. |
| Gap Matrix Completion | Percentage of identified gaps with severity, impact, evidence, owner or owner gap, recommendation, and roadmap linkage. | Complete gap records / total gap records. |
| Risk Register Completion | Percentage of risks with impact, probability, mitigation, owner, status, and roadmap linkage where applicable. | Complete risk records / total risks. |
| Roadmap Progress | Percentage of roadmap items completed, in progress, blocked, or not started by phase. | Status by 0-90 days, 3-6 months, 6-12 months, and 12-24 months. |
| Catalog / Metadata Completeness | Percentage of priority assets with required metadata fields populated. | Assets with required metadata / total priority assets. |
| Lineage Coverage | Percentage of priority data flows, reports, CDEs, or domains with documented lineage. | Documented lineage items / total priority items. |
| DQ Rule Coverage | Percentage of priority CDEs with approved Data Quality rules and thresholds. | CDEs with approved DQ rules / total priority CDEs. |
| DQ Issue Remediation | Percentage of DQ issues closed within agreed target timing. | Closed on time / total closed or due issues. |
| Open Question Closure | Percentage of assessment open questions closed or formally deferred. | Closed or deferred questions / total questions. |
| Stakeholder Review Completion | Percentage of required stakeholder groups that reviewed and signed off on final deliverables. | Completed reviews / required reviews. |


## 19. Open Questions

The following open questions should be tracked through closure because they affect source inventory accuracy, ownership mapping, scope classification, Data Quality confidence, HA / DR interpretation, and downstream governance recommendations.

| ID | Topic | Question | Owner | Due Date | Status | Impact if Unresolved |
| --- | --- | --- | --- | --- | --- | --- |
| OQ-001 | Access | Which in-scope SQL Server hosts still require read-only access for database enumeration and metadata validation? | Infrastructure | TBD | Open | The assessment may rely on incomplete or inconsistent inventory data. |
| OQ-002 | Access | If read-only access cannot be granted for a server, can Infrastructure provide an authoritative database export with database names, status, size, backup metadata, and owner/contact fields? | Infrastructure | TBD | Open | Technical discovery may remain incomplete for restricted hosts. |
| OQ-003 | Ownership | For each in-scope server and database, who is the technical owner, functional owner, application owner, business owner, and vendor contact where applicable? | Infrastructure / Data Intelligence / Business SMEs | TBD | Open | Findings, DQ issues, lineage gaps, and remediation actions may lack accountable owners. |
| OQ-004 | Ownership | Which internal team leads or application teams should be contacted for each server/database group? | Infrastructure / Data Intelligence | TBD | Open | Discovery interviews may be delayed or routed to the wrong stakeholders. |
| OQ-005 | Scope | For duplicate server records, was the database engine / product considered when identifying duplicates? | Data Intelligence / Infrastructure | TBD | Open | Duplicate handling may incorrectly merge or inflate inventory records. |
| OQ-006 | Scope | When the workbook states “No business databases found,” does that mean the databases do not exist, the team lacks access, or the business purpose is unknown? | Data Intelligence / Infrastructure | TBD | Open | Scope classification and database-count assumptions may be inaccurate. |
| OQ-007 | Scope | Can SQL Compact instances be considered out of scope if they contain no business databases or are not relevant to the SQL Server consolidation / governance assessment? | Data Intelligence / Infrastructure | TBD | Open | Out-of-scope decisions may be inconsistent or undocumented. |
| OQ-008 | Scope | Which non-SQL Server technologies, such as MySQL or MongoDB records, should be excluded from this assessment, and what evidence is required for exclusion? | Data Intelligence / Infrastructure | TBD | Open | Non-relevant assets may distort governance scope and assessment effort. |
| OQ-009 | Operational Status | Which databases are active, inactive, legacy, closed, DR-only, vendor-managed, or pending validation? | Application Owners / Infrastructure / Business SMEs | TBD | Open | Remediation priorities and migration relevance may be inaccurate. |
| OQ-010 | Business Purpose | What business process, application, report, workflow, or regulatory output does each in-scope database support? | Application Owners / Business SMEs | TBD | Open | Criticality, ownership, lineage, and DQ prioritization cannot be completed. |
| OQ-011 | Integrations | What inbound feeds, outbound feeds, ETL processes, file exchanges, jobs, or downstream dependencies exist for each in-scope database? | Application Owners / Developers / Data Intelligence | TBD | Open | Lineage, impact analysis, and migration risk may remain incomplete. |
| OQ-012 | Reporting | Which reports, dashboards, extracts, regulatory submissions, or operational consumers depend on each database? | Business SMEs / Application Owners | TBD | Open | Critical reporting lineage and governance priority may be missed. |
| OQ-013 | Data Quality | The workbook includes a Data Quality question about a server running MSSQL 2019 while its note indicates “Non-MSSQL.” Which field is correct, and what validation source should be authoritative? | Data Intelligence / Infrastructure | TBD | Open | Engine classification, scope, and inventory quality may be unreliable. |
| OQ-014 | Data Quality | Which workbook fields are validated versus pending validation, unknown, formula-derived, or manually entered? | Data Intelligence | TBD | Open | Evidence confidence may be overstated if data quality status is unclear. |
| OQ-015 | Data Quality | What controls should be applied to validate completeness, accuracy, consistency, timeliness, and validity of the source inventory? | Data Intelligence / RSM | TBD | Open | Inventory defects may flow into maturity scoring, gap analysis, and roadmap actions. |
| OQ-016 | HA / DR | The HA / DR column is marked as DR for some records. Can the DR pair or related production server be identified? | Infrastructure | TBD | Open | Criticality, recoverability, scope, and dependency analysis may be incomplete. |
| OQ-017 | HA / DR | Should DR-only databases be included in governance findings, migration scope, ownership mapping, and DQ analysis? | Infrastructure / Data Governance / Data Intelligence | TBD | Open | DR assets may be incorrectly excluded or double-counted. |
| OQ-018 | Classification / Privacy | Do any in-scope databases contain confidential, restricted, PII, or regulated banking data? | Data Owners / Security / Compliance | TBD | Open | Classification, privacy, access, and regulatory-control recommendations may be incomplete. |
| OQ-019 | CDEs | Which databases or reports contain candidate Critical Data Elements for priority domains? | Data Governance / Business SMEs / Data Intelligence | TBD | Open | DQ rule design, stewardship, lineage, and ownership remediation may lack focus. |
| OQ-020 | Final Repository | Where will the final evidence register, maturity scorecard, gap matrix, risk register, roadmap, and executive readout be stored? | Data Intelligence / Data Governance | TBD | Open | Final deliverables may lack controlled access, versioning, and durable ownership. |

## 20. Decision Log

The decision log should capture project milestone decisions, governance review checkpoints, approval points, and unresolved decisions that affect completion of the Data Governance Gap Analysis. Dates below reflect the active project plan milestones and should be updated as decisions are completed or rescheduled.

| Date | Decision / Checkpoint | Owner / Approver | Status | Notes |
| --- | --- | --- | --- | --- |
| Jul 2026 | Engage RSM to perform the Bradesco Bank Data Governance Assessment. | Bradesco Leadership | Approved | Establishes the assessment engagement and expected RSM deliverables. |
| Jul 2026 | Use the RSM deliverable-oriented WBS as the working structure for the assessment. | RSM / Bradesco Team | Approved | WBS covers current-state assessment, maturity scoring, gap analysis, target governance framework, target architecture, roadmap, and executive readout. |
| Jul 2026 | Adopt a phased assessment approach: project initiation, current-state confirmation, target-state architecture / gap analysis, recommendations / roadmap, and final readout. | RSM / Bradesco Team | Approved | Reflected in the project plan workbook and milestone schedule. |
| Jul 16, 2026 | Complete kickoff meeting and initial stakeholder alignment. | RSM / Bradesco Team | Complete | Kickoff and project initiation activities marked complete in the project plan. |
| Jul 21, 2026 | Conduct stakeholder interviews for executive sponsorship, strategy, and in-flight initiatives. | RSM / Bradesco Team | Complete | Interview activity marked complete in the project plan. |
| Jul 22, 2026 | Conduct stakeholder interviews for data architecture, platform, lineage, and metadata. | RSM / Bradesco Team | Complete | Interview activity marked complete in the project plan. |
| Jul 24, 2026 | Confirm Infrastructure support model for SQL Server inventory validation, read-only access coordination, and owner mapping. | Infrastructure / Data Intelligence | In Progress | Meeting summary confirms access and ownership mapping are required for reliable discovery. |
| Aug 11, 2026 | Review / define Target State Data Governance direction. | RSM & Bradesco Team | Pending Scheduling | Required input for gap analysis and target-state recommendations. |
| Aug 12, 2026 | Review and confirm Current State Maturity Assessment. | RSM & Bradesco Team | Pending Scheduling | Milestone M1. Required before finalizing maturity scores and evidence-backed findings. |
| Aug 18, 2026 | Review Sample Data Governance Policy Draft. | RSM & Bradesco Team | Pending Scheduling | Milestone M2. Required to validate policy expectations used in the gap analysis. |
| Aug 26, 2026 | Review Target State DG Architecture, Gap Analysis Matrix, and Risk Register. | RSM & Bradesco Team | Pending Scheduling | Milestone M3. Core checkpoint for this epic. |
| Sept 8, 2026 | Review Prioritized Implementation Roadmap and 30/60/90-Day Action Plan. | RSM Team / Bradesco Team | Pending Scheduling | Milestone M4. Required to convert validated gaps into sequenced remediation actions. |
| Sept 14, 2026 | Collect feedback from Bradesco on executive presentation. | Bradesco Team | Not Started | Feedback checkpoint before final readout. |
| Sept 17, 2026 | Deliver final executive presentation to stakeholders. | RSM Team / Bradesco Team | Pending Scheduling | Milestone M5. Required for leadership review and closure direction. |
| TBD | Approve Data Governance Framework and operating model. | Data Governance / Bradesco Leadership | Pending | Approval required before implementation planning. |
| TBD | Approve target-state conceptual data architecture direction. | Architecture / Platform / Data Governance | Pending | Should confirm Databricks, Unity Catalog, metadata, lineage, DQ, access, and medallion governance alignment. |
| TBD | Approve enterprise gap matrix and risk register. | RSM / Bradesco Team / Data Governance | Pending | Required before roadmap finalization. |
| TBD | Approve prioritized remediation roadmap and 30/60/90-day action plan. | Bradesco Leadership / Data Governance | Pending | Required before epic closure and follow-on backlog creation. |
| TBD | Confirm final documentation repository and access model. | Data Intelligence / Data Governance | Pending | Required for artifact publication, versioning, and controlled access. |
| TBD | Approve epic closure with residual risks and open items documented. | Epic Owner / Data Governance / Bradesco Leadership | Pending | Closure should confirm accepted deliverables, unresolved items, and follow-on actions. |

## 21. Related Documents

- RSM Share folder: [https://rsmnet.sharepoint.com/teams/td\_7191464/00024/SitePages/NewHome.aspx](https://rsmnet.sharepoint.com/teams/td_7191464/00024/SitePages/NewHome.aspx)

| File | Use in This Epic |
| --- | --- |
| 01\_Current\_State\_Maturity\_Assessment.docx | Maturity dimensions, maturity scale, scorecard structure, findings structure, evidence expectations. |
| 02\_Governance\_Framework\_Policy\_Recommendations.docx | Governance principles, operating roles, RACI areas, policy hierarchy, stewardship cadence, escalation path, success metrics. |
| 03\_Target\_State\_Data\_Architecture.docx | Databricks / cloud layer model, Unity Catalog, DQ, lineage, security, governance-to-platform controls. |
| 04\_Prioritized\_Remediation\_Roadmap.docx | Prioritization criteria, effort sizing, initiative register, 30/60/90 action plan, roadmap risk model. |
| BradescoRSM\_AssessmentEpicBacklog.md | Candidate child epics and missing-item analysis. |
| BradescoRSM\_AssessmentWBS\_ProjectPlan07292026.xlsx | Ten-week WBS, milestone dates M1-M6, owners, dependencies. |
| BradescoRSM.csv | WBS hierarchy export. |
| BradescoRSM.xlsx | WBS detail, metrics, completion estimates. |
| Data Domains & Ownership.md | Related domain ownership and stewardship epic, 80% critical-domain coverage target, ownership dependency. |
| RSM-US\_WBS.md | Deliverable-oriented WBS and completion/confidence estimates. |
| RSM-US\_WBS\_h.md | WBS dashboard, deliverables completion matrix, executive scorecard. |

## 22. Change Log

| Date | Change | Author |
| --- | --- | --- |
| Jul 2026 | Initial epic draft created for Data Governance Gap Analysis. | @David Tatis / Data Intelligence |
| Aug 3, 2026 | Refreshed section content using available assessment source files. | RSM |
| Aug 3, 2026 | Updated epic summary, business goals, scope, stakeholders, current state, target state, architecture, data requirements, functional requirements, non-functional requirements, Data Quality, security / compliance, dependencies, risks, acceptance criteria, operational readiness, open questions, and decision log. | @Enrique Escobar |
| Aug 3, 2026 | Added source-refresh findings from RSM WBS, project plan workbook, Data Domains & Ownership epic, and governance deliverable templates. | @Enrique Escobar |
| Aug 3, 2026 | Added evidence-based completion framing: maturity scorecard not yet populated, enterprise gap matrix not yet produced, evidence register incomplete, risk register pending, and remediation roadmap not yet finalized. | @Enrique Escobar |
| Aug 4, 2026 | Improved epic using only local files under wiki/di/8/Epics: added evidence coverage register, missing closure items, corrected project milestones, provisional remediation roadmap, 30/60/90 action plan, detailed RSM deliverable acceptance checklist, and candidate epic children. | @Enrique Escobar |

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

| Deliverable | Description | Required Contents | Current Evidence Status | Acceptance Signal |
| --- | --- | --- | --- | --- |
| Current-state maturity assessment | Scored baseline across all governance components, with prioritized observations based on the assessment framework. | Ten-dimension maturity scorecard, score rationale, evidence source, stakeholder reviewer, confidence rating, prioritized observations. | Template and WBS exist; scores and Bradesco-specific observations are not populated in the local source package. | M1 reviewed and accepted with all ten dimensions scored. |
| Governance framework and policy recommendations | Policy sample draft, standards, and stewardship model to sustain governance. | Governance vision, principles, council / decision body, roles, RACI, decision rights, escalation path, stewardship cadence, policy hierarchy, recommended policies. | Template exists; Bradesco-specific council membership, role assignments, and approval path remain pending. | Policy draft and framework reviewed by Data Governance and leadership stakeholders. |
| Target-state conceptual data architecture | Conceptual data architecture on cloud / Databricks and a governance operating model. | Current-state challenges, target architecture layers, Unity Catalog, DQ framework, lineage, security, access control, domain model, governance-to-platform control mapping, design decisions. | Template exists; Bradesco-specific architecture decisions and diagrams remain pending. | M3 target architecture reviewed with gap matrix and risk register. |
| Enterprise gap matrix and risk register | Formal bridge between current maturity, target-state expectations, material gaps, and governance risks. | Gap ID, dimension, current state, target state, severity, impact, evidence, owner or owner gap, dependency, recommendation; risk probability, impact, mitigation, status. | Required by WBS and project plan; not produced in the local source package. | M3 package accepted with evidence-linked gaps and risks. |
| Prioritized remediation roadmap | Risk-based, sequenced actions with effort and dependency guidance, plus a 30/60/90-day action plan. | Prioritization weights, effort sizing, initiative register, 30/60/90 actions, 3-6 month foundation work, 6-12 month program work, 12-24 month expansion, owners, dependencies. | Template exists; validated initiatives, owners, effort, priority scores, and dependencies are pending. | M4 roadmap approved and ready for follow-on backlog creation. |
| Final readout | Leadership-ready summary of findings, target state, and path forward for business planning. | Executive summary, maturity baseline, top gaps, risk exposure, decisions required, recommended target state, roadmap priorities, investment / dependency view, residual risks. | Milestone exists; content depends on M1-M4 deliverables. | M5 executive presentation delivered and M6 package closed. |

### RSM Files



#  Epic Children
