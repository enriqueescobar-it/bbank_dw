# Current State Overview

## Source Ingestion

```text
Source
 ↓
NiFi
 ↓
Central Repository
 ↓
Airflow
 ↓
DW Landing
```

## DBX Layer Refresh

Refreshed from the local filesystem on 2026-07-30.

```mermaid
flowchart TD
    A["sqlserver_brz and sqlserver_brz_dbt"] --> B["dbx_bronze"]
    C["sqlserver_landing_dbt and sqlserver_landing_desc"] --> D["dbx_landing"]
    D --> E["130 DBX landing SQL files"]
    B --> F["59 DBX bronze SQL files"]
    E --> G["221 unique landing tables"]
    F --> H["220 unique bronze tables"]
    I["landing_pershing.default"] --> J["bronze_pershing.default"]
    K["landing_jh.default"] --> L["bronze_jh.default"]
    M["landing_sei.default"] --> N["bronze_sei.default"]
    J --> O["40 unique Pershing bronze tables"]
```

## Children
