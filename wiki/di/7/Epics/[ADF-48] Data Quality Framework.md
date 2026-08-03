# \[ADF\-48\] Data Quality Framework

# Epic: Data Quality Framework

## 1. Epic Summary

**Epic ID:** ADF-48

**Owner:** @\_Mariane Moraes  

**Technical Lead:** @Enrique Escobar

**Status:** In Progress

**Target Release:** 2026-09-30

**Created Date:** 2026-07-13

**Last Updated:** 2026-07-31

### 1.1 Executive Summary

This epic establishes the Enterprise Data Quality Framework, providing the standards, governance model, implementation methodology, and supporting artifacts required to enable consistent Data Quality adoption across business domains.

The framework defines how data quality initiatives are assessed, designed, implemented, monitored, and governed, ensuring a standardized approach across the organization.

The outcome of this initiative is a reusable Data Quality operating model that supports domain onboarding, control implementation, measurement, and continuous improvement.

## 2. Business Context

### 2.1 Business Problem

Describe the business problem or opportunity this epic addresses.

- No standardized Enterprise Data Quality Framework.
- Inconsistent implementation of Data Quality controls across domains.
- Lack of common definitions for dimensions, rules, thresholds, and severity levels.
- No standardized implementation methodology for domain onboarding.
- Future platform modernization requires a scalable and reusable Data Quality operating model.

### 2.2 Business Goals

| Goal | Description | Success Indicator |
| --- | --- | --- |
| Establish Data Quality Framework | Create enterprise standards and governance | 100% framework approved |
| Standardize DQ Implementation | Provide a repeatable implementation methodology | Same implementation methodology successfully reused across NICE/TMS, Report BI, and Regulatory domains |
| Enable Domain Adoption | Allow business domains to onboard using a common approach | New domains onboard using the Framework without requiring custom methodology work |
| Support Platform Modernization | Align Data Quality with future architecture initiatives | Framework concepts mapped to Databricks-equivalent capabilities (Unity Catalog, Delta Live Tables) with no redesign required |

## 3. Scope

### 3.1 In Scope

- Enterprise Data Quality Framework
- RACI structure
- Data Quality dimensions applied by layer (Medallion Architecture)
- Technical validation standards
- Threshold methodology
- Severity classification model
- Technical actions Catalog
- Critical Data Element (CDE) methodology
- Framework documentation

### 3.2 Out of Scope

- Production issue remediation and operational support activities
- Development of monitoring dashboards and reporting solutions
- Data cleansing or historical data correction initiatives
- Data Contract principles
- Data Contract ownership guidelines
- Data Contract minimum requirements

## 4. Users and Stakeholders

| Role | Name / Team | Responsibility |
| --- | --- | --- |
| Data Manager | @Michel Ferreira | Supervise and align RSM team with BBank team |
| Team lead | @Enrique Escobar | Communicate inside BBANK department |
| Data Analyst | @\_Mariane Moraes | Provide the requested documentation or assestment |

## 5. Current State

Describe the current architecture, process, or data flow.

### 5.1 Current-State Challenges

- No standard process exists for CDE identification.
- Thresholds and severity levels are not defined.
- No Monitoring approaches across domains.
- No Data Quality Implemented by layer and Source

### 5.2 Current Systems

- 

## 6. Target State

Describe the desired future state.

### 6.1 Target-State Capabilities

- Standardized implementation methodology
- Defined Data Quality dimensions by layer goal
- Common rule definition structure
- Guardrails Definition and Classification
- Reusable templates and artifacts
- Continuous improvement model

### 6.2 Target Architecture Summary

Describe the intended architecture at a high level.

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
| FR-001 | Define enterprise Data Quality dimensions and their applicability by layer | Must | Dimension catalog approved |
| FR-002 | Define Data Quality governance model and RACI ownership | Must | Governance and RACI approved |
| FR-003 | Define Guardrail methodology (Rule + Threshold + Severity + Response Strategy) | Must | Guardrail model documented |
| FR-004 | Define severity classification model and response strategies | Must | Severity catalog approved |
| FR-005 | Define threshold calibration methodology | Must | Threshold methodology documented |

---

## 10. Non-Functional Requirements

