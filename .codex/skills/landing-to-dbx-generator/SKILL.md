---
name: landing-to-dbx-generator
description: Generate or repair Databricks landing SQL files under dbx_landing from SQL Server bronze SQL files under sqlserver_brz, dbt SQL Server landing models under sqlserver_landing_dbt such as landing-pers*.dbt.ms.sql, sqlserver_landing_desc metadata, and regenerate empty Pershing DataProd dbt SQL Server landing models from existing DBX landing schemas. Use when creating landing tables in the correct landing catalog, including landing.default, landing_jh.default, landing_pershing.default, and landing_sei.default, deterministic 10-row seed data, meaningful table comments, row-count checks, and landing-only DBX files without touching bronze-layer SQL.
---

# Landing To DBX Generator

## Purpose

Use this skill to create or repair `dbx_landing/*.dbx.sql` files. The output should be deployable Databricks SQL for landing-layer tables and should follow the current repository style.

This skill owns landing-file structure, target landing table naming, generated seed data, table descriptions, landing validation, and documented reverse regeneration for empty Pershing DataProd dbt landing models. Use `$sqlserver-dbx-syntax-converter` for SQL Server type, function, cast, and reserved-word conversion rules.

## Required Preflight

1. Read the source artifact before generating anything.
2. Read at least one current working `dbx_landing/*.dbx.sql` example from the same source family when available.
3. Check whether the target file already exists and whether it is empty, generated, or user-edited.
4. Preserve user edits unless the user explicitly asks to replace them.
5. Do not edit `dbx_bronze/` or any bronze SQL file.

When the user says to refresh files in memory, do not rely on prior conversation context. Re-list the current files on disk with `rg --files sqlserver_brz sqlserver_landing_dbt sqlserver_brz_dbt sqlserver_landing_desc dbx_landing dbx_bronze`, then re-read the source artifacts, existing landing targets, and any same-family examples needed for the current task.

## Workflow

```mermaid
flowchart TD
    A["Landing generation request"] --> B["Read current dbx_landing examples"]
    B --> C["Identify source input type"]

    C --> C1["sqlserver_brz/*.ms.sql"]
    C --> C2["sqlserver_landing_dbt/*.dbt.ms.sql"]
    C --> C3["sqlserver_landing_desc/*-desc.txt"]
    C --> C4["Existing dbx_landing repair"]
    C --> C5["dbx_landing/landing-pershingdataprod_*.dbx.sql"]

    C1 --> D["Extract source table blocks and columns"]
    C2 --> E["Extract dbt source() table and landing_data columns"]
    C3 --> F["Parse column/type metadata"]
    C4 --> G["Inspect current CREATE, INSERT, and comments"]
    C5 --> R["Reverse-generate empty sqlserver_landing_dbt DataProd model"]
    C2 --> C6["Known correction: isca_rec_i -> isca_rec_j"]

    D --> H["Apply sqlserver-dbx-syntax-converter rules"]
    E --> H
    F --> H
    G --> H

    H --> I["Resolve landing target"]
    I --> I1["Catalog: landing or source-specific landing catalog"]
    I --> I2["Schema: default"]
    I --> I3["Table: source name converted to lower_snake_case"]

    I --> J["Generate landing SQL"]
    J --> J1["CREATE CATALOG and USE CATALOG"]
    J --> J2["CREATE SCHEMA and USE SCHEMA"]
    J --> J3["CREATE TABLE IF NOT EXISTS"]
    J --> J4["COMMENT ON TABLE"]
    J --> J5["TRUNCATE TABLE"]
    J --> J6["INSERT 10 deterministic rows"]
    J --> J7["Row-count verification SELECT"]

    J --> K["Validate output"]
    K --> K1["No bronze references"]
    K --> K2["No SQL Server-only syntax"]
    K --> K3["No dbt Jinja"]
    K --> K4["No tabs"]
    K --> K5["Source columns covered"]
    K --> K6["One meaningful table comment"]

    K --> L{"Validation clean?"}
    L -->|No| M["Fix landing SQL only"]
    M --> K
    L -->|Yes| N["Report changed files and validation results"]

    R --> R1["Extract source table from Source comment or CREATE TABLE name"]
    R --> R2["Extract CREATE TABLE column order"]
    R2 --> R3["Write sqlserver_landing_dbt/landing-pershingdataprod_*.dbt.ms.sql"]
    R3 --> R4["Use dbt source(\"pershing\", \"PERSHINGDATAPROD_*\")"]
    R4 --> R5["Derive YEARMONTH with SQL Server CONVERT from LOADED_AT"]
    R5 --> R6["Use incremental append and GETUTCDATE loaded timestamp pattern"]
    C6 --> E
```

## Source Input Types

### `sqlserver_landing_desc/*-desc.txt`

Parse each non-empty line as:

```text
COLUMN_NAME sql_server_type
```

Map types using `$sqlserver-dbx-syntax-converter`. Add standard landing control columns only when the source metadata or local convention requires them. In this repository, generated landing test tables commonly include `YEARMONTH INT` and `LOADED_AT TIMESTAMP`; do not duplicate either if already present.

