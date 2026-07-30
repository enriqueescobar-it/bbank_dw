# BRZ Bronze Layer Standardization Framework

**Document type:** Reusable architecture, assessment, and remediation framework  
**Scope:** BRZ / Bronze layer only  
**Origin:** Generalized from data-platform remediation lessons documented at Jazwares LLC  
**Version:** 1.0  
**Status:** Bronze-only, industry-benchmarked framework baseline  
**Assessment confidence:** High — 89%

---

## 1. Purpose

This framework defines a repeatable approach for assessing, correcting, implementing, and governing a **BRZ Bronze layer** across organizations and technology stacks.

For this document, **BRZ** is the source-aligned, queryable, raw system-of-record layer. Its responsibility begins when an approved upstream delivery or source extract is made available for ingestion and ends when a complete, technically valid, traceable Bronze dataset version is published through an approved BRZ release interface.

The framework standardizes:

- how accepted source records are represented in queryable raw storage;
- how source fidelity is preserved;
- how immutable history is maintained;
- how load, record, schema, and pipeline lineage are captured;
- how technical schema evolution is controlled;
- how retries, replays, and duplicate deliveries are handled;
- how snapshot, incremental, and CDC records are preserved;
- how atomicity and recoverability are enforced;
- how technically invalid records are isolated without silent loss;
- how BRZ datasets are secured, retained, observed, owned, and released.

This framework intentionally does **not** prescribe data-type-centric column naming conventions or business-semantic standardization.

---

## 2. Scope Boundaries

### 2.1 In scope

The BRZ layer may perform only the technical work required to represent accepted source data as a durable, queryable, source-aligned system of record:

- read an approved upstream delivery or source extract;
- create a source-aligned tabular or queryable representation;
- preserve the source record content and source semantics;
- add technical lineage and audit metadata;
- enforce an explicit source schema or capture the observed schema;
- apply controlled technical type interpretation based on the source contract;
- isolate unparseable or structurally incompatible records;
- preserve snapshot, incremental, and CDC operation evidence;
- append new load or event history;
- suppress only demonstrably identical technical duplicates under an approved rule;
- reconcile records and checksums with the approved input;
- publish an atomic BRZ dataset version;
- perform physical maintenance that does not alter the logical record set.

### 2.2 Out of scope

The following do not belong in BRZ:

- source-delivery detection and transport registration when a separate landing layer owns them;
- business-rule validation;
- enterprise terminology normalization;
- semantic renaming of source fields;
- cross-domain joins;
- reference-data enrichment;
- master-data conformance;
- business-entity deduplication;
- survivorship logic;
- business default substitution;
- business null interpretation;
- current-state reconstruction from CDC events;
- slowly changing dimension logic;
- KPI, measure, ratio, or aggregate calculation;
- dimensional, semantic, reporting, or analytical modelling;
- filtering records because they appear commercially invalid;
- correcting source values;
- data-type-centric enterprise column naming standards.

### 2.3 Boundary rule

> BRZ proves that accepted source records were durably represented with traceable raw history. It does not prove that the business data is correct, conformed, or ready for analytics.

---

## 3. Relationship Between Landing and Bronze

This framework assumes that a separate LND layer may exist, but it remains portable to organizations where Bronze is also the first physical raw zone.

### 3.1 Preferred pattern: separate LND and BRZ

```text
Source delivery
    -> LND registration, preservation, and acceptance
    -> BRZ queryable raw representation and history
```

In this pattern:

- LND preserves delivery evidence and transport context;
- BRZ preserves queryable source-record history;
- the BRZ load references the LND delivery identifier;
- BRZ does not duplicate LND workflow logic unless technically necessary.

### 3.2 Combined physical pattern

Some platforms use Bronze as the initial physical landing zone. This is acceptable only when the Bronze implementation also provides the required landing controls for:

- original delivery preservation;
- delivery identity;
- completeness and integrity checks;
- quarantine;
- replay;
- delivery-level lineage.

### 3.3 Assessment rule

Do not mark an implementation non-compliant solely because LND and BRZ are physically combined. Assess whether the **logical responsibilities** of both layers are explicit and controlled.

---

## 4. Core BRZ Contract

Every BRZ implementation should satisfy the following contract.

| Contract area | Required condition |
|---|---|
| Source alignment | BRZ fields and records remain traceable to the source structure and meaning. |
| Queryable raw history | Accepted source records are represented in a queryable form without business transformation. |
| Immutability | Published historical evidence is not silently updated or overwritten. |
| Append-oriented processing | New loads, corrections, and replays create new auditable history. |
| Traceability | Every BRZ record or load links to its source delivery, source object, pipeline run, and schema version. |
| Atomicity | Consumers never observe a partially committed BRZ load as published. |
| Idempotency | Reprocessing the same approved input does not create uncontrolled duplicate effects. |
| Schema visibility | Source and BRZ schema versions, fingerprints, and drift outcomes are recorded. |
| Technical validity | Unparseable or structurally incompatible records are isolated without silent loss. |
| CDC preservation | Insert, update, delete, snapshot, and truncate evidence is preserved when supplied. |
| Reproducibility | A published BRZ version can be tied to the exact input and processing version that produced it. |
| Security | Raw and sensitive source data is access-controlled and audited. |
| Release control | Only complete and reconciled BRZ loads are exposed as published. |
| Retention | Raw history, metadata, schema evidence, and replay records have explicit retention. |
| Ownership | Each BRZ dataset has a named technical owner and source-system contact. |

---

## 5. Design Principles

### 5.1 Preserve source truth, not consumer convenience

BRZ should remain source-aligned even when the source structure is inconvenient. Convenience transformations belong outside Bronze.

### 5.2 Append rather than overwrite

A correction, resend, replay, or source change should produce new history. Historical evidence must not be silently replaced.

### 5.3 Make technical projection reversible

When BRZ converts a source payload into tables, the transformation must be technically explainable and traceable back to the source representation.

### 5.4 Separate source fields from BRZ metadata

BRZ metadata should not overwrite or masquerade as source data. Source-provided fields and platform-added fields must remain distinguishable.

### 5.5 Treat exact duplicates differently from business duplicates

BRZ may control exact technical duplication. It must not decide that two different source records represent the same business entity.

### 5.6 Fail without losing evidence

A malformed or incompatible record should be isolated with diagnostics. It must not disappear silently.

### 5.7 Physical optimization cannot change logical content

Compaction, clustering, indexing, statistics generation, file-size optimization, and partition evolution are acceptable only when they preserve the logical record set and lineage.

### 5.8 Replays must be attributable

A replay must identify the original input, replay reason, code version, prior outcome, and resulting BRZ load.

### 5.9 Preserve uncertainty

When source data cannot be interpreted safely, retain the raw value or rescued representation rather than inventing a corrected value.

