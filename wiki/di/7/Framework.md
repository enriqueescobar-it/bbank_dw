# Framework

## Overview

This document defines the framework as a set of rules which dimensions apply to each layer, what type of check they use (Rule), and what severity they carry rather than an official, fixed threshold table. The specific threshold values shown throughout are illustrative reference points, not mandates. 

The model follows the logic most commonly used by companies running Databricks, Azure, AWS, or GCP to apply data quality guardrails per layer, alongside the DAMA-DMBOK quality dimensions. It is not a proprietary standard it's the application of practices already established in the market to the context of our pipeline, which reduces the risk of reinventing the wheel and makes it easier to adopt tools that already follow this same vocabulary.

## Framework Flow

The starting point is always the landing schema and medallion layer (Bronze, Silver, or Gold), as the intended purpose of each layer determines which data quality dimensions should be monitored. Based on the selected dimension, a Rule, Threshold, Business Severity, and Response Strategy are defined.

Rule and Threshold define how a violation is detected, while Business Severity and Response Strategy define how the organization evaluates and responds to the violation. Together, these components form a complete Guardrail.

## **Data quality dimensions: Core and Extended**

The 6 Core dimensions are testable automatically and in a binary form (pass/warn/fail) and are the primary focus of the framework's first phase. The Extended dimensions are either covered by complementary disciplines (e.g., Traceability through Lineage and Observability) or require additional business context and judgment.

The classification of a dimension as Core or Extended is independent of its applicability within a specific layer. A Core dimension may not be relevant in every layer, while an Extended dimension may still be evaluated when it addresses a meaningful risk or operational requirement for that stage of the pipeline.

Dimensions are therefore applied based on the objective and risks of each layer rather than their classification alone. **How Extended dimensions are operationalized (ownership, tooling, and integration into the same guardrail/dashboard structure) is detailed in the Monitoring section.**

|  |  |  |  |
| --- | --- | --- | --- |
| Dimension | Type | Objective | Note |
| Completeness | Core | Guarantee that all required data fields and expected records are present and populated. | — |
| Uniqueness | Core | Ensure each entity/event is recorded only once | — |
| Freshness/Timeliness | Core | Ensure data reflects the most recent state, within an acceptable lag | — |
| Validity | Core | Ensure data conforms to the defined format, type, or range | — |
| Accuracy | Core | Ensure that data correctly represents the real-world entities, events, or facts it describes. | — |
| Consistency | Core | Maintain uniformity of data across systems and over time, ensuring no contradictions. | Closely related to data integrity and often assessed through reconciliation and referential checks. |
| Accessibility | Extended | Ensure that the right users can access the data easily and securely when needed. | Operationalized via IAM/governance tooling |
| Availability | Extended | Ensure the underlying systems and data are operational and accessible for use. | Sub-dimension of Accessibility. Typically monitored via infrastructure/platform tools (e.g., cloud monitoring, storage health checks) rather than native DQ tests; results are integrated into the same guardrail and dashboard. |
| Traceability | Extended | Ensure data can be tracked back to its origin through every transformation | Covered by lineage/observability |

## **Dimension applicability by layer**

The Core dimensions don't apply uniformly across the pipeline each layer has its own objective, and that objective is what decides which dimensions are tested there. Every layer is anchored to the same guiding question: "What specifically breaks trust here?"

**Important:**

The same dimension may appear in multiple layers, but its purpose and control implementation can vary significantly. For example, Freshness in Landing focuses on source delivery SLA, while Freshness in Gold focuses on business reporting SLA. Dimensions should therefore be evaluated within the context of each layer's objective rather than assumed to have identical controls throughout the pipeline.

### A) Landing

*Objective: Receive source files exactly as delivered and preserve them in their original state before any validation or transformation occurs. *Landing focuses on source delivery monitoring and raw data preservation. No structural or business validation should occur at this stage.

**Key Questions**

- Was the file delivered?
- Did it arrive within the agreed SLA?
- Is the file available for processing?

**What We Want to Prevent**

- Missing file deliveries
- Late file arrivals
- File availability issues
- Loss of source evidence

|  |  |  |
| --- | --- | --- |
| Dimension | Applies? | Test/Reasoning |
| Availability | **Yes** | File accessible and readable |
| Freshness | **Yes** | File arrival within SLA; missing delivery detection |

### B) Staging

