# LND Landing Layer Standardization Framework

**Document type:** Reusable architecture and implementation framework  
**Scope:** Landing / staging layer only  
**Origin:** Generalized from the data-platform remediation lessons documented at Jazwares LLC  
**Version:** 1.2  
**Status:** Landing-only, industry-benchmarked framework baseline

---

## 1. Purpose

This framework defines a repeatable approach for assessing, correcting, and governing an **LND landing layer** across organizations and technology stacks.

For this document, **LND** is the controlled operational ingress and evidence layer. Its responsibility begins when a source delivery is detected and ends when an accepted delivery is released through a documented receiving interface. The implementation and behaviour of the receiving system are outside this framework.

The framework standardizes:

- how data arrives;
- how an arrival is identified and tracked;
- how files, messages, or extracts are preserved;
- how technical validation is performed;
- how schema drift is handled;
- how duplicate deliveries and reruns are controlled;
- how failures are quarantined;
- how lineage and operational metadata are captured;
- how accepted deliveries are released from LND through a controlled handoff;
- how ownership, access, retention, and observability are governed.

It intentionally does **not** prescribe data-type-centric column naming conventions.

---

## 2. Scope Boundaries

### 2.1 In scope

The LND layer may perform only the minimum technical work required to make an inbound payload safe, traceable, readable, and ready for an approved LND release:

- receive and register an inbound delivery;
- preserve the original payload;
- validate file or message integrity;
- decompress or decrypt approved formats;
- parse transport-level envelopes;
- flatten a payload only when required for reliable ingestion;
- capture the source schema and delivery metadata;
- detect schema drift;
- reject or quarantine technically invalid deliveries;
- prevent accidental duplicate processing;
- record operational lineage;
- expose an approved LND release interface without prescribing the receiving system.

### 2.2 Out of scope

The following do not belong in LND:

- business-rule validation;
- business terminology normalization;
- conformed dimensions;
- KPI or measure calculation;
- cross-domain joins;
- enrichment from reference data;
- business deduplication based on interpreted entity meaning;
- null replacement based on business defaults;
- outlier correction;
- source-to-enterprise semantic renaming;
- dimensional, semantic, reporting, or analytical modelling;
- data-type-centric column naming standards.

### 2.3 Boundary rule

> LND proves that a delivery arrived and can be processed. It does not prove that the business data is correct.

---

## 3. Core LND Contract

Every LND implementation should satisfy the following contract.

| Contract area | Required condition |
|---|---|
| Source fidelity | The original inbound payload is retained without business transformation. |
| Traceability | Every delivery has a unique, durable delivery identifier. |
| Idempotency | Reprocessing the same delivery does not create uncontrolled duplicates. |
| Technical validity | Corrupt, incomplete, unsupported, or unreadable payloads are rejected or quarantined. |
| Schema visibility | The observed source schema is captured and compared with the previously accepted schema. |
| Controlled drift | Schema changes follow an explicit allow, warn, or block policy. |
| Auditability | Arrival time, processing time, source, pipeline, status, and error details are recorded. |
| Security | Access follows least privilege and sensitive payloads are protected. |
| Recoverability | Failed deliveries can be diagnosed and safely replayed. |
| Release control | Only deliveries that pass LND controls are eligible to leave the landing boundary through the approved interface. |
| Retention | Raw payload and metadata retention periods are explicit. |
| Ownership | A named technical owner and business/source-system contact exist. |

---

## 4. Design Principles

### 4.1 Preserve before transforming

Store the original inbound object before parsing, flattening, or restructuring it. The preserved object is the evidence of what the source delivered.

### 4.2 Make every delivery uniquely identifiable

A delivery identifier should be deterministic when possible. It may be derived from a combination of:

- source system;
- source object or endpoint;
- source extraction timestamp;
- file path or object key;
- file size;
- content checksum;
- batch identifier;
- partition or sequence identifier.

### 4.3 Separate arrival state from data state

The framework distinguishes:

- **delivery metadata** - information about the inbound object or batch;
- **payload data** - the actual source records;
- **processing metadata** - information about LND execution and status.

### 4.4 Prefer append-only operational history

Delivery events and status transitions should be recorded as append-only history wherever practical. Corrections should create a new event rather than silently overwrite evidence.

### 4.5 Fail visibly

A delivery must never disappear because of a parsing or validation error. It should finish in an explicit terminal or recoverable status.

### 4.6 Replays must be intentional

A replay should reference the original delivery, identify the reason, record the pipeline version, and produce an auditable outcome.

### 4.7 Keep LND source-aligned

LND structures should remain close to the source payload. Enterprise conformance and business processing are outside the LND boundary.

---

## 5. Standard LND Processing Flow

```text
Source
  |
  v
Arrival detection
  |
  v
Delivery registration
  |
  v
Original payload preservation
  |
  v
Transport and integrity checks
  |
  +---- failure ----> Quarantine + incident metadata
  |
  v
Schema capture and drift evaluation
  |
  +---- blocked drift ----> Quarantine / approval workflow
  |
  v
Minimal parsing or flattening, when required
  |
  v
Record-level technical checks
  |
  +---- failure ----> Reject set or quarantined delivery
  |
  v
LND acceptance record
  |
  v
Accepted LND release record
```

---

## 6. Delivery Lifecycle and Status Model

Use a finite and documented lifecycle. A recommended baseline is:

| Status | Meaning |
|---|---|
| `detected` | A candidate delivery has been observed. |
| `registered` | A delivery identifier and metadata record have been created. |
| `preserved` | The original payload has been stored in the controlled landing zone. |
| `validating` | Technical validation is running. |
| `accepted` | LND controls passed and the delivery is eligible for approved release. |
| `accepted_with_warning` | The delivery passed LND controls, but a non-blocking condition requires review. |
| `quarantined` | The delivery is retained but blocked from LND acceptance and release. |
| `rejected` | The delivery is invalid and will not be processed without replacement or override. |
| `released` | The accepted delivery was exposed through the approved LND release interface. |
| `replayed` | The delivery was intentionally processed again under an auditable replay event. |

