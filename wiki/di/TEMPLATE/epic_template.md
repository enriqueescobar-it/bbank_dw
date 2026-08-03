# epic\_template

# Epic: \<Epic Name\>

## 1. Epic Summary

**Epic ID:** \<Jira Epic Key / Reference\> 

**Owner:** \<Product Owner / Business Owner\> 

**Technical Lead:** \<Tech Lead / Architect\> 

**Status:** Draft / In Review / Approved / In Progress / Blocked / Complete 

**Target Release:** \<Release / PI / Quarter\> 

**Created Date:** \<YYYY-MM-DD\> 

**Last Updated:** \<YYYY-MM-DD\>

### 1.1 Executive Summary

Briefly describe the purpose of this epic in business and technical terms.

Example:

This epic delivers a governed, scalable data capability to support analytics, operational reporting, and downstream AI/ML use cases by modernizing the ingestion, transformation, and serving layers for \<business domain\>.

## 2. Business Context

### 2.1 Business Problem

Describe the business problem or opportunity this epic addresses.

- What pain point are we solving?
- Who is impacted?
- Why does this matter now?
- What happens if we do nothing?

### 2.2 Business Goals

| Goal | Description | Success Indicator |
| --- | --- | --- |
| \<Goal 1\> | \<Description\> | \<Metric or outcome\> |
| \<Goal 2\> | \<Description\> | \<Metric or outcome\> |

## 3. Scope

### 3.1 In Scope

- \<Capability, system, workflow, data domain, or process included\>
- \<Deliverable included\>
- \<Integration included\>
- \<Reporting, analytics, or data product included\>

### 3.2 Out of Scope

- \<Explicit exclusion\>
- \<Future phase item\>
- \<Dependency not covered by this epic\>

## 4. Users and Stakeholders

| Role | Name / Team | Responsibility |
| --- | --- | --- |
| Business Owner | \<Name\> | Owns business value and prioritization |
| Product Owner | \<Name\> | Owns backlog and acceptance criteria |
| Tech Lead | \<Name\> | Owns technical delivery |
| Data Owner | \<Name\> | Owns business meaning and data quality |
| Data Steward | \<Name\> | Owns glossary, definitions, and governance |
| Engineering Team | \<Team\> | Delivers implementation |
| QA / Validation | \<Team\> | Validates acceptance criteria |

## 5. Current State

Describe the current architecture, process, or data flow.

### 5.1 Current-State Challenges

- \<Manual process\>
- \<Data quality issue\>
- \<Lack of standardization\>
- \<Reporting gap\>
- \<Performance issue\>
- \<Governance or lineage gap\>
- \<Operational risk\>

### 5.2 Current Systems

- 

## 6. Target State

Describe the desired future state.

### 6.1 Target-State Capabilities

- \<Capability 1\>
- \<Capability 2\>
- \<Capability 3\>

### 6.2 Target Architecture Summary

Describe the intended architecture at a high level.

Example:

The target state introduces a governed data pipeline using bronze, silver, and gold layers. Source data is ingested into the raw layer, standardized and validated in the curated layer, and exposed through trusted business-ready data products for BI, analytics, and AI-ready consumption.

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
| FR-001 |  | Must / Should / Could |  |
| FR-002 |  | Must / Should / Could |  |

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

- Data classification:
- PII / sensitive data handling:
- Data retention:
- Audit logging:
- Lineage:
- Approval workflow:
- Business glossary updates:

---

## 13. Dependencies

| Dependency | Type | Owner | Status | Notes |
| --- | --- | --- | --- | --- |
|  | System / Team / Data / Vendor |  | Open / Closed |  |

---

## 14. Risks and Mitigations

| Risk | Impact | Probability | Mitigation | Owner |
| --- | --- | --- | --- | --- |
|  | High / Medium / Low | High / Medium / Low |  |  |

## 15. Delivery Plan

### 15.1 Milestones

| Milestone | Target Date | Owner | Status |
| --- | --- | --- | --- |
| Discovery complete |  |  | Not Started |
| Design approved |  |  | Not Started |
| Development complete |  |  | Not Started |
| QA complete |  |  | Not Started |
| Production release |  |  | Not Started |

### 15.2 Work Breakdown

| Workstream | Description | Owner | Status |
| --- | --- | --- | --- |
| Ingestion |  |  | Not Started |
| Transformation |  |  | Not Started |
| Data Modeling |  |  | Not Started |
| Reporting / BI |  |  | Not Started |
| QA / Validation |  |  | Not Started |
| Deployment |  |  | Not Started |

## 16. Jira / Backlog Links

| Item Type | Key / Link | Description |
| --- | --- | --- |
| Epic |  |  |
| Story |  |  |
| Spike |  |  |
| Defect |  |  |

## 17. Acceptance Criteria

The epic is complete when:

- Business requirements are reviewed and approved.
- Architecture and design are reviewed and approved.
- Required source data is available and validated.
- Pipelines are implemented and tested.
- Data quality checks are implemented.
- Security and access controls are configured.
- Documentation is complete.
- Business validation is complete.
- Production deployment is complete.
- Monitoring and support handoff are complete.

## 18. Operational Readiness

| Area | Requirement | Status |
| --- | --- | --- |
| Monitoring |  | Not Started |
| Alerting |  | Not Started |
| Runbook |  | Not Started |
| Support Model | \<Support team / escalation path\> | Not Started |
| SLA / SLO |  | Not Started |

## 19. Open Questions

| Question | Owner | Due Date | Status |
| --- | --- | --- | --- |
|  |  |  | Open |

---

## 20. Decision Log

| Date | Decision | Owner | Notes |
| --- | --- | --- | --- |
|  |  |  |  |

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
|  | Initial draft |  |

## Recommended Confluence Labels

Add these labels to the page:

- text

- epic template

- data-platform

- architecture

- delivery

- governance

# Epic Children
