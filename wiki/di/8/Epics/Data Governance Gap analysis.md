# Data Governance Gap analysis

# Epic:  Data Governance Gap analysis

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
| Data analyst | @David Tatis | Provide the requested documentation or assestment |

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
| Current Data Artchitecture | Architecture Documents | Current-state architecture, data flows and system inventory | Ad Hoc | @David Tatis |
| Stake holders | Interviews | Business and technical knowledge transfers | Ad Hoc |  |

### 8.2 Target Data Products

| Data Product | Description | Consumer | SLA | Owner |
| --- | --- | --- | --- | --- |
| Data Governance Framework | Governance roles, and operating model | Business & It |  | Data foundation |
| Data Governance Policy | Governance principles, standards, and controls | Business & It |  | Data foundation |
| Future-State Architecture Diagram | Target conceptual data architecture | Infrastructure & Data Teams |  | Data Intelligence |
| 30/60/90-Day Action Plan | Prioritized implementation roadmap | Business & It |  | Data Intelligence |

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

## DELIVERABLES?

### RSM List

| Deliverable | Description |
| --- | --- |
| Current-state maturity assessment | Scored baseline across all governance components, with prioritized observations based on the assessment framework |
| Governance framework & policy recommendations | Policy sample draft, standards, and stewardship model to sustain governance |
| Target-state conceptual data architecture | Conceptual data architecture on Cloud / Databricks and a governance operating model |
| Prioritized remediation roadmap | Risk-based, sequenced actions with effort and dependency guidance, along with a 30/60/90-day action plan |
| Final readout | Leadership-ready summary of findings, target state, and the path forward, which can be leveraged for the business plan |

### WBS