A status transition should record:

- delivery identifier;
- prior status;
- new status;
- transition timestamp;
- pipeline or job identifier;
- code or configuration version;
- actor or service principal;
- reason code;
- human-readable diagnostic message.

---

## 7. Mandatory Operational Metadata

The exact physical column names are implementation-specific. The following **metadata concepts** are mandatory.

### 7.1 Source identity

- source system;
- source object, feed, endpoint, or dataset;
- source environment;
- source region or business unit, when relevant;
- source-generated batch or extract identifier;
- source extraction timestamp, when supplied.

### 7.2 Delivery identity

- landing delivery identifier;
- original file name or object key;
- original path or URI reference;
- file or payload size;
- content checksum;
- compression or encryption format;
- arrival timestamp;
- detected partition or sequence.

### 7.3 Processing identity

- ingestion pipeline name;
- run identifier;
- pipeline version or commit identifier;
- processing start and end timestamps;
- replay indicator;
- prior delivery reference for replay;
- execution environment;
- service principal or technical actor.

### 7.4 Processing outcome

- delivery status;
- accepted record count;
- rejected record count;
- total observed record count;
- schema fingerprint;
- schema drift classification;
- quarantine location;
- error category;
- error code;
- diagnostic message.

---

## 8. Technical Validation Controls

### 8.1 Delivery-level controls

Apply controls before record-level processing:

- file or object exists;
- payload is non-empty unless an empty extract is explicitly valid;
- expected file count or message count is met;
- expected naming or partition pattern is met;
- file extension and actual format agree;
- compression can be opened;
- decryption succeeds;
- checksum validation succeeds, when supplied;
- manifest and payload agree;
- delivery is complete and not still being written;
- delivery has not already been accepted under the idempotency rule.

### 8.2 Format-level controls

Examples include:

- CSV delimiter and quoting are parseable;
- JSON is syntactically valid;
- XML is well formed;
- Parquet or Avro metadata can be read;
- workbook sheet expectations are met;
- fixed-width record length is valid;
- message envelope and payload versions are supported.

### 8.3 Record-level technical controls

LND record checks should remain technical rather than semantic:

- row can be parsed;
- required structural fields exist;
- record length or field count is valid;
- invalid byte sequences are detected;
- malformed nested structures are isolated;
- source-provided sequence is readable;
- record-level checksum is valid, when supplied.

Do not use LND to enforce business thresholds, referential integrity, or enterprise domain rules.

---

## 9. Schema Drift Management

### 9.1 Capture

For each accepted delivery, capture a schema representation and a stable fingerprint. The representation should include, as supported by the source format:

- field names as delivered;
- nesting paths;
- source-declared physical types;
- field order, where operationally significant;
- nullability or optionality, when supplied;
- source schema version;
- repeated or array structures.

### 9.2 Classify

Classify drift into at least these categories:

| Drift class | Example | Default disposition |
|---|---|---|
| No change | Same schema fingerprint | Accept |
| Additive | New optional field | Warn or accept by policy |
| Restrictive | Field removed or made required | Block |
| Type change | Source physical type changed | Block or require approval |
| Structural | Nesting or array structure changed | Block |
| Ordering-only | Field order changed where order is not significant | Accept with audit |
| Unknown | Difference cannot be classified | Quarantine |

### 9.3 Policy

Every source feed must declare one of the following drift modes:

- **strict** - any unapproved drift blocks the delivery;
- **controlled additive** - approved additive changes may pass with warning;
- **versioned** - each supported source schema version has an explicit parser;
- **discovery** - drift may land in an isolated discovery area but cannot be accepted or released automatically.

### 9.4 Approval evidence

An approved schema change should identify:

- affected source feed;
- prior and new schema fingerprint;
- change description;
- effective date;
- owner approval;
- compatibility assessment;
- receiving-interface compatibility assessment;
- parser or configuration version.

---

## 10. Idempotency and Duplicate Delivery Control

LND duplicate control is delivery-centric, not business-entity-centric.

### 10.1 Recommended duplicate keys

Use one or more of:

- source batch identifier;
- immutable source object key;
- content checksum;
- source extract timestamp plus sequence;
- manifest identifier;
- API cursor or event offset;
- source partition plus file name.

### 10.2 Required behaviour

When a duplicate is detected, the platform must explicitly choose one of these outcomes:

- ignore and link to the original accepted delivery;
- register as a duplicate event without reprocessing;
- replay under an approved replay reason;
- quarantine because the duplicate identity conflicts with different content.

### 10.3 Collision rule

If two payloads use the same source delivery identifier but have different checksums, treat the condition as a conflict, not a normal duplicate.

---


## 11. Conditional CDC and Streaming Readiness — LND Only

### 11.1 Applicability

Jazwares currently operates batch ingestion. The controls in this section are therefore **conditional** and apply only when a feed is declared as incremental, CDC, micro-batch, or continuous-stream input.

This section does not require a streaming platform and does not define how changes are applied outside LND. It standardizes only how change events are identified, preserved, ordered, checkpointed, validated, quarantined, replayed, and released by the landing layer.

### 11.2 Feed ingestion-mode declaration

Each feed must declare one ingestion mode:

| Ingestion mode | Landing-layer interpretation |
|---|---|
| `batch_snapshot` | A complete source extract delivered as one identifiable batch. |
| `batch_incremental` | A scheduled batch containing records after a source cursor, timestamp, or sequence. |
| `batch_cdc` | A scheduled batch containing explicit insert, update, delete, snapshot, or truncate events. |
| `snapshot_cdc` | Ordered snapshots from which source changes are identified or reconciled. |
| `micro_batch_stream` | Events collected continuously but registered and accepted in bounded LND batches. |
| `continuous_stream` | Events captured continuously with durable positions and event-level landing evidence. |

