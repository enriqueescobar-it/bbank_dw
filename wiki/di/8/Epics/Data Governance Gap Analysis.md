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

This epic establishes Bradesco Bank's Data Governance Framework and Target Data Architecture to improve data ownership, quality, compliance, aligned with the Databricks cloud strategy.

## 2. Business Context

### 2.1 Business Problem

- What pain point are we solving?
    - Data governance, ownership, standards, and metadata management are inconsistently applied across the organization.
- Who is impacted?
    - Business users, Data Intelligence teams, leadership, audit and compliance.
- Why does this matter now?
    - The bank is migrating to the cloud and needs governance foundations to ensure a successful transformation.
- What happens if we do nothing?
    - Data quality, accountability, compliance, and analytics challenges will continue and may increase during cloud adoption.

### 2.2 Business Goals

| Goal | Description | Success Indicator |
| --- | --- | --- |
| Data Governance Framework | Define governance domains, roles, responsibilities, and decision rights. | Data Governance Framework completed and approved. |
| Data Governance Policy | Develop a sample policy outlining governance principles and standards. | Sample Data Governance Policy delivered and reviewed. |
| Future-State Data Architecture | Define the target conceptual architecture aligned with cloud and data strategy. | Future-State Architecture Diagram completed and approved. |
| Action Plan & Roadmap | Define prioritized governance initiatives and next steps. | 30/60/90-Day Action Plan delivered and approved. |

## 3. Scope

### 3.1 In Scope

- Assessment of current Data Governance capabilities, gaps, risks, and opportunities
- Definition of Data Governance Framework, including roles and responsibilities.
- Development of a sample Data Governance Policy
- Creation of a 30/60/90-Day Action Plan and implementation roadmap.
- Design of the Future-State Conceptual Data Architecture aligned with Databricks and cloud strategy.

### 3.2 Out of Scope

- Implementation of governance tools, platforms, or technical solutions.
- Remediation of data quality issues identified during the assessment.
- Execution of roadmap initiatives beyond planning and recommendations.

## 4. Users and Stakeholders

| Role | Name / Team | Responsibility |
| --- | --- | --- |
| Data Manager | @Michel Ferreira | Supervise and align RSM team with BBank team |
| Team lead | @Enrique Escobar | Communicate inside BBANK department |
| Data analyst | @David Tatis | Provide the requested documentation or assessment |

## 5. Current State

Current-state documentation has been collected and shared for review, and stakeholder engagement began with the project kickoff meeting.

### 5.1 Current-State Challenges

- Data ownership and stewardship roles are not formally defined across all data domains.
- Governance policies, standards, and decision-making processes require formalization.
- Metadata management, data cataloging, and lineage capabilities are inconsistently applied.
- Limited visibility into data quality management and issue remediation processes.
- Data is distributed across multiple systems and platforms, increasing governance complexity.
- Future-state architecture and governance operating model are not yet formally defined.
- Regulatory, audit, and compliance risks may increase without a standardized governance framework.

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
