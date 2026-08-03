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

---

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

---

## 11. Data Quality and Validation

### 11.1 Data Quality Rules  
  
TBD  
  
11.2 Reconciliation Requirements

- N/A

---

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

---

## 13. Dependencies

| Dependency | Type | Owner | Status | Notes |
| --- | --- | --- | --- | --- |
| Access to critical reporting dataset | Data | Data Engineer team | Open | Required to identify critical business entities and domains. |
| Data Engineer / Stakeholder participation | Team | Business Units | Open | Required to validate domains and ownership assignments. |

---

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

---

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

## Recommended Confluence Labels

Add these labels to the page:

- text
- epic template
- data-platform
- architecture
- delivery
- governance

# Epic Children