A feed cannot change ingestion mode without a contract version, compatibility assessment, and approved cutover plan.

### 11.3 Conditional CDC metadata concepts

When a feed is incremental or CDC-capable, LND must preserve the metadata available from the source for:

- change-event identifier;
- source record or business key as delivered;
- source operation type, such as insert, update, delete, snapshot, or truncate;
- source transaction identifier, when supplied;
- source sequence or log position;
- source partition, shard, or topic partition;
- source commit timestamp;
- source extraction timestamp;
- source schema or envelope version;
- snapshot indicator;
- before-image availability indicator;
- after-image availability indicator;
- LND arrival timestamp;
- LND processing timestamp.

The framework defines metadata concepts rather than mandatory physical column names.

### 11.4 Ordering contract

LND must not assume that arrival order equals source-change order.

Each applicable feed must document:

- the authoritative ordering field;
- whether ordering is global, per partition, or per source key;
- the deterministic tie-breaker for equal sequence or timestamp values;
- whether source sequences can reset;
- whether partitions may be processed independently;
- the disposition for sequence regression, gaps, or conflicting events.

Recommended ordering precedence, where supported:

```text
source sequence or log position
    -> source commit timestamp
    -> stable change-event identifier
```

Source timestamps alone should not be treated as sufficient ordering evidence unless the source contract guarantees uniqueness and precision.

### 11.5 Delivery guarantee and idempotency

The default LND guarantee is:

> Source deliveries or events may be received more than once. LND must preserve them without causing uncontrolled duplicate landing effects.

LND should implement **at-least-once capture with deterministic idempotency** unless the complete source-to-LND transaction boundary proves a stronger guarantee.

A CDC idempotency key should use the strongest source evidence available, for example:

```text
source system
+ source object or feed
+ source partition
+ source offset or sequence
+ change-event identifier
```

When a stable event identifier is unavailable, LND may derive a deterministic fingerprint from preserved source metadata and event content. A repeated identity with different content is a conflict and must not be silently overwritten.

### 11.6 LND checkpoint commit rule

A source cursor, offset, or log position may be committed only after:

1. the original event or delivery envelope is durably preserved;
2. mandatory LND metadata is durably recorded;
3. the event identity and checksum or fingerprint are available;
4. the LND write is confirmed;
5. the corresponding checkpoint event is auditable.

```text
Read source event
    -> preserve source evidence
    -> write LND metadata and status
    -> confirm durable LND write
    -> commit source checkpoint
```

LND must not advance a source checkpoint before durable preservation. A checkpoint that cannot be reconciled to preserved landing evidence is a control failure.

### 11.7 Delete, tombstone, and truncate preservation

LND must preserve source delete, tombstone, and truncate evidence when supplied.

- Delete events must not be silently discarded.
- The source key and operation metadata must be retained.
- Tombstones must remain available for replay and late-event handling for the configured retention period.
- A source deletion does not authorize immediate deletion of LND audit evidence.
- LND does not interpret a delete as inactive, cancelled, closed, or any other business state.
- Any business or current-state interpretation is outside this framework.

### 11.8 Initial snapshot and incremental cutover

When an incremental or CDC feed begins with an initial snapshot, its onboarding contract must define:

- snapshot start and completion timestamps;
- source position at the snapshot boundary;
- whether source changes continue during the snapshot;
- overlap and duplicate handling;
- snapshot reconciliation totals;
- incremental cursor validation;
- failure and restart behaviour;
- resynchronization procedure.

The LND cutover gate is satisfied only when snapshot evidence, source boundary, reconciliation, cursor validation, and overlap resolution are documented and accepted.

### 11.9 Late and out-of-order event policy

Each applicable feed must define:

| Parameter | Required decision |
|---|---|
| Expected lateness | Normal arrival delay for the feed |
| Maximum accepted lateness | Oldest event that may still be accepted automatically |
| Ordering scope | Global, partition, or source key |
| Late-event outcome | Accept with warning, quarantine, or require replay approval |
| Sequence-gap outcome | Wait, quarantine, alert, or controlled resynchronization |
| Extremely late event outcome | Quarantine or approved exception |
| Tombstone retention | Long enough to support the accepted lateness window |

These controls are also applicable to batch feeds that arrive out of sequence or resend historical corrections.

### 11.10 Event-envelope schema control

For CDC feeds, LND must govern two distinct structures:

1. the **event envelope**, including operation, sequence, partition, transaction, snapshot, and timestamp metadata;
2. the **source payload**, including before-images and after-images when supplied.

Envelope drift and payload drift must be classified separately. Missing ordering metadata, missing source keys on delete events, unsupported operation codes, or removal of checkpoint fields are blocking contract violations unless an approved versioned parser exists.

### 11.11 CDC-specific technical validation

Conditional validation should verify, as applicable:

- operation type is supported;
- required source key is present;
- source partition and sequence or offset are present;
- event identity is stable;
- update or insert events contain the required source image;
- delete events contain the minimum source identity;
- source position has not unexpectedly regressed;
- source gaps are handled according to policy;
- duplicate identities contain identical preserved evidence;
- snapshot and incremental modes are distinguishable;
- source envelope version is supported;
- event age is within the configured acceptance policy.

These checks are structural and operational. LND must not assess whether the source change is correct from a business perspective.

### 11.12 CDC status reason codes

The existing delivery lifecycle remains authoritative. The following optional reason codes may be added without creating a separate business-state model:

