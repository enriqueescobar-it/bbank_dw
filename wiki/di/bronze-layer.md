Use the attached BRZ Bronze Layer Standardization Framework as the sole assessment rubric.

Analyse the attached schemas, table definitions, table properties, ingestion logic, and operational evidence strictly from a BRONZE-layer perspective.

Do not assess or recommend:

* table-name conventions;
* column-name conventions;
* data-type-based naming conventions;
* Landing-layer architecture;
* Silver-layer cleansing, validation, standardization, or conformance;
* Gold-layer facts, dimensions, marts, metrics, or aggregations;
* business transformations;
* semantic renaming;
* reporting or consumption patterns.

Assess only whether the implementation satisfies the responsibilities of a raw, source-aligned, historically reproducible, technically governed Bronze layer.

For every framework control, assign exactly one status:

* Compliant
* Partially compliant
* Non-compliant
* Not evidenced
* Not applicable

For every conclusion:

1. Cite the exact evidence:

   * schema;
   * table;
   * column;
   * table property;
   * SQL statement;
   * configuration;
   * pipeline operation;
   * log entry;
   * or documentation section.

2. Do not infer implementation behaviour from a table or column name.

3. Do not treat missing evidence as non-compliance. Classify it as “Not evidenced.”

4. Clearly separate:

   * directly evidenced findings;
   * reasonable technical inferences;
   * missing evidence.

5. Evaluate only Bronze concerns, including:

   * source fidelity;
   * raw-history preservation;
   * immutability;
   * append, overwrite, merge, and delete behaviour;
   * load identity;
   * record traceability;
   * idempotency;
   * replay and backfill safety;
   * schema evolution;
   * rescued or unexpected data;
   * snapshot and incremental preservation;
   * CDC event preservation, where applicable;
   * delete and tombstone preservation, where applicable;
   * atomic writes and publication;
   * technical quarantine;
   * retention;
   * security;
   * observability;
   * recoverability.

6. Do not evaluate whether business values are correct, standardized, deduplicated by business meaning, conformed, enriched, aggregated, or suitable for reporting.

Produce the following sections:

1. Executive summary
2. Scope and evidence reviewed
3. Bronze control assessment table
4. Confirmed strengths
5. Confirmed control gaps
6. Risks
7. Controls not evidenced
8. Required Bronze corrections
9. Recommended Bronze improvements
10. Additional evidence required
11. Prioritized remediation backlog
12. Overall confidence assessment

The control assessment table must contain:

* Control area
* Framework requirement
* Status
* Evidence
* Finding
* Risk
* Recommended Bronze-only correction
* Confidence level

Use these confidence levels:

* High: directly demonstrated by complete implementation evidence
* Medium: supported by partial evidence or a strong technical inference
* Low: based on limited or indirect evidence
* Not assessable: insufficient evidence

Do not manufacture missing schemas, pipeline behaviour, source semantics, constraints, or operational controls.