---

## 6. Standard BRZ Processing Flow

```text
Approved upstream input
  |
  v
BRZ load registration
  |
  v
Input and contract verification
  |
  v
Source-aligned technical projection
  |
  +---- incompatible record ----> BRZ quarantine / rescued record set
  |
  v
Append raw records and BRZ metadata
  |
  v
Record, checksum, and schema reconciliation
  |
  +---- failure ----> Failed or quarantined load; unpublished
  |
  v
Atomic commit
  |
  v
BRZ publication record
  |
  v
Approved BRZ release interface
```

A partial write must not become visible as a published BRZ load.

---

## 7. BRZ Load Lifecycle and Status Model

Use a finite and documented lifecycle. A recommended baseline is:

| Status | Meaning |
|---|---|
| `registered` | A BRZ load identifier has been created for an approved input. |
| `loading` | Source-aligned records are being written. |
| `loaded` | Physical writes completed but reconciliation and publication are pending. |
| `validating` | Technical reconciliation and contract checks are running. |
| `published` | The complete BRZ load passed controls and is visible through the approved interface. |
| `published_with_warning` | The load is published, but a non-blocking technical condition requires review. |
| `quarantined` | The load or record set is preserved but blocked from publication. |
| `failed` | The load did not complete and has no published partial result. |
| `replayed` | The input was intentionally processed again under an auditable replay. |
| `superseded` | A later approved load replaces the operational authority of this load without deleting its history. |
| `retired` | The dataset is no longer active but remains governed under retention policy. |

Each transition should record:

- BRZ load identifier;
- upstream delivery or extraction identifier;
- prior and new status;
- transition timestamp;
- pipeline job and run identifier;
- code, configuration, and contract version;
- actor or service principal;
- reason code;
- diagnostic message;
- affected BRZ dataset version or snapshot.

---

## 8. Approved BRZ Storage Patterns

### 8.1 Source-aligned append history

Each accepted source record is appended with BRZ load metadata. This pattern is suitable for recurring extracts and append-oriented sources.

### 8.2 Immutable snapshot history

Each full source snapshot is retained as a separately identifiable BRZ load or snapshot version. Records must be attributable to the snapshot that produced them.

### 8.3 Append-only change-event journal

Each source CDC event is retained as a new BRZ record with operation, sequence, transaction, snapshot, and source-key evidence.

### 8.4 Raw nested or semi-structured history

The source record is retained in a semi-structured column or source-aligned nested schema with metadata. Unsupported or newly arrived fields may be retained in a rescued representation.

### 8.5 Multi-table technical projection

A complex source object may be projected into multiple BRZ tables only when:

- the projection is source-aligned;
- relationships are based on source structure, not enterprise semantics;
- every projected record links to the original source record and load;
- the projection is documented and reproducible;
- no business enrichment or current-state logic is introduced.

### 8.6 Non-compliant default pattern

A destructively overwritten “latest copy” with no retained history is not a compliant BRZ system of record unless:

- the complete raw history is durably preserved elsewhere;
- reconstructability is tested;
- the exception is documented;
- the table is explicitly classified as a convenience replica rather than authoritative Bronze history.

---

## 9. Mandatory Operational and Lineage Metadata

The exact physical column names are implementation-specific. The following **metadata concepts** are mandatory.

### 9.1 Dataset identity

- BRZ dataset identifier;
- source system;
- source object, table, endpoint, feed, or topic;
- source environment;
- source region, tenant, or business unit when applicable;
- BRZ dataset version;
- dataset owner;
- contract version.

### 9.2 Input identity

- upstream delivery or extraction identifier;
- original object, file, message, cursor, or snapshot reference;
- input checksum or content fingerprint;
- source batch or transaction identifier;
- source extraction timestamp;
- upstream acceptance or release timestamp.

### 9.3 BRZ load identity

- BRZ load identifier;
- pipeline name;
- pipeline run identifier;
- code commit or release version;
- configuration version;
- load start and end timestamps;
- execution environment;
- replay indicator;
- original BRZ load reference for replay;
- write mode;
- table snapshot, commit, or version identifier.

### 9.4 Record lineage

Where practical, each BRZ record should retain:

- BRZ record identifier or deterministic record fingerprint;
- upstream delivery identifier;
- source record position, row number, event identifier, or source key;
- source partition, file, message, or object reference;
- BRZ load identifier;
- source schema version;
- observed BRZ schema version;
- ingestion timestamp.

### 9.5 Processing outcome

- input record count;
- written record count;
- rescued record count;
- quarantined record count;
- exact-duplicate count;
- checksum or aggregate reconciliation result;
- schema fingerprint;
- schema drift classification;
- publication status;
- error category, code, and message;
- quarantine location.

---

## 10. Allowed Technical Transformations

The following transformations may occur in BRZ when documented, deterministic, and source-aligned.

### 10.1 Storage-format conversion

Examples:

- CSV, JSON, XML, Avro, or API records represented in a managed tabular format;
- source database extracts represented in Delta, Iceberg, Parquet, or equivalent tables;
- source records retained in a structured or semi-structured queryable column.

### 10.2 Source-contract type interpretation

A source value may be stored using the physical type explicitly declared by the source contract. Ambiguous or invalid values should be rescued or quarantined rather than coerced using business assumptions.

### 10.3 Technical encoding normalization

Examples:

- valid character encoding conversion;
- line-ending normalization;
- source timestamp parsing when timezone and format are contractually explicit;
- representation of source binary or decimal values in a supported storage type.

### 10.4 Structural projection

Nested objects, arrays, or repeating groups may be projected into source-aligned structures when the mapping is reversible and lineage is retained.

### 10.5 Technical metadata augmentation

BRZ may add load, lineage, schema, source-position, checksum, replay, and processing-status metadata.

### 10.6 Exact technical duplicate control

BRZ may suppress or link records that are demonstrably identical under an approved deterministic identity rule. The suppressed evidence and count must remain auditable.

### 10.7 Physical maintenance

BRZ may perform:

- file compaction;
- clustering;
- indexing;
- partitioning or partition evolution;
- statistics collection;
- metadata optimization;
- snapshot expiration under approved retention;
- archival.

These operations must not change the logical record set or source values.

---

## 11. Prohibited BRZ Transformations

BRZ must not:

- rename source fields into enterprise business terminology;
- join independent source entities for business convenience;
- replace nulls with business defaults;
- classify source values into business categories;
- calculate revenue, margin, status, age, duration, or other business measures;
- apply reference-data lookups;
- choose a surviving customer, product, order, or supplier record;
- remove records because they fail a business expectation;
- convert source codes into business descriptions;
- collapse CDC history into a current-state table;
- create SCD1 or SCD2 business history;
- hide source deletes;
- overwrite historical records to make them appear corrected;
- filter test, cancelled, closed, inactive, or invalid business records unless the source contract identifies them as non-data transport artifacts;
- apply enterprise column naming conventions that alter source semantics.

