# Data Domains & Ownership

# Epic: Data Domains - Design data ownership and stewardship

## 1. Epic Summary

**Epic ID:** ADF-145 

**Owner:** @David Tatis  

**Technical Lead:** @Enrique Escobar  

**Status:** In Progress 

**Target Release:** Sept 30, 2026

**Created Date:**  

**Last Updated:** 

### 1.1 Executive Summary

This EPIC establishes a formal definition of business ownership and stewardship for at least 80% of critical data domains within scope. The initiative aims to improve accountability, data quality, consistency of business definitions, and regulatory compliance by assigning clear ownership of key business data assets.

## 2. Business Context

### 2.1 Business Problem

The organization currently lacks a consistent and documented framework for assigning ownership and stewardship of critical business data domains. While data is stored, managed, and consumed across multiple systems and teams, accountability for the quality, definition, and governance of that data is often unclear.

- What pain point are we solving?
    - Lack of clearly defined Data Owners and Data Stewards.
    - Difficulty identifying accountable stakeholders when data quality issues arise.
- Who is impacted?
    - Business stakeholders who rely on trusted data for decision-making.
    - Risk, Compliance, and Audit teams requiring clear accountability.
- Why does this matter now?
    - Defining accountable business owners and stewards enables more effective data governance, improves issue resolution processes, supports regulatory requirements, and creates a foundation for scalable data management practices.
- What happens if we do nothing?
    - Data quality issues may remain unresolved due to unclear accountability.
    - Audit and regulatory requests may require significant manual effort.

### 2.2 Business Goals

| Goal | Description | Success Indicator |
| --- | --- | --- |
| Define Data Domain Ownership | Identify and assign accountable business owners for critical data domains within scope. | Data Owner assigned and approved for at least 80% of critical data domains. |
| Establish Data Stewardship | Identify and assign Data Stewards responsible for data quality, definitions, and governance activities. | Data Steward assigned and approved for at least 80% of critical data domains. |
| Improve Data Accountability | Create clear ownership, escalation paths, and decision-making responsibilities for critical business data. | Documented ownership matrix published and adopted by stakeholders. |

## 3. Scope

### 3.1 In Scope

- Identification and documentation of critical business data domains within scope.
- Discovery and validation of domain ownership candidates across business units.
- Assignment of Data Domain Owners (business accountability) for critical domains.
- Assignment of Data Stewards (operational accountability) for critical domains.

### 3.2 Out of Scope

- Implementation of Data Governance tools, Data Catalogs, or Metadata Management platforms.
- Development of Data Quality rules, monitoring, remediation, or data cleansing activities.
- Implementation of Data Lineage, Master Data Management (MDM), or Data Contracts.

## 4. Users and Stakeholders

| Role | Name / Team | Responsibility |
| --- | --- | --- |
| Focal point | @David Tatis | Check data served by the DI team and communicate with different departments to clarify the data domains. |
| Tech Lead | @Enrique Escobar | Supervise the data domain definitions and reinforce cross teams alignments. |
| Data Owner | Assigned Domain Owner | Accountable for business meaning, usage, and quality of data within the domain. |
| Data Steward | Assigned Domain Steward | Maintains business definitions and metadata. |

## 5. Current State

While DI team provides data that is actively used and operationally maintained, the business data domains represented within those datasets have not been formally documented, classified, or assigned to accountable Data Owners and Data Stewards.

### 5.1 Current-State Challenges

- Critical data domains have not been formally identified or documented.
- Data ownership and stewardship responsibilities are not consistently defined across critical business data.
- Business accountability for data definitions, quality, and governance is not clearly established.
- Domain knowledge is distributed across teams and relies heavily on individual expertise.

## 6. Target State

The target state establishes a formal Data Domain Governance where critical business data domains are identified, documented, and assigned to accountable Data Owners and Data Stewards.

### 6.1 Target-State Capabilities

- Critical data domains are identified, documented, and prioritized based on business importance.
- Data Owners and Data Stewards are assigned to at least 80% of critical data domains.
- A centralized Data Domain Register provides clear accountability, ownership, and stewardship information.

### 6.2 Target Architecture Summary

The target state introduces a domain-driven governance model where critical business data is organized into documented data domains with defined ownership and stewardship assignments.

## 7. Architecture and Design

TBD

## 8. Data Requirements

### 8.1 Source Data