*Objective: Validate technical structure and ingestion readiness before data is persisted into Bronze. *Staging focuses on technical validation and ingestion readiness rather than business quality rules.

**Key Questions**

- Is the file readable?
- Does the structure match expectations?
- Can data be processed successfully?

**What We Want to Prevent**

- Corrupted files
- Schema mismatches
- Invalid data types
- Parsing failures
- Unexpected file formats

| Dimension | Applies? | Test / Reasoning |
| --- | --- | --- |
| Validity | Yes | File format, schema, encoding, delimiter validation |
| Completeness | Depends | Applicable when ingestion requires mandatory technical attributes (e.g., primary identifiers, partition keys, ingestion metadata) to successfully process records. Not required when completeness validation is deferred to downstream layers. |
| Consistency | Depends | Applicable when multiple files, partitions, or source extracts must align to a common structure or delivery pattern. Not required when staging only validates individual file ingestion. |

### **C) Bronze**

*Objective: *Preserve source fidelity while ensuring data is successfully ingested and remains usable for downstream processing.

**Key Questions**

- Did every record from the source actually arrive?
- Did the data arrive within the expected ingestion window?

**What We Want to Prevent**

- Missing records during ingestion
- Unexpected volume changes
- Ingestion delays
- Schema incompatibilities
- Access issues when Bronze is the first persisted layer

|  |  |  |
| --- | --- | --- |
| Dimension | Applies? | Test/Reasoning |
| Completeness | Yes | Row-count comparison, volume anomaly detection, and monitoring of required-field population when applicable. |
| Freshness | Yes | Ingestion timestamp within expected SLA |
| Uniqueness | Depends | Duplicate key detection when Bronze data is directly consumed or expected to be unique |
| Validity | Depends | Applied when basic technical validation is required before Silver processing (e.g., schema conformance, timestamp parsing, datatype validation). Also common when Bronze is directly consumed by users or downstream processes. |
| Availability | Depends | Applicable when Bronze is the first persisted layer and serves as the ingestion access point |

### **D) Silver**

*Objective: *Silver is typically the layer where data becomes standardized, validated, cleansed, and trusted for consumption. Most quality controls should concentrate here.

**Key Questions**

- Is the data standardized?
- Are duplicates removed?
- Are business validation rules respected?
- Are records consistent across integrated sources?
- Was data successfully propagated from Bronze?

**What We Want to Prevent**

- Invalid values
- Duplicate records
- Data loss caused by joins or filters
- Broken referential integrity
- Inconsistent information across sources

|  |  |  |
| --- | --- | --- |
| Dimension | Applies? | Test/Reasoning |
| Validity | Yes | Datatype checks, accepted values, format validation |
| Uniqueness | Yes | Deduplication validation, unique key enforcement |
| Consistency | Yes | Referential integrity, cross-source reconciliation |
| Completeness | Yes | Join loss detection, required field population |
| Freshness | Yes | Processing completed within expected SLA |

### **E) Gold**

*Objective: Apply final business rules and transform validated Silver data into a business-consumable model — typically a **star or snowflake schema** (fact and dimension tables) — ready for reporting, KPIs, and downstream business consumption.*

**Key Questions**

- Are business rules correctly and completely applied before publication?
- Is the data correctly modeled into fact and dimension tables, at the right grain?
- Do fact tables correctly reference their dimensions (surrogate keys resolved, no orphan foreign keys)?
- Are Slowly Changing Dimensions (SCD) handled correctly, where applicable?
- Do KPIs and aggregated metrics match the expected business outcome?
- Do reports reconcile with trusted business sources?
- Is the information delivered within the expected business cadence?

**What We Want to Prevent**

- Business rules incorrectly or incompletely applied
- Incorrect fact table grain (too granular or too aggregated for the intended use)
- Broken relationships between fact and dimension tables (orphan keys, unresolved surrogate keys)
- Incorrect handling of Slowly Changing Dimensions (e.g., wrong current-record flag, broken history)
- Incorrect aggregations or KPI calculations
- Dashboard/report discrepancies
- Decisions based on inaccurate or incorrectly modeled data