---

## 12. Schema and Contract Evolution

### 12.1 Capture three schema perspectives

Where applicable, record:

1. **source-declared schema** — the schema provided by the source contract or registry;
2. **observed input schema** — the schema actually detected in the approved input;
3. **published BRZ schema** — the schema exposed by the BRZ table or dataset version.

### 12.2 Schema fingerprint

Each BRZ load should record a stable schema fingerprint that includes, as supported:

- source field names;
- nesting paths;
- source-declared physical types;
- BRZ physical types;
- nullability or optionality;
- array or repeated structures;
- field identifiers when supported by the table format;
- source and BRZ schema version.

### 12.3 Drift classification

| Drift class | Example | Default BRZ disposition |
|---|---|---|
| No change | Same source and BRZ schema fingerprints | Publish |
| Additive compatible | New optional source field | Add, rescue, or publish with warning by policy |
| Additive incompatible | New field cannot be represented safely | Rescue or quarantine |
| Restrictive | Source field removed or made required | Block or require versioned handling |
| Type widening | Integer expands to long under approved compatibility | Allow by explicit policy |
| Type narrowing | Long becomes integer | Block |
| Semantic reuse | Same source field name now represents a different concept | Block and version |
| Structural | Nested object becomes scalar or array shape changes | Block or use a versioned BRZ structure |
| Identifier change | Source key, field ID, or event identity changes | Block |
| Unknown | Difference cannot be classified | Quarantine |

### 12.4 Schema evolution modes

Each BRZ dataset should declare one mode:

- **strict** — unapproved drift blocks publication;
- **controlled additive** — compatible additive fields may be added or rescued;
- **rescued** — unrecognized fields or incompatible values are retained in a rescued representation;
- **versioned** — breaking changes produce a new BRZ schema or dataset version;
- **discovery** — new structures may be captured in an isolated unpublished area for analysis.

### 12.5 No silent loss rule

A source field or value that cannot be represented under the current BRZ schema must not be silently dropped.

### 12.6 Approval evidence

An approved BRZ schema change should identify:

- affected dataset;
- previous and new source schema fingerprints;
- previous and new BRZ schema fingerprints;
- compatibility classification;
- migration or coexistence plan;
- effective load or source position;
- source owner approval;
- technical owner approval;
- contract and parser version;
- replay impact;
- retention impact.

---

## 13. Idempotency and Duplicate Control

BRZ requires controls at both load and record level.

### 13.1 Load-level idempotency

A BRZ load should be deterministically identified using the strongest available evidence, such as:

- upstream delivery identifier;
- source batch identifier;
- source snapshot identifier;
- source cursor range;
- source partition and offset range;
- input checksum;
- extraction timestamp plus sequence;
- manifest identifier.

### 13.2 Record-level exact identity

An exact-record identity may use:

- source event identifier;
- source partition plus offset;
- source row position within an immutable input;
- stable source record checksum;
- source key plus source version or change sequence;
- deterministic fingerprint of the complete preserved source record.

### 13.3 Required duplicate outcomes

When duplicate evidence is detected, BRZ must explicitly choose one of:

- link the attempted load to the original published BRZ load;
- register the duplicate without rewriting data;
- replay under an approved reason and separate replay identifier;
- append a repeated source event when the source contract states that repetition is meaningful;
- quarantine because the same identity contains conflicting content.

### 13.4 Conflict rule

The same source or load identity associated with different content is a conflict, not an ordinary duplicate.

### 13.5 Business duplicate prohibition

BRZ must not remove records merely because they share a customer ID, product ID, order number, timestamp, or other business attribute. That is not sufficient proof of technical duplication.

---

## 14. Snapshot, Incremental, and CDC Semantics — BRZ Only

### 14.1 Applicability

This section applies to batch snapshots, incremental extracts, CDC batches, micro-batches, and continuous source events. It defines how BRZ preserves change evidence. It does not define how a downstream system constructs current state or business history.

### 14.2 Required ingestion-mode declaration

Each BRZ dataset must declare one primary mode:

| Mode | BRZ interpretation |
|---|---|
| `batch_snapshot` | Preserve each accepted full extract as an identifiable snapshot load. |
| `batch_incremental` | Append records delivered after a documented cursor or watermark. |
| `batch_cdc` | Append explicit source change events delivered in bounded batches. |
| `snapshot_cdc` | Preserve ordered snapshots and the evidence needed to reconcile changes. |
| `micro_batch_stream` | Append bounded event groups with durable source positions. |
| `continuous_stream` | Append source events continuously with durable record and checkpoint lineage. |

### 14.3 CDC metadata preservation

When supplied by the source, BRZ must retain:

- operation type;
- source record key;
- source event identifier;
- source transaction identifier;
- source sequence or log position;
- source partition, shard, or topic partition;
- source commit timestamp;
- source event timestamp;
- source schema or envelope version;
- snapshot indicator;
- before-image;
- after-image;
- delete or tombstone indicator;
- truncate indicator;
- source checkpoint range;
- upstream delivery identifier;
- BRZ load identifier.

### 14.4 Append-only change journal

CDC events should be stored as append-only history. A later event does not erase an earlier event.

### 14.5 Ordering contract

BRZ must not assume arrival order equals source-change order. Each applicable dataset must document:

- authoritative source sequence;
- ordering scope: global, partition, transaction, or source key;
- deterministic tie-breaker;
- sequence reset behaviour;
- gap and regression policy;
- transaction-boundary semantics;
- whether before-images and after-images are complete.

### 14.6 Delete and tombstone preservation

- Source deletes, tombstones, and truncates must not be silently discarded.
- The minimum source identity needed to interpret the change later must be retained.
- Source deletion does not authorize immediate deletion of BRZ audit history.
- BRZ must not reinterpret deletion as inactive, cancelled, closed, or expired.

### 14.7 Snapshot-to-incremental cutover

The BRZ contract must record:

- snapshot identifier;
- snapshot start and completion;
- source position at the snapshot boundary;
- overlap between snapshot and incremental capture;
- duplicate-resolution rule;
- record-count reconciliation;
- source checkpoint validation;
- failure and restart behaviour;
- resynchronization procedure.

### 14.8 Late and out-of-order events

BRZ should append late events with explicit lateness metadata rather than rewriting prior history. Each dataset must define:

- expected lateness;
- maximum automatically accepted lateness;
- sequence-gap disposition;
- sequence-regression disposition;
- extreme-lateness disposition;
- tombstone retention required to support the lateness window;
- replay or resynchronization trigger.

### 14.9 Current-state prohibition