| Reason code | Meaning |
|---|---|
| `checkpoint_pending` | Source evidence is preserved, but the source position is not yet committed. |
| `checkpoint_committed` | Durable LND preservation and checkpoint completion are confirmed. |
| `late_event` | Event arrived outside expected sequence or time. |
| `offset_conflict` | The same source position is associated with conflicting content. |
| `sequence_regression` | Source position moved backward unexpectedly. |
| `sequence_gap` | An expected source position is missing. |
| `snapshot_event` | Event belongs to an initial or resynchronization snapshot. |
| `tombstone_event` | Event represents source deletion evidence. |
| `resync_required` | Incremental continuity cannot be proven. |

### 11.13 CDC and streaming observability

Enable these metrics only for applicable feeds:

- current captured source position;
- checkpoint age;
- source-to-LND position lag;
- source event-time to LND arrival lag;
- oldest unaccepted event;
- late-event count;
- out-of-order event count;
- duplicate-event count;
- conflicting-event count;
- sequence-gap and sequence-regression count;
- operation distribution;
- snapshot progress;
- tombstone count;
- replayed event count;
- unresolved checkpoint count;
- LND acceptance and release latency.

### 11.14 Landing-only acceptance criteria for CDC-capable feeds

A CDC-capable feed is ready at the LND boundary when:

- ingestion mode is declared;
- source event identity is durable;
- ordering and tie-break rules are documented;
- source checkpoints are committed only after durable LND preservation;
- duplicate and conflicting-event behaviour is tested;
- delete and tombstone evidence is preserved;
- snapshot-to-incremental cutover is reconciled;
- late-event and sequence-gap policies are configured;
- envelope and payload drift are governed separately;
- replay and resynchronization are auditable;
- applicable observability metrics and alerts are active;
- the LND release interface exposes only accepted event evidence.

## 12. Quarantine and Error Handling

### 12.1 Quarantine requirements

A quarantined delivery must retain:

- the original payload;
- delivery metadata;
- validation results;
- schema snapshot;
- error category and diagnostics;
- first failure timestamp;
- most recent retry timestamp;
- owner or queue assignment;
- disposition status;
- replay or replacement linkage.

### 12.2 Error taxonomy

Use a controlled taxonomy such as:

- arrival incomplete;
- unsupported format;
- corrupt payload;
- decryption failure;
- checksum mismatch;
- manifest mismatch;
- parse failure;
- blocked schema drift;
- duplicate conflict;
- access or permission failure;
- infrastructure failure;
- configuration failure;
- unknown failure.

### 12.3 Disposition options

- source resubmission requested;
- configuration corrected and replay approved;
- parser version upgraded;
- schema change approved;
- delivery rejected permanently;
- incident escalated;
- exception accepted with documented expiry.

---

## 13. LND Acceptance and Release Gate

A delivery may be accepted and released from LND only when:

- original payload preservation is confirmed;
- required metadata is complete;
- delivery integrity controls pass;
- the payload is technically parseable;
- schema drift is accepted under policy;
- duplicate status is resolved;
- blocking errors are absent;
- record counts reconcile at the required technical level;
- an acceptance event is written;
- the receiving interface can reference the LND delivery identifier without changing the original evidence.

The LND release event should preserve lineage from:

```text
source delivery -> LND delivery -> LND processing run -> LND release event
```

---

## 14. Security and Access Model

A standard LND access model should follow least privilege.

| Role | Typical access |
|---|---|
| Ingestion service | Write inbound payloads and delivery metadata for assigned sources |
| Data engineering pipeline | Read accepted LND data and write processing outcomes |
| Platform operations | Diagnose failures and manage approved replays |
| Governance/security | Inspect metadata, classification, access, and policy compliance |
| Source-system owner | View delivery status and diagnostics for owned feeds |
| Analysts and BI users | No direct payload access by default |

Additional controls:

- encrypt data in transit and at rest;
- restrict direct human writes;
- classify sensitive feeds before onboarding;
- prevent secrets from appearing in file paths, logs, or diagnostics;
- mask sensitive values in error samples;
- audit access to raw payloads;
- use time-bound privileged access for manual intervention;
- document cross-border or residency restrictions.

---

## 15. Retention and Lifecycle

Each feed must define retention separately for:

- original inbound payload;
- parsed LND representation;
- delivery metadata;
- quarantine payload;
- validation evidence;
- operational logs;
- replay history.

Retention decisions should consider:

- ability to replay;
- source-system recovery capability;
- regulatory requirements;
- contractual requirements;
- storage cost;
- incident investigation needs;
- source resend capability and LND recovery requirements;
- sensitive-data minimization.

A deletion or archival process must retain sufficient metadata to prove that a delivery existed and how it was processed, unless policy explicitly requires complete deletion.

---

## 16. Observability and Service-Level Controls

### 16.1 Minimum metrics

- deliveries expected;
- deliveries received;
- deliveries accepted;
- deliveries quarantined;
- delivery lateness;
- file or payload volume;
- record volume;
- processing duration;
- schema drift events;
- duplicate events;
- replay events;
- failure rate by category;
- oldest unresolved quarantine item;
- LND acceptance and release lag.

### 16.2 Recommended service-level indicators

- arrival timeliness;
- successful acceptance rate;
- end-to-end LND processing latency;
- LND release latency;
- unresolved quarantine age;
- metadata completeness;
- replay success rate.

### 16.3 Alerting principles

Alerts should be actionable and route to an identified owner. Avoid alerting solely on raw event counts without a defined threshold, expected schedule, or business impact.

---

## 17. Ownership and RACI Baseline

