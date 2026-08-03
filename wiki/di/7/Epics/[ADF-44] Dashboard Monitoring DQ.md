# \[ADF\-44\] Dashboard Monitoring DQ

# Epic:  Dashboard Monitoring

## 1. Epic Summary

**Epic ID:** [ADF-44](https://bradescobank1.atlassian.net/browse/ADF-44)

**Owner:** @\_Mariane Moraes

**Technical Lead:** @Enrique Escobar

**Status:** In Progress 

**Target Release:**Q3

**Created Date:** 2026-07-13

**Last Updated:** 2026-07-31

### 1.1 Executive Summary

This epic establishes foundational monitoring and visibility capabilities for the current Data Warehouse environment: an Overview page (Volume, Freshness, and Test Pass/Fail KPIs), a basic tabular Table Health view, and basic Coverage metrics (tables without tests, unclassified tests, coverage % by dimension).

By implementing this dashboard, the organization will gain a centralized view of existing data quality health for its prioritized datasets. This initiative provides immediate operational value while supporting future Data Quality modernization efforts and governance initiatives.

## 2. Business Context

### 2.1 Business Problem

There is currently limited visibility into the health and quality of data within the current Data Warehouse. Without monitoring and alerting capabilities, data issues are detected reactively, increasing operational risk and reducing confidence in downstream reporting and analytics.

Without monitoring and alerting capabilities:

- Data quality issues will continue to be identified reactively.
- Root cause investigation efforts will remain manual and time-consuming.
- Operational risks and reporting inaccuracies may go undetected for extended periods.
- Future Data Quality initiatives will lack the baseline metrics needed to measure improvement and demonstrate value.

### 2.2 Business Goals

| Goal | Description | Success Indicator |
| --- | --- | --- |
| Establish Data Quality Visibility | Provide a centralized view of data quality controls, issues, trends, and overall data health across critical Data Warehouse datasets. | Data Quality dashboard deployed and actively used by business and technical stakeholders, with coverage of prioritized critical datasets. |
| Identify Data Quality Gaps and Improvement Opportunities | Provide actionable insights into data quality weaknesses, coverage gaps, recurring issues, and areas requiring remediation or additional controls. | Data quality gaps documented, prioritized, and incorporated into remediation or improvement plans. |

## 3. Scope

### 3.1 In Scope

- Overview page: Volume Monitoring, Freshness Monitoring, and Test Pass/Fail counts (sourced from dbt run\_results).

- Table Health page (basic): tabular list of tables with individual Volume and Freshness values no score, no history yet.

- Coverage page (basic): number of tables with no test at all; number of tests with no dimension classified; coverage % by dimension,tables missing a loaded\_at column

- Baseline data quality monitoring for the current Data Warehouse environment.

### 3.2 Out of Scope

- Audit page (failure log, severity, status, resolution time).

- Coverage page (advanced): ownership gaps, owner filter.

- Table Health (full): score, score history, delay vs. SLA, expected vs. actual volume time series.

- Data Quality Scorecard.

- Enterprise-wide Data Quality framework implementation.

- Data Governance processes, policies, and stewardship operating model.

- Advanced data quality automation, machine learning, or predictive monitoring capabilities.

- Alerting and notification capabilities.

## 4. Users and Stakeholders

| Role | Name / Team | Responsibility |
| --- | --- | --- |
| Data Manager | @Michel Ferreira | Supervise and align RSM team with BBank team |
| Team lead | @Enrique Escobar | Communicate inside BBANK department |
| Data Analyst | @\_Mariane Moraes | Provide the requested documentation or assessment |

## 5. Current State

Describe the current architecture, process, or data flow.

### 5.1 Current-State Challenges

- Data quality issues are detected reactively rather than proactively.
- There is no centralized view of Data Quality health, trends, and risks.
- Monitoring coverage gaps are difficult to identify and quantify.
- Historical visibility and trend analysis are limited.
- Ownership and accountability information is not consistently available.
- Root-cause investigation remains manual and time-consuming.
- Baseline metrics for measuring Data Quality improvement do not exist.

### 5.2 Current Systems

**Work more on that!!**

| System / Source | Purpose | Data Quality Contribution |
| --- | --- | --- |
| Data Warehouse Metadata Monitoring Dataset | Consolidated dataset generated from Data Warehouse tables using LOADED\_AT timestamps and record counts across Landing, Bronze, Silver, and Gold layers. | Supports monitoring of data availability, freshness, load activity, and volume trends across the data platform. |
| dbt Manifest (manifest.json) | Stores dbt model metadata, dependencies, lineage, ownership, and documentation. | Provides lineage visibility, model inventory, and monitoring coverage analysis. |
| dbt Run Results (run\_results.json) | Captures execution results, test outcomes, runtime information, and execution status. | Supports monitoring of data quality tests, control effectiveness, execution health, and failure tracking. |
| Power BI | Reporting and visualization platform. | Provides centralized dashboards for monitoring, alerts, trends, and KPI reporting. |

## 6. Target State

Describe the desired future state.

### 6.1 Target-State Capabilities

- Centralized Data Quality Dashboard (Overview, basic By Table/Source, basic Coverage)
- Automated Freshness and Volume Monitoring
- Test Pass/Fail Visibility
- Baseline Metrics for Data Quality Performance

### 6.2 Target Architecture Summary

The target state provides centralized visibility into the health of the current Data Warehouse through an Overview dashboard, a basic table-level diagnostic view, and basic coverage metrics. Stakeholders can monitor key quality indicators and use baseline metrics to guide remediation and future Data Quality initiatives. Deeper diagnostics (Audit, advanced Coverage, full By Table/Source, Scorecard) are out of scope for this Epic see the [Program Proposal](https://bradescobank1.atlassian.net/wiki/spaces/DQP/pages/1381203970/Data+Quality+Program+Proposal) for that roadmap.

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

|  |  |  |  |
| --- | --- | --- | --- |
| ID | Requirement | Priority | Acceptance Criteria |
| FR-001 | Dashboard shall provide enterprise DQ overview metrics (Volume, Freshness) | Must | Overview page available |
| FR-002 | Dashboard shall identify monitoring coverage gaps (basic) | Must | Coverage page available — see 9.1 for KPI list |
| FR-003 | Dashboard shall provide basic diagnostics by table | Must | Table Health page available (tabular Volume/Freshness) — see 9.1 |
| FR-004 | Dashboard shall support basic filtering | Must | Filters implemented (Period, Data Source, Business Area) |
| FR-005 | Dashboard shall support freshness monitoring | Must | Freshness KPIs implemented |
| FR-006 | Dashboard shall support volume monitoring | Must | Volume KPIs implemented |
| FR-007 | Dashboard shall display test execution pass/fail counts | Must | Pass/Fail KPI available (sourced from dbt run\_results) |

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

- xxxx

---

## 12. Security, Governance, and Compliance

### 12.1 Access Control

| Role / Group | Access Level | Data Scope |
| --- | --- | --- |
|  | Read / Write / Admin | \<Dataset / Domain\> |

### 12.2 Governance Requirements

- xxx

---

## 13. Dependencies

| Dependency | Type | Owner | Status | Notes |
| --- | --- | --- | --- | --- |
|   | System / Team / Data / Vendor |   | Open / Closed |   |

---

## 14. Risks and Mitigations

| Risk | Impact | Probability | Mitigation | Owner |
| --- | --- | --- | --- | --- |
| Limited DQ test coverage reduces dashboard usefulness | High | High | Prioritize onboarding of critical tables and controls | DQ Team |
| Poor data quality history limits trend analysis | Medium | High | Establish baseline and accumulate historical data over time | DQ Team |
| Dashboard adoption is lower than expected | Medium | Medium | Conduct stakeholder reviews and training sessions | Product Owner |
| Future platform migration impacts monitoring architecture | Medium | Medium | Maintain platform-agnostic monitoring design | Architecture Team |

## 15. Delivery Plan

### 15.1 Milestones

| Milestone | Target Date | Owner | Status |
| --- | --- | --- | --- |
| DQ Data Source Discovery Completed |  | @\_Mariane Moraes | ✅ Completed |
| Wave 1: Platform Health Monitoring Delivered |  | @\_Mariane Moraes | 🟡 In Progress |
| Wave 2: DQ Test Monitoring Delivered |  | @\_Mariane Moraes | 🔴 Not Started |
| Wave 3: DQ Coverage Monitoring Delivered | TBD | @\_Mariane Moraes | 🔴 Not Started |
| Dashboard MVP Released | TBD | @\_Mariane Moraes | 🔴 Not Started |
| Dashboard Feedback Collected | TBD | @Michel Ferreira@\_Mariane Moraes | 🔴 Not Started |
| Dashboard Improvements Completed | TBD | @\_Mariane Moraes | 🔴 Not Started |
| Dashboard Approved & Published | TBD | @Michel Ferreira@\_Mariane Moraes | 🔴 Not Started |

### 15.2 Work Breakdown

| Workstream | Description | Owner | Status |
| --- | --- | --- | --- |
| DQ Data Source Discovery | Identify available Data Quality sources and monitoring datasets. | @\_Mariane Moraes | ✅ Completed |
| Data Model & Relationship Discovery | Define relationships, dimensions and dashboard data model. | @\_Mariane Moraes | 🟡 In Progress |
| KPI & Dashboard Design | Define dashboard structure, pages, KPIs and user experience. | @\_Mariane Moraes | 🟡 In Progress |
| Wave 1 - Platform Health Monitoring | Implement Volume and Freshness KPIs using DATA\_LOAD\_MONITORING. Deliver initial Overview and By Table capabilities. | @\_Mariane Moraes | 🟡 In Progress |
| Wave 2 - DQ Test Monitoring | Implement dbt Results analysis, failed tests, pass rate and dimension classification monitoring. | @\_Mariane Moraes | 🔴 Not Started |
| Wave 3 - DQ Coverage Monitoring | Implement coverage analysis, tables without tests, missing loaded\_at, ownership and classification gaps. | @\_Mariane Moraes | 🔴 Not Started |
| Dashboard Validation & Feedback | Validate calculations, usability and business expectations. | @Michel Ferreira@\_Mariane Moraes | 🔴 Not Started |
| Dashboard Publication | Publish and communicate Dashboard MVP. | @\_Mariane Moraes | 🔴 Not Started |


## 16. Jira / Backlog Links

| Item Type | Key / Link | Description |
| --- | --- | --- |
| Epic |  |  |
| Story |  |  |
| Spike |  |  |
| Defect |  |  |

## 17. Acceptance Criteria

The epic is complete when:

- Monitoring datasets are available and validated.
- Freshness and Volume monitoring metrics are implemented.
- Test Pass/Fail counts are implemented (sourced from dbt run\_results).
- Overview and basic Table Health dashboards are delivered.
- Basic Coverage metrics are delivered (tables with no test, unclassified tests, coverage % by dimension).
- Dashboard filters (Period, Data Source, Business Area) are operational.
- Business and technical stakeholders approve the solution.

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
| What should be the Data Quality Score granularity (Program, Domain, Source, Table, or Multiple Levels)? Dashboard V2 | @\_Mariane Moraes |   | Open. relevant once Scorecard is in scope |

---

## 20. Decision Log

The decision was made.

| Date | Decision | Owner | Notes |
| --- | --- | --- | --- |
|  |  |  |  |

## 21. Related Documents

- Xxxx

## 22. Change Log

Updates to the document

| Date | Change | Author |
| --- | --- | --- |
|  | Initial draft |  |

## 23. Activities to Produce

```
ADF-44 Dashboard Monitoring DQ
├── 1. Dashboard MVP
│   ├── 1.1 Overview Page
│   │   ├── Volume Monitoring KPIs
│   │   ├── Freshness Monitoring KPIs
│   │   └── Test Pass/Fail KPIs
│   ├── 1.2 Table Health Page
│   │   ├── Table-level Volume Values
│   │   ├── Table-level Freshness Values
│   │   └── Basic Table Diagnostics
│   ├── 1.3 Coverage Page
│   │   ├── Tables Without Tests
│   │   ├── Tests Without Dimension Classification
│   │   ├── Coverage % by Dimension
│   │   └── Tables Missing loaded_at Column
│   └── 1.4 Dashboard Filters
│       ├── Period Filter
│       ├── Data Source Filter
│       └── Business Area Filter
│
├── 2. Monitoring Data Foundation
│   ├── 2.1 Data Warehouse Metadata Monitoring Dataset
│   ├── 2.2 dbt run_results Integration
│   ├── 2.3 dbt manifest Integration
│   └── 2.4 Dataset Refresh Process
│
├── 3. KPI Definitions
│   ├── 3.1 Volume KPI Definitions
│   ├── 3.2 Freshness KPI Definitions
│   ├── 3.3 Test Pass/Fail KPI Definitions
│   └── 3.4 Coverage KPI Definitions
│
├── 4. Validation Package
│   ├── 4.1 Source-to-dashboard Reconciliation
│   ├── 4.2 KPI Calculation Validation
│   ├── 4.3 Filter Behavior Validation
│   └── 4.4 Stakeholder Review Evidence
│
└── 5. Operational Package
    ├── 5.1 Dashboard Access Model
    ├── 5.2 Refresh Monitoring
    ├── 5.3 Support / Escalation Path
    └── 5.4 Publication and Handover Notes
```

## Recommended Confluence Labels

Add these labels to the page:

- data quality dashboard
- ...


# Epic Children