A BRZ table that applies CDC events to maintain only the latest source state is not sufficient as the sole Bronze system of record. The immutable event or snapshot history must also exist and be reconstructable.

---

## 15. Technical Validation and BRZ Quarantine

### 15.1 Load-level controls

Before publication, verify:

- upstream input is approved and identifiable;
- expected source object or partition is present;
- input checksum or fingerprint matches the registered input;
- source schema or version is supported;
- write completed atomically;
- no unpublished partial files or rows are exposed;
- input and output record counts reconcile under the declared projection;
- exact-duplicate outcome is documented;
- schema drift disposition is recorded;
- mandatory metadata is complete.

### 15.2 Record-level technical controls

BRZ record checks should remain structural and source-contract based:

- record is parseable;
- source-required structural fields are present;
- source-declared type can be represented safely;
- source event identity is present when required;
- source sequence or offset is readable;
- nested or repeated structure is valid;
- invalid bytes or malformed values are retained or isolated;
- source key is present for CDC operations that require it;
- operation type is supported;
- source record can be traced to its input.

### 15.3 BRZ quarantine requirements

A quarantined BRZ load or record set must retain:

- upstream input reference;
- original or rescued record evidence;
- BRZ load identifier;
- source schema and observed schema;
- error category, code, and diagnostics;
- failed field or structural path when available;
- first failure timestamp;
- most recent replay timestamp;
- owner or work queue;
- disposition status;
- replacement or replay linkage.

### 15.4 Error taxonomy

Use a controlled taxonomy such as:

- unsupported source schema;
- incompatible type;
- structural parse failure;
- missing source identity;
- invalid CDC operation;
- sequence conflict;
- source-position regression;
- source-position gap;
- exact-identity content conflict;
- reconciliation failure;
- atomic commit failure;
- access or permission failure;
- storage or transaction failure;
- configuration failure;
- unknown failure.

### 15.5 Business-validation exclusion

BRZ quarantine must not be used to remove records because a quantity is negative, a customer is inactive, a country code is unknown, an order date is old, or another business expectation is violated.

---

## 16. Atomicity, Consistency, and Recoverability

### 16.1 Atomic publication

A BRZ load must become published as one complete logical commit. Readers must not observe a partially written published load.

### 16.2 Commit evidence

Record, where supported:

- transaction or snapshot identifier;
- commit timestamp;
- committed file or partition set;
- input and output counts;
- writer version;
- table protocol or format version;
- publication event.

### 16.3 Restart behaviour

A failed load must restart using a documented strategy:

- resume from a durable checkpoint;
- abandon the unpublished attempt and rerun;
- replay from the registered upstream input;
- reconcile already written but unpublished data before proceeding.

### 16.4 No orphaned publication

A publication record without a complete dataset commit, or a complete commit without corresponding load and lineage evidence, is a control failure.

### 16.5 Recovery tests

Test at least:

- failure before first write;
- failure after partial physical write;
- failure before atomic commit;
- failure after commit but before publication metadata;
- repeated input delivery;
- conflicting duplicate identity;
- schema change during processing;
- replay using a newer code version;
- rollback or snapshot restoration where supported.

---

## 17. BRZ Publication and Release Gate

A BRZ load may be published only when:

- approved input identity is confirmed;
- source-aligned representation is complete;
- source and BRZ schemas are recorded;
- mandatory lineage metadata is complete;
- atomic commit is confirmed;
- record and checksum reconciliation pass;
- duplicate and replay outcomes are resolved;
- blocking schema drift is absent;
- blocking technical errors are absent;
- quarantined records are accounted for under policy;
- publication status is written;
- the BRZ release interface references the BRZ load or dataset version.

The lineage chain should preserve:

```text
source or LND delivery
    -> BRZ processing run
    -> BRZ load
    -> BRZ table snapshot or commit
    -> BRZ publication event
```

A publication exception must identify an owner, reason, risk acceptance, scope, and expiry date.

---

## 18. Security and Access Model

BRZ normally contains raw source data and should not be the default business-consumption layer.

| Role | Typical access |
|---|---|
| Ingestion or BRZ pipeline | Read approved input and write assigned BRZ datasets |
| Data engineering | Read BRZ and operate controlled writes, replays, and repairs |
| Platform operations | Diagnose failures and manage approved recovery actions |
| Governance and security | Inspect classification, access, lineage, retention, and policy evidence |
| Source-system owner | View status, lineage, and approved diagnostics for owned datasets |
| Analytics engineering | Controlled read where needed to build approved receiving models |
| Analysts and BI users | No direct BRZ access by default |

Required controls:

- least-privilege access;
- separate read and write identities;
- restricted direct human writes;
- encryption in transit and at rest;
- audit logging for raw-data access;
- data classification and tagging;
- column masking or row filtering only when required by policy and without modifying stored raw evidence;
- time-bound privileged access;
- secrets excluded from records, paths, and logs;
- sensitive samples masked in diagnostics;
- residency and cross-border rules documented;
- periodic access recertification;
- break-glass activity reviewed.

### 18.1 Restricted BRZ pattern

Highly sensitive feeds may require a restricted BRZ area with:

- separate storage or schema boundary;
- narrower service identities;
- stronger network isolation;
- enhanced key management;
- additional access approval;
- shorter or legally mandated retention;
- tokenized or masked release interfaces;
- enhanced audit retention.

---

## 19. Retention, Immutability, and Lifecycle

Each BRZ dataset must define retention separately for:

- raw source-aligned records;
- snapshot history;
- CDC events and tombstones;
- table snapshots or transaction history;
- schema history;
- BRZ load metadata;
- quarantine records;
- validation evidence;
- replay history;
- operational logs.

Retention decisions should consider:

- reconstructability;
- source resend capability;
- regulatory and contractual obligations;
- legal hold;
- incident investigation;
- maximum accepted event lateness;
- downstream rebuild requirements;
- storage and compute cost;
- sensitive-data minimization;
- platform time-travel and vacuum behaviour.

### 19.1 Immutability does not mean infinite retention

Bronze history may be archived or deleted under approved policy. The process must be controlled, auditable, and consistent with recovery requirements.

### 19.2 Time travel is not automatically a backup

Table history or time travel should not be assumed to provide long-term archival unless retention settings, data files, metadata, and restore procedures explicitly support the required period.

### 19.3 Destructive maintenance controls

Vacuum, snapshot expiration, compaction, overwrite, restore, and purge operations must have:

- approved retention settings;
- impact assessment;
- operational ownership;
- audit evidence;
- recovery validation;
- protection against deleting data still required for replay or legal hold.

---

## 20. Observability and Service-Level Controls

### 20.1 Minimum metrics