| Activity | Platform lead | Data engineer | Source-system owner | Governance / security | Data-quality owner |
|---|---|---|---|---|---|
| Define LND contract | A | R | C | C | C |
| Define source delivery specification | C | R | A/R | C | C |
| Implement ingestion | A | R | C | I | C |
| Operate retries and replays | A | R | C | I | C |
| Approve schema drift | C | R | A/R | C | C |
| Classify sensitive data | C | C | R | A/R | I |
| Define quarantine disposition | A | R | C | C | R |
| Define retention | C | C | C | A/R | I |
| Monitor service levels | A | R | C | I | R |
| Approve LND acceptance or release exceptions | A | R | C | C | C |

Legend: **R** Responsible, **A** Accountable, **C** Consulted, **I** Informed.

---

## 18. Feed Onboarding Specification

Complete one onboarding specification per source feed.

### 18.1 Source details

- source system:
- business/source owner:
- technical owner:
- source environment:
- feed or object name:
- ingestion mechanism:
- ingestion mode (`batch_snapshot`, `batch_incremental`, `batch_cdc`, `snapshot_cdc`, `micro_batch_stream`, or `continuous_stream`):
- delivery schedule or trigger:
- expected delivery window:
- source timezone:
- expected volume:
- peak volume:
- sensitivity classification:

### 18.2 Delivery details

- file, message, table, API, or stream:
- path, endpoint, topic, or connection reference:
- naming or partition pattern:
- manifest available:
- compression:
- encryption:
- checksum available:
- source batch identifier:
- late-arrival behaviour:
- empty-delivery behaviour:

For incremental or CDC-capable feeds:

- source event identifier:
- source key:
- operation-type field:
- source sequence or offset:
- source partition or shard:
- source commit timestamp:
- authoritative ordering rule:
- tie-breaker:
- checkpoint commit rule:
- delete/tombstone behaviour:
- snapshot cutover rule:
- expected and maximum lateness:
- sequence-gap and regression disposition:

### 18.3 Schema details

- current schema version:
- schema registry or contract location:
- drift mode:
- additive-change policy:
- breaking-change approval owner:
- historical schema examples available:

### 18.4 Recovery details

- source can resend:
- maximum resend window:
- replay key:
- duplicate rule:
- conflict rule:
- quarantine owner:
- escalation route:

### 18.5 Retention details

- original payload retention:
- quarantine retention:
- metadata retention:
- legal or regulatory constraints:

---

## 19. LND Assessment Checklist

Use this checklist to assess an existing landing layer.

### Architecture

- [ ] LND responsibility is documented.
- [ ] The beginning and end of LND responsibility are documented.
- [ ] Original payloads are preserved.
- [ ] The LND release interface is explicit and auditable.
- [ ] Business transformations are absent from LND.

### Delivery control

- [ ] Every delivery receives a unique identifier.
- [ ] Duplicate-delivery behaviour is deterministic.
- [ ] Partial or still-writing files cannot be processed accidentally.
- [ ] Replay behaviour is documented and audited.
- [ ] Delivery status is visible.

### Technical validation

- [ ] Integrity checks exist.
- [ ] Format validation exists.
- [ ] Schema is captured.
- [ ] Drift is classified.
- [ ] Blocking and non-blocking drift rules are defined.
- [ ] Applicable feeds declare their batch, incremental, CDC, or streaming mode.
- [ ] CDC-capable feeds define event identity, ordering, checkpoints, delete preservation, and late-event handling.

### Operations

- [ ] Quarantine exists.
- [ ] Error categories are standardized.
- [ ] Failed deliveries retain diagnostic evidence.
- [ ] Service-level metrics exist.
- [ ] Alerts route to named owners.

### Governance

- [ ] LND access is restricted.
- [ ] Sensitive-data classification is recorded.
- [ ] Retention is defined.
- [ ] Ownership is assigned.
- [ ] Exceptions have owners and expiry dates.

---

## 20. Maturity Model

| Level | Characteristics |
|---|---|
| 0 - Uncontrolled | Files or extracts are copied into storage with no durable registration, status, or ownership. |
| 1 - Repeatable | Basic ingestion paths and schedules exist; failures are handled manually. |
| 2 - Standardized | Delivery metadata, idempotency, validation, quarantine, acceptance, and release rules are consistent. |
| 3 - Governed | Ownership, access, retention, drift approval, service levels, and audit evidence are enforced. |
| 4 - Automated | Contract validation, drift workflows, observability, replay controls, and policy enforcement are automated. |
| 5 - Productized | LND onboarding is template-driven, self-service within guardrails, measurable, and reusable across domains. |

---

## 21. Correction and Migration Playbook

### Phase 1 - Inventory

1. Inventory all current landing locations, feeds, jobs, owners, and consumers.
2. Identify transformations currently occurring in landing.
3. Identify feeds with no preserved original payload.
4. Identify duplicate or rerun behaviour.
5. Identify undocumented schema drift.
6. Identify sensitive data and access exposure.
7. Identify direct analyst or BI dependencies on LND.

### Phase 2 - Classify

Classify each current operation as:

- valid LND responsibility;
- non-LND transformation or modelling responsibility;
- receiving-system responsibility;
- operational control;
- obsolete or duplicate logic;
- temporary exception.

### Phase 3 - Establish controls

1. Introduce delivery registration.
2. Preserve original payloads.
3. Add checksums or equivalent identity evidence.
4. Implement status lifecycle.
5. Add technical validation.
6. Add schema capture and drift policy.
7. Implement quarantine.
8. Define the LND acceptance and release gate.
9. Restrict access.
10. Add monitoring and ownership.

### Phase 4 - Remove misplaced logic

Remove from LND and assign outside the landing boundary:

- business defaults;
- semantic renaming;
- business deduplication;
- reference-data joins;
- business validation;
- cross-source reconciliation;
- conformance logic.

### Phase 5 - Prove equivalence and cut over

