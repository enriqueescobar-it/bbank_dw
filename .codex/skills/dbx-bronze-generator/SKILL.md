---
name: dbx-bronze-generator
description: Generate or repair Databricks bronze SQL files under dbx_bronze from SQL Server SQL, dbt SQL Server bronze models, or existing bronze DBX SQL. Use when creating bronze.default tables, reading from landing.default tables, replacing SQL Server syntax with DBX syntax, adding bronze table comments, validating landing column coverage, and avoiding landing-layer edits.
---

# DBX Bronze Generator

## Purpose

Use this skill to generate or repair `dbx_bronze/*.dbx.sql` files. Bronze SQL should preserve source model logic, read from the landing layer, write to the bronze layer, and run in Databricks SQL.

This skill owns bronze-file structure, source-to-landing references, output bronze table naming, bronze comments, landing column validation, and bronze-only validation. Use `$sqlserver-to-dbx-converter` for SQL Server type, function, cast, and reserved-word conversion rules.

## Required Preflight

1. Read the source bronze artifact before generating anything.
2. Read the matching `dbx_landing/*.dbx.sql` file to confirm source table and column availability.
3. Read any existing target `dbx_bronze/*.dbx.sql` file and preserve user edits unless replacement is explicitly requested.
4. Confirm the task is bronze-only. Do not create or modify landing files.
5. Check current repo conventions for table naming, comments, and source references before writing.

## Workflow

```mermaid
flowchart TD
    A["Bronze generation or repair request"] --> B["Read source SQL or existing bronze SQL"]
    B --> C["Read matching dbx_landing source tables"]

    C --> D["Identify bronze outputs"]
    D --> D1["Target catalog: bronze"]
    D --> D2["Target schema: default"]
    D --> D3["Target table: bronze.default.<bronze_table>"]

    C --> E["Identify landing inputs"]
    E --> E1["Source catalog: landing unless current source explicitly differs"]
    E --> E2["Source schema: default"]
    E --> E3["Source table from source(), FROM, or local pattern"]

    B --> F["Apply sqlserver-to-dbx-converter rules"]
    F --> F1["CONVERT -> TRY_CAST"]
    F --> F2["CAST source data -> TRY_CAST"]
    F --> F3["GETUTCDATE and GETDATE -> current_timestamp"]
    F --> F4["DATEADD and date formatting -> DBX functions"]
    F --> F5["SQL Server brackets -> backticks"]
    F --> F6["ISNULL -> COALESCE"]

    C --> G["Cross-check landing columns"]
    G --> G1["Every selected input column exists"]
    G --> G2["Reserved identifiers are backticked"]
    G --> G3["No per-source catalog remains"]

    G --> H{"Landing shape supports bronze logic?"}
    H -->|No| I["Report missing columns or mismatch; do not invent"]
    H -->|Yes| J["Generate or repair bronze SQL"]

    J --> J1["CREATE CATALOG IF NOT EXISTS bronze"]
    J --> J2["USE CATALOG bronze"]
    J --> J3["CREATE SCHEMA IF NOT EXISTS default"]
    J --> J4["CREATE OR REPLACE TABLE bronze.default.<table> AS"]
    J --> J5["WITH landing_data AS (...)"]
    J --> J6["WITH bronze_data AS (...)"]
    J --> J7["SELECT * FROM bronze_data"]
    J --> J8["COMMENT ON TABLE bronze.default.<table>"]

    J --> K["Validate output"]
    K --> K1["No SQL Server-only syntax"]
    K --> K2["No blind CAST on source data"]
    K --> K3["No dbt Jinja"]
    K --> K4["No source-specific catalogs"]
    K --> K5["No missing comments"]
    K --> K6["No tabs"]
    K --> K7["No landing files touched"]

    K --> L{"Validation clean?"}
    L -->|No| M["Fix dbx_bronze SQL only"]
    M --> K
    L -->|Yes| N["Report changed files and validation result"]
```