| Source System | Object / Table / API | Description | Refresh Frequency | Owner |
| --- | --- | --- | --- | --- |
| Critical Regulatory/Operational Reporting Process | BR 9 file | Primary data source used to identify and prioritize critical business data domains | Daily | TBD |

### 8.2 Target Data Products

| Data Product | Description | Consumer | SLA | Owner |
| --- | --- | --- | --- | --- |
| Data Domain Register | Central inventory of critical data domains, owners, and stewards | Data Governance, Business Stakeholders, Data Intelligence |  | Data Governance / TBD |

### 8.3 Key Business Entities

| Entity | Definition | Source of Truth | Notes |
| --- | --- | --- | --- |
| TBD | TBD | TBD | TBD |

## 9. Functional Requirements

| ID | Requirement | Priority | Acceptance Criteria |
| --- | --- | --- | --- |
| FR-001 | Identify and document critical business entities and candidate data domains from the critical reporting dataset. | Must | Critical entities and candidate domains are documented and reviewed. |
| FR-002 | Define and maintain a Data Domain Register for domains within scope. | Must | Domain Register is created and published. |
| FR-003 | Assign a Data Owner to each identified critical domain where applicable. | Must | Data Owner assigned for at least 80% of critical domains. |
| FR-004 | Assign a Data Steward to each identified critical domain where applicable. | Must | Data Steward assigned for at least 80% of critical domains. |
| FR-005 | Document ownership, and stewardship. | Must | Governance roles and responsibilities are approved and documented. |

## 10. Non-Functional Requirements

| Category | Requirement | Target |
| --- | --- | --- |
| Performance | Domain ownership information must be easily accessible and maintainable. | 100% of documented domains stored in a centralized repository. |
| Availability | Domain documentation must be available to authorized stakeholders. | Available during business hours with controlled access. |
| Security | Ownership and stewardship information must follow existing data governance and access policies. | Compliance with enterprise security standards. |
| Data Quality | Domain definitions, ownership assignments, and stewardship assignments must be complete and validated. | 80%+ of critical domains documented and approved. |
| Observability | Progress toward domain coverage must be measurable and reportable. | Governance status and coverage metrics available. |
| Scalability | Governance framework must support additional domains in future phases. | Framework reusable across all enterprise data domains. |
| Compliance | Domain accountability assignments must support audit, risk, and regulatory requirements. | Ownership and stewardship information documented and auditable. |

## 11. Data Quality and Validation

### 11.1 Data Quality Rules  
  
TBD  
  
11.2 Reconciliation Requirements

- N/A

## 12. Security, Governance, and Compliance

### 12.1 Access Control

| Role / Group | Access Level | Data Scope |
| --- | --- | --- |
| Data Governance Team | Read / Write / Admin | Data Domain Register |
| Data Owners | Read / Write | Assigned Data Domains |
| Data Stewards | Read / Write | Assigned Data Domains |
| Business Stakeholders | Read | Governance Documentation |

### 12.2 Governance Requirements

- Data classification: Critical data domains shall be identified and documented based on business criticality.
- PII / sensitive data handling: Existing enterprise policies remain applicable; no new controls introduced by this epic.
- Data retention: N/A.
- Audit logging: Ownership and stewardship assignments shall be documented and available for review.
- Lineage: Out of scope
- Approval workflow: Domain ownership and stewardship assignments require business stakeholder approval.
- Business glossary updates: Domain definitions and descriptions shall be documented as part of the Data Domain Register.

## 13. Dependencies

| Dependency | Type | Owner | Status | Notes |
| --- | --- | --- | --- | --- |
| Access to critical reporting dataset | Data | Data Engineer team | Open | Required to identify critical business entities and domains. |
| Data Engineer / Stakeholder participation | Team | Business Units | Open | Required to validate domains and ownership assignments. |

## 14. Risks and Mitigations

| Risk | Impact | Probability | Mitigation | Owner |
| --- | --- | --- | --- | --- |
| Difficulty identifying appropriate Data Owners | High | Medium | Conduct stakeholder and data engineers reviews. | Data Governance team |
| Lack of agreement on domain boundaries | Medium | Medium | Establish domain definitions and review with stakeholders. | Data Governance Team |
| Limited stakeholder engagement | High | Medium | Schedule regular reviews and obtain leadership sponsorship. | Project Lead / Business Sponsor |
| Critical domains not fully identified | Medium | Low | Use the critical reporting dataset as the primary source for domain discovery. | Data Intelligence team |

## 15. Delivery Plan