- expected BRZ loads;
- registered loads;
- published loads;
- failed and quarantined loads;
- input and output record counts;
- rescued-record counts;
- exact-duplicate counts;
- schema drift events;
- processing duration;
- publication latency;
- upstream-to-BRZ latency;
- replay frequency and success;
- reconciliation failures;
- oldest unresolved BRZ quarantine item;
- storage growth;
- small-file or fragmentation indicators where relevant;
- unauthorized-access events;
- metadata completeness.

### 20.2 CDC and incremental metrics

For applicable datasets:

- current captured source position;
- source-position lag;
- sequence gaps and regressions;
- late-event count;
- out-of-order count;
- operation distribution;
- tombstone count;
- snapshot progress;
- unresolved checkpoint count;
- source-to-BRZ event latency.

### 20.3 Recommended service-level indicators

- successful BRZ publication rate;
- publication timeliness;
- record reconciliation rate;
- schema-compatibility success rate;
- quarantine age;
- replay success rate;
- metadata completeness;
- recoverability-test success;
- raw-history availability.

### 20.4 Alerting principles

Alerts should be actionable, threshold-based, routed to a named owner, and tied to a documented runbook. Avoid alerts that report raw counts without expected schedules or severity definitions.

---

## 21. Ownership and RACI Baseline

| Activity | Platform lead | Data engineer | Source-system owner | Governance / security | Data-quality owner | Receiving-model owner |
|---|---|---|---|---|---|---|
| Define BRZ contract | A | R | C | C | C | C |
| Define source-to-BRZ technical mapping | C | R | A/R | I | C | I |
| Implement BRZ ingestion | A | R | C | I | C | I |
| Approve schema evolution | C | R | A/R | C | C | C |
| Operate retries and replays | A | R | C | I | C | I |
| Define exact-duplicate rules | A | R | C | I | C | C |
| Define CDC preservation contract | C | R | A/R | I | C | C |
| Classify sensitive data | C | C | R | A/R | I | I |
| Define retention | C | C | C | A/R | I | C |
| Approve publication exceptions | A | R | C | C | C | C |
| Monitor BRZ service levels | A | R | C | I | R | I |
| Approve dataset retirement | A | R | C | C | I | C |

Legend: **R** Responsible, **A** Accountable, **C** Consulted, **I** Informed.

---

## 22. BRZ Dataset Onboarding Specification

Complete one specification per source-aligned BRZ dataset.

### 22.1 Dataset identity

- BRZ dataset name:
- source system:
- source object or feed:
- source environment:
- business/source owner:
- technical owner:
- receiving-model owner:
- sensitivity classification:
- criticality tier:
- contract version:

### 22.2 Upstream interface

- upstream layer or interface:
- upstream delivery identifier:
- upstream acceptance criteria:
- source resend capability:
- input format:
- input path, table, endpoint, or topic:
- expected schedule or trigger:
- expected and peak volume:
- source timezone:

### 22.3 BRZ representation

- storage format:
- table or dataset type:
- BRZ grain:
- source-aligned projection description:
- nested or multi-table mapping:
- source-field preservation method:
- rescued-data method:
- partitioning or clustering strategy:
- write mode:
- append-only enforcement:
- table protocol or compatibility requirements:

### 22.4 Identity and lineage

- BRZ load key:
- record identity or fingerprint:
- source record position:
- source key, when supplied:
- source batch or snapshot identifier:
- input checksum:
- required lineage metadata:
- OpenLineage or catalog mapping:

### 22.5 Schema controls

- source contract location:
- source schema version:
- BRZ schema version:
- schema fingerprint method:
- evolution mode:
- additive-change policy:
- incompatible-type policy:
- rescued-field policy:
- breaking-change approver:
- coexistence or versioning strategy:

### 22.6 Duplicate and replay controls

- load-idempotency key:
- exact-record identity:
- conflicting-identity rule:
- replay approval owner:
- replay retention:
- code-version change policy for replay:

### 22.7 Snapshot or CDC controls

- ingestion mode:
- source event identifier:
- source operation field:
- source sequence or offset:
- source partition or shard:
- source transaction identifier:
- authoritative ordering rule:
- delete and tombstone behaviour:
- snapshot boundary:
- late-event policy:
- sequence-gap policy:
- resynchronization procedure:

### 22.8 Publication and recovery

- reconciliation rule:
- atomic commit mechanism:
- publication interface:
- blocking validation rules:
- warning rules:
- quarantine owner:
- restart strategy:
- rollback or restore method:
- recoverability-test cadence:

### 22.9 Security and retention

- read groups:
- write identities:
- masking or filtering policy:
- privileged-access procedure:
- raw-history retention:
- schema-history retention:
- quarantine retention:
- time-travel retention:
- legal-hold requirements:
- deletion verification:

---

## 23. BRZ Assessment Checklist

Use this checklist to assess an existing Bronze layer.

### Architecture

- [ ] BRZ responsibility and boundary are documented.
- [ ] BRZ is source-aligned and queryable.
- [ ] Raw history is preserved.
- [ ] Physical and logical LND/BRZ responsibilities are distinguishable.
- [ ] Business transformations are absent.
- [ ] Direct business consumption is restricted by default.

### Immutability and history

- [ ] Published history is not silently overwritten.
- [ ] Replays create auditable outcomes.
- [ ] Corrections and resends remain attributable.
- [ ] Snapshot history or CDC history is reconstructable.
- [ ] Destructive maintenance is governed.

### Lineage and metadata

- [ ] Every BRZ load has a unique identifier.
- [ ] Records link to an upstream input and BRZ load.
- [ ] Pipeline, code, configuration, and schema versions are recorded.
- [ ] Table snapshot or commit identity is captured.
- [ ] Record and load counts reconcile.

### Schema and technical processing

- [ ] Source, observed, and BRZ schemas are distinguishable.
- [ ] Schema fingerprints are retained.
- [ ] Drift is classified and governed.
- [ ] Unsupported fields are rescued or quarantined rather than silently lost.
- [ ] Technical projection is reversible and documented.
- [ ] Source-semantic renaming is absent.

### Duplicate and CDC controls

- [ ] Load idempotency is deterministic.
- [ ] Exact technical duplicates are distinguished from business duplicates.
- [ ] Conflicting duplicate identities are quarantined.
- [ ] Applicable feeds declare snapshot, incremental, or CDC mode.
- [ ] CDC operations, source positions, deletes, tombstones, and snapshots are preserved.
- [ ] BRZ does not replace immutable change history with current-state-only storage.

### Atomicity and recovery

- [ ] Loads publish atomically.
- [ ] Partial loads are invisible as published.
- [ ] Restart and replay procedures are documented.
- [ ] Commit and publication evidence reconcile.
- [ ] Recovery scenarios are tested.

### Operations and governance