## Source Input Rules

### `sqlserver/*.sql`

Use SQL Server source files as bronze transformation logic. Extract each model/table block, source references, selected columns, type conversions, date logic, and final output table names from comments or local naming patterns.

### `sqlserver_dbt/*.dbt.sql`

Extract:

- Model name from `-- NAME: ...`.
- Source table from `{{ source("source_name", "TABLE_NAME") }}`.
- Landing columns and transformations from `landing_data`.
- Final bronze output columns from `bronze_data`.

Remove dbt config, Jinja conditionals, `{{ this }}`, and logging blocks from final `.dbx.sql`.

### Existing `dbx_bronze/*.dbx.sql`

When repairing existing bronze SQL, preserve working structure and narrow the edit to the requested behavior. Do not rewrite entire files unless the user asks or the file is structurally unusable.

## Landing Cross-Check Rules

Before writing bronze SQL:

1. Locate the matching `dbx_landing` source table.
2. Extract its `CREATE TABLE` columns.
3. Confirm every landing input referenced by bronze logic exists.
4. Confirm reserved identifiers are referenced consistently with backticks.
5. Report missing columns instead of inventing them.

If the landing file uses an intentional catalog exception, preserve that source reference. Otherwise use `landing.default.<table>`.

## Bronze Naming Rules

Use these defaults unless current repo style or source comments provide a stronger answer:

```text
catalog                  -> bronze
schema                   -> default
output table             -> bronze.default.<bronze_model_name>
source table             -> landing.default.<landing_table>
output file              -> dbx_bronze/bronze-<source-family>.dbx.sql
```

Examples:

```text
-- NAME: BRONZE_PERSHING_ACA2_REC_A
-> bronze.default.bronze_pershing_aca2_rec_a

{{ source("pershing", "PERSHING_ACA2_A") }}
-> landing.default.pershing_aca2_a
```

Do not recreate old per-source catalogs like `apex.default`, `q2.default`, `ibkr.default`, or `pershing.default` unless the current source file explicitly proves that is intentional.

## Bronze File Structure

Use this order for each bronze table:

```sql
CREATE CATALOG IF NOT EXISTS bronze;
USE CATALOG bronze;

CREATE SCHEMA IF NOT EXISTS default;
USE SCHEMA default;

-- From <source-file>
-- Source model: <bronze_table>
CREATE OR REPLACE TABLE bronze.default.<bronze_table> AS
WITH landing_data AS (
    SELECT
        <landing columns and source-safe conversions>
    FROM landing.default.<landing_table>
),

bronze_data AS (
    SELECT
        <final bronze columns>
    FROM landing_data
)

SELECT * FROM bronze_data;
COMMENT ON TABLE bronze.default.<bronze_table> IS
'Bronze table <bronze_table> contains standardized data loaded from the landing layer for Databricks validation and downstream processing.';
```

Use meaningful comments when the source context is clear. Generic bronze comments are acceptable only when no useful business context is available.

## Conversion Rules

Follow `$sqlserver-to-dbx-converter` rules, with these bronze-specific constraints:

- Use `TRY_CAST` for source-data conversions.
- Avoid blind `CAST` on landing columns.
- Replace `GETUTCDATE()` and `GETDATE()` with `current_timestamp()`.
- Replace `CONVERT(INT, CONVERT(nvarchar(6), date_expr, 112))` with `TRY_CAST(date_format(date_expr, 'yyyyMM') AS INT)`.
- Replace `DATEADD("m", -1, date_expr)` with `add_months(date_expr, -1)`.
- Replace `ISNULL` with `COALESCE`.
- Convert SQL Server brackets to Databricks backticks.
- Remove dbt/Jinja in final `.dbx.sql`.

## JSON Rule

Do not use JSON extraction when matching flattened landing columns already exist. Prefer direct selects from the landing table. If the source only exists as JSON and flattened columns are unavailable, report that constraint before introducing JSON parsing.