|  |  |  |
| --- | --- | --- |
| Dimension | Applies? | Test/Reasoning |
| Accuracy | Yes | Reconciliation against business source of truth |
| Consistency | Yes | KPI reconciliation across reports and systems |
| Freshness | Yes | Metric refresh within business SLA |
| Completeness | Depends | Applied when aggregation logic requires coverage validation |
| Validity | Depends | Only when additional transformations occur in Gold |
| Uniqueness | Depends | Applied only if aggregations or joins introduce duplication risks |

## Guardrails

***Note:** This diagram illustrates the logical flow followed when a data quality violation occurs. During guardrail design, Rule, Threshold, Business Severity, and Treatment Strategy are defined together as part of a single policy configuration.*



A **Guardrail** represents the complete quality policy applied to a specific data quality rule. It consists of three inseparable components:

1. **Rule** – Defines how quality is measured (e.g., Min/Max, Average, Baseline, Between).
2. **Threshold** – Defines the limit that determines when a violation occurs.
3. **Severity and Response Strategy **– Define the business impact of a violation and the response applied when the threshold is breached.

These components work together:

- The **Rule** determines *how* quality is measured.
- The **Threshold** determines *when* a violation occurs.
- The **Severity** determines *how significant* the violation is from a business perspective.
- The **Response Strategy** determines *how the platform responds* to the violation.

A guardrail is only fully defined when all three components are established.

### **Severity and Response Strategy**

When a threshold violation occurs, two complementary dimensions must be evaluated:

- **Business Severity** classifies the business impact and risk associated with the violation.
- **Response Strategy** defines the operational and technical response applied when the violation is detected.

While these dimensions are defined separately, they are closely related. Business Severity is the primary factor used to determine the appropriate response strategy, but it does not automatically dictate a specific action.

For example, two violations classified as **Critical** may require different responses depending on the affected dataset, regulatory obligations, downstream dependencies, and organizational risk tolerance. Likewise, violations with different severity levels may trigger the same response when justified by business or operational requirements.

The framework defines both the **Business Severity** and the **Response Strategy** for each data quality violation, considering business criticality, regulatory requirements, risk tolerance, operational constraints, and platform capabilities.

#### Recommended Severity and Response Patterns

| Business Severity | Business Impact | Response Strategies |
| --- | --- | --- |
| Critical | The data cannot be trusted for business decisions. May result in financial loss, regulatory exposure, incorrect executive reporting, or materially incorrect KPIs. | Stop Pipeline, Quarantine Records |
| High | The data remains available but contains quality issues that may affect business processes, operational reporting, or downstream consumers. | Quarantine Records, Stop Pipeline |
| Medium | The issue is within an agreed tolerance and does not significantly impact business decisions, but should be investigated and monitored. | Publish with Warning, Quarantine Records |

The response strategies shown above represent recommended response patterns. Business Severity is the primary input for response selection, but the final strategy should be determined according to business requirements, regulatory obligations, risk tolerance, and operational constraints.

#### Response Strategy Catalog

The framework provides a catalog of available response strategies that may be selected during guardrail configuration.

| Response Strategy | Description |
| --- | --- |
| Stop Pipeline | Block processing and prevent downstream propagation until the issue is resolved. |
| Quarantine Records | Isolate failed records in an exception dataset while allowing valid records to continue processing. |
| Publish with Warning | Allow data publication while generating alerts and notifications for investigation. |
| Additional strategies may be introduced over time | The catalog is expected to evolve as the Data Quality program matures and new operational requirements emerge. |

***Note:** The response strategies shown above represent recommended response patterns. Business Severity is the primary input for response selection, but the final strategy should be determined according to business requirements, regulatory obligations, risk tolerance, and operational constraints.*

### Rules

A Rule defines how a measured metric is evaluated against an expected condition. Rules can be based on fixed thresholds or historical behavior.

#### Static Rules

Static rules compare the measured metric against a predefined threshold.

| Rule Type | Description | Example |
| --- | --- | --- |
| Min | Value must be greater than or equal to the threshold | Completeness ≥ 98% |
| Max | Value must be lower than or equal to the threshold | Duplicate Count = 0 |
| Equals | Value must exactly match the threshold | Dataset Availability = TRUE |
| Not Equals | Value must not match the threshold | Error Count ≠ 0 |
| Between | Value must remain within a defined range | Freshness between 0h and 24h |

#### Dynamic Rules

Dynamic rules evaluate the metric against historical behavior.