- [ ] BRZ quarantine exists.
- [ ] Error categories are standardized.
- [ ] Metrics and alerts route to named owners.
- [ ] Access follows least privilege.
- [ ] Sensitive data is classified.
- [ ] Retention and legal-hold requirements are defined.
- [ ] Exceptions have owners and expiry dates.

---

## 24. Maturity Model

| Level | Characteristics |
|---|---|
| 0 - Uncontrolled | Source data is copied or overwritten with little lineage, history, or ownership. |
| 1 - Repeatable | Recurring raw loads exist, but controls and metadata vary by pipeline. |
| 2 - Standardized | Source alignment, load IDs, append history, schema controls, reconciliation, and publication rules are consistent. |
| 3 - Governed | Ownership, access, retention, drift approval, CDC preservation, service levels, and audit evidence are enforced. |
| 4 - Automated | Contract checks, schema workflows, exact-duplicate control, lineage, quarantine, replay, and recovery testing are automated. |
| 5 - Productized | BRZ onboarding is template-driven, policy-enforced, self-service within guardrails, measurable, and portable across domains. |

---

## 25. Correction and Migration Playbook

### Phase 1 — Inventory

1. Inventory BRZ tables, files, streams, schemas, jobs, owners, and consumers.
2. Identify overwrite-only tables and missing history.
3. Identify business transformations occurring in BRZ.
4. Identify missing load and record lineage.
5. Identify undocumented schema evolution.
6. Identify duplicate, replay, and CDC behaviour.
7. Identify direct analyst or BI dependencies.
8. Identify sensitive-data exposure and retention gaps.

### Phase 2 — Classify

Classify each BRZ object or operation as:

- valid source-aligned Bronze responsibility;
- landing responsibility;
- receiving-model or business-transformation responsibility;
- physical maintenance;
- temporary exception;
- obsolete or duplicate implementation.

### Phase 3 — Establish the BRZ contract

1. Define BRZ boundaries and publication rules.
2. Assign dataset and source owners.
3. Define load and record identity.
4. Introduce mandatory lineage metadata.
5. Define append, snapshot, or CDC storage pattern.
6. Define schema evolution and rescued-data policy.
7. Define atomic commit and reconciliation controls.
8. Define quarantine, replay, and recovery procedures.
9. Restrict direct consumption.

### Phase 4 — Restore immutable history

Depending on available evidence:

- backfill from preserved LND payloads;
- reload from source snapshots;
- reconstruct from source CDC logs;
- version existing overwrite tables and begin append history prospectively;
- preserve legacy history as a separately classified archive;
- record unrecoverable historical gaps explicitly.

Do not manufacture missing history.

### Phase 5 — Remove misplaced logic

1. Identify semantic renaming, defaults, joins, filters, and current-state logic in BRZ.
2. Preserve the current output for comparison.
3. relocate non-BRZ logic to the responsible receiving model.
4. Publish a source-aligned BRZ replacement.
5. Maintain temporary compatibility views only with an owner and sunset date.

### Phase 6 — Prove equivalence and cut over

Validate:

- load and record reconciliation;
- source-value fidelity;
- schema and lineage completeness;
- replay safety;
- duplicate behaviour;
- CDC and delete preservation;
- access and retention controls;
- downstream migration;
- no unapproved business logic remains.

### Phase 7 — Decommission and govern

- retire obsolete tables and jobs;
- archive required evidence;
- publish ownership and runbooks;
- activate monitoring and periodic controls;
- review exceptions until closure.

---

## 26. Acceptance Criteria for a Corrected BRZ Layer

A BRZ dataset is considered corrected when:

- its boundary and purpose are documented;
- the source and upstream interface are identified;
- the representation is source-aligned and queryable;
- accepted source records are traceable to BRZ loads;
- raw history is append-oriented and auditable;
- overwrite-only loss of history is eliminated or explicitly mitigated;
- mandatory metadata is complete;
- schema fingerprints and evolution rules are enforced;
- unsupported values are rescued or quarantined without silent loss;
- load and record idempotency are deterministic;
- exact duplicates are not confused with business duplicates;
- snapshot and CDC semantics are preserved where applicable;
- loads publish atomically;
- input and output records reconcile;
- replay and recovery procedures are tested;
- access and sensitive-data controls are enforced;
- retention and destructive maintenance are governed;
- no business conformance, enrichment, or analytical modelling remains;
- publication exceptions have owners and expiry dates.

---

## 27. Are Table Definitions Required?

### 27.1 For the reusable framework

No. This document can be adopted as a general BRZ architecture and assessment rubric without receiving any organization-specific DDL.

### 27.2 For a structural assessment

Table definitions, schemas, catalog exports, and representative metadata are sufficient to assess visible controls such as:

- source alignment;
- operational metadata coverage;
- schema design;
- table properties;
- partitioning;
- append-only indicators;
- raw-history patterns;
- CDC columns;
- naming and organization;
- obvious business logic in views or computed columns;
- security tags and documented ownership when included.

### 27.3 For a complete operational assessment

Table definitions alone do not prove:

- immutable processing behaviour;
- atomic publication;
- idempotency;
- replay safety;
- schema-drift handling;
- exact-duplicate detection;
- reconciliation;
- CDC ordering and checkpoint semantics;
- quarantine behaviour;
- access enforcement;
- retention execution;
- recovery capability;
- absence of upstream or pipeline transformations.

A complete assessment should also request:

- ingestion SQL, notebooks, dbt models, or pipeline code;
- orchestration definitions;
- table properties and storage-format configuration;
- sample load and record metadata;
- schema history;
- source and upstream contracts;
- CDC envelope examples;
- replay and failure runbooks;
- data-quality and reconciliation results;
- access grants and security policies;
- retention, vacuum, and archival configuration;
- incident history;
- representative data samples where permitted.

### 27.4 Evidence classification rule

Missing evidence must be classified as **Not evidenced**, not automatically as non-compliant.

---

## 28. Recommended Deliverables Per External Organization

When applying this framework, produce:

1. Executive BRZ risk summary.
2. BRZ inventory and ownership register.
3. Source-to-BRZ interface matrix.
4. Control-by-control compliance assessment.
5. Evidence and missing-evidence register.
6. Transformation classification: allowed, prohibited, or exception.
7. Raw-history and immutability assessment.
8. Schema-evolution and rescued-data assessment.
9. Snapshot, incremental, and CDC assessment.
10. Security and retention assessment.
11. Prioritized remediation backlog.
12. Migration and cutover plan.
13. BRZ dataset contract templates.
14. Acceptance test plan.
15. Final confidence score with rationale.

---

## 29. Framework Adaptation Rules

When adapting the framework:

- preserve the BRZ boundary even if the physical layer name differs;
- distinguish logical responsibilities from catalogs, schemas, buckets, or databases;
- do not require a separate LND when controls are logically combined;
- preserve source fidelity over stylistic consistency;
- do not introduce business semantics into BRZ to satisfy consumer requests;
- document every exception with an owner and expiry date;
- use platform-specific capabilities without making the core contract vendor-dependent;
- separate architecture-design confidence from implementation-evidence confidence;
- do not claim compliance from table names alone;
- do not infer missing history or controls.

---

## 30. Reusable LLM Assessment Instruction

Use the following instruction when this framework and organization-specific BRZ evidence are uploaded to another capable LLM:

```text
Use the attached BRZ Bronze Layer Standardization Framework as the sole assessment rubric.

Analyze the attached Bronze schemas, table definitions, pipeline logic, metadata, table properties, and operational evidence strictly from a BRZ perspective.

Do not assess downstream business standardization, semantic modelling, dimensions, facts, KPIs, reports, or analytical consumption except to identify logic that is misplaced in BRZ.

For each framework control:
1. Classify it as Compliant, Partially compliant, Non-compliant, Not evidenced, or Not applicable.
2. Cite the exact table, column, property, SQL expression, pipeline step, configuration, or operational artifact supporting the conclusion.
3. Do not treat missing evidence as non-compliance.
4. Identify strengths, gaps, risks, missing evidence, and BRZ-only corrections.
5. Separate mandatory corrections, recommended improvements, and future readiness controls.
6. Provide a confidence level for each conclusion.
7. Do not invent source behaviour, pipeline behaviour, or historical data.
8. Do not treat matching business keys as proof of duplicate records.
9. Do not recommend semantic transformations inside BRZ.

Produce:
- executive summary;
- control-by-control comparison table;
- misplaced-logic inventory;
- evidence gaps;
- prioritized BRZ remediation backlog;
- additional evidence required;
- overall architecture and implementation-confidence scores.
```

---

## 31. Source Basis and Generalization Note

This framework generalizes lessons from the Jazwares LLC data-platform remediation work, including the need for:

- explicit Medallion layer contracts;
- raw and immutable Bronze behaviour;
- source-aligned schemas;
- mandatory ingestion metadata;
- controlled schema drift;
- defined duplicate and replay behaviour;
- restricted access to raw layers;
- ownership and RACI;
- governed retention and observability;
- separation of raw storage from business standardization.

Organization-specific names, platforms, domains, and remediation dates are not treated as universal requirements.

---

## 32. Industry Standards Benchmark and Confidence Assessment

### 32.1 Benchmarking basis

The framework was compared with current official guidance from:

- Databricks Medallion and Delta Lake documentation;
- Microsoft Fabric Medallion guidance;
- AWS data-lake raw-layer guidance;
- Google Cloud data-lake guidance;
- Apache Iceberg reliability and evolution documentation;
- OpenLineage specifications;
- Open Data Contract Standard v3.1.0;
- NIST SP 800-53 Rev. 5 security and privacy controls.

The benchmark evaluates architecture coverage, not whether any particular organization has implemented the controls.

### 32.2 Confidence scale

| Confidence | Interpretation |
|---|---|
| High | Strongly aligned with multiple authoritative sources and directly applicable to BRZ. |
| Medium | Directionally aligned, but physical implementation or industry terminology varies. |
| Low | Limited authoritative support or material design ambiguity. |

### 32.3 Comparison table

| Control area | Framework position | Industry comparison | Assessment | Confidence | Improvement priority |
|---|---|---|---|---|---|
| Bronze/raw layer definition | Defines BRZ as source-aligned, queryable raw history with minimal technical processing. | Databricks and Fabric define Bronze as raw data, while AWS describes the raw layer as an immutable copy of source data [R1] [R7] [R8]. | Strong alignment. | **High** | Keep the layer contract explicit and enforce it through onboarding and review. |
| Separate LND and BRZ | Prefers separate landing and Bronze responsibilities but permits logical combination. | Industry implementations vary: some use Bronze as initial landing, while AWS guidance can distinguish landing and raw areas [R1] [R7] [R8]. | Correctly treats separation as a logical design choice rather than a universal physical rule. | **Medium** | Publish approved physical deployment patterns. |
| Queryable source fidelity | Requires reversible, source-aligned representation and prohibits semantic transformation. | Current Medallion guidance retains raw source data in Bronze for audit, replay, and later refinement [R1] [R2] [R7]. | Strong alignment. | **High** | Add source-specific projection templates. |
| Append-only history and immutability | Requires append-oriented raw history and prohibits silent overwrite. | AWS describes raw data as immutable; Databricks supports append-only table properties and append-oriented raw ingestion patterns [R4] [R8]. | Strong alignment. | **High** | Enforce append-only properties where supported and test destructive operations. |
| Allowed technical projection | Permits storage conversion, source-contract typing, structural projection, and metadata augmentation. | Vendors vary in how much parsing and schema enforcement occurs in Bronze; Databricks recommends preserving raw fidelity while enabling queryable raw tables [R1] [R3]. | Sound but requires organization-specific boundaries. | **Medium** | Maintain an explicit allowed-transformation catalog per platform. |
| Atomic publication and versioning | Requires atomic commits and prohibits visible partial publication. | Delta Lake provides ACID transaction logs; Iceberg uses atomic metadata commits and snapshot isolation [R2] [R9] [R10]. | Strong alignment. | **High** | Require platform-specific atomicity evidence and failure tests. |
| Schema evolution and rescued data | Separates source, observed, and BRZ schemas; supports additive, versioned, rescued, and strict modes. | Databricks supports controlled schema evolution and rescued data; Iceberg supports schema and partition evolution [R3] [R10] [R11]. | Strong and current. | **High** | Add explicit compatibility rules for registry-based formats. |
| Load and record idempotency | Defines load identity, exact-record identity, conflict handling, and replay linkage. | Reliable raw ingestion patterns require restartability and deterministic handling of repeated inputs; append writes alone do not detect duplicates automatically [R3] [R12]. | Strong control coverage. | **High** | Add executable idempotency tests to onboarding. |
| CDC event preservation | Requires append-only operation history, ordering evidence, source positions, deletes, and tombstones. | Databricks CDC guidance and change-data features preserve row-level changes for incremental processing [R5] [R6]. | Strong alignment at the Bronze boundary. | **High** | Add source-specific CDC envelope profiles only when needed. |
| Snapshot history | Requires identifiable snapshot loads and controlled snapshot-to-incremental cutover. | Raw-zone guidance emphasizes retained source history and reproducibility; table formats support snapshots and time travel [R2] [R8] [R9]. | Strong alignment. | **High** | Add snapshot reconciliation templates. |
| Technical validation and quarantine | Performs structural checks and preserves rescued or invalid records without business filtering. | Databricks recommends schema controls and rescued data to avoid silent loss [R3]. | Strong alignment. | **High** | Define quantitative quarantine thresholds per dataset. |
| Publication gate | Requires reconciliation, complete metadata, schema disposition, atomic commit, and publication evidence. | Transactional table formats and layered architectures support controlled dataset-state transitions [R2] [R9]. | Strong and operationally mature. | **High** | Make publication outcomes machine-enforceable. |
| Lineage interoperability | Defines source-to-load-to-snapshot-to-publication lineage. | OpenLineage standardizes Dataset, Job, Run, schema, and facet metadata [R13] [R14]. | Strong internal model but not yet explicitly mapped to an open standard. | **Medium** | Add an OpenLineage mapping and naming convention. |
| Machine-readable contracts | Provides a detailed onboarding specification but remains Markdown-oriented. | ODCS v3.1.0 defines a machine-readable YAML/JSON contract structure [R15]. | Conceptually aligned but not directly automatable. | **Medium** | Add an ODCS-aligned BRZ contract template with layer-specific extensions. |
| Security assurance | Defines least privilege, restricted raw access, encryption, classification, audit, and privileged-access controls. | NIST provides customizable access, audit, integrity, privacy, and incident-response controls [R16]. | Good baseline without a formal minimum control profile. | **Medium** | Map required evidence to the organization’s chosen security baseline. |
| Retention and time travel | Separates raw history, CDC, schema, snapshot, quarantine, and log retention and warns that time travel is not automatically backup. | Databricks documents configurable table-history and time-travel retention; Iceberg supports snapshot history and expiration [R9] [R17]. | Strong alignment. | **High** | Add legal-hold and deletion-verification procedures. |
| Observability and service levels | Defines publication, reconciliation, schema, replay, CDC, storage, and recovery indicators. | AWS recommends monitoring lake operations against performance expectations and SLAs [R18]. | Strong metrics but target-setting is implementation-specific. | **Medium** | Add dataset-tier SLO and error-budget templates. |
| Technology portability | Uses logical contracts compatible with Delta, Iceberg, Fabric, AWS, Google Cloud, and other platforms. | Major platforms use different physical constructs but converge on raw, refined, and curated responsibilities [R1] [R7] [R8] [R10]. | Strong portability. | **High** | Publish non-normative platform profiles. |