## Comment Rules

Every `CREATE OR REPLACE TABLE bronze.default.* AS` must have a matching `COMMENT ON TABLE bronze.default.*`.

Use a domain-aware description when possible:

- Accounts: account master, registration, lifecycle, balances, ownership.
- Transfers: ACATS/transfer activity, status, contra broker, request, reject details.
- Transactions: movement, amount, posting, source, reference, reconciliation.
- Positions/assets: holdings, market value, quantity, security identifiers.

## Validation Checklist

Before finishing:

- Only `dbx_bronze/*.dbx.sql` files were created or edited.
- No `dbx_landing/` files were touched.
- Outputs use `bronze.default`.
- Inputs use `landing.default` unless an intentional exception is confirmed.
- No executable `CONVERT(`, `GETUTCDATE()`, `GETDATE()`, SQL Server brackets, or dbt Jinja remain.
- No blind `CAST(` remains on source data.
- All referenced landing columns exist.
- Reserved identifiers are backticked.
- Every created bronze table has a `COMMENT ON TABLE`.
- No tab characters are introduced.

## Test Prompts

### Dry Assessment Test

Use this prompt to test skill behavior without edits:

```text
Use $dbx-bronze-generator to assess, but do not edit files.

Source bronze SQL:
sqlserver_dbt/landing-pershing_aca2_a.dbt.sql

Landing source:
dbx_landing/landing-pershing_aca2_a.dbx.sql

Tell me the target bronze table, source landing table, required column coverage, and validation checks.
```

Expected behavior:

- It does not edit files.
- It reads the dbt SQL and landing file.
- It identifies `landing.default.pershing_aca2_a` as the landing source unless current source proves otherwise.
- It identifies `bronze.default.bronze_pershing_aca2_rec_a` from the dbt model name/comment.
- It reports required columns and any missing landing columns.
- It explicitly says no landing edits are needed.

### Generation Test

Use this prompt when writes are intended:

```text
Use $dbx-bronze-generator to generate or repair bronze SQL for:

Source:
sqlserver_dbt/landing-pershing_aca2_a.dbt.sql

Landing:
dbx_landing/landing-pershing_aca2_a.dbx.sql

Write only under dbx_bronze. Do not touch dbx_landing.
```

Expected generated output:

- A repo-consistent `dbx_bronze/bronze-*.dbx.sql` file.
- `CREATE CATALOG IF NOT EXISTS bronze`.
- `CREATE OR REPLACE TABLE bronze.default.<table> AS`.
- Reads from `landing.default.pershing_aca2_a`.
- Uses `TRY_CAST` for source-data conversion.
- Removes dbt Jinja.
- Adds `COMMENT ON TABLE`.
- Does not edit landing files.

### Manual Validation Commands

Run targeted checks against the generated file:

```bash
rg -n 'CONVERT\(|GETUTCDATE\(|GETDATE\(|\{\{|\{%|\[|\]' dbx_bronze/<generated-file>.dbx.sql
rg -n '\bCAST\(' dbx_bronze/<generated-file>.dbx.sql
rg -n '\b(apex|q2|ibkr|pershing|assist|cos|dmi|fis|manual|mis|mulesoft|rprt|sblc)\.default\b' dbx_bronze/<generated-file>.dbx.sql
rg -n $'\t' dbx_bronze/<generated-file>.dbx.sql
rg -n 'CREATE OR REPLACE TABLE|COMMENT ON TABLE' dbx_bronze/<generated-file>.dbx.sql
```

The first, third, and fourth commands should return no matches. The `CAST` command should return no source-data casts; controlled constant casts may be acceptable only when they match local style and cannot fail.

## Reporting

Report:

- Files created or modified.
- Source SQL and landing files used.
- Bronze table names generated.
- Landing tables read.
- Validation checks performed.
- Any missing landing columns or source-shape mismatches.
