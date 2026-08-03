# \[ADF\-46\] Data Quality Framework Rollout

# Epic: Data Quality Framework Rollout

## 1. Epic Summary

**Epic ID:** [ADF-46](https://bradescobank1.atlassian.net/browse/ADF-46)

**Owner:** @\_Mariane Moraes

**Technical Lead:** @Enrique Escobar

**Status:** In Progress

**Target Release:** Q3 

**Created Date:** 2026-07-20

**Last Updated:** 2026-07-29

### 1.1 Executive Summary

This epic applies the Enterprise Data Quality Framework across prioritized business domains — NICE/TMS, Report BI, and Regulatory through RACI ownership, Dimension Applicability by Layer, Critical Data Element (CDE) identification, business rules, and the technical implementation of Data Quality tests by dimension and layer objective.

This Epic establishes what is tested and why for each domain, without yet attaching Threshold, Business Severity, or Response Strategy. Guardrail operationalization and expansion to additional domains are planned for a later phase and are tracked in the Data Quality Program Proposal, not in this document.

The outcome establishes a standardized approach for Data Quality adoption and provides the foundation for monitoring, reporting, and future domain onboarding.

## 2. Business Context

### 2.1 Business Problem

The organization currently lacks a standardized and consistently implemented approach to Data Quality across business domains. While the Enterprise Data Quality Framework defines governance, ownership, dimension applicability by layer, and guardrail standards, these practices have not yet been operationalized uniformly across prioritized data domains.

As a result, Data Quality controls may be implemented inconsistently, ownership responsibilities may vary between domains, and traceability between business requirements, controls, and technical validations remains limited. These gaps reduce visibility into data quality risks and hinder the organization's ability to establish consistent monitoring, auditability, and operational confidence across critical data assets.

This initiative addresses these challenges by operationalizing the Enterprise Data Quality Framework across prioritized business domains, including NICE/TMS, Report BI, and Regulatory, through the implementation of RACI ownership, Dimension Applicability by Layer, Critical Data Elements (CDEs), business rules, technical controls.

### 2.2 Business Goals

| Goal | Description | Success Indicator |
| --- | --- | --- |
| Standardize Data Quality Management | Establish a consistent approach for ownership, controls, and quality validation across business domains. | Framework standards adopted and approved across prioritized domains. |
| Increase Visibility of Data Quality Risks | Enable proactive identification and management of data quality issues through defined controls and monitoring capabilities. | Data quality controls and monitoring metrics available for implemented domains. |
| Enable Scalable Domain Onboarding | Create a repeatable model that supports expansion of Data Quality practices across additional business domains. | Framework adoption successfully replicated in new domains. |

## 3. Scope

### 3.1 In Scope

- Domain Assessment and Discovery

- Stakeholder Mapping

- RACI Implementation

- Critical Data Element (CDE) Identification

- Dimension Applicability by Layer Mapping

- Business Rule Definition by CDE

- Type Test Definition by CDE (technical validation type — not the Guardrail Rule component)

- Technical Control Design and Data Quality Test Implementation

- Domain Adoption of the Enterprise Data Quality Framework for NICE/TMS, Report BI, and Regulatory domains (Phase 1 scope)

### 3.2 Out of Scope

- Threshold Definition, Business Severity Classification, and Response Strategy Definition (Guardrail Operationalization — tracked in the Program Proposal for Q4)
- Guardrail Implementation (Rule + Threshold + Severity + Response Strategy combined)
- Expansion to domains beyond NICE/TMS, Report BI, and Regulatory
- Changes to existing medallion architectures.
- Implementation of new Landing, Staging, Bronze, Silver, or Gold layers.
- Re-engineering of existing data pipelines.
- Development of new ingestion processes.
- Enterprise-wide monitoring dashboard development.
- Data Quality score calculation and dashboard reporting.
- Alerting and notification capabilities.
- Data remediation activities and production issue resolution.
- Observability platform implementation.
- Data platform modernization initiatives and cloud migration activities.

## 4. Users and Stakeholders

| Role | Name / Team | Responsibility |
| --- | --- | --- |
| Data Manager | @Michel Ferreira | Supervise and align RSM team with BBank team |
| Team lead | @Enrique Escobar | Communicate inside BBANK department |
| Data Analyst | @\_Mariane Moraes | Provide the requested documentation or assesment |

## 5. Current State

Describe the current architecture, process, or data flow.

### 5.1 Current-State Challenges

- No formal Data Quality assessment has been consistently performed across prioritized business domains.
- Critical Data Elements (CDEs) are not formally identified or documented across onboarded domains.
- Data Quality controls are implemented inconsistently across datasets and domains.
- No standardized mapping exists between business requirements, business rules, and technical validations.
- Framework concepts such as Dimension Applicability by Layer, Thresholds, Business Severity, and Response Strategy have not been operationalized consistently.
- Limited visibility exists into framework adoption and Data Quality implementation maturity across business domains.

### 5.2 Current Systems

- 

## 6.1 Target-State Capabilities

- Documented Domain Assessments
- Business-approved Critical Data Elements (CDEs)
- Defined RACI and ownership model
- Dimension Applicability by Layer implemented
- Technical controls defined and mapped to business requirements
- Guardrails implemented (Rules, Thresholds, Business Severity, and Response Strategy)
- Repeatable framework adoption model across business domains
- Consistent Data Quality implementation across NICE/TMS, Report BI, and Regulatory domains

### 6.2 Target Architecture Summary

The target state establishes a standardized Data Quality implementation model across NICE/TMS, Report BI, and Regulatory domains: RACI ownership, Dimension Applicability by Layer, CDEs, business rules, and technical test implementation, consistently applied to support traceability and monitoring readiness. Guardrail completion (Threshold, Business Severity, Response Strategy) is out of scope for this Epic see the [Program Proposal](https://bradescobank1.atlassian.net/wiki/spaces/DQP/pages/1381203970/Data+Quality+Program+Proposal) for that roadmap.

## 7. Architecture and Design

### High-Level Architecture

Attach or link the architecture diagram here.

## 8. Data Requirements

### 8.1 Source Data

| Source System | Object / Table / API | Description | Refresh Frequency | Owner |
| --- | --- | --- | --- | --- |
|  |  |  | \<Daily / Hourly / Real-time\> |  |

### 8.2 Target Data Products

| Data Product | Description | Consumer | SLA | Owner |
| --- | --- | --- | --- | --- |
| \<Data Product 1\> |  | \<Team / Report / App\> |  |  |

### 8.3 Key Business Entities

| Entity | Definition | Source of Truth | Notes |
| --- | --- | --- | --- |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

## 9. Functional Requirements

| ID | Requirement | Priority | Acceptance Criteria |
| --- | --- | --- | --- |
| FR-001 | Implement the Data Quality Framework across prioritized business domains | Must | Framework components applied to onboarded domains |
| FR-002 | Define and validate RACI ownership for each onboarded domain | Must | RACI approved by business and technical stakeholders |
| FR-003 | Identify and document Critical Data Elements (CDEs) | Must | CDE inventory approved |
| FR-004 | Define Dimension Applicability by Layer for each domain | Must | Layer assessment completed and approved |
| FR-005 | Define and document Business Rules for prioritized CDEs | Must | Business Rules repository completed |
| FR-006 | Define and map Technical Controls (Type Test) to business requirements | Must | Control mapping completed |

---

## 10. Non-Functional Requirements

| Category | Requirement | Target |
| --- | --- | --- |
| Performance |  |  |
| Availability |  |  |
| Security |  |  |
| Data Quality |  |  |
| Observability |  |  |
| Scalability |  |  |
| Compliance |  |  |

---

## 11. Data Quality and Validation

### 11.1 Data Quality Rules

| Rule ID | Rule Description | Severity | Validation Method |
| --- | --- | --- | --- |
| DQ-001 |  | Critical / High / Medium / Low | \<SQL test / dbt test / pipeline check\> |
| DQ-002 |  | Critical / High / Medium / Low |  |

### 11.2 Reconciliation Requirements

- xxxxx

---

## 12. Security, Governance, and Compliance

### 12.1 Access Control

| Role / Group | Access Level | Data Scope |
| --- | --- | --- |
|  | Read / Write / Admin | \<Dataset / Domain\> |

### 12.2 Governance Requirements

- xxxxxx

---

## 13. Dependencies

| Dependency | Type | Owner | Status | Notes |
| --- | --- | --- | --- | --- |
| Domain stakeholder engagement |  | Team Domain Leads | Open | Required for approval process |
| Source system knowledge |  | Data Domain Teams | Open | Required for CDE mapping |
| Existing architecture documentation |  | System Architecture Team | Open | Supports layer assessment |
| Data Quality Framework approval |  | DQ Program | Open | Framework baseline required |

---

## 14. Risks and Mitigations

| Risk | Impact | Probability | Mitigation | Owner |
| --- | --- | --- | --- | --- |
| Business Rules not documented | High | High | Conduct workshops and review sessions with SMEs | Business Owner |
| Critical Data Elements not clearly identified | High | Medium | Execute structured CDE assessment process | Technology StewardBusiness Steward |
| Missing source information or documentation | High | High | Perform discovery and technical assessment workshops | Technology Steward |
| Undefined ownership across domains | High | Medium | Validate RACI with stakeholders early in rollout | Business Owner |
| Framework interpreted differently between domains | Medium | Medium | Use standardized templates and approval process | DQ Team |
| Delays in stakeholder validation | Medium | High | Schedule recurring review and approval sessions | Technology StewardBusiness Steward |
| Low framework adoption by business areas | High | Medium | Demonstrate value through onboarding and monitoring | Technology Steward |

## 15. Delivery Plan

### 15.1 Milestones

What need to be delivered?

| Milestone | Target Date | Responsible | Status |
| --- | --- | --- | --- |
| NICE/TMS — Phase 1 (Foundation) Completed |  | @\_Mariane Moraes@Eduardo Baroni | 🟡 In Progress |
| Report BI — Phase 1 (Foundation) Completed | TBD (Q3) | @Alex Arao@Julio Cesar Bello de Moura | 🔴 Not Started |
| Regulatory — Phase 1 (Foundation) Completed | TBD (Q3) | @\_Mariane Moraes | 🔴 Not Started |

### 15.2 Work Breakdown

How can I get there?

### 2.1 NICE/TMS

|  |  |  |  |
| --- | --- | --- | --- |
| **Workstream** | **Description** | **Owner** | **Status** |
| **Phase 1 — Foundation (Q3): technical application by dimension / layer** |  |  |  |
| Discovery | Understand business objectives, data flows, scope, and domain requirements. | @\_Mariane Moraes@Eduardo Baroni | 🟡 In Progress |
| Stakeholders & RACI | Identify stakeholders, define ownership, accountability, and governance responsibilities. | @\_Mariane Moraes@Eduardo Baroni | 🟡 In Progress |
| CDE Identification | Identify and prioritize Critical Data Elements (CDEs). | @\_Mariane Moraes@Eduardo Baroni | 🟡 In Progress |
| Dimension Applicability by Layer | Map applicable Data Quality dimensions across Landing, Staging, Bronze, Silver, and Gold layers. | @\_M@\_Mariane Moraes@Eduardo Baroni | 🟡 In Progress |
| Business Rule Mapping | Translate business requirements into Data Quality controls and validations. | @\_Mariane Moraes@Eduardo Baroni | 🟡 In Progress |
| Type Test Definition by CDE | Define the technical validation type (e.g., Not Null, Format, Range check) associated with each CDE. This is a technical test classification only — distinct from the Guardrail's "Rule" component (Min/Max/Between/Baseline), which is defined in Phase 2. | @\_Mariane Moraes@Eduardo Baroni | 🟡 In Progress |
| Data Quality Test Implementation | Implement the technical validations defined above (test execution only — no Threshold, Severity, or Response Strategy attached yet). | @\_Mariane Moraes@Eduardo Baroni | 🔴 Not Started |

 

### 2.2 Report BI

|  |  |  |  |
| --- | --- | --- | --- |
| **Workstream** | **Description** | **Owner** | **Status** |
| **Phase 1 — Foundation (Q3): technical application by dimension / layer** |  |  |  |
| Discovery | Understand business objectives, data flows, scope, and domain requirements. | @\_Mariane Moraes@Alex Arao@Julio Cesar Bello de Moura | 🔴 Not Started |
| Stakeholders & RACI | Identify stakeholders, define ownership, accountability, and governance responsibilities. | @\_Mariane Moraes@Alex Arao@Julio Cesar Bello de Moura | 🔴 Not Started |
| CDE Identification | Identify and prioritize Critical Data Elements (CDEs). | @\_Mariane Moraes@Alex Arao@Julio Cesar Bello de Moura | 🔴 Not Started |
| Dimension Applicability by Layer | Map applicable Data Quality dimensions across Landing, Staging, Bronze, Silver, and Gold layers. | @\_Mariane Moraes@Alex Arao@Julio Cesar Bello de Moura | 🔴 Not Started |
| Business Rule Mapping | Translate business requirements into Data Quality controls and validations. | @\_Mariane Moraes@Alex Arao@Julio Cesar Bello de Moura | 🔴 Not Started |
| Type Test Definition by CDE | Define the technical validation type (e.g., Not Null, Format, Range check) associated with each CDE. This is a technical test classification only — distinct from the Guardrail's "Rule" component (Min/Max/Between/Baseline), which is defined in Phase 2. | @\_Mariane Moraes@Alex Arao@Julio Cesar Bello de Moura | 🔴 Not Started |
| Data Quality Test Implementation | Implement the technical validations defined above (test execution only — no Threshold, Severity, or Response Strategy attached yet). | @\_Mariane Moraes@Alex Arao@Julio Cesar Bello de Moura | 🔴 Not Started |

 

### 2.3 Regulatory

|  |  |  |  |
| --- | --- | --- | --- |
| **Workstream** | **Description** | **Owner** | **Status** |
| **Phase 1 — Foundation (Q3): technical application by dimension / layer** |  |  |  |
| Discovery | Understand business objectives, data flows, scope, and domain requirements. |  | 🔴 Not Started |
| Stakeholders & RACI | Identify stakeholders, define ownership, accountability, and governance responsibilities. |  | 🔴 Not Started |
| CDE Identification | Identify and prioritize Critical Data Elements (CDEs). |  | 🔴 Not Started |
| Dimension Applicability by Layer | Map applicable Data Quality dimensions across Landing, Staging, Bronze, Silver, and Gold layers. |  | 🔴 Not Started |
| Business Rule Mapping | Translate business requirements into Data Quality controls and validations. |  | 🔴 Not Started |
| Type Test Definition by CDE | Define the technical validation type (e.g., Not Null, Format, Range check) associated with each CDE. This is a technical test classification only — distinct from the Guardrail's "Rule" component (Min/Max/Between/Baseline), which is defined in Phase 2. |  | 🔴 Not Started |
| Data Quality Test Implementation | Implement the technical validations defined above (test execution only — no Threshold, Severity, or Response Strategy attached yet). |  | 🔴 Not Started |

## 16. Jira / Backlog Links

| Item Type | Key / Link | Description |
| --- | --- | --- |
| Epic |  |  |
| Story |  |  |
| Spike |  |  |
| Defect |  |  |

## 17. Acceptance Criteria

The epic is complete when:

- Domain assessments are completed and approved.

- Stakeholders and RACI matrices are documented and validated.

- Critical Data Elements (CDEs) are identified and approved.

- Dimension Applicability by Layer is defined and approved.

- Priority Business Rules are documented.

- Technical Controls (Type Test) are mapped to business requirements and implemented in production environment

## 18. Operational Readiness

| Area | Requirement | Status |
| --- | --- | --- |
| Monitoring |  | Not Started |
| Alerting |  | Not Started |
| Runbook |  | Not Started |
| Support Model | \<Support team / escalation path\> | Not Started |
| SLA / SLO |  | Not Started |

## 19. Open Questions

No decision has been made yet.

| Question | Owner | Due Date | Status |
| --- | --- | --- | --- |
|  |  |  | Open |

---

## 20. Decision Log

No decision has been made yet.

| Date | Decision | Owner | Notes |
| --- | --- | --- | --- |
|  |  |  |  |

## 21. Related Documents

- xxxxx

## 22. Change Log

Updates to the document

| Date | Change | Author |
| --- | --- | --- |
| 2026-07-31 | Split Work Breakdown into Phase 1 (Foundation) / Phase 2 (Guardrail Operationalization) for all three domains; renamed "Rule Type Definition" to "Type Test Definition by CDE"; added Phase column to Functional Requirements; flagged Regulatory resourcing gap. | @\_Mariane Moraes |

## 23. Activities to Produce

```
ADF-46 Data Quality Framework Rollout
├── 1. Rollout Scope Package
│   ├── 1.1 Phase 1 Domain Scope
│   │   ├── NICE/TMS
│   │   ├── Report BI
│   │   └── Regulatory
│   ├── 1.2 Phase 1 In-Scope Framework Components
│   │   ├── Domain Assessment
│   │   ├── Stakeholder Mapping
│   │   ├── RACI Implementation
│   │   ├── CDE Identification
│   │   ├── Dimension Applicability by Layer
│   │   ├── Business Rule Definition
│   │   ├── Type Test Definition by CDE
│   │   └── Technical Control Implementation
│   └── 1.3 Phase 2 Deferred Components
│       ├── Threshold Definition
│       ├── Business Severity Classification
│       ├── Response Strategy Definition
│       └── Full Guardrail Operationalization
│
├── 2. NICE/TMS Rollout Package
│   ├── 2.1 Domain Assessment
│   ├── 2.2 Stakeholder and RACI Matrix
│   ├── 2.3 CDE Inventory
│   ├── 2.4 Dimension Applicability by Layer Matrix
│   ├── 2.5 Business Rules Catalog
│   ├── 2.6 Type Test Mapping by CDE
│   ├── 2.7 Technical Controls / DQ Tests
│   └── 2.8 Domain Approval Evidence
│
├── 3. Report BI Rollout Package
│   ├── 3.1 Domain Assessment
│   ├── 3.2 Stakeholder and RACI Matrix
│   ├── 3.3 CDE Inventory
│   ├── 3.4 Dimension Applicability by Layer Matrix
│   ├── 3.5 Business Rules Catalog
│   ├── 3.6 Type Test Mapping by CDE
│   ├── 3.7 Technical Controls / DQ Tests
│   └── 3.8 Domain Approval Evidence
│
├── 4. Regulatory Rollout Package
│   ├── 4.1 Domain Assessment
│   ├── 4.2 Stakeholder and RACI Matrix
│   ├── 4.3 CDE Inventory
│   ├── 4.4 Dimension Applicability by Layer Matrix
│   ├── 4.5 Business Rules Catalog
│   ├── 4.6 Type Test Mapping by CDE
│   ├── 4.7 Technical Controls / DQ Tests
│   └── 4.8 Domain Approval Evidence
│
├── 5. Cross-Domain Standardization Package
│   ├── 5.1 Common Rollout Template
│   ├── 5.2 Standard CDE Inventory Template
│   ├── 5.3 Standard RACI Template
│   ├── 5.4 Standard Business Rule Template
│   ├── 5.5 Standard Type Test Mapping Template
│   └── 5.6 Reusable Domain Onboarding Checklist
│
├── 6. Traceability Package
│   ├── 6.1 Domain-to-CDE Traceability
│   ├── 6.2 CDE-to-Business Rule Traceability
│   ├── 6.3 Business Rule-to-Type Test Traceability
│   ├── 6.4 Type Test-to-Technical Control Traceability
│   └── 6.5 Domain Approval Traceability
│
└── 7. Rollout Closure Package
    ├── 7.1 Domain Completion Summary
    ├── 7.2 Open Issues and Deferred Items
    ├── 7.3 Phase 2 Guardrail Backlog
    ├── 7.4 Stakeholder Sign-Off
    └── 7.5 Rollout Lessons Learned
```

### Activity Table

| Jira Task | Jira Sub-task |
| --- | --- |
| **Confirm Rollout Scope and Delivery Boundaries** | Confirm Phase 1 domain scope for NICE/TMS, Report BI, and Regulatory |
| **Confirm Rollout Scope and Delivery Boundaries** | Confirm Phase 1 framework components included in rollout |
| **Confirm Rollout Scope and Delivery Boundaries** | Confirm Phase 2 guardrail components deferred from this epic |
| **Confirm Rollout Scope and Delivery Boundaries** | Resolve scope conflict around guardrails, thresholds, severity, and response strategy |
| **Deliver NICE/TMS Domain Assessment Package** | Complete NICE/TMS domain discovery |
| **Deliver NICE/TMS Domain Assessment Package** | Document NICE/TMS business objectives and data flows |
| **Deliver NICE/TMS Domain Assessment Package** | Identify NICE/TMS source systems and priority data assets |
| **Deliver NICE/TMS Stakeholder and RACI Package** | Identify NICE/TMS business and technical stakeholders |
| **Deliver NICE/TMS Stakeholder and RACI Package** | Define NICE/TMS RACI matrix |
| **Deliver NICE/TMS Stakeholder and RACI Package** | Validate NICE/TMS ownership model with stakeholders |
| **Deliver NICE/TMS CDE Inventory Package** | Identify NICE/TMS Critical Data Elements |
| **Deliver NICE/TMS CDE Inventory Package** | Prioritize NICE/TMS CDEs for Phase 1 rollout |
| **Deliver NICE/TMS CDE Inventory Package** | Obtain stakeholder validation for NICE/TMS CDE inventory |
| **Deliver NICE/TMS Dimension Applicability Package** | Map NICE/TMS DQ dimensions by data layer |
| **Deliver NICE/TMS Dimension Applicability Package** | Validate Landing, Staging, Bronze, Silver, and Gold layer applicability |
| **Deliver NICE/TMS Dimension Applicability Package** | Obtain approval for NICE/TMS dimension applicability matrix |
| **Deliver NICE/TMS Business Rule Package** | Document business rules for prioritized NICE/TMS CDEs |
| **Deliver NICE/TMS Business Rule Package** | Trace NICE/TMS business rules to CDEs |
| **Deliver NICE/TMS Business Rule Package** | Review NICE/TMS business rules with SMEs |
| **Deliver NICE/TMS Type Test Mapping Package** | Define Type Test mapping for NICE/TMS CDEs |
| **Deliver NICE/TMS Type Test Mapping Package** | Map NICE/TMS business rules to technical validation types |
| **Deliver NICE/TMS Type Test Mapping Package** | Validate NICE/TMS Type Test mapping with technical stakeholders |
| **Deliver NICE/TMS Technical Control Package** | Design NICE/TMS technical DQ controls |
| **Deliver NICE/TMS Technical Control Package** | Implement NICE/TMS DQ tests for approved Type Test mappings |
| **Deliver NICE/TMS Technical Control Package** | Validate NICE/TMS DQ test execution results |
| **Deliver NICE/TMS Approval Package** | Package NICE/TMS rollout evidence for review |
| **Deliver NICE/TMS Approval Package** | Capture NICE/TMS stakeholder feedback |
| **Deliver NICE/TMS Approval Package** | Obtain NICE/TMS Phase 1 sign-off |
| **Deliver Report BI Domain Assessment Package** | Complete Report BI domain discovery |
| **Deliver Report BI Domain Assessment Package** | Document Report BI business objectives and data flows |
| **Deliver Report BI Domain Assessment Package** | Identify Report BI source systems and priority data assets |
| **Deliver Report BI Stakeholder and RACI Package** | Identify Report BI business and technical stakeholders |
| **Deliver Report BI Stakeholder and RACI Package** | Define Report BI RACI matrix |
| **Deliver Report BI Stakeholder and RACI Package** | Validate Report BI ownership model with stakeholders |
| **Deliver Report BI CDE Inventory Package** | Identify Report BI Critical Data Elements |
| **Deliver Report BI CDE Inventory Package** | Prioritize Report BI CDEs for Phase 1 rollout |
| **Deliver Report BI CDE Inventory Package** | Obtain stakeholder validation for Report BI CDE inventory |
| **Deliver Report BI Dimension Applicability Package** | Map Report BI DQ dimensions by data layer |
| **Deliver Report BI Dimension Applicability Package** | Validate Landing, Staging, Bronze, Silver, and Gold layer applicability |
| **Deliver Report BI Dimension Applicability Package** | Obtain approval for Report BI dimension applicability matrix |
| **Deliver Report BI Business Rule Package** | Document business rules for prioritized Report BI CDEs |
| **Deliver Report BI Business Rule Package** | Trace Report BI business rules to CDEs |
| **Deliver Report BI Business Rule Package** | Review Report BI business rules with SMEs |
| **Deliver Report BI Type Test Mapping Package** | Define Type Test mapping for Report BI CDEs |
| **Deliver Report BI Type Test Mapping Package** | Map Report BI business rules to technical validation types |
| **Deliver Report BI Type Test Mapping Package** | Validate Report BI Type Test mapping with technical stakeholders |
| **Deliver Report BI Technical Control Package** | Design Report BI technical DQ controls |
| **Deliver Report BI Technical Control Package** | Implement Report BI DQ tests for approved Type Test mappings |
| **Deliver Report BI Technical Control Package** | Validate Report BI DQ test execution results |
| **Deliver Report BI Approval Package** | Package Report BI rollout evidence for review |
| **Deliver Report BI Approval Package** | Capture Report BI stakeholder feedback |
| **Deliver Report BI Approval Package** | Obtain Report BI Phase 1 sign-off |
| **Deliver Regulatory Domain Assessment Package** | Complete Regulatory domain discovery |
| **Deliver Regulatory Domain Assessment Package** | Document Regulatory business objectives and reporting obligations |
| **Deliver Regulatory Domain Assessment Package** | Identify Regulatory source systems and priority data assets |
| **Deliver Regulatory Stakeholder and RACI Package** | Identify Regulatory business and technical stakeholders |
| **Deliver Regulatory Stakeholder and RACI Package** | Define Regulatory RACI matrix |
| **Deliver Regulatory Stakeholder and RACI Package** | Validate Regulatory ownership model with stakeholders |
| **Deliver Regulatory CDE Inventory Package** | Identify Regulatory Critical Data Elements |
| **Deliver Regulatory CDE Inventory Package** | Prioritize Regulatory CDEs for Phase 1 rollout |
| **Deliver Regulatory CDE Inventory Package** | Obtain stakeholder validation for Regulatory CDE inventory |
| **Deliver Regulatory Dimension Applicability Package** | Map Regulatory DQ dimensions by data layer |
| **Deliver Regulatory Dimension Applicability Package** | Validate Landing, Staging, Bronze, Silver, and Gold layer applicability |
| **Deliver Regulatory Dimension Applicability Package** | Obtain approval for Regulatory dimension applicability matrix |
| **Deliver Regulatory Business Rule Package** | Document business rules for prioritized Regulatory CDEs |
| **Deliver Regulatory Business Rule Package** | Trace Regulatory business rules to CDEs |
| **Deliver Regulatory Business Rule Package** | Review Regulatory business rules with SMEs |
| **Deliver Regulatory Type Test Mapping Package** | Define Type Test mapping for Regulatory CDEs |
| **Deliver Regulatory Type Test Mapping Package** | Map Regulatory business rules to technical validation types |
| **Deliver Regulatory Type Test Mapping Package** | Validate Regulatory Type Test mapping with technical stakeholders |
| **Deliver Regulatory Technical Control Package** | Design Regulatory technical DQ controls |
| **Deliver Regulatory Technical Control Package** | Implement Regulatory DQ tests for approved Type Test mappings |
| **Deliver Regulatory Technical Control Package** | Validate Regulatory DQ test execution results |
| **Deliver Regulatory Approval Package** | Package Regulatory rollout evidence for review |
| **Deliver Regulatory Approval Package** | Capture Regulatory stakeholder feedback |
| **Deliver Regulatory Approval Package** | Obtain Regulatory Phase 1 sign-off |
| **Deliver Cross-Domain Standardization Package** | Create reusable rollout template |
| **Deliver Cross-Domain Standardization Package** | Create standard CDE inventory template |
| **Deliver Cross-Domain Standardization Package** | Create standard RACI template |
| **Deliver Cross-Domain Standardization Package** | Create standard business rule template |
| **Deliver Cross-Domain Standardization Package** | Create standard Type Test mapping template |
| **Deliver Cross-Domain Standardization Package** | Create reusable domain onboarding checklist |
| **Deliver Traceability Package** | Create domain-to-CDE traceability view |
| **Deliver Traceability Package** | Create CDE-to-business-rule traceability view |
| **Deliver Traceability Package** | Create business-rule-to-Type-Test traceability view |
| **Deliver Traceability Package** | Create Type-Test-to-technical-control traceability view |
| **Deliver Traceability Package** | Capture domain approval traceability |
| **Close Phase 1 Rollout** | Prepare domain completion summary |
| **Close Phase 1 Rollout** | Document open issues and deferred items |
| **Close Phase 1 Rollout** | Create Phase 2 guardrail backlog |
| **Close Phase 1 Rollout** | Capture stakeholder sign-off |
| **Close Phase 1 Rollout** | Document rollout lessons learned |

## Recommended Confluence Labels

Add these labels to the page:

- data quality

# Epic Children