### 15.1 Milestones

| Milestone | Target Date | Owner | Status |
| --- | --- | --- | --- |
| Discovery complete (domain identification) |  | @David Tatis | In progress |
| Domain validation complete |  | Data Foundation Team | Not Started |
| Ownership assignments complete |  | Data Intelligence Team | Not Started |
| Data Domain Register approved |  | @Michel Ferreira | Not Started |
| 80% critical domain coverage achieved |  | Data Governance Team | Not Started |

## 16. Jira / Backlog Links

| Item Type | Key / Link | Description |
| --- | --- | --- |
| Epic |  | Epic for data domains and ownership. |
| Story |  |  |
| Spike |  |  |
| Defect |  |  |

## 17. Acceptance Criteria

The epic is complete when:

- Critical data domains within scope have been identified, documented, and validated
- Data Owners have been assigned and approved for at least 80% of critical data domains.
- Data Stewards have been assigned and approved for at least 80% of critical data domains.
- A Data Domain Register containing domains, owners, and stewards has been completed and published.
- Progress metrics demonstrate at least 80% coverage of critical data domains.

## 18. Operational Readiness

N/A as producing a governance artifact (Data Domain Register + ownership assignments), not an operational system.

##   
19. Open Questions

| Question | Owner | Due Date | Status |
| --- | --- | --- | --- |
|  |  |  | Open |

## 20. Decision Log

| Date | Decision | Owner | Notes |
| --- | --- | --- | --- |
|  | Critical data domains will be identified starting from the daily BR09 file delivered to Brazil. | @David Tatis | Dataset selected as the baseline due to its business criticality. |

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
|  | Initial draft created for the Data Domains Ownership & Stewardship OKR initiative. | @David Tatis |
|  | Defined scope, governance approach, milestones, acceptance criteria, and critical domain discovery methodology. | @David Tatis |

## Activities to Produce

```bash
Data Domain Governance Product
├── 1. Domain Discovery Package
│   ├── 1.1 Critical Reporting Dataset Input
│   ├── 1.2 Candidate Business Entity List
│   ├── 1.3 Candidate Data Domain List
│   ├── 1.4 Domain Prioritization Notes
│   └── 1.5 Discovery Gap Log
├── 2. Data Domain Register
│   ├── 2.1 Domain Name
│   ├── 2.2 Domain Description
│   ├── 2.3 Business Criticality
│   ├── 2.4 Source / Evidence Reference
│   ├── 2.5 Data Owner
│   ├── 2.6 Data Steward
│   ├── 2.7 Approval Status
│   └── 2.8 Last Review Date
├── 3. Ownership Assignment Package
│   ├── 3.1 Data Owner Candidate List
│   ├── 3.2 Approved Data Owner Assignments
│   ├── 3.3 Owner Responsibility Definition
│   ├── 3.4 Owner Approval Record
│   └── 3.5 Owner Gap List
├── 4. Stewardship Assignment Package
│   ├── 4.1 Data Steward Candidate List
│   ├── 4.2 Approved Data Steward Assignments
│   ├── 4.3 Steward Responsibility Definition
│   ├── 4.4 Steward Approval Record
│   └── 4.5 Steward Gap List
├── 5. Governance Accountability Package
│   ├── 5.1 Ownership and Stewardship Responsibility Matrix
│   ├── 5.2 Escalation Path
│   ├── 5.3 Decision-Making Responsibilities
│   ├── 5.4 Business Stakeholder Approval Evidence
│   └── 5.5 Audit Review Evidence
├── 6. Validation Package
│   ├── 6.1 Subject-Matter Expert Review Notes
│   ├── 6.2 Domain Boundary Validation
│   ├── 6.3 Coverage Validation
│   ├── 6.4 Open Question Register
│   └── 6.5 Validation Status Summary
├── 7. Publication and Access Package
│   ├── 7.1 Published Register Location
│   ├── 7.2 Access Control Matrix
│   ├── 7.3 Document Owner
│   ├── 7.4 Maintenance Process
│   └── 7.5 Review Cadence
└── 8. Progress Metrics Package
    ├── 8.1 Critical Domain Coverage Percentage
    ├── 8.2 Data Owner Assignment Percentage
    ├── 8.3 Data Steward Assignment Percentage
    ├── 8.4 Open Gap Count
    └── 8.5 Approval Completion Percentage
```

### Activity List