1. Run old and corrected ingestion paths in parallel.
2. Reconcile delivery counts and checksums.
3. Test duplicate and replay scenarios.
4. Test expected schema changes and breaking changes.
5. Test quarantine and recovery.
6. Confirm source-to-LND-to-release lineage.
7. Remove or deprecate the legacy path.
8. Publish runbooks and ownership.

---

## 22. Acceptance Criteria for a Corrected LND Layer

A corrected feed is complete when:

- the LND contract is documented and approved;
- the original payload is durably preserved;
- every delivery is uniquely registered;
- duplicate and conflict behaviour is tested;
- technical validation is automated;
- schema drift is detected and governed;
- failed deliveries are quarantined with diagnostics;
- an approved replay process exists;
- LND acceptance and release are gated and traceable;
- access is restricted by role;
- retention is configured;
- ownership and escalation are documented;
- observability and alerts are active;
- no business transformation remains in LND;
- consumers cannot bypass the approved LND release interface to access uncontrolled landing objects.

---

## 23. Are Table Definitions Required?

### For the reusable framework

**No.** Table definitions are not required to establish the LND operating model, controls, governance, lifecycle, or assessment checklist.

### For applying the framework to a specific organization

**Yes, eventually.** Physical definitions and representative payloads are needed to create an implementation-specific correction plan. At minimum, collect:

- current landing table or file definitions;
- representative payload samples;
- source delivery schedule;
- current ingestion code or orchestration configuration;
- observed schema history;
- volume and latency profile;
- duplicate and replay behaviour;
- source-system keys or batch identifiers;
- security classification;
- current retention;
- receiving-interface dependency;
- known incidents and failure modes.

Table definitions alone are not sufficient. Operational delivery metadata and pipeline behaviour are equally important because LND standardization is primarily an ingestion-control problem.

---

## 24. Recommended Deliverables Per External Organization

When this framework is applied outside Jazwares LLC, produce:

1. **Current-state LND inventory**
2. **Gap assessment against the LND contract**
3. **Feed-by-feed risk classification**
4. **Target LND architecture**
5. **Delivery metadata specification**
6. **Schema drift policy**
7. **Idempotency and replay design**
8. **Quarantine and error taxonomy**
9. **LND acceptance and release contract**
10. **Security and retention matrix**
11. **Migration plan**
12. **Acceptance-test pack**
13. **Runbook and ownership matrix**

---

## 25. Framework Adaptation Rules

This framework is intentionally technology-neutral. Adapt the implementation to the local platform while preserving the contract.

Examples of implementation variation:

- object storage, managed volumes, database staging schemas, queues, or event streams;
- batch, micro-batch, or streaming ingestion;
- Databricks, Snowflake, BigQuery, Fabric, Redshift, or another data platform;
- dbt, Spark, native SQL, orchestration services, or custom ingestion code;
- schema registry, contract files, or metadata tables.

The technology may change. The required LND behaviours - fidelity, traceability, idempotency, validation, quarantine, controlled drift, acceptance, release, security, and observability - should not.

---

## 26. Source Basis and Generalization Note

This framework generalizes the following lessons from the Jazwares LLC medallion remediation material:

- create a distinct Copper / Staging / Landing responsibility;
- use landing for flattening, schema enforcement, and pre-cleaning ingestion;
- preserve source fidelity and immutable landing evidence;
- define explicit layer contracts;
- add mandatory operational metadata;
- introduce data-quality controls, quarantine, and ownership;
- align permissions with layer responsibilities;
- document and enforce retention, access, and change management;
- avoid mixing landing, cleansing, conformance, and business-curation logic.

The detailed LND lifecycle, schema-drift classification, idempotency model, migration checklist, and acceptance criteria are portable framework extensions derived from those stated architectural principles. They should be validated against each adopting organization's regulatory, operational, and platform requirements.

---

## 27. Industry Standards Benchmark and Confidence Assessment

**Assessment date:** 28 July 2026  
**Assessment type:** Architecture-design benchmark, not a certification or implementation audit

### 27.1 Benchmarking basis

There is no single universally binding standard that defines an enterprise **LND landing layer**. Current industry practice is instead established through convergent guidance from cloud and lakehouse vendors, security control frameworks, and open metadata and data-contract specifications.

This assessment compares the framework against:

- Databricks medallion guidance for raw-data fidelity, limited validation, metadata capture, append-oriented history, reprocessing, and restricted analyst access [R1];
- Databricks guidance for rescued data and schema evolution [R2] [R3];
- AWS guidance for landing, raw, stage, lifecycle, versioning, auditability, and monitoring [R4] [R5] [R6];
- Microsoft Fabric guidance for raw-zone boundaries and OneLake role-based security, encryption, and auditing [R7] [R8];
- Google Cloud Dataplex raw-versus-curated zone guidance [R9];
- OpenLineage's Run, Job, Dataset, schema, version, lifecycle, and source-code metadata model [R10];
- the Open Data Contract Standard (ODCS) v3.1.0 for machine-readable schema, quality, service-level, stakeholder, and governance agreements [R11];
- NIST SP 800-53 Revision 5 for technology-neutral security and privacy control assurance [R12];
- Apache Kafka delivery guarantees for idempotent and exactly-once streaming patterns [R13] [R14].

### 27.2 Confidence scale

| Confidence level | Interpretation |
|---|---|
| **High** | The framework directly aligns with multiple current official sources or open specifications, with no material architectural conflict. Only implementation-specific detail is normally required. |
| **Medium** | The framework aligns in principle, but a recognized standard mapping, workload-specific control, or enforceable specification is missing. |
| **Low** | A material control area is absent or insufficient for an important workload class. |

For the overall design-confidence indicator, High = 3 points, Medium = 2 points, and Low = 1 point. This score evaluates the framework's architecture coverage only. It does not prove that a specific organization's pipelines comply with the framework.

### 27.3 Comparison table

