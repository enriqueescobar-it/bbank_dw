Repository memory refresh rules for `bbank_dw`
==============================================

Treat the current filesystem as the source of truth. When the user asks to
refresh memory, reassess files, update rules, or refresh skills, re-list the
relevant folders from disk before relying on prior conversation context.

Primary SQL Server source folders:

- `sqlserver_brz/`: SQL Server bronze source SQL, currently 128 `*.ms.sql`
  files.
- `sqlserver_brz_dbt/`: SQL Server dbt-derived Pershing bronze models,
  currently 40 `brz-pers*.dbt.ms.sql` files.
- `sqlserver_lnd_dbt/`: SQL Server dbt-derived Pershing landing models,
  currently 40 `lnd-pers*.dbt.ms.sql` files.
- `sqlserver_lnd_desc/`: SQL Server landing metadata descriptions, currently
  36 `*-desc.ms.txt` files, excluding `.gitkeep`.

Current counterpart rules:

- `sqlserver_brz_dbt/brz-pers*.dbt.ms.sql` has one-to-one coverage in
  `sqlserver_brz/brz-pers*.ms.sql`.
- `sqlserver_lnd_dbt/lnd-pers*.dbt.ms.sql` has partial description coverage.
  Descriptions are absent for `lnd-pers_accf`, `lnd-pers_pershing`,
  `lnd-pershing_aca2_rec_a`, and `lnd-pershing_aca2_rec_d`.
- `lnd-pershingdataprod_caps_rec_hist-desc.ms.txt` is the description
  counterpart for `lnd-pershingdataprod_caps_hist`.
- `isca_rec_i` is stale. Use `isca_rec_j`, sourced from `PERSHING_ISCA_J`,
  across SQL Server, dbt, and DBX artifacts.

Databricks catalog parity:

- `landing.default` maps to `bronze.default`.
- `landing_jh.default` maps to `bronze_jh.default`.
- `landing_pershing.default` maps to `bronze_pershing.default`.
- `landing_sei.default` maps to `bronze_sei.default`.

Do not recreate old source-system catalogs such as `pershing.default`,
`jh.default`, `sei.default`, `apex.default`, `q2.default`, or `ibkr.default`
in generated DBX SQL. Preserve source-specific landing and bronze catalogs
unless the user explicitly asks for a catalog migration.

When editing local skills, preserve user changes, keep updates scoped to the
skill behavior, and keep refresh instructions aligned with the four SQL Server
source folders above plus `dbx_lnd/` and `dbx_brz/` when Databricks outputs are
in scope.

Current local assessor skill names:

- `landing-layer-assessor`: LND landing-layer assessment skill for `dbx_lnd/`.
- `bronze-layer-assessor`: BRZ bronze-layer assessment skill for `dbx_brz/`.

Do not use the retired names `lnd-landing-layer-assessor` or
`brz-bronze-layer-assessor`.