### `sqlserver_landing_dbt/*.dbt.ms.sql`

Extract:

- Source table from `{{ source("source_name", "TABLE_NAME") }}`.
- Landing columns from the `landing_data` CTE.
- Types from explicit `CONVERT(...)` expressions when present.
- Pass-through columns that appear in `landing_data`.

Remove dbt config, Jinja conditionals, `{{ this }}`, and logging blocks from final `.dbx.sql`.

For Pershing dbt sources matching `sqlserver_landing_dbt/landing-pers*.dbt.ms.sql`, create or repair the counterpart `dbx_landing/landing-per*.dbx.sql`. Use `landing_pershing.default.<source_table_lower>` where `<source_table_lower>` comes from the dbt `source("pershing", "...")` table name, such as `PERSHING_CAPS_1 -> landing_pershing.default.pershing_caps_1`. Preserve non-empty target files unless the user asks to regenerate them; fill empty placeholders when the counterpart exists but has no SQL.

Known Pershing correction: `isca_rec_i` is a typo for `isca_rec_j`. When a file, provenance comment, model name, or landing artifact says `PERSHING_ISCA_J` or `BRONZE_PERSHING_ISCA_REC_J`, use `landing-pershing_isca_rec_j.*`, `brz-pershing_isca_rec_j.*`, and `landing_pershing.default.pershing_isca_j`. Do not recreate `*_isca_rec_i.*` artifacts.

### Reverse Pershing DataProd dbt regeneration

When asked to regenerate `sqlserver_landing_dbt/landing-pershingdataprod_*.dbt.ms.sql` from landing artifacts, first check whether `sqlserver_landing_dbt/` exists. If an older `dbt_landing/` path is mentioned and absent, say so and use the current `dbx_landing/landing-pershingdataprod_*.dbx.sql` files as the available source of truth when the user still asks to proceed.

For each `dbx_landing/landing-pershingdataprod_*.dbx.sql` file:

- Extract the SQL Server source table from the `-- Source: "DQP_LANDING"."dbo"."<SOURCE_TABLE>"` comment when present; otherwise use the uppercased Databricks table name.
- Extract column order from `CREATE TABLE IF NOT EXISTS landing_pershing.default.<table>`.
- Regenerate the matching `sqlserver_landing_dbt/landing-pershingdataprod_*.dbt.ms.sql` file only when it is empty or the user explicitly asks to overwrite it.
- Use the existing dbt SQL Server landing model style: header metadata, `materialized='incremental'`, `incremental_strategy='append'`, `tags=["pershing_standard"]`, a `landing_data` CTE reading from `{{ source("pershing", "<SOURCE_TABLE>") }}`, a `bronze_data` CTE, the standard incremental `LOADED_AT` filter, and final `SELECT * FROM bronze_data`.
- Keep source columns in DBX `CREATE TABLE` order. Derive `YEARMONTH` as `CONVERT(INT, CONVERT(nvarchar(6), LOADED_AT, 112)) AS YEARMONTH` in `landing_data`. In `bronze_data`, emit `GETUTCDATE() AS LOADED_AT` for the output load timestamp.
- Do not add Databricks DDL, table comments, backticks, seed data, `TRY_CAST`, `timestampadd`, or `date_add` to `sqlserver_landing_dbt/*.dbt.ms.sql` outputs.

### `sqlserver_brz/*.ms.sql`

Parse source table blocks and SELECT/CTE logic conservatively. Prefer structured source columns from metadata or explicit SELECT lists over broad regex assumptions. Use existing landing files from the same source family as the naming/style guide.

## Naming Rules

Use these defaults unless the current source-of-truth file shows a source-specific catalog:

```text
schema                   -> default
SQL Server source table   -> lower_snake_case Databricks table
output file              -> dbx_landing/landing-<source-family-or-table>.dbx.sql
```

Use the current catalog convention by source family:

```text
general landing sources   -> landing.default.<table>
Jack Henry JH_* sources   -> landing_jh.default.<table>
Pershing sources          -> landing_pershing.default.<table>
SEI sources               -> landing_sei.default.<table>
```

Examples:

```text
"DQP_LANDING"."dbo"."PERSHINGDATAPROD_TRANSFER"
-> landing_pershing.default.pershingdataprod_transfer
-> dbx_landing/landing-pershingdataprod_transfer.dbx.sql

sqlserver_brz/brz-jh_glmast.ms.sql
-> landing_jh.default.jh_glmast
-> dbx_landing/landing-jh_glmast.dbx.sql

{{ source("pershing", "PERSHING_ACA2_A") }}
-> landing_pershing.default.pershing_aca2_a
-> dbx_landing/landing-pershing_aca2_a.dbx.sql

sqlserver_landing_dbt/landing-pershing_caps_rec_1.dbt.ms.sql
-> source("pershing", "PERSHING_CAPS_1")
-> landing_pershing.default.pershing_caps_1
-> dbx_landing/landing-pershing_caps_rec_1.dbx.sql

dbx_landing/landing-pershingdataprod_transfer.dbx.sql
-> source("pershing", "PERSHINGDATAPROD_TRANSFER")
-> sqlserver_landing_dbt/landing-pershingdataprod_transfer.dbt.ms.sql

sqlserver_landing_dbt/landing-pershing_isca_rec_j.dbt.ms.sql
-> source("pershing", "PERSHING_ISCA_J")
-> landing_pershing.default.pershing_isca_j
-> dbx_landing/landing-pershing_isca_rec_j.dbx.sql
```

