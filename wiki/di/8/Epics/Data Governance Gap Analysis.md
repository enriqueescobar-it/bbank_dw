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

Current-state documentation has been collected and shared for review, and stakeholder engagement began with the project kickoff meeting.

The current-state Data Governance assessment is in progress. The assessment has been initiated through RSM engagement, project kickoff, stakeholder alignment, and collection of available governance, architecture, and data-domain documentation.

Current evidence indicates that Bradesco Bank has active data management and Data Intelligence capabilities, but enterprise governance practices are not yet consistently formalized across domains, platforms, and decision-making processes. Governance-related activities exist in several areas, including Data Quality, data architecture, reporting support, and critical data-domain discovery; however, these capabilities are not yet fully connected through a unified governance operating model.

The current assessment baseline includes the following workstreams:

| Assessment Area | Current-State Focus | Evidence / Source |
| --- | --- | --- |
| Governance Operating Model | Executive sponsorship, decision rights, stewardship, ownership, escalation, and governance cadence. | RSM WBS, Governance Framework recommendations |
| Data Domain Assessment | Identification of critical business domains and domain ownership gaps. | Critical Data Domains, Data Domains & Ownership |
| Data Asset Assessment | Source system inventory, product inventory review, and business glossary seed. | RSM WBS, BradescoRSM task inventory |
| Metadata and Catalog Assessment | Business metadata, glossary standardization, technical metadata, and catalog coverage. | RSM WBS, Target-State Architecture draft |
| Data Lineage Assessment | Source-to-landing, landing-to-warehouse, warehouse-to-reporting, and regulatory traceability review. | RSM WBS, Target-State Architecture draft |
| Data Quality Assessment | DQ framework review, DQ dimensions, CDEs, quality rules, and monitoring expectations. | Data Quality Framework, Framework.md |
| Security, Privacy, and Compliance Assessment | Classification, privacy, access, auditability, regulatory controls, and sensitive data handling. | Governance Policy recommendations, Target-State Architecture draft |
| Architecture and Platform Assessment | Current architecture, Databricks/cloud target-state alignment, Unity Catalog, lineage, DQ, and security architecture. | Target-State Architecture draft |
| Monitoring and Reporting Assessment | Governance KPIs, DQ scorecards, catalog completeness metrics, lineage coverage, and issue tracking. | Governance Framework recommendations, Dashboard Monitoring DQ |

### 5.1 Current-State Challenges

- Data ownership and stewardship roles are not formally defined across all data domains.
- Governance policies, standards, and decision-making processes require formalization.
- Metadata management, data cataloging, and lineage capabilities are inconsistently applied.
- Limited visibility into data quality management and issue remediation processes.
- Data is distributed across multiple systems and platforms, increasing governance complexity.
- Future-state architecture and governance operating model are not yet formally defined.
- Regulatory, audit, and compliance risks may increase without a standardized governance framework.

| Challenge | Impact | Evidence / Source | Priority |
| --- | --- | --- | --- |
| Data ownership and stewardship roles are not formally assigned across all critical data domains. | Data issues lack clear accountability, delaying resolution and weakening audit readiness. | Data Domains & Ownership; Critical Data Domains; RSM WBS Ownership Assessment | High |
| Governance decision rights and escalation paths are not fully documented. | Policy decisions, issue prioritization, and cross-domain conflicts may be handled inconsistently. | Governance Framework & Policy Recommendations; RSM WBS Decision Rights Assessment | High |
| Critical data domains are still being identified and refined. | Domain boundaries, ownership assignments, and stewardship responsibilities remain incomplete. | Critical Data Domains; Data Domains Adjusted; Business Domains Adjusted | High |
| Metadata and business glossary coverage are immature. | Business definitions, ownership, and technical metadata are difficult to standardize and reuse. | RSM WBS Metadata & Catalog Assessment; Epic Backlog Seed | High |
| Data lineage and traceability are not consistently documented end to end. | Impact analysis, regulatory traceability, and audit evidence require manual investigation. | RSM WBS Lineage Assessment; Target-State Architecture draft | High |
| Data Quality practices exist but are not yet governed through an enterprise operating model. | DQ rules, CDE mappings, thresholds, ownership, and remediation responsibilities may vary by domain. | Framework.md; ADF-48 Data Quality Framework; ADF-46 Rollout | High |
| Classification, privacy, and access governance require formal assessment and standardization. | Sensitive data handling, access controls, and regulatory alignment may be inconsistent across platforms. | Governance Policy Recommendations; Target-State Architecture draft | Medium-High |
| Current architecture is distributed across multiple systems and layers. | Governance controls such as cataloging, lineage, access, and quality monitoring are harder to enforce consistently. | Target-State Architecture draft; Current State Overview; LandingDW | Medium-High |
| Governance metrics and reporting are not yet established. | Leadership cannot easily monitor governance adoption, data ownership coverage, DQ maturity, or remediation progress. | Governance Policy Recommendations; Dashboard Monitoring DQ | Medium |
| RSM deliverables are currently structured but still require Bradesco-specific findings, scoring, and evidence population. | The epic cannot be considered complete until maturity scores, observations, and roadmap initiatives are populated and reviewed. | Current-State Maturity Assessment; Epic Backlog Seed; RSM WBS | High |

## 6. Target State

Bradesco Bank defined a formal Data Governance Framework, documented policies, defined governance roles, and a target-state data architecture that supports trusted, compliant, and scalable data management across the organization.

### 6.1 Target-State Capabilities

- Defined Data Governance Framework and operating model.
- Documented Data Governance Policy and standards.
- Future-state data architecture aligned with cloud modernization strategy.
- Clear governance roles.
- Roadmap and action plan for governance adoption.

## 7. Architecture and Design

### High-Level Architecture

**To be attached:** Future-State Conceptual Data Architecture Diagram (RSM Deliverable).

## 8. Data Requirements

### 8.1 Source Data

| Source System | Object / Table / API | Description | Refresh Frequency | Owner |
| --- | --- | --- | --- | --- |
| Data Governance Assessment | Governance Artifacts | Existing Governance documentation and standards | Ad Hoc | @David Tatis |
| Current Data Architecture | Architecture Documents | Current-state architecture, data flows and system inventory | Ad Hoc | @David Tatis |
| Stakeholders | Interviews | Business and technical knowledge transfers | Ad Hoc |  |

### 8.2 Target Data Products

| Data Product | Description | Consumer | SLA | Owner |
| --- | --- | --- | --- | --- |
| Data Governance Framework | Governance roles, and operating model | Business & IT |  | Data foundation |
| Data Governance Policy | Governance principles, standards, and controls | Business & IT |  | Data foundation |
| Future-State Architecture Diagram | Target conceptual data architecture | Infrastructure & Data Teams |  | Data Intelligence |
| 30/60/90-Day Action Plan | Prioritized implementation roadmap | Business & IT |  | Data Intelligence |

## 9. Functional Requirements

| ID | Requirement | Priority | Acceptance Criteria |
| --- | --- | --- | --- |
| FR-001 | Assess current-state data governance capabilities and identify gaps. | Must | Gap assessment completed and documented. |
| FR-002 | Define Data Governance Framework, including roles and responsibilities. | Must | Framework reviewed by stakeholders. |
| FR-003 | Develop a sample Data Governance Policy. | Must | Policy draft completed and reviewed. |
| FR-004 | Define Future-State Conceptual Data Architecture. | Must | Architecture diagram completed. |
| FR-005 | Develop a 30/60/90-Day Action Plan. | Must | Action plan documented and approved. |

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
