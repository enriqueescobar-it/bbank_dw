#!/usr/bin/env python3
"""Summarize Bronze SQL evidence for BRZ framework assessments."""

from __future__ import annotations

import argparse
import json
import re
from collections import Counter, defaultdict
from pathlib import Path


META_PATTERNS = {
    "loaded_at": re.compile(r"`?LOADED_AT`?", re.IGNORECASE),
    "yearmonth": re.compile(r"`?YEARMONTH`?", re.IGNORECASE),
    "date_of_data": re.compile(r"`?DATE_OF_DATA`?", re.IGNORECASE),
    "source_file": re.compile(r"`?SOURCE_FILE`?|`?FILE_NAME_[A-Z0-9_]+`?", re.IGNORECASE),
    "brz_load_id": re.compile(r"BRZ[_ ]?LOAD[_ ]?ID|BRONZE[_ ]?LOAD[_ ]?ID", re.IGNORECASE),
    "pipeline_run": re.compile(r"PIPELINE|RUN[_ ]?ID|JOB[_ ]?ID", re.IGNORECASE),
    "checksum_or_fingerprint": re.compile(r"CHECKSUM|FINGERPRINT|HASH", re.IGNORECASE),
    "schema_version": re.compile(r"SCHEMA[_ ]?VERSION|SCHEMA[_ ]?FINGERPRINT", re.IGNORECASE),
}

CHECKS = {
    "sqlserver_or_jinja_leftovers": re.compile(
        r"CONVERT\(|GETUTCDATE\(|GETDATE\(|ISNULL\(|\{\{|\{%", re.IGNORECASE
    ),
    "landing_catalog_refs": re.compile(r"\blanding(?:_jh|_pershing|_sei)?\.default\.[\w`]+", re.IGNORECASE),
    "downstream_catalog_refs": re.compile(r"\b(?:silver|gold)\.default\.[\w`]+", re.IGNORECASE),
    "write_or_mutation_keywords": re.compile(
        r"\bINSERT INTO\b|\bMERGE\b|\bUPDATE\b|\bDELETE FROM\b|\bTRUNCATE\b|\bDROP TABLE\b",
        re.IGNORECASE,
    ),
    "filters": re.compile(r"\bWHERE\b|\bQUALIFY\b|\bHAVING\b", re.IGNORECASE),
    "joins": re.compile(r"\bJOIN\b", re.IGNORECASE),
    "aggregates_or_distinct": re.compile(
        r"\bGROUP BY\b|\bDISTINCT\b|\bCOUNT\(|\bSUM\(|\bMAX\(|\bMIN\(", re.IGNORECASE
    ),
    "business_defaults_or_case": re.compile(r"\bCASE\b|\bCOALESCE\(|\bNVL\(", re.IGNORECASE),
    "static_seed_blocks": re.compile(r"\bVALUES\b|SELECT\s+\*\s+FROM\s+\(", re.IGNORECASE),
    "table_properties": re.compile(r"TBLPROPERTIES|SET TBLPROPERTIES|delta\.", re.IGNORECASE),
    "access_controls": re.compile(r"\bGRANT\b|\bDENY\b|\bMASK\b|ROW FILTER|SET TAGS", re.IGNORECASE),
    "quarantine_or_rescue": re.compile(r"QUARANTINE|RESCUED|_rescued_data|BAD_RECORDS", re.IGNORECASE),
    "replay_or_duplicate": re.compile(r"REPLAY|DUPLICATE|IDEMPOTEN|CONFLICT", re.IGNORECASE),
    "publication_or_status": re.compile(r"PUBLISHED|PUBLICATION|LOAD[_ ]?STATUS|BRZ[_ ]?STATUS", re.IGNORECASE),
    "retention_or_vacuum": re.compile(r"RETENTION|VACUUM|LEGAL[_ -]?HOLD|ARCHIV", re.IGNORECASE),
}


def line_number(text: str, offset: int) -> int:
    return text.count("\n", 0, offset) + 1


def uncommented_text(text: str) -> str:
    """Keep line positions stable while removing SQL comments and string literals."""
    without_block_comments = re.sub(
        r"/\*.*?\*/", lambda m: "\n" * m.group(0).count("\n"), text, flags=re.DOTALL
    )
    lines = []
    for line in without_block_comments.splitlines():
        if "--" in line:
            line = line[: line.index("--")]
        lines.append(re.sub(r"'(?:''|[^'])*'", "''", line))
    return "\n".join(lines)