| Category | Requirement | Target |
| --- | --- | --- |
| Dimensions | Characteristics used to measure data quality |  |
| Technical Rules | Technical implementation of validations |  |
| Thresholds | Acceptance limits and guardrails |  |
| Severity Levels | Impact classification model |  |
| Technical Actions | Response actions triggered by issues |  |
| Layer Applicability | Guidance on which dimensions apply to each data layer |  |
| RACI Model | Ownership and accountability structure |  |
| Guardrails | Combination of Rules, Thresholds, Severity and Response Strategy |  |
| Response Strategies | Operational treatment of violations |  |

---

## 11. Data Quality and Validation

### 11.1 Data Quality Rules

| Rule ID | Rule Description | Severity | Validation Method |
| --- | --- | --- | --- |
| DQ-001 |  | Critical / High / Medium / Low | \<SQL test / dbt test / pipeline check\> |
| DQ-002 |  | Critical / High / Medium / Low |  |

### 11.2 Reconciliation Requirements

- Source-to-target record count validation:
- Balance / amount reconciliation:
- Duplicate detection:
- Null checks:
- Referential integrity:
- Business-rule validation:

---

## 12. Security, Governance, and Compliance

### 12.1 Access Control

| Role / Group | Access Level | Data Scope |
| --- | --- | --- |
|  | Read / Write / Admin | \<Dataset / Domain\> |

### 12.2 Governance Requirements

- xxxxx

---

## 13. Dependencies

| Dependency | Type | Owner | Status | Notes |
| --- | --- | --- | --- | --- |
|  | System / Team / Data / Vendor |  | Open / Closed |  |

---

## 14. Risks and Mitigations

| Risk | Impact | Probability | Mitigation | Owner |
| --- | --- | --- | --- | --- |
| Lack of business engagement during framework definition and review | High | Medium | Conduct periodic review sessions with business stakeholders and secure approvals at key milestones | DQ Team |
| Inconsistent interpretation of DQ dimensions across domains | High | Medium | Publish dimension definitions, reference matrix, and implementation examples | DQ Team |
| Undefined ownership and responsibilities for Data Quality activities | High | Medium | Establish and approve RACI model before framework rollout | DQ Team |
| Framework becomes overly complex and difficult to adopt | High | Medium | Prioritize practical guidance, templates, and onboarding materials | DQ Team |
| Delays in stakeholder reviews and approvals | Medium | High | Schedule review checkpoints and define decision owners in advance | DQ Team / Stakeholders |
| Lack of alignment between business rules and technical validations | High | Medium | Define standard rule structure and traceability between business and technical controls | DQ Team |
| Low adoption by future domains | High | Medium | Define onboarding methodology and reusable implementation artifacts | DQ Team |

## 15. Delivery Plan

### 15.1 Milestones

|  |  |  |  |
| --- | --- | --- | --- |
| Milestone | Target Date | Owner | Status |
| Framework Baseline Definition | Jul 21, 2026 | @\_Mariane Moraes | ✅ Completed |
| Stakeholder Review Cycle | Aug 2026 | @Enrique Escobar@Michel Ferreira | 🔶 BlockedAwaiting Review |
| Framework Refinement & Enhancements | TBD | @\_Mariane Moraes | 🔴 Not Started |
| Framework Approval | TBD | @Enrique Escobar@Michel Ferreira | 🔶 Blocked Awaiting Review |
| Framework V1 Publication | TBD | @\_Mariane Moraes | 🔴 Not Started |

### 15.2 Work Breakdown

|  |  |  |  |
| --- | --- | --- | --- |
| Workstream | Description | Owner | Status |
| Framework Structure | Define scope, principles,  and framework structure | @\_Mariane Moraes | ✅ Completed |
| Data Quality Dimensions | Define dimensions and applicability by layer | @\_Mariane Moraes | ✅ Completed |
| Guardrails Definition | Define rules, thresholds, severity classification, and response strategy | @\_Mariane Moraes | ✅ Completed |
| Stakeholder Review Cycle | Collect stakeholder feedback and review framework artifacts | @Enrique Escobar@Michel Ferreira | 🔶 BlockedAwaiting Review |
| Framework Refinement | Incorporate approved recommendations and improve framework documentation | @\_Mariane Moraes | 🔴 Not Started |
| Framework Approval | Obtain formal approval from Business and Technology stakeholders | @Enrique Escobar@Michel Ferreira | 🔶 Blocked Awaiting Review |
| Framework Publication | Publish Framework V1 and adoption guidance | @\_Mariane Moraes | 🔴 Not Started |