| Rule Type | Description | Example |
| --- | --- | --- |
| Average/Baseline | Compares current value to historical average | Volume Variation ±20% from baseline |
| Trend | Evaluates deviation from expected growth/decline pattern | Daily volume trend |
| Anomaly Detection | Detects unexpected deviations from historical behavior | Row count suddenly drops 80% |

### **Thresholds**

A Threshold is the specific limit that determines when a measured value becomes a data quality violation. It defines the acceptable boundary for a given rule and allows the platform to distinguish between normal variation and a condition that requires action. Thresholds can be expressed as fixed values (e.g., ≥98% completeness, 0 duplicates, ≤60 minutes delay) or as deviations from a historical baseline, depending on the rule type being applied.

The table below provides illustrative examples of how threshold values may be mapped across layers and dimensions. These values are not fixed framework requirements and should not be interpreted as mandatory standards. Actual thresholds must be calibrated per pipeline using historical analysis, business tolerance, and operational requirements, as described in the MVP section.

The examples below illustrate possible implementations when a given dimension is evaluated in a layer. They do not imply that the dimension is mandatory or universally applicable to that layer. Dimension applicability should follow the guidance defined in the "Dimension Applicability by Layer" section.

**Example threshold mapping:**

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| Dimension | Landing | Bronze | Silver | Gold |
| Completeness | N/A | ≥95% | ≥98% | ≥99% |
| Uniqueness | N/A | ≤5% duplicates | ≤0.5% | 0% |
| Validity | File is structurally readable | ≥95% | ≥99% | 100% |
| Accuracy | N/A | N/A | N/A | ≥99.9% |
| Freshness | File arrival SLA | Ingestion SLA | Transformation SLA | Publication SLA |
| Consistency | N/A | N/A | ≥99% |  |

### **How to Define Thresholds for a Specific Pipeline**

The example thresholds presented above should be treated as starting points, not as predefined standards. Thresholds must be calibrated for each pipeline based on historical behavior, business tolerance, and operational requirements. The process below provides a simple and repeatable approach for defining effective thresholds.

#### 1. Start with a Reference Value

Use the example threshold as an initial hypothesis rather than a committed target. The objective is to establish a starting point that can be validated against real pipeline behavior.

#### 2. Validate Against Historical Data

Backtest the rule against historical executions of the pipeline, ideally using the previous 2–4 weeks of data. Evaluate how frequently the rule would have failed and whether those failures would have represented genuine business concerns.

For example, if a completeness threshold of 98% would have triggered weekly alerts for situations that never resulted in business impact, the threshold is likely too restrictive for that domain.

#### 3. Define Business Tolerance

A threshold is not purely a technical decision.

It represents the maximum level of deviation that the business can tolerate before data becomes unreliable for decision-making. Business owners should therefore define the acceptable tolerance level for their datasets, reports, and operational processes.

#### 4. Document and Periodically Recalibrate

Record the approved threshold, its rationale, and the associated business owner in the Rule Catalog.

Thresholds should be reviewed periodically, as source systems, business processes, data volumes, and reporting requirements evolve over time.

## Relationship Between Rules and Thresholds

A rule type defines **how a metric is evaluated**, while a threshold defines **the acceptable limit** for that metric. Together, the measured metric, rule type, and threshold determine whether a control passes or fails. Once a violation is detected, the corresponding business severity and technical action are applied.

Some examples below:

A **Min Rule** requires the measured value to remain equal to or greater than the threshold.

*Example:*

```
Metric      = % Populated Records
Rule Type   = Min
Threshold   = 98%

95% < 98%

Result = FAILED
```

A **Max** **Rule** requires the measured value to remain equal to or lower than the threshold.

*Example:*

```
Metric      = Duplicate Count
Rule Type   = Max
Threshold   = 0

3 > 0

Result = FAILED
```

An **Average/Baseline Rule** compares the current measurement against historical behavior rather than a fixed limit.

*Examples:*

```
Metric      = Volume Variation
Rule Type   = Average/Baseline
Threshold   = ±20%

Current Volume = -25%

Result = FAILED
```


## Reference Matrix

The Reference Matrix provides a consolidated view of how a Data Quality dimension is translated into an operational guardrail. Each row demonstrates the relationship between:

- the quality dimension being evaluated,
- the control used to measure it,
- the metric being monitored,
- the rule type applied,
- the threshold used to determine success or failure,
- the resulting business severity,
- and the technical action triggered when a violation occurs.

