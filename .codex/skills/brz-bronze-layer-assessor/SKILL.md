---
name: brz-bronze-layer-assessor
description: Assess Databricks Bronze SQL files against the repository BRZ Bronze-layer framework and core prompt. Use when the user asks to analyze, audit, compare, create a control table, or report on dbx_bronze SQL from a BRONZE-only perspective using BRZ_Bronze_Layer_Standardization_Framework_v1.0_Bronze_Only.md and BRZ_Bronze_Layer.md, including requests to classify framework controls as compliant, partially compliant, non-compliant, not evidenced, or not applicable.
---

# BRZ Bronze Layer Assessor

## Scope Rule

Assess only Bronze-layer evidence. Do not assess table-name conventions, column-name conventions, Landing architecture, Silver or Gold modeling, semantic standardization, business validation, reporting, enrichment suitability, or downstream consumption.

When the user gives a folder and file list, restrict reads and analysis to:

- the named folder;
- the named framework/core-prompt Markdown files;
- the explicitly listed SQL files.

Do not edit SQL files unless the user explicitly asks for repairs.

## Required Inputs

Confirm these exist before analysis:

- `BRZ_Bronze_Layer_Standardization_Framework_v1.0_Bronze_Only.md`
- `BRZ_Bronze_Layer.md`
- each SQL file listed by the user

If all are present, say `YES_SIR` and proceed. If anything is missing, list the missing items and stop before analysis.

## Workflow

1. Read `BRZ_Bronze_Layer.md` first. Treat it as the core prompt and obey its classification/reporting rules.
2. Read the full Bronze framework Markdown file. Use it as the sole assessment rubric.
3. Read only the scoped SQL files.
4. Run `scripts/brz_bronze_sql_evidence.py` against the scoped SQL files to collect repeatable evidence.
5. Interpret script output against the framework. The script output is evidence, not the final judgment.
6. Classify each framework control as:
   - `Compliant`
   - `Partially compliant`
   - `Non-compliant`
   - `Not evidenced`
   - `Not applicable`
7. Cite exact file paths and line numbers for SQL evidence.
8. Do not treat missing operational evidence as non-compliance. Use `Not evidenced` when pipeline, storage, orchestration, access, retention, ownership, drift, quarantine, publication, replay, recovery, or observability implementation details are unavailable.

## Evidence Extraction

Run the helper from the requested folder or pass absolute SQL paths:

```bash
python3 /path/to/brz-bronze-layer-assessor/scripts/brz_bronze_sql_evidence.py bronze-apex.dbx.sql bronze-assist.dbx.sql
```

The helper reports:

- target catalogs;
- created table counts;
- table comments;
- load-type comments;
- landing source references;
- `CREATE OR REPLACE TABLE` overwrite patterns;
- duplicate target tables;
- common metadata evidence;
- filters, joins, static seed blocks, and cross-source candidates;
- SQL Server, dbt/Jinja, non-Bronze catalog, table-property, access-control, retention, quarantine, replay, checksum, and tab-character candidates.

Use `rg -n` or `sed -n` for exact supporting lines when a final report cites a finding.

## Bronze-Specific Interpretation

Treat these as strengths when evidenced:

- targets use `bronze.default`, `bronze_jh.default`, `bronze_pershing.default`, or `bronze_sei.default`;
- sources read from the matching landing catalog;
- every created table has a `COMMENT ON TABLE`;
- source data conversions use `TRY_CAST` or other safe Databricks functions;
- no dbt/Jinja or SQL Server-only syntax remains;
- source-aligned table projections are queryable and avoid business joins, aggregates, current-state merges, or semantic enrichment.

Treat these as likely gaps or missing evidence unless separate operational files prove them:

- append-oriented immutable raw history;
- BRZ load identifier;
- upstream delivery or extraction identifier;
- input checksum or content fingerprint;
- record fingerprint or source record position;
- pipeline run id, code version, configuration version, and execution environment;
- schema fingerprint, drift classification, and evolution mode;
- rescued data or quarantine with diagnostics;
- deterministic idempotency, exact duplicate outcomes, replay controls, and conflict handling;
- CDC operation, source sequence, tombstone, transaction, and checkpoint preservation;
- atomic publication status and commit metadata;
- reconciliation counts and checksums;
- access controls, sensitive-data classification, retention, ownership, alerts, SLOs, and recovery tests.

Flag these as confirmed Bronze control gaps when directly evidenced:

- `CREATE OR REPLACE TABLE` used as the recurring Bronze load mechanism without separate retained-history evidence;
- executable `WHERE` filters that remove accepted source rows;
- duplicate `CREATE OR REPLACE TABLE` targets where a later block overwrites an earlier source projection;
- cross-source lookup or enrichment inside Bronze;
- `MERGE`, `UPDATE`, `DELETE`, or current-state-only logic in Bronze;
- `COALESCE`, defaults, or `CASE` expressions that replace source uncertainty with business assumptions.

Controlled casts over literals, static seed values, or `CAST(NULL AS type)` are not automatically defects. Interpret casts in context.

## Report Shape

When the user asks to create or refresh the BRZ assessment document, write the report to:

```text
dbx_bronze/BRZ_Bronze_Layer_Assessment.md
```

Match the repository LND assessment style while using the BRZ framework and BRZ-only terminology.

Produce:

- executive summary;
- scope and evidence reviewed;
- current evidence flow mermaid diagram;
- target BRZ control flow mermaid diagram when helpful;
- Bronze control assessment table with classification, evidence, finding, risk, recommended Bronze-only correction, and confidence;
- confirmed strengths;
- confirmed control gaps;
- risks;
- controls not evidenced;
- required Bronze corrections;
- recommended Bronze improvements;
- additional evidence required;
- prioritized remediation backlog;
- overall confidence assessment.

The control table must include exactly these columns when producing `BRZ_Bronze_Layer_Assessment.md`:

```text
Framework control | Classification | Evidence | Finding | Risk | Recommended Bronze-only correction | Confidence
```

Keep severity practical:

- `P0`: Bronze SQL will not deploy or targets a wrong layer/catalog.
- `P1`: BRZ contract is broken for core controls such as history, fidelity, row preservation, target uniqueness, or source isolation.
- `P2`: metadata, governance, schema, idempotency, quarantine, or observability is partial or not evidenced.
- `P3`: wording, maintainability, or documentation cleanup.

## Citation Rules

Use exact file references such as:

```text
dbx_bronze/bronze-dmi.dbx.sql:262
```

In final answers, use clickable absolute paths when possible.

Do not cite framework line numbers unless the user asks for source-rubric traceability. The important implementation evidence is the SQL, documentation, or the absence of required operational artifacts from the scoped evidence set.