| W | B | S |
| --- | --- | --- |
| 1\_Project Governance & Engagement Management | 1.1\_Project Initiation | 1.1.1\_Kickoff Meeting |
| 1\_Project Governance & Engagement Management | 1.1\_Project Initiation | 1.1.2\_Stakeholder Register |
| 1\_Project Governance & Engagement Management | 1.1\_Project Initiation | 1.1.3\_Assessment Methodology |
| 1\_Project Governance & Engagement Management | 1.1\_Project Initiation | 1.1.4\_Communication Plan |
| 2\_Current State Data Governance Assessment | 2.1\_Governance Operating Model Assessment | 2.1.1\_Executive Sponsorship Assessment |
| 2\_Current State Data Governance Assessment | 2.1\_Governance Operating Model Assessment | 2.1.2\_Decision Rights Assessment |
| 2\_Current State Data Governance Assessment | 2.1\_Governance Operating Model Assessment | 2.1.3\_Stewardship Assessment |
| 2\_Current State Data Governance Assessment | 2.1\_Governance Operating Model Assessment | 2.1.4\_Ownership Assessment |
| 2\_Current State Data Governance Assessment | 2.2\_Data Domain Assessment | 2.2.1\_Customer Domain |
| 2\_Current State Data Governance Assessment | 2.2\_Data Domain Assessment | 2.2.2\_Deposit Domain |
| 2\_Current State Data Governance Assessment | 2.2\_Data Domain Assessment | 2.2.3\_Time Deposit Domain |
| 2\_Current State Data Governance Assessment | 2.2\_Data Domain Assessment | 2.2.4\_Treasury Domain |
| 2\_Current State Data Governance Assessment | 2.2\_Data Domain Assessment | 2.2.5\_Finance Domain |
| 2\_Current State Data Governance Assessment | 2.2\_Data Domain Assessment | 2.2.6\_Regulatory Reporting Domain |
| 2\_Current State Data Governance Assessment | 2.2\_Data Domain Assessment | 2.2.7\_Risk Domain |
| 2\_Current State Data Governance Assessment | 2.3\_Data Asset Assessment | 2.3.1\_Source System Inventory |
| 2\_Current State Data Governance Assessment | 2.3\_Data Asset Assessment | 2.3.2\_Product Inventory Review |
| 2\_Current State Data Governance Assessment | 2.3\_Data Asset Assessment | 2.3.3\_Business Glossary Seed |
| 3\_Metadata & Catalog Assessment | 3.1\_Business Metadata Assessment | 3.1.1\_Glossary Assessment |
| 3\_Metadata & Catalog Assessment | 3.1\_Business Metadata Assessment | 3.1.2\_Definition Standardization |
| 3\_Metadata & Catalog Assessment | 3.2\_Technical Metadata Assessment | 3.2.1\_Catalog Coverage Assessment |
| 4\_Data Lineage Assessment | 4.1\_Enterprise Lineage Review | 4.1.1\_Source-to-Landing Review |
| 4\_Data Lineage Assessment | 4.1\_Enterprise Lineage Review | 4.1.2\_Landing-to-Warehouse Review |
| 4\_Data Lineage Assessment | 4.1\_Enterprise Lineage Review | 4.1.3\_Warehouse-to-Reporting Review |
| 4\_Data Lineage Assessment | 4.1\_Enterprise Lineage Review | 4.1.4\_Regulatory Traceability Review |
| 5\_Data Quality Assessment | 5.1\_Data Quality Framework Review | 5.1.1\_Completeness Assessment |
| 5\_Data Quality Assessment | 5.1\_Data Quality Framework Review | 5.1.2\_Accuracy Assessment |
| 5\_Data Quality Assessment | 5.1\_Data Quality Framework Review | 5.1.3\_Consistency Assessment |
| 5\_Data Quality Assessment | 5.1\_Data Quality Framework Review | 5.1.4\_Timeliness Assessment |
| 5\_Data Quality Assessment | 5.1\_Data Quality Framework Review | 5.1.5\_Validity Assessment |
| 5\_Data Quality Assessment | 5.2\_Critical Data Elements Program | 5.2.1\_CDE Inventory |
| 5\_Data Quality Assessment | 5.2\_Critical Data Elements Program | 5.2.2\_CDE Ownership |
| 5\_Data Quality Assessment | 5.2\_Critical Data Elements Program | 5.2.3\_CDE Rule Definition |
| 6\_SecurityPrivacy\_AndComplianceAssessment | 6.1\_Data Classification Assessment | 6.1.1\_Public Classification Review |
| 6\_SecurityPrivacy\_AndComplianceAssessment | 6.1\_Data Classification Assessment | 6.1.2\_Internal Classification Review |
| 6\_SecurityPrivacy\_AndComplianceAssessment | 6.1\_Data Classification Assessment | 6.1.3\_Confidential Classification Review |
| 6\_SecurityPrivacy\_AndComplianceAssessment | 6.1\_Data Classification Assessment | 6.1.4\_Restricted Classification Review |
| 6\_SecurityPrivacy\_AndComplianceAssessment | 6.2\_Regulatory Controls Assessment | 6.1.1\_TBD |
| 7\_Current State Maturity Assessment | 7.1\_Strategy & Vision | 7.1.1\_TBD |
| 7\_Current State Maturity Assessment | 7.2\_Policies & Standards | 7.2.1\_TBD |
| 7\_Current State Maturity Assessment | 7.3\_Organization & Roles | 7.3.1\_TBD |
| 7\_Current State Maturity Assessment | 7.4\_Metadata & Catalog | 7.4.1\_TBD |
| 7\_Current State Maturity Assessment | 7.5\_Data Lineage | 7.5.1\_TBD |
| 7\_Current State Maturity Assessment | 7.6\_Data Quality | 7.6.1\_TBD |
| 7\_Current State Maturity Assessment | 7.7\_Classification & Privacy | 7.7.1\_TBD |
| 7\_Current State Maturity Assessment | 7.8\_Retention & Records | 7.8.1\_TBD |
| 7\_Current State Maturity Assessment | 7.9\_Architecture & Platform | 7.9.1\_TBD |
| 7\_Current State Maturity Assessment | 7.10\_Monitoring & Reporting | 7.10.1\_TBD |
| 8\_Gap Analysis | 8.1\_Governance Gaps | 8.1.1\_TBD |
| 8\_Gap Analysis | 8.2\_Technology Gaps | 8.2.1\_TBD |
| 8\_Gap Analysis | 8.3\_Organizational Gaps | 8.3.1\_TBD |
| 8\_Gap Analysis | 8.4\_Metadata Gaps | 8.4.1\_TBD |
| 8\_Gap Analysis | 8.5\_Lineage Gaps | 8.5.1\_TBD |
| 8\_Gap Analysis | 8.6\_Data Quality Gaps | 8.6.1\_TBD |
| 9\_Target State Governance Framework | 9.1\_Governance Vision | 9.1.1\_TBD |
| 9\_Target State Governance Framework | 9.2\_Governance Council Design | 9.2.1\_TBD |
| 9\_Target State Governance Framework | 9.3\_Stewardship Model Design | 9.3.1\_TBD |
| 9\_Target State Governance Framework | 9.4\_RACI Development | 9.4.1\_TBD |
| 9\_Target State Governance Framework | 9.5\_Escalation Framework | 9.5.1\_TBD |
| 9\_Target State Governance Framework | 9.6\_Decision Rights Framework | 9.6.1\_TBD |
| 10\_Target State Data Architecture | 10.1\_Enterprise Domain Model | 10.1.1\_TBD |
| 10\_Target State Data Architecture | 10.2\_Governance Architecture | 10.2.1\_Unity Catalog Architecture |
| 10\_Target State Data Architecture | 10.2\_Governance Architecture | 10.2.2\_Metadata Architecture |
| 10\_Target State Data Architecture | 10.2\_Governance Architecture | 10.2.3\_DQ Architecture |
| 10\_Target State Data Architecture | 10.2\_Governance Architecture | 10.2.4\_Lineage Architecture |
| 10\_Target State Data Architecture | 10.2\_Governance Architecture | 10.2.5\_Security Architecture |
| 10\_Target State Data Architecture | 10.3\_Medallion Architecture Design | 10.3.1\_TBD |

# Epic Children