## 16. Jira / Backlog Links

| Item Type | Key / Link | Description |
| --- | --- | --- |
| Epic |  |  |
| Story |  |  |
| Spike |  |  |
| Defect |  |  |

## 17. Acceptance Criteria

The epic is complete when:

- Enterprise Data Quality Framework document is approved
- RACI matrix is defined
- Data Quality dimensions by layer are defined
- Severity classification model is defined
- Threshold methodology is established
- Strategy Response model is documented
- Domain onboarding process is documented

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
| Should Landing and Staging be represented as separate layers or as a single ingestion layer? |   | 2026-07-21 | Finish |
| What should be the standard remediation strategy when critical Data Quality checks fail (pipeline stop, continue processing, or quarantine invalid records in a temporary/error table)? This decision may vary based on pipeline characteristics and business requirements. |  | 2026-07-24 | Finish |
| Should the Enterprise Data Quality Framework adopt a 3-level or 4-level severity model, and what remediation actions should be associated with each severity level? |  | 2026-07-24 | Finish |

---

## 20. Decision Log

The decision was made.

| Date | Decision | Owner | Notes |
| --- | --- | --- | --- |
| 2026-07-14 | Data Quality controls shall be selected according to the objective of each layer rather than applying all dimensions uniformly across the pipeline. |  |   |
| 2026-07-20 | Data Quality controls are risk-based and aligned with the business objective of each layer. |  |   |
|  | The business Severity will have just 3 option (critical, high and medium) |  |  |
|  | The action should be determined by the owner, who can select from a predefined catalog of response options. The appropriate action will also depend on the business severity of the issue. |  |  |

## 21. Related Documents

- Architecture diagram:
- Data dictionary:
- Source-to-target mapping:
- Business glossary:
- API documentation:
- Security review:
- Test plan:
- Release plan:

## 22. Change Log