def samples_for(pattern: re.Pattern[str], scan_text: str, original_text: str, limit: int = 10) -> list[dict]:
    lines = original_text.splitlines()
    items = []
    for match in pattern.finditer(scan_text):
        line = line_number(scan_text, match.start())
        text = lines[line - 1].strip() if 0 < line <= len(lines) else ""
        items.append({"line": line, "text": text[:180]})
        if len(items) >= limit:
            break
    return items


def analyze_file(path: Path) -> dict:
    text = path.read_text(errors="ignore")
    executable_text = uncommented_text(text)
    create_matches = list(
        re.finditer(r"CREATE OR REPLACE TABLE\s+([\w.]+)\s+AS\b", text, re.IGNORECASE)
    )
    target_tables = [match.group(1) for match in create_matches]
    source_refs = re.findall(r"\bFROM\s+((?:landing|landing_jh|landing_pershing|landing_sei)\.default\.[\w`]+)", text, re.IGNORECASE)
    load_types = re.findall(r"^--\s*LOAD TYPE:\s*(.+)$", text, re.IGNORECASE | re.MULTILINE)
    catalogs = re.findall(r"(?:CREATE CATALOG IF NOT EXISTS|USE CATALOG)\s+(\w+)", text, re.IGNORECASE)

    checks = {}
    samples = {}
    for name, pattern in CHECKS.items():
        scan_text = executable_text
        matches = list(pattern.finditer(scan_text))
        checks[name] = len(matches)
        samples[name] = samples_for(pattern, scan_text, text)

    metadata = {
        name: len(pattern.findall(text))
        for name, pattern in META_PATTERNS.items()
    }

    return {
        "file": str(path),
        "lines": text.count("\n") + 1,
        "catalogs": sorted(set(catalogs)),
        "created_tables": len(target_tables),
        "target_tables": target_tables,
        "comments": len(re.findall(r"COMMENT ON TABLE\s+[\w.]+\s+IS", text, re.IGNORECASE)),
        "load_types": Counter(load_type.strip() for load_type in load_types),
        "landing_source_refs": sorted(set(source_refs)),
        "landing_source_ref_count": len(source_refs),
        "metadata_mentions": metadata,
        "checks": checks,
        "samples": samples,
        "tabs": text.count("\t"),
    }


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Collect repeatable SQL evidence for BRZ Bronze-layer assessments."
    )
    parser.add_argument("sql_files", nargs="+", type=Path)
    parser.add_argument("--json", action="store_true", help="Emit machine-readable JSON.")
    args = parser.parse_args()

    results = [analyze_file(path) for path in args.sql_files]
    totals = Counter()
    load_types = Counter()
    target_occurrences: dict[str, list[dict]] = defaultdict(list)

    for result in results:
        totals["created_tables"] += result["created_tables"]
        totals["comments"] += result["comments"]
        totals["landing_source_ref_count"] += result["landing_source_ref_count"]
        totals["tabs"] += result["tabs"]
        load_types.update(result["load_types"])
        for key, value in result["metadata_mentions"].items():
            totals[f"metadata_{key}"] += value
        for key, value in result["checks"].items():
            totals[key] += value
        for table in result["target_tables"]:
            target_occurrences[table.lower()].append({"file": result["file"], "table": table})

    duplicate_targets = {
        table: occurrences
        for table, occurrences in sorted(target_occurrences.items())
        if len(occurrences) > 1
    }

    payload = {
        "files": results,
        "totals": dict(totals),
        "load_types": dict(load_types),
        "duplicate_targets": duplicate_targets,
    }

    if args.json:
        print(json.dumps(payload, indent=2))
        return 0

    print("BRZ Bronze SQL Evidence")
    print(f"files: {len(results)}")
    for key in ("created_tables", "comments", "landing_source_ref_count", "tabs"):
        print(f"{key}: {totals[key]}")
    print(f"load_types: {dict(load_types)}")
    print(f"duplicate_targets: {len(duplicate_targets)}")
    for table, occurrences in duplicate_targets.items():
        print(f"  {table}: {', '.join(item['file'] for item in occurrences)}")
    for key in sorted(k for k in totals if k.startswith("metadata_")):
        print(f"{key}: {totals[key]}")
    for key in CHECKS:
        print(f"{key}: {totals[key]}")
    print()

    for result in results:
        print(
            f"{result['file']}: catalogs={result['catalogs']} "
            f"created_tables={result['created_tables']} comments={result['comments']} "
            f"landing_source_refs={result['landing_source_ref_count']} "
            f"load_types={dict(result['load_types'])}"
        )
        for key, count in result["checks"].items():
            if count:
                print(f"  {key}: {count}")
                for sample in result["samples"][key]:
                    print(f"    line {sample['line']}: {sample['text']}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
