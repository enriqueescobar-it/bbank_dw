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

## Recommended Confluence Labels

Add these labels to the page:

- data quality

# Epic Children