| Date | Change | Author |
| --- | --- | --- |
| 2026-07-20 | [Framework ](https://bradescobank1.atlassian.net/wiki/spaces/DQP/pages/1332477962/Framework)updated to explicitly separate Landing and Staging layers. Landing focuses on delivery monitoring, while Staging focuses on technical validation and ingestion readiness. | @\_Mariane Moraes |
| 2026-07-20 | [RACI ](https://bradescobank1.atlassian.net/wiki/spaces/DQP/pages/1332477962/Framework)model was updated to align with the medallion architecture [proposal ](https://bradescobank1.atlassian.net/wiki/spaces/DQP/pages/1332215810/proposal_example)and layer-based responsibilities. | @\_Mariane Moraes |
| 2026-07-20 | [Layer applicability guidance](https://bradescobank1.atlassian.net/wiki/spaces/DQP/pages/1332477962/Framework) was revised to support Landing → Staging → Bronze → Silver → Gold lifecycle. | @\_Mariane Moraes |
| 2026-07-20 | Added Resolution SLA information to the [Severity-to-Action Mapping section](https://bradescobank1.atlassian.net/wiki/spaces/DQP/pages/1332477962/Framework) | @\_Mariane Moraes |
|  | Delete the low severity from Business severity | @\_Mariane Moraes |
|  | The response strategy should be selected by the owner from a predefined catalog of available options. The final decision is up to the owner and should be based on the business severity, impact, and context of the issue. | @\_Mariane Moraes |

## 23. Activities to Produce

```
ADF-48 Enterprise Data Quality Framework
├── 1. Framework Foundation Package
│   ├── 1.1 Framework Purpose and Scope
│   ├── 1.2 Data Quality Principles
│   ├── 1.3 Framework Lifecycle
│   │   ├── Assess
│   │   ├── Design
│   │   ├── Implement
│   │   ├── Monitor
│   │   └── Improve
│   └── 1.4 Framework Alignment to Medallion Architecture
│       ├── Landing
│       ├── Staging
│       ├── Bronze
│       ├── Silver
│       └── Gold
│
├── 2. Governance and Ownership Package
│   ├── 2.1 Data Quality Governance Model
│   ├── 2.2 RACI Matrix
│   ├── 2.3 Business Steward Responsibilities
│   ├── 2.4 Technology Steward Responsibilities
│   ├── 2.5 Data Owner Responsibilities
│   ├── 2.6 Escalation and Approval Model
│   └── 2.7 Continuous Review Cadence
│
├── 3. Data Quality Dimensions Package
│   ├── 3.1 Dimension Catalog
│   │   ├── Completeness
│   │   ├── Validity
│   │   ├── Accuracy
│   │   ├── Consistency
│   │   ├── Uniqueness
│   │   ├── Timeliness / Freshness
│   │   └── Integrity
│   ├── 3.2 Dimension Definitions
│   ├── 3.3 Dimension Applicability by Layer Matrix
│   └── 3.4 Dimension Examples by Data Layer
│
├── 4. Critical Data Element Methodology Package
│   ├── 4.1 CDE Definition Criteria
│   ├── 4.2 CDE Identification Process
│   ├── 4.3 CDE Prioritization Model
│   ├── 4.4 CDE Approval Process
│   └── 4.5 CDE Inventory Template
│
├── 5. Guardrail Methodology Package
│   ├── 5.1 Guardrail Definition
│   ├── 5.2 Rule Model
│   │   ├── Min
│   │   ├── Max
│   │   ├── Between
│   │   ├── Baseline
│   │   └── Allowed Values
│   ├── 5.3 Threshold Methodology
│   ├── 5.4 Severity Classification Model
│   │   ├── Critical
│   │   ├── High
│   │   └── Medium
│   ├── 5.5 Response Strategy Catalog
│   ├── 5.6 Severity-to-Action Mapping
│   └── 5.7 Resolution SLA Guidance
│
├── 6. Technical Validation Standards Package
│   ├── 6.1 Technical Rule Catalog
│   ├── 6.2 Type Test Catalog
│   │   ├── Not Null
│   │   ├── Unique
│   │   ├── Accepted Values
│   │   ├── Referential Integrity
│   │   ├── Format Check
│   │   ├── Range Check
│   │   ├── Freshness Check
│   │   └── Volume Check
│   ├── 6.3 Technical Action Catalog
│   ├── 6.4 Validation Pattern by Layer
│   └── 6.5 Business Rule to Technical Control Mapping
│
├── 7. Implementation Methodology Package
│   ├── 7.1 Domain Assessment Method
│   ├── 7.2 Stakeholder Mapping Method
│   ├── 7.3 Rule Definition Workflow
│   ├── 7.4 Threshold Calibration Workflow
│   ├── 7.5 Control Implementation Workflow
│   ├── 7.6 Review and Approval Workflow
│   └── 7.7 Continuous Improvement Workflow
│
├── 8. Reusable Templates and Artifacts Package
│   ├── 8.1 Domain Assessment Template
│   ├── 8.2 RACI Template
│   ├── 8.3 CDE Inventory Template
│   ├── 8.4 Business Rule Template
│   ├── 8.5 Guardrail Definition Template
│   ├── 8.6 Dimension Applicability Matrix Template
│   ├── 8.7 Technical Control Mapping Template
│   ├── 8.8 Issue / Exception Handling Template
│   └── 8.9 Approval Evidence Template
│
├── 9. Framework Documentation Package
│   ├── 9.1 Framework Main Document
│   ├── 9.2 Glossary
│   ├── 9.3 Examples and Use Cases
│   ├── 9.4 Adoption Guide
│   ├── 9.5 FAQ / Decision Guidance
│   └── 9.6 Version History
│
└── 10. Framework Approval and Publication Package
    ├── 10.1 Stakeholder Review Evidence
    ├── 10.2 Open Decision Resolution
    ├── 10.3 Formal Approval
    ├── 10.4 Published Framework V1
    └── 10.5 Backlog for Future Enhancements
```

## Recommended Confluence Labels

Add these labels to the page:

- data quality
- framework
- guardrail
- data quality dimensiom


# Epic Children
