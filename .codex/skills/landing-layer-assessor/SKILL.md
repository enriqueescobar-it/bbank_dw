---
name: landing-layer-assessor
description: Assess Databricks landing-layer SQL files against the repository LND landing-layer framework and core prompt. Use when the user asks to analyze, audit, compare, or report on dbx_lnd SQL from a LANDING-only perspective using LND_Landing_Layer_Standardization_Framework_v1.2_Landing_Only.md and LND_Landing_Layer.md, including requests to classify framework controls as compliant, partially compliant, non-compliant, not evidenced, or not applicable.
---

# Landing Layer Assessor

## Scope Rule

Assess only landing-layer evidence. Do not assess Bronze, Silver, Gold, dimensional modeling, business transformations, semantic standardization, or downstream consumption.

When the user gives a folder and file list, restrict all reads and analysis to:

- the named folder;
- the named framework/core-prompt Markdown files;
- the explicitly listed SQL files.

Do not edit SQL files unless the user explicitly asks for repairs.

## Required Inputs

Confirm these exist before analysis:

- `LND_Landing_Layer_Standardization_Framework_v1.2_Landing_Only.md`
- `LND_Landing_Layer.md`
- each SQL file listed by the user

If all are present, say `YES_SIR` and proceed. If anything is missing, list the missing items and stop before analysis.

## Workflow

1. Read `LND_Landing_Layer.md` first. Treat it as the core prompt and obey its classification/reporting rules.
2. Read the full framework Markdown file. Use it as the sole assessment rubric.
3. Read only the scoped SQL files.
4. Run `scripts/lnd_landing_sql_evidence.py` against the scoped SQL files to collect repeatable evidence.
5. Interpret script output against the framework. The script output is evidence, not the final judgment.
6. Classify each framework control as:
   - `Compliant`
   - `Partially compliant`
   - `Non-compliant`
   - `Not evidenced`
   - `Not applicable`
7. Cite exact file paths and line numbers for SQL evidence.
8. Do not treat missing operational evidence as non-compliance. Use `Not evidenced` when pipeline, storage, orchestration, access, retention, ownership, drift, quarantine, or release-gate implementation details are unavailable.

## Evidence Extraction

Run the helper from the requested folder or pass absolute SQL paths:

```bash
python3 /path/to/landing-layer-assessor/scripts/lnd_landing_sql_evidence.py lnd-apex.dbx.sql lnd-assist.dbx.sql
```

The helper reports:

- target catalogs;
- created table counts;
- table comments;
- inserts, truncates, and count checks;
- source comments;
- common operational metadata columns;
- missing metadata by table;
- SQL Server, dbt/Jinja, non-landing, and tab-character candidates.

Use `rg -n` for exact supporting lines when a final report cites a finding.

## Landing-Specific Interpretation

Treat these as strengths when evidenced:

- all targets are landing catalogs such as `landing.default`, `landing_jh.default`, `landing_pershing.default`, or `landing_sei.default`;
- every created table has a `COMMENT ON TABLE`;
- row-count verification exists;
- no `bronze`, `silver`, or `gold` references appear;
- no dbt/Jinja or SQL Server-only syntax remains;
- no joins/merges/updates/deletes occur in executable SQL.

Treat these as likely gaps or missing evidence unless separate operational files prove them:

- original payload preservation;
- delivery identifier;
- original file/object key;
- file size;
- checksum or schema fingerprint;
- delivery status lifecycle;
- duplicate handling and idempotency;
- replay controls;
- schema drift capture, classification, and approval;
- quarantine location and error taxonomy;
- LND acceptance/release event;
- access controls, sensitive-data classification, retention, ownership, alerts, SLOs;
- CDC/streaming mode, event identity, ordering, checkpoint, tombstone, late-event, and sequence-gap controls.

Flag `TRUNCATE TABLE` plus deterministic seed inserts as evidence that the SQL is a deployable schema/seed artifact, not proof of immutable source-payload preservation.

## Report Shape

Produce:

- executive summary;
- current strengths;
- control-by-control comparison table with classification, evidence, and confidence;
- prioritized findings grouped by severity;
- required corrections;
- recommended improvements;
- future CDC or streaming-readiness controls;
- additional evidence required.

Keep severity practical:

- `P0`: landing SQL will not deploy or targets a wrong layer/catalog.
- `P1`: LND contract cannot be proven for core controls such as fidelity, traceability, idempotency, quarantine, drift, or release.
- `P2`: metadata or observability is partial or inconsistent.
- `P3`: wording, maintainability, or documentation cleanup.

## Citation Rules

Use exact file references such as:

```text
dbx_lnd/lnd-apex.dbx.sql:80
```

In final answers, use clickable absolute paths when possible.

Do not cite framework line numbers unless the user asks for source-rubric traceability. The important evidence is the SQL or missing implementation artifact.