### 32.4 Overall confidence

**Overall architecture-design confidence: High — 89%.**

Scoring basis:

- 12 High-confidence areas × 3 points = 36
- 6 Medium-confidence areas × 2 points = 12
- 0 Low-confidence areas × 1 point = 0
- Total = 48 out of 54 possible points = 88.9%, rounded to **89%**

This score means the framework provides strong coverage of current Bronze-layer architecture practices. It does not certify implementation quality for a specific organization.

Implementation confidence requires inspection of actual DDL, pipelines, table properties, source contracts, data samples, load history, schema history, access grants, retention settings, CDC behaviour, failures, replays, and recovery tests.

### 32.5 Priority changes before Version 2.0

1. Add an ODCS-aligned machine-readable BRZ dataset contract.
2. Add an OpenLineage mapping for source, load, table snapshot, schema, and publication events.
3. Publish platform-specific append-only and atomicity implementation profiles.
4. Add executable idempotency, replay, and recovery test templates.
5. Add compatibility matrices for Avro, Protobuf, JSON, Parquet, Delta, and Iceberg schema evolution.
6. Add formal security-control evidence mapping.
7. Add dataset-tier SLO and error-budget templates.

---

## 33. Industry Benchmark References

- **[R1] Databricks — Medallion lakehouse architecture:** <https://docs.databricks.com/aws/en/lakehouse/medallion>
- **[R2] Databricks — Delta Lake architecture and ACID transaction log:** <https://docs.databricks.com/aws/en/delta/>
- **[R3] Databricks — Auto Loader schema inference, evolution, and rescued data:** <https://docs.databricks.com/aws/en/ingestion/cloud-object-storage/auto-loader/schema>
- **[R4] Databricks — Table properties, including append-only:** <https://docs.databricks.com/aws/en/tables/table-properties>
- **[R5] Databricks — Change data feed:** <https://docs.databricks.com/aws/en/tables/features/change-data-feed>
- **[R6] Databricks — CDC pipeline tutorial:** <https://docs.databricks.com/aws/en/ldp/tutorial-pipelines>
- **[R7] Microsoft Fabric — Medallion lakehouse architecture:** <https://learn.microsoft.com/en-us/fabric/onelake/onelake-medallion-lakehouse-architecture>
- **[R8] AWS — Data lake foundation and immutable raw data:** <https://docs.aws.amazon.com/whitepapers/latest/building-data-lakes/data-lake-foundation.html>
- **[R9] Apache Iceberg — Reliability and atomic commits:** <https://iceberg.apache.org/docs/latest/>
- **[R10] Apache Iceberg — Reliability:** <https://iceberg.apache.org/docs/1.7.1/reliability/>
- **[R11] Apache Iceberg — Schema and partition evolution:** <https://iceberg.apache.org/docs/latest/schemas/> and <https://iceberg.apache.org/docs/latest/partitioning/>
- **[R12] Databricks — Delta table append behaviour:** <https://docs.databricks.com/gcp/en/delta/tutorial>
- **[R13] OpenLineage — Object model:** <https://openlineage.io/docs/spec/object-model>
- **[R14] OpenLineage — Facets and schema metadata:** <https://openlineage.io/docs/spec/facets/> and <https://openlineage.io/docs/spec/facets/dataset-facets/schema/>
- **[R15] Bitol / Linux Foundation — Open Data Contract Standard v3.1.0:** <https://github.com/bitol-io/open-data-contract-standard>
- **[R16] NIST — SP 800-53 Revision 5 security and privacy controls:** <https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final>
- **[R17] Databricks — Table history and time travel:** <https://docs.databricks.com/aws/en/tables/history>
- **[R18] AWS — Monitoring and optimizing the data lake environment:** <https://docs.aws.amazon.com/whitepapers/latest/building-data-lakes/monitoring-optimizing-data-lake-environment.html>

---

## 34. Benchmark Maintenance Rule

Re-run this benchmark at least annually and whenever one of the following occurs:

- a major lakehouse or table-format migration;
- adoption of a new CDC or streaming source;
- adoption of a data-contract or lineage standard;
- a significant security or regulatory change;
- a material raw-data loss, corruption, or replay incident;
- a change to the BRZ boundary or publication interface;
- a major version change in the principal lakehouse platform;
- a change to table-retention or destructive-maintenance policies.

The confidence score must be recalculated using current authoritative documentation and the same published scoring method.

---

## 35. Final Framework Rule

> Bronze is the durable, queryable record of what the source provided—not what the enterprise wishes the source had provided.