| Product ID | Product | Description | Acceptance / Quality Criteria | Source Traceability |
| --- | --- | --- | --- | --- |
| 1.0 | Domain Discovery Package | Evidence and analysis used to identify critical business entities and candidate data domains. | Critical entities and candidate domains are documented and reviewed. | FR-001; Scope; Source Data |
| 1.1 | Critical Reporting Dataset Input | Input from the critical regulatory/operational reporting process, specifically the BR 9 file. | Dataset access is available or the access dependency remains explicitly open. | Data Requirements 8.1; Dependency 13 |
| 1.2 | Candidate Business Entity List | List of business entities identified from the critical reporting dataset. | Entities are documented and ready for stakeholder validation. | FR-001; Key Business Entities |
| 1.3 | Candidate Data Domain List | Initial list of critical data domains within scope. | Domains are documented, reviewed, and linked to source evidence. | Scope 3.1; FR-001 |
| 1.4 | Domain Prioritization Notes | Rationale for which domains are treated as critical. | Priority is based on business importance and reviewable evidence. | Target State 6.1 |
| 1.5 | Discovery Gap Log | Gaps in domain identification, evidence, access, or SME knowledge. | Each gap has owner, status, and next action. | Current-State Challenges; Open Questions |
| 2.0 | Data Domain Register | Central inventory of critical data domains, owners, and stewards. | Register is created, completed, published, and available to authorized stakeholders. | Target Data Products 8.2; FR-002; Acceptance Criteria |
| 2.1 | Domain Name | Standard name for each critical domain. | Naming is consistent and understandable by business stakeholders. | FR-002 |
| 2.2 | Domain Description | Business definition of each domain. | Description explains meaning and scope of the domain. | Governance Requirements 12.2 |
| 2.3 | Business Criticality | Criticality classification for each domain. | Criticality is documented and reviewed. | Target State 6.1; Governance Requirements 12.2 |
| 2.4 | Source / Evidence Reference | Reference to source dataset, process, or analysis supporting the domain. | Each domain links to identifiable evidence. | Source Data 8.1 |
| 2.5 | Data Owner | Accountable business owner for the domain. | Owner assigned and approved for at least 80% of critical domains. | FR-003; Acceptance Criteria |
| 2.6 | Data Steward | Operational steward responsible for definitions, metadata, and governance support. | Steward assigned and approved for at least 80% of critical domains. | FR-004; Acceptance Criteria |
| 2.7 | Approval Status | Status showing whether the domain and assignments are draft, reviewed, approved, or blocked. | Status is maintained and visible. | NFR Observability; Acceptance Criteria |
| 2.8 | Last Review Date | Date of most recent stakeholder or governance review. | Review date is populated for approved or reviewed domains. | Operational Readiness |
| 3.0 | Ownership Assignment Package | Products needed to identify, validate, approve, and track Data Owner assignments. | Data Owner assignments are approved for at least 80% of critical domains. | Business Goals; FR-003 |
| 3.1 | Data Owner Candidate List | Candidate owner names or teams for each domain. | Candidate owner exists or owner gap is documented. | Scope 3.1; Current-State Challenges |
| 3.2 | Approved Data Owner Assignments | Final approved owner mapping. | Approved owner assignment is documented for each covered critical domain. | FR-003 |
| 3.3 | Owner Responsibility Definition | Description of owner accountability for business meaning, usage, quality, and prioritization. | Responsibilities are documented and approved. | Stakeholders; FR-005 |
| 3.4 | Owner Approval Record | Evidence that owner assignment was approved by business stakeholders. | Approval workflow evidence is retained. | Governance Requirements 12.2 |
| 3.5 | Owner Gap List | List of critical domains without an approved Data Owner. | Gaps are visible and actionable. | Risks and Mitigations |
| 4.0 | Stewardship Assignment Package | Products needed to identify, validate, approve, and track Data Steward assignments. | Data Steward assignments are approved for at least 80% of critical domains. | Business Goals; FR-004 |
| 4.1 | Data Steward Candidate List | Candidate steward names or teams for each domain. | Candidate steward exists or steward gap is documented. | Scope 3.1 |
| 4.2 | Approved Data Steward Assignments | Final approved steward mapping. | Approved steward assignment is documented for each covered critical domain. | FR-004 |
| 4.3 | Steward Responsibility Definition | Description of steward responsibility for definitions, metadata, and governance activity support. | Responsibilities are documented and approved. | Stakeholders; FR-005 |
| 4.4 | Steward Approval Record | Evidence that steward assignment was approved. | Approval evidence is retained. | Governance Requirements 12.2 |
| 4.5 | Steward Gap List | List of critical domains without an approved Data Steward. | Gaps are visible and actionable. | Risks and Mitigations |
| 5.0 | Governance Accountability Package | Operating artifacts that make domain ownership and stewardship usable for governance. | Ownership, stewardship, decision responsibilities, and escalation paths are documented. | Business Goals; FR-005 |
| 5.1 | Responsibility Matrix | Matrix showing data owners, stewards, focal point, technical lead, and governance responsibilities. | Responsibilities are approved and documented. | Users and Stakeholders; FR-005 |
| 5.2 | Escalation Path | Path for unresolved ownership, stewardship, or domain-boundary issues. | Escalation path is documented and available for use. | Business Goals; Risks |
| 5.3 | Decision-Making Responsibilities | Clarifies who approves domain definitions, owners, stewards, and changes. | Decision responsibility is documented. | Business Goals; Governance Requirements |
| 5.4 | Business Stakeholder Approval Evidence | Evidence of business review and acceptance. | Stakeholder approval is documented for completed domains. | Scope; Dependencies |
| 5.5 | Audit Review Evidence | Evidence that accountability assignments are available for review. | Ownership and stewardship information is auditable. | NFR Compliance; Governance Requirements |
| 6.0 | Validation Package | Products proving that domains, owners, and stewards were reviewed with SMEs and stakeholders. | Validation status is visible and unresolved gaps remain tracked. | Scope; Dependencies |
| 6.1 | SME Review Notes | Notes from subject-matter expert and data engineer reviews. | Review outputs are captured and linked to domain records. | Dependencies; Risks |
| 6.2 | Domain Boundary Validation | Confirmation that domain boundaries are agreed or gaps are documented. | Boundary disagreements are resolved or tracked. | Risks and Mitigations |
| 6.3 | Coverage Validation | Validation of progress toward 80% domain owner/steward coverage. | Coverage calculation is reproducible. | Acceptance Criteria |
| 6.4 | Open Question Register | Open questions with owner, due date, and status. | Questions are actively maintained. | Open Questions |
| 6.5 | Validation Status Summary | Summary of validated, pending, blocked, and approved domains. | Summary is current and available to stakeholders. | NFR Observability |
| 7.0 | Publication and Access Package | Products needed to publish and control access to the Data Domain Register. | Domain documentation is centralized, accessible, controlled, and maintainable. | Non-Functional Requirements; Access Control |
| 7.1 | Published Register Location | Final location of the Data Domain Register. | Published location is documented. | NFR Performance / Availability |
| 7.2 | Access Control Matrix | Defines read/write/admin access for Data Governance, Data Owners, Data Stewards, and business stakeholders. | Access matches governance requirements. | Security 12.1 |
| 7.3 | Document Owner | Accountable maintainer of the register. | Owner is assigned. | NFR Maintainability |
| 7.4 | Maintenance Process | Process for updating domains, owners, stewards, and statuses. | Updates are repeatable and controlled. | NFR Scalability |
| 7.5 | Review Cadence | Frequency for reviewing and approving updates. | Review cadence supports governance and audit needs. | NFR Compliance / Observability |
| 8.0 | Progress Metrics Package | Metrics showing whether the epic is meeting its coverage and approval goals. | Metrics demonstrate at least 80% critical-domain coverage. | Acceptance Criteria |
| 8.1 | Critical Domain Coverage Percentage | Percentage of critical domains identified and documented. | Coverage metric is calculated and reported. | Acceptance Criteria |
| 8.2 | Data Owner Assignment Percentage | Percentage of critical domains with approved Data Owners. | At least 80% coverage. | Business Goals; Acceptance Criteria |
| 8.3 | Data Steward Assignment Percentage | Percentage of critical domains with approved Data Stewards. | At least 80% coverage. | Business Goals; Acceptance Criteria |
| 8.4 | Open Gap Count | Count of open owner, steward, domain, access, or validation gaps. | Open gaps are visible for follow-up. | Current-State Challenges; Risks |
| 8.5 | Approval Completion Percentage | Percentage of domain records with approval completed. | Approval progress is measurable. | Governance Requirements; Acceptance Criteria |

## Recommended Confluence Labels

Add these labels to the page:

- text
- epic template
- data-platform
- architecture
- delivery
- governance

# Epic Children