| Control area | Current LND framework position | Current industry benchmark | Assessment | Confidence level | Recommended enhancement |
|---|---|---|---|---|---|
| LND responsibility separation | LND is limited to ingress, technical validation, preservation, acceptance, and controlled release; business logic is outside the landing boundary. | Databricks, Microsoft, AWS, and Google consistently separate raw ingestion from cleansing, conformance, and business-ready layers [R1] [R5] [R7] [R9]. | Strong alignment with the dominant medallion and zoned-lake pattern. | **High** | Retain the boundary rule and enforce it through architecture reviews and automated checks. |
| Physical or logical LND deployment | LND is defined by operational responsibility rather than by a mandatory product or schema name. | Current platforms support both a distinct landing location and landing controls implemented within a broader raw zone [R1] [R4] [R7] [R9]. | Architecturally valid and portable, but physical placement remains organization-specific. | **Medium** | Publish two approved patterns: **physical LND zone** and **logical LND state within a raw zone**. Require the same landing contract in either pattern. |
| Source fidelity and landing immutability | Original inbound payload is retained without business transformation, with append-oriented evidence. | Landing and raw zones are expected to preserve the source state, support auditing and reprocessing, and retain history [R1] [R4] [R5]. | Direct alignment. | **High** | Add platform-specific immutability mechanisms such as object versioning, write-once policies, or append-only table controls. |
| Minimal transformation | Only transport-level parsing, approved flattening, decompression, decryption, and structural checks are allowed. | Current lakehouse guidance keeps business cleanup and conformance outside the landing/raw responsibility [R1] [R5] [R7]. | Strong alignment. | **High** | Define an exception register for transformations required solely to make the payload readable. |
| Delivery identity and audit metadata | Requires durable delivery IDs, checksums, source identity, run IDs, versions, timestamps, actors, status, and diagnostics. | Industry guidance supports provenance metadata, reproducibility, dataset/run identity, and audit evidence [R1] [R6] [R10]. | More detailed than many vendor reference architectures and consistent with open lineage concepts. | **High** | Standardize identifiers as UUIDv7 or deterministic hashes where appropriate and document collision handling. |
| Batch idempotency and replay | Duplicate control is delivery-centric; conflicts, approved replay, linkage, and outcomes are explicit. | Reliable ingestion patterns require deterministic replay and duplicate protection; immutable raw history supports reprocessing [R1] [R5]. | Strong for file, extract, and micro-batch workloads. | **High** | Add mandatory replay test cases to the acceptance-test pack. |
| CDC and streaming landing semantics | Defines conditional LND-only controls for ingestion mode, event identity, ordering, idempotency, durable checkpoint commits, late events, sequence gaps, snapshots, deletes, tombstones, envelope drift, replay, and observability. | Modern event platforms distinguish source ordering, idempotence, transactional boundaries, checkpoint management, and the limits of exactly-once guarantees [R13] [R14]. | Strong alignment for the landing boundary. Broker design, stateful business processing, and receiving-system application semantics are intentionally outside scope. | **High** | Add platform-specific implementation profiles only when an actual CDC or streaming source is approved. |
| Technical validation and quarantine | Defines delivery-, format-, and record-level technical checks plus quarantine evidence, taxonomy, disposition, and replay. | Current reliability guidance supports preserving unparsed/rescued data, isolating invalid data, and avoiding silent loss [R2] [R3]. | Strong and operationally mature. | **High** | Add quantitative quarantine thresholds and escalation rules per feed. |
| Schema capture and drift governance | Captures schema fingerprints, classifies additive/restrictive/type/structural drift, and applies strict, additive, versioned, or discovery policies. | Databricks persists inferred schemas and requires deliberate coordination between source evolution and target-table evolution; rescued data prevents silent loss [R2] [R3]. | Strong alignment and broader governance coverage than basic vendor defaults. | **High** | Add explicit backward-, forward-, and full-compatibility definitions, especially for Avro/Protobuf/schema-registry feeds. |
| Machine-readable data contracts | Feed onboarding captures owners, schedule, schema version, drift policy, recovery, and retention, but the specification is prose/checklist oriented. | ODCS v3.1.0 defines a versionable, machine-readable contract structure including schema, quality, service levels, stakeholders, and governance [R11]. | Conceptually aligned but not directly automatable or interoperable. | **Medium** | Add a YAML/JSON feed-contract template mapped to ODCS fields, while keeping LND-specific extensions for delivery and replay controls. |
| LND acceptance and release gate | Release requires preservation, metadata completeness, integrity, parseability, approved drift, resolved duplicates, reconciliation, and lineage. | Zoned architectures use explicit readiness transitions and controlled movement between operational states [R4] [R5] [R9]. | Strong landing-control design. | **High** | Define machine-enforceable acceptance/release outcomes and exception expiry rules. |
| Lineage interoperability | Defines source-delivery-to-LND-run-to-release lineage and captures run/code/version metadata. | OpenLineage standardizes Job, Run, Dataset, schema, version, lifecycle, and source-code facets [R10]. | Strong internal lineage model, but no explicit open-event mapping. | **Medium** | Add an OpenLineage mapping for delivery, run, input/output dataset, schema, version, error, and parent-run facets. |
| Security and least privilege | Restricts analysts, separates service and operational roles, requires encryption, sensitive-data classification, audit, masking in diagnostics, and time-bound privilege. | Microsoft and NIST emphasize granular role-based access, encryption, authentication, audit, and risk-tailored security/privacy controls [R8] [R12]. | Good baseline, but not yet a formal control profile. | **Medium** | Map the framework to a minimum security baseline: identity, key management, network isolation, logging, privileged access, access review, incident response, and evidence retention. |
| Sensitive-data ingress | Requires classification and protection but uses one general LND flow. | AWS recommends a separate landing location for sensitive data so it can be masked before entering the raw layer [R4]. | Adequate principle, but the target architecture needs a stronger restricted-ingress pattern. | **Medium** | Add a **restricted LND** pattern with separate storage, narrower identities, tokenization/masking handoff, residency controls, and enhanced audit retention. |
| Retention and lifecycle | Separates payload, parsed representation, metadata, quarantine, validation, logs, and replay retention. | AWS recommends explicit lifecycle strategies, versioning, archival, and different retention periods by layer and derivative [R4]. | Strong alignment. | **High** | Add legal-hold, defensible deletion, deletion verification, and orphaned-object reconciliation requirements. |
| Observability and service levels | Defines delivery, latency, volume, drift, duplicate, replay, quarantine-age, release lag, and metadata-completeness indicators. | AWS recommends monitoring operations against performance expectations and SLAs and using utilization data for cost/performance optimization [R6]. ODCS also supports service-level commitments [R11]. | Strong metric coverage, but targets and reliability-management mechanics are not prescribed. | **Medium** | Add per-feed SLO targets, error budgets, alert thresholds, cost/capacity indicators, incident severity, and review cadence. |
| Ownership and decision rights | Includes RACI, named technical and source owners, drift approval, retention accountability, escalation, and exception ownership. | Current governance and data-contract practices assign stakeholders, owners, and service responsibilities [R11] [R12]. | Strong alignment. | **High** | Add mandatory approver separation for high-risk overrides and periodic ownership recertification. |
| Technology portability | Contract is technology-neutral and supports batch, micro-batch, streaming, files, tables, APIs, and major cloud/lakehouse platforms. | Major cloud platforms use different physical terminology but converge on raw-to-curated readiness stages [R1] [R4] [R7] [R9]. | Strong portability, provided the framework distinguishes logical controls from physical layer names. | **High** | Publish platform profiles for Databricks, Fabric, AWS, Google Cloud, Snowflake, and other adopted platforms without changing the core contract. |

