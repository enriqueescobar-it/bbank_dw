#!/usr/bin/env python3
"""Summarize landing SQL evidence for LND framework assessments."""

from __future__ import annotations

import argparse
import json
import re
from collections import Counter
from pathlib import Path


META_COLUMNS = ("SOURCE_FILE", "DATE_OF_DATA", "YEARMONTH", "LOADED_AT")

CHECKS = {
    "sqlserver_or_jinja_leftovers": re.compile(
        r"CONVERT\(|GETUTCDATE\(|GETDATE\(|ISNULL\(|\{\{|\{%", re.IGNORECASE
    ),
    "non_landing_catalog_refs": re.compile(r"\b(?:bronze|silver|gold)\.", re.IGNORECASE),
    "write_or_join_keywords": re.compile(
        r"\bJOIN\b|\bMERGE\b|\bUPDATE\b|\bDELETE\b", re.IGNORECASE
    ),
    "checksum_or_fingerprint": re.compile(r"checksum|fingerprint", re.IGNORECASE),
    "delivery_identity": re.compile(
        r"delivery[_ ]?id|batch[_ ]?id|run[_ ]?id|pipeline", re.IGNORECASE
    ),
    "status_or_quarantine": re.compile(
        r"\bstatus\b|quarantine|accepted|rejected|released|replay", re.IGNORECASE
    ),
}


def line_number(text: str, offset: int) -> int:
    return text.count("\n", 0, offset) + 1


def parse_columns(create_block: str) -> set[str]:
    pattern = re.compile(
        r"`?([A-Za-z_][A-Za-z0-9_]*)`?\s+"
        r"(?:STRING|INT|BIGINT|DECIMAL\([^)]*\)|TIMESTAMP|DATE|BOOLEAN|DOUBLE|FLOAT)",
        re.IGNORECASE,
    )
    return {match.group(1).upper() for match in pattern.finditer(create_block)}


def uncommented_text(text: str) -> str:
    """Keep line positions stable while removing SQL comments and string literals."""
    without_block_comments = re.sub(r"/\*.*?\*/", lambda m: "\n" * m.group(0).count("\n"), text, flags=re.DOTALL)
    lines = []
    for line in without_block_comments.splitlines():
        if "--" in line:
            line = line[: line.index("--")]
        lines.append(re.sub(r"'(?:''|[^'])*'", "''", line))
    return "\n".join(lines)


def analyze_file(path: Path) -> dict:
    text = path.read_text(errors="ignore")
    executable_text = uncommented_text(text)
    create_pattern = re.compile(
        r"CREATE TABLE IF NOT EXISTS\s+([\w.]+)\s*\((.*?)\n\);",
        re.IGNORECASE | re.DOTALL,
    )
    tables = []
    missing_meta = []
    for match in create_pattern.finditer(text):
        table = match.group(1)
        cols = parse_columns(match.group(2))
        missing = [col for col in META_COLUMNS if col not in cols]
        tables.append(table)
        if missing:
            missing_meta.append(
                {
                    "line": line_number(text, match.start()),
                    "table": table,
                    "missing": missing,
                }
            )

    checks = {}
    samples = {}
    for name, pattern in CHECKS.items():
        scan_text = executable_text if name == "write_or_join_keywords" else text
        matches = list(pattern.finditer(scan_text))
        checks[name] = len(matches)
        samples[name] = [
            {
                "line": line_number(scan_text, match.start()),
                "text": text.splitlines()[line_number(scan_text, match.start()) - 1].strip()[:180],
            }
            for match in matches[:10]
        ]

    catalog_matches = re.findall(
        r"(?:CREATE CATALOG IF NOT EXISTS|USE CATALOG)\s+(\w+)", text, re.IGNORECASE
    )

    return {
        "file": str(path),
        "lines": text.count("\n") + 1,
        "catalogs": sorted(set(catalog_matches)),
        "tables": len(tables),
        "comments": len(re.findall(r"COMMENT ON TABLE\s+[\w.]+\s+IS", text, re.IGNORECASE)),
        "inserts": len(re.findall(r"INSERT INTO\s+[\w.]+", text, re.IGNORECASE)),
        "truncates": len(re.findall(r"\bTRUNCATE TABLE\b", text, re.IGNORECASE)),
        "count_checks": len(
            re.findall(
                r"SELECT\s+'[^']+'\s+AS\s+table_name,\s*COUNT\(\*\)",
                text,
                re.IGNORECASE,
            )
        ),
        "source_comments": len(re.findall(r"^-- Source:", text, re.IGNORECASE | re.MULTILINE)),
        "metadata_columns_present": {
            col: len(re.findall(rf"`?{col}`?\s+", text, re.IGNORECASE)) for col in META_COLUMNS
        },
        "missing_metadata_tables": missing_meta,
        "checks": checks,
        "samples": samples,
        "tabs": text.count("\t"),
    }


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Collect repeatable SQL evidence for LND landing-layer assessments."
    )
    parser.add_argument("sql_files", nargs="+", type=Path)
    parser.add_argument("--json", action="store_true", help="Emit machine-readable JSON.")
    args = parser.parse_args()

    results = [analyze_file(path) for path in args.sql_files]
    totals = Counter()
    metadata_missing = Counter()
    for result in results:
        for key in ("tables", "comments", "inserts", "truncates", "count_checks", "source_comments"):
            totals[key] += result[key]
        totals["tabs"] += result["tabs"]
        for item in result["missing_metadata_tables"]:
            for col in item["missing"]:
                metadata_missing[col] += 1
        for key, value in result["checks"].items():
            totals[key] += value

    payload = {
        "files": results,
        "totals": dict(totals),
        "metadata_missing_table_counts": dict(metadata_missing),
    }

    if args.json:
        print(json.dumps(payload, indent=2))
        return 0

    print("LND Landing SQL Evidence")
    print(f"files: {len(results)}")
    for key in ("tables", "comments", "inserts", "truncates", "count_checks", "source_comments"):
        print(f"{key}: {totals[key]}")
    print(f"tabs: {totals['tabs']}")
    print(f"metadata_missing_table_counts: {dict(metadata_missing)}")
    for key in CHECKS:
        print(f"{key}: {totals[key]}")
    print()

    for result in results:
        print(
            f"{result['file']}: catalogs={result['catalogs']} tables={result['tables']} "
            f"comments={result['comments']} inserts={result['inserts']} "
            f"truncates={result['truncates']} count_checks={result['count_checks']}"
        )
        missing_count = len(result["missing_metadata_tables"])
        if missing_count:
            print(f"  tables_missing_any_standard_metadata: {missing_count}")
            for item in result["missing_metadata_tables"][:5]:
                print(f"  line {item['line']}: {item['table']} missing {','.join(item['missing'])}")
            if missing_count > 5:
                print(f"  ... {missing_count - 5} more")
        for key, count in result["checks"].items():
            if count:
                print(f"  {key}: {count}")
                for sample in result["samples"][key]:
                    print(f"    line {sample['line']}: {sample['text']}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