| Dimension | Example Control | Measured Metric | Rule Type | Layer | Threshold | Business Severity | Technical Action |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Completeness | Not Null | % Populated Records | Min | Bronze | ≥95% | High | Blocker |
| Uniqueness | PK Unique | Duplicate Count | Max | Silver | 0 | Critical | Blocker |
| Validity | Accepted Values | % Valid Records | Min | Silver | ≥99% | High | Blocker |
| Freshness | Processing SLA Validation | Delay (Minutes) | Max | Bronze | ≤60 min | High | Blocker |
| Consistency | FK Relationship | Valid Relationships (%) | Min | Silver | 100% | High | Blocker |
| Accuracy | Source Reconciliation | Difference (%) | Max | Gold | ≤1% | Critical | Blocker |
| Completeness | Volume Monitoring | Volume Variation | Average/Baseline | Bronze | ±20% | Medium | Warn |

**The Reference Matrix** consolidates the key components of the framework into a single view. Each row represents an example of how a data quality dimension can be operationalized through controls, rules, thresholds, severity, and actions.

The matrix is designed to answer the most common implementation questions in a single line:

| Question | Column |
| --- | --- |
| What am I validating? | Dimension |
| How is it implemented? | Control |
| What is being measured? | Measured Metric |
| What evaluation logic is applied? | Rule Type |
| Where does it apply? | Layer |
| What is the acceptable limit? | Threshold |
| What is the business impact if it fails? | Business Severity |
| What happens when it fails? | Technical Action |

## **Roles and Ownership (RACI)**

The RACI model defines accountability and ownership for Data Quality activities across each layer of the data lifecycle. Responsibilities may vary according to the objective of the layer, the applicable dimensions, and the type of controls being implemented. You can find the proposal template in [here](https://bradescobank1.atlassian.net/wiki/spaces/DQP/pages/1332215810/proposal_example#RACI-matrix-for-layers).


*R = Responsible for execution · A = Accountable · C = Consulted · I = Informed*

*BO = Business Owner  · DQ =  Data Quality Owner ·   DE = Data Engineer  ·   BS =  Business Steward *


### RACI Landing

|  | Activity | BO | DQ | DE | BS |
| --- | --- | --- | --- | --- | --- |
| 1 | Define delivery SLA requirements | C | C | R | C |
| 2 | Define Landing controls and Guardrails | I | A/R | C | I |
| 3 | Implement delivery validations | I | C | A/R | I |
| 4 | Monitor source delivery failures | I | A/R | I | I |
| 5 | Resolve and investigate failures | I | C | A/R | I |

### RACI Staging

| Activity | BO | DQ | DE | BS |
| --- | --- | --- | --- | --- |
| Define schema validation requirements | I | C | A/R | I |
| Define Staging controls and Guardrails | I | A/R | C | I |
| Implement schema and format validations | I | C | A/R | I |
| Monitor staging validation failures | I | A/R | I | I |
| Manage schema changes and drift | I | C | A/R | I |
| Resolve and investigate failures | I | C | A/R | I |

### RACI Bronze

| Activity | BO | DQ | DE | BS |
| --- | --- | --- | --- | --- |
| Define Bronze controls and Guardrails | I | A/R | C | C |
| Implement quality tests | I | C | A/R | I |
| Monitor DQ metrics | I | A/R | I | I |
| Resolve and investigate failures | I | C | A/R | I |

### RACI Silver

| Activity | BO | DQ | DE | BS |
| --- | --- | --- | --- | --- |
| Identify Critical Data Elements (CDEs) | A | C | I | R |
| Define Business Rules | A | C | I | R |
| Define Silver controls | C | A/R | C | C |
| Define Guardrails | A | R | C | C |
| Implement dbt tests | I | C | A/R | I |
| Monitor DQ scores and alerts | I | A/R | R | I |
| Resolve and investigate delivery failures | I | C | A/R | I |

### RACI Gold

| Activity | BO | DQ | DE | BS |
| --- | --- | --- | --- | --- |
| Define publication requirements | A | C | C | R |
| Define Gold controls and Guardrails | A | R | C | C |
| Monitor business SLA and publication quality | I | A/R | R | I |
| Approve operational readiness | A | R | C | C |
| Resolve and investigate delivery failures | I | C | A/R | I |