### 27.4 Overall confidence

**Overall architecture-design confidence: High — 89%.**

Scoring basis:

- 12 High-confidence areas × 3 points = 36
- 6 Medium-confidence areas × 2 points = 12
- 0 Low-confidence areas × 1 point = 0
- Total = 48 out of 54 possible points = 88.9%, rounded to **89%**


The framework is therefore suitable as an enterprise baseline for batch, file-oriented, incremental, CDC, and streaming **landing controls**. It intentionally does not define event-broker architecture, stateful business processing, or how a receiving system applies change events.

Implementation confidence for a specific organization cannot be scored from the framework alone. That requires inspection of its feed definitions, sample payloads, orchestration, landing storage controls, security configuration, schema history, retention settings, failure history, and LND release interface.

### 27.5 Priority changes before Version 2.0

1. Add a machine-readable LND feed-contract template aligned to ODCS.
2. Add an OpenLineage event and facet mapping.
3. Add physical-versus-logical LND deployment patterns.
4. Add a restricted-ingress pattern for sensitive data.
5. Add enforceable SLO, error-budget, and incident-management templates.
6. Add a minimum security control profile and evidence checklist.
7. Add platform-specific CDC implementation profiles only when a real CDC source is approved.

---

## 28. Industry Benchmark References

- **[R1] Databricks — Medallion lakehouse architecture:** <https://docs.databricks.com/aws/en/lakehouse/medallion>
- **[R2] Databricks — Reliability best practices and rescued data:** <https://docs.databricks.com/aws/en/lakehouse-architecture/reliability/best-practices>
- **[R3] Databricks — Schema evolution:** <https://docs.databricks.com/aws/en/data-engineering/schema-evolution>
- **[R4] AWS Prescriptive Guidance — Recommended data layers:** <https://docs.aws.amazon.com/prescriptive-guidance/latest/defining-bucket-names-data-lakes/data-layer-definitions.html>
- **[R5] AWS — Modern data architecture layer rationale:** <https://docs.aws.amazon.com/whitepapers/latest/modern-data-architecture-rationales-on-aws/modern-data-architecture.html>
- **[R6] AWS — Monitoring and optimizing the data lake:** <https://docs.aws.amazon.com/whitepapers/latest/building-data-lakes/monitoring-optimizing-data-lake-environment.html>
- **[R7] Microsoft Fabric — Medallion lakehouse architecture:** <https://learn.microsoft.com/en-us/fabric/onelake/onelake-medallion-lakehouse-architecture>
- **[R8] Microsoft Fabric — OneLake security overview:** <https://learn.microsoft.com/en-us/fabric/onelake/security/get-started-security>
- **[R9] Google Cloud Dataplex — Raw and curated zones:** <https://docs.cloud.google.com/dataplex/docs/build-a-data-mesh>
- **[R10] OpenLineage — Object model and facets:** <https://openlineage.io/docs/spec/object-model/> and <https://openlineage.io/docs/spec/facets/>
- **[R11] Bitol / Linux Foundation — Open Data Contract Standard v3.1.0:** <https://github.com/bitol-io/open-data-contract-standard>
- **[R12] NIST — SP 800-53 Revision 5 security and privacy controls:** <https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final>
- **[R13] Apache Kafka — Producer idempotence configuration:** <https://kafka.apache.org/41/configuration/producer-configs/>
- **[R14] Apache Kafka — Delivery and processing design:** <https://kafka.apache.org/41/design/design/>

---

## 29. Benchmark Maintenance Rule

Re-run this benchmark at least annually, and whenever one of the following occurs:

- a major platform migration;
- adoption of streaming or CDC;
- adoption of a data-contract or lineage standard;
- a significant security or regulatory change;
- a material ingestion incident;
- a change to the LND acceptance or release boundary;
- a major version change in the organization's principal lakehouse platform.

The confidence score must be updated using current official documentation and the same published scoring method so that changes remain auditable.