Do not collapse source-specific catalogs back into `landing`. Preserve `landing_jh`, `landing_pershing`, and `landing_sei` during repairs unless the user explicitly asks to change the catalog.

## File Structure

Use this order:

```sql
-- Databricks SQL for source: <source>
-- Generated from <input-path>

CREATE CATALOG IF NOT EXISTS <landing_catalog>;
USE CATALOG <landing_catalog>;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- Source: "DQP_LANDING"."dbo"."<SOURCE_TABLE>"
CREATE TABLE IF NOT EXISTS <landing_catalog>.default.<table_name> (
    `COLUMN_NAME` STRING,
    `YEARMONTH` INT,
    `LOADED_AT` TIMESTAMP
);
COMMENT ON TABLE <landing_catalog>.default.<table_name> IS
'Meaningful description of the table, its key entities, and analytical use.';

TRUNCATE TABLE <landing_catalog>.default.<table_name>;

INSERT INTO <landing_catalog>.default.<table_name> (
    `COLUMN_NAME`, `YEARMONTH`, `LOADED_AT`
)
SELECT
    concat('COLUMN_NAME_', format_string('%02d', idx)) AS `COLUMN_NAME`,
    202601 AS `YEARMONTH`,
    timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00') AS `LOADED_AT`
FROM VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10) AS seed(idx);

-- Row-count verification
SELECT '<table_name>' AS table_name, COUNT(*) AS record_count
FROM <landing_catalog>.default.<table_name>;
```

## Seed Data Rules

Generate exactly 10 deterministic rows unless the user requests another count.

Use these seed patterns:

```text
STRING                  -> concat('<COLUMN>_', format_string('%02d', idx))
INT/BIGINT/SMALLINT     -> idx
DECIMAL(p,s)            -> TRY_CAST(idx * 100.25 AS DECIMAL(p,s))
DOUBLE                  -> TRY_CAST(idx * 100.25 AS DOUBLE)
DATE                    -> date_add(DATE '2026-01-01', idx - 1)
TIMESTAMP               -> timestampadd(DAY, idx - 1, TIMESTAMP '2026-01-01 12:00:00')
BOOLEAN                 -> CASE WHEN idx % 2 = 0 THEN true ELSE false END
YEARMONTH               -> 202601
```

Use `TRY_CAST` for numeric seed expressions to stay aligned with repository conversion standards.

## Description Rules

Every generated table must have a meaningful `COMMENT ON TABLE`.

The description should mention:

- The business entity or source process.
- Key column groups, such as accounts, transfers, balances, transactions, positions, identifiers, dates, or statuses.
- Landing-layer use cases, such as validation, reconciliation, downstream reporting, operational monitoring, or compliance review.

Avoid generic comments like "contains standardized data." Use domain-specific terms from the source table and column names.

Do not put apostrophes or single quotes inside `COMMENT ON TABLE ... IS '<description>';` text. Phrases such as `system's` break the SQL string unless escaped, so prefer wording like `system source`, `source system`, or `system-level`. Keep comment text plain ASCII unless the source file already requires otherwise.

Fix obvious English typos in generated descriptions when you see them. Do not "fix" source-of-truth object names, table names, column names, or source names merely because they look misspelled; preserve names from SQL Server sources and existing DBX files unless the user explicitly asks for a rename.

## Validation Checklist

Before finishing:

- Only `dbx_landing/*.dbx.sql` files were created or edited, except for the documented reverse Pershing DataProd case where empty `sqlserver_landing_dbt/landing-pershingdataprod_*.dbt.ms.sql` files may be regenerated from existing DBX landing schemas.
- No `dbx_bronze/` files were touched.
- Output uses the expected landing catalog/schema, including source-specific catalogs such as `landing_jh`, `landing_pershing`, and `landing_sei`.
- Each table has exactly one `CREATE TABLE IF NOT EXISTS`, `COMMENT ON TABLE`, `TRUNCATE TABLE`, and `INSERT INTO` block unless the file intentionally contains multiple source tables.
- All source columns are represented in the landing table.
- There are no duplicate generated control columns.
- No executable `CONVERT(`, `GETUTCDATE()`, `GETDATE()`, SQL Server brackets, or dbt Jinja remain.
- Reserved and ambiguous identifiers are backticked.
- Table comments contain no apostrophes or unescaped single quotes inside the description literal.
- No tab characters are introduced.
- Row-count verification is present.

## Reporting

Report:

- Files created or modified.
- Source artifacts used.
- Table names generated.
- Validation checks performed.
- Any intentional exception, mismatch, or source ambiguity.
