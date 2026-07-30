# bbank_dbx
Bradesco Bank Databricks

## SQL Source Layout

- SQL Server bronze source SQL lives under `sqlserver_brz/` as `*.ms.sql`.
- SQL Server landing metadata descriptions live under `sqlserver_landing_desc/`.
- SQL Server landing dbt-derived source models live under `sqlserver_landing_dbt/` as `landing-*.dbt.ms.sql`.
- SQL Server bronze dbt-derived source models live under `sqlserver_brz_dbt/` as `brz-*.dbt.ms.sql`.
- Databricks landing SQL lives under `dbx_landing/` as `*.dbx.sql`.
- Databricks bronze SQL lives under `dbx_bronze/` as `*.dbx.sql`.

For Pershing dbt landing inputs, create matching Databricks landing files from:

```text
sqlserver_landing_dbt/landing-pers*.dbt.ms.sql -> dbx_landing/landing-per*.dbx.sql
```

The target catalog for Pershing landing tables is `landing_pershing.default`, and the table name comes from the dbt `source("pershing", "...")` table name converted to lower snake case.

Known Pershing correction: `isca_rec_i` is a typo. Use `isca_rec_j` for SQL Server, dbt, and DBX landing artifacts sourced from `PERSHING_ISCA_J`.

For Pershing DataProd reverse regeneration, use the current SQL Server landing dbt folder. If an older `dbt_landing/` folder is mentioned but absent, regenerate empty SQL Server dbt models from the matching DBX landing schemas:

```text
dbx_landing/landing-pershingdataprod_*.dbx.sql -> sqlserver_landing_dbt/landing-pershingdataprod_*.dbt.ms.sql
```

The regenerated dbt files read from `{{ source("pershing", "PERSHINGDATAPROD_*") }}`, derive `YEARMONTH` from `LOADED_AT` with SQL Server `CONVERT`, and use the established incremental append pattern.

```mermaid
flowchart TD
    A["sqlserver_landing_dbt/landing-pers*.dbt.ms.sql"] --> B["Read dbt source() table"]
    A --> C["Extract landing_data columns and conversions"]
    B --> D["Resolve landing_pershing.default.<source_table>"]
    C --> E["Convert SQL Server types and functions to Databricks SQL"]
    D --> F["Write dbx_landing/landing-per*.dbx.sql"]
    E --> F
    F --> G["Add deterministic 10-row seed data"]
    F --> H["Add COMMENT ON TABLE without apostrophes"]
    F --> I["Add row-count verification"]
    O["Known typo isca_rec_i"] --> P["Normalize to isca_rec_j"]
    P --> Q["Use PERSHING_ISCA_J and pershing_isca_j"]
    J["dbx_landing/landing-pershingdataprod_*.dbx.sql"] --> K["Extract DBX CREATE TABLE columns"]
    J --> L["Read Source comment for PERSHINGDATAPROD_*"]
    K --> M["Regenerate empty sqlserver_landing_dbt/landing-pershingdataprod_*.dbt.ms.sql"]
    L --> M
    M --> N["Use dbt incremental append and source(\"pershing\", ...)"]
```

## Codex Skills

The local skills are named by layer and direction:

- `$landing-to-dbx-generator`: generate or repair Databricks landing SQL from SQL Server landing metadata, SQL Server landing dbt models, or existing DBX landing schemas.
- `$bronze-to-dbx-generator`: generate or repair Databricks bronze SQL from SQL Server bronze SQL, populated dbt transformation models, and DBX landing sources.
- `$dbx-layer-auditor`: audit DBX landing and bronze SQL, including landing-to-bronze coverage and Pershing DataProd DBX-to-landing-dbt pairs.
- `$sqlserver-dbx-syntax-converter`: shared SQL Server to Databricks syntax and type conversion rules.

```mermaid
flowchart LR
    A["SQL Server sources and metadata"] --> B["$landing-to-dbx-generator"]
    B --> C["dbx_landing/*.dbx.sql"]
    C --> D["$bronze-to-dbx-generator"]
    D --> E["dbx_bronze/*.dbx.sql"]
    F["$sqlserver-dbx-syntax-converter"] --> B
    F --> D
    C --> G["$dbx-layer-auditor"]
    E --> G
    H["sqlserver_landing_dbt/*.dbt.ms.sql"] --> G
```
