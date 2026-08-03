# proposal\_example

# Executive Summary: Example risk assessment

You already have a reasonable medallion organization:

- Separate dev/prod catalogs.
- Schemas clearly labeled as bronze/silver/gold.
- Domain-specific schemas (POS, HighJump, Arkieva, etc.).
- Helpful utility schemas (reference, sandbox, data\_integrity).

The main improvements would be:

- Make naming fully consistent (decide layer-first vs domain-first and stick to it).
- Mirror the same structure between development and production.
- Tidy up historical vs current schemas.
- Document and enforce which teams can read/write each layer.

## Inherited Strengths

- Environments are split by catalog (development, production).
- Medallion layers and domains/sources are encoded in schema names:
    - Prefix by layer: bronze\_\*, silver\_\*, gold\_\*.
    - Suffix by domain/source/region: \*\_pos, \*\_x3\_jz, \*\_3pl\_eu, etc.

### Catalog DEV

- bronze
- bronze\_3pl\_eu
- bronze\_admerse
- bronze\_airbyte\_red\_sftp
- bronze\_airbyte\_shopify
- bronze\_amazon\_seller\_partner
- bronze\_apps
- bronze\_github
- bronze\_google\_sheets
- bronze\_google\_sheets\_eu
- bronze\_highjump
- bronze\_pos
- bronze\_pos\_benelux
- bronze\_pos\_fr
- bronze\_pos\_uk
- bronze\_\*

### Catalog PROD

#### Grouping Bronze

bronze, bronze\_pos\_\*, bronze\_vmt, bronze\_x3\_jz, etc.

#### Grouping Silver

silver, silver\_arkieva, silver\_digital\_marketing, silver\_eu\_sql\_server, silver\_internal, silver\_npd, silver\_reference, silver\_shipping, silver\_highjump\_historical, silver\_scheduler\_historical, silver\_x3\_jz\_historical, …

#### Grouping Gold

gold, gold\_datablaster, gold\_pos

#### Grouping the rest

data\_integrity, delta\_share, sandbox, sigma, sigma\_logs

## Inherited Weaknesses

No standardization

## Top 5 Technical Risks

The following risks are prioritized based on impact to operations, security, and cost. Each includes mitigation priority (High/Medium/Low) and estimated exposure.

### Layer & Domain are mixed at schema level (High Priority)

Both exist:

- Generic schemas: bronze, silver, gold.
- Domain-specific schemas: bronze\_pos\_\*, silver\_arkieva, gold\_pos, etc.

Over time this can become confusing:

- Where should a new table for POS data go: bronze\_pos\_eu or generic bronze?
- Why is there silver\_eu\_sql\_server sitting next to silver\_internal and also silver\_eu\_sql\_server visible outside production?

### Naming inconsistency (Medium Priority)

Inconsistent naming makes it harder for new people to guess where data should live.

- Bronze often uses bronze\_\_ (e.g., bronze\_pos\_benelux), but silver sometimes uses silver\_, sometimes silver\_\_, sometimes silver\_\*\_historical.
- Gold has gold, gold\_datablaster, gold\_pos but not obviously a gold schema for each bronze/silver domain.

### Harder to do “by-domain” RBAC or cataloging (Medium Priority)

Because schemas are layer-first (bronze\_x, silver\_x), all data for a single domain is spread across multiple schemas. For example, POS data exists in:

- bronze\_pos\_\* (raw)
- silver\_\* (modeled POS tables)
- gold\_pos (curated POS outputs)

That is expected in medallion, but if you ever want a “POS only” view (for documentation or RBAC), you need to stitch across those schemas.

### Historical vs current is encoded in schema names (Low Priority)

silver\_highjump\_historical, silver\_scheduler\_historical, etc., are entire schemas. This is fine, but:

- You may end up with a lot of similar schemas.
- Sometimes it is easier to put history in tables or table-name suffixes (\*\_hist) inside one schema and use table properties for retention.

### RACI matrix absent

RACI matrices are needed for all the layers on the Medallion architecture.

## Top 5 Tightening Suggestions

No need to change everything, but this list of improvements that would make the structure more robust and easier to scale.

### Lock in a Naming Convention

Given your current naming, Option A is probably easier: keep bronze\_pos\_\* etc., but:

- Also create silver\_pos\_\* and gold\_pos\_\* schemas with matching patterns
- Use bronze, silver, gold only for shared or truly generic data.

#### Option A

Layer-first (closer to current)

catalog is with environment/schema = LAYER\_DOMAIN\_REGION

Then avoid generic bronze/silver/gold except for truly cross-domain things.

Examples:

- production.bronze\_pos\_eu
- production.silver\_pos\_eu
- production.gold\_pos

#### Option B

schema = DOMAIN\_\_LAYER\_REGION\_ (or similar)

This makes it very easy to see all layers of one domain.

Examples:

- production.pos\_bronze\_eu
- production.pos\_silver\_eu
- production.pos\_gold

### Make dev/prod symmetry explicit

All environments should be 95% the same. That keeps promotion paths very clear.

### Clarify special schemas

Keep using:

- silver\_reference for organization-wide dimensions / lookup tables.
- data\_integrity for quality checks.
- delta\_share for external sharing.
- sandbox for ad-hoc dev (ideally only in dev, or very locked-down in prod).

But document them so everyone knows:

- What is allowed there.
- Who owns them.
- Retention rules

### Formal Historical data strategy

This keeps the schema list shorter and avoids repetition. Instead of many \_historical schemas, consider one of:

- Keep current and history in the same schema:
    - silver\_pos.order (current SCD2 view)
    - silver\_pos.order\_hist (raw history)
- Or use table properties / tags to mark history tables, not separate schemas. 

### Permissions aligned with layers

Even though I cannot see your ACLs, the structure you have works nicely with a typical medallion access model:

- Bronze: ETL/service accounts only (write), restricted read.
- Silver: data engineers + analysts (read), only pipelines write.
- Gold: business-facing, BI tools, wide read-access, curated write.

Because all schemas at a layer share a prefix (bronze\_%, silver\_%, gold\_%), you can:

- Grant SELECT on silver\_% to analytics groups.
- Restrict or deny SELECT on bronze\_% to most users.

### Silver Layer Data Vault (Data Vault - Graph Model)

The raw data is processed into the following Data Vault components:

Hubs (Nodes):

- Hub\_Customer (Business Key: customer\_id)
- Hub\_Product (Business Key: product\_id)
- Hub\_Order (Business Key: order\_id)

Links (Edges):

- Link\_Customer\_Order: Connects a specific Hub\_Customer to a specific Hub\_Order.
- Link\_Order\_Product: Connects a specific Hub\_Order to multiple Hub\_Products.

Satellites (Attributes/History):

- Sat\_Customer\_Details: Contains customer name, address, and credit score, with load dates and hash-diffs to track changes over time.
- Sat\_Product\_Pricing: Contains current and historical prices, descriptions, and weights for products.
- Sat\_Order\_Status: Tracks the history of an order's status (e.g., "Pending", "Shipped", "Delivered").

This structure acts like a graph where you can traverse from a customer (node) to their orders (relationship/link), to the products in that order (nodes), and get historical context at each step via the satellites. The explicit modeling of relationships in links and entity properties in satellites makes the Data Vault model naturally align with graph database concepts, even when implemented on a relational lakehouse platform.

### RACI matrix for layers

Responsibility

Accountability

Consulted

Informed

#### Core Roles

- DPO, DP Owner (Product Owner): accountable for platform outcomes, prioritization.
- DPL, Data Platform Lead (Data Eng Manager/Architect): accountable for architecture standards and enforcement.
- DE, Data Engineers (DE): build/operate pipelines and tables.
- AS, Analytics Engineers (AE / dbt): build curated models (often Silver/Gold) and semantic consistency.
- DS, Data Steward (Business): accountable for business definitions, data meaning, certification.
- DG, Data Governance / Security: policies, access controls, compliance.
- BID, BI / Visualization Developers: semantic model, certified datasets, reporting layer.
- DQO, Data Quality (DQ) Owner: owns rules, thresholds, monitoring (may be combined with AE/DE).
- CAU, Consumers (Analysts / Business Users): use data products.

#### RACI-Copper (Landing, Staging)

| **Activity** | **DPO** | **DPL** | **DE** | **AE** | **DS** | **DG** | **BID** | **DQO** | **CAU** |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Define ingestion patterns, schemas, file landing rules | C | A | R | C | C | C | I | C | I |
| Operate ingestion jobs (SLAs, retries, lineage) | I | A | R | I | I | C | I | C | I |
| Sensitive data classification (PII tags, masking policy) | I | C | R | I | C | A/R | I | C | I |

#### RACI-Bronze

| **Activity** | **DPO** | **DPL** | **DE** | **AE** | **DS** | **DG** | **BID** | **DQO** | **CAU** |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Define Bronze contract (immutability, audit cols, retention) | C | A | R | C | C | C | I | C | I |
| Ingest to Bronze + metadata (ingestion\_ts, source\_system, batch\_id) | I | A | R | I | I | C | I | C | I |
| Access policy: Bronze is restricted by default | I | C | C | I | I | A/R | I | I | I |
| Bronze change management (schema drift handling) | I | A | R | C | I | C | I | C | I |

#### RACI-Silver

| **Activity** | **DPO** | **DPL** | **DE** | **AE** | **DS** | **DG** | **BID** | **DQO** | **CAU** |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Define Silver contract (nulls, dedup, limits, defaults, types) | C | A | R | R | C | C | I | R | I |
| Implement standardization & conformance pipelines | I | A | R | R | C | I | I | R | I |
| Data quality rules & thresholds (domain constraints) | C | C | R | R | A | I | I | R | C |
| Silver access policy (usually internal + controlled external) | I | C | I | C | I | A/R | C | I | I |

#### RACI-Gold/ Platinum

| **Activity** | **DPO** | **DPL** | **DE** | **AE** | **DS** | **DG** | **BID** | **DQO** | **CAU** |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Define Gold contract (facts/dims, semantic consistency, KPI rules) | A | C | C | R | R | C | R | C | C |
| Build gold marts (facts, dims, aggregates) | I | C | R | R | C | I | R | C | I |
| Certification (“Approved for BI”, trusted KPI definitions) | A | I | I | R | R | C | R | C | C |
| Gold access policy (default for BI) | I | I | I | I | I | A/R | C | I | I |

#### RACI-Cross Layers

| **Activity** | **DPO** | **DPL** | **DE** | **AE** | **DS** | **DG** | **BID** | **DQO** | **CAU** |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |

Common rules and responsibilities across layers, wider impact requires wider governance. We do require to cover the following aspects:

- Naming standards (schemas + column name standardization)
- Data quality framework (tests, alerts, quarantine, SLOs)
- Ownership model (per domain/table owner, on-call rotation)
- RBAC / permissions and periodic access reviews
- Change management (breaking changes, deprecation policy)
- Catalog metadata + documentation completeness

# Scenarios

The goal is to be ready for putting the Semantic Layer atop Gold & Platinum for ML & AI readiness.

## Worst (Actual) Scenario

We keep things as they are or we work into readiness for Semantic Layer

## Best Scenario

We have all time, all the budget, all the resources to make it perfect

TDB

## Compromise Scenario

We re align with current state and we create short path in an INTELLIGENT way to reach a point where we have Semantic Layer READINESS without implementing it.

TDB

# Example Remediation Plan

Databricks environment shows symptoms typical of a “custom medallion” that grew organically without governance:

- The gold layer is thin or unused.
- Analysts consume Silver and sometimes Bronze directly.
- There is no consistent staging/copper layer.
- No standardization for nulls, duplicates, limits, default values, or naming conventions.
- Schema proliferation without governance.
- The permission model becomes unmanageable.

Below is a structured improvement plan with priorities and timelines.

## Critical

Problem: Teams don’t know what qualifies a table for Bronze/Silver/Gold. The result is inconsistent quality, inconsistent patterns, and accidental misuse of layers.

Fix: Create **Medallion Layer Contracts**

Priority: Critical

Reason: Without this, no governance or quality improvements will stick.

| Layer | Contract (What should be true) |
| --- | --- |
| Bronze | Raw, immutable, ingestion format. No business logic, no heavy transformations. Only hygiene: schema inference, ingestion timestamp, dedup by primary key if needed. |
| Silver | Cleaned, validated, standardized, typed. Null handling, default rules, deduplication, naming conventions applied. Joins possible only inside domain. |
| Gold | Business-ready, aggregated, dimensional models, conformed dimensions, measures, wide tables, curated outputs for BI and data products. |

### Lack of Standardized Layer Definitions

Problem: Teams don’t know what qualifies a table for Bronze/Silver/Gold. The result is inconsistent quality, inconsistent patterns, and accidental misuse of layers.

Fix: Create **Medallion Layer Contracts**

Priority: Critical

Reason: Without this, no governance or quality improvements will stick.

### Governance Breakdown: Analysts Accessing Bronze & Silver

Problem: Visualization users access Bronze/Silver to avoid Gold, preventing the gold layer from maturing.

Fix:

- Short-term: Introduce controlled read-only views for analysts instead of raw bronze/silver tables.
- Medium-term: Remove direct access to bronze/silver once gold is ready.
- Long-term: Gold becomes a canonical source for analytics.

Priority: Critical

Reason: You cannot enforce quality or governance while analysts bypass curation.

### No Standardization Checks

Problem:

- null handling
- default values
- value limits
- duplicates
- outlier handling
- business validation
- schema consistency

Fix: Introduce a **Silver Standardization Framework**

- Null replacements (or explicit nullable rules)
- Deduplication rules defined per entity
- Standard default values (0, false, unknown,…)
- Allowed domain lists / reference tables
- Mandatory audit columns:
    - created\_at
    - updated\_at
    - ingestion\_ts
    - source\_system

Priority: Critical

Reason: Without standardization, the silver layer becomes a swamp instead of a clean layer.

## High Priority: Structural Improvements

### Create a Proper Copper (Landing/ Staging) Layer

Bronze is raw; staging/copper is for light transformations (e.g., flattening json, renaming columns). Right now, bronze\_staging mixes concerns and confuses users.

Fix:

- Create new schema: copper\_domain
- Use copper for:
    - flattening
    - schema enforcement
    - landing tables before full cleaning

Priority: High

Timeline: 4–6 weeks

### Strengthen the Gold Layer With Proper Dimensions

Current gold is too thin. No shared dim tables exist.

Add:

- dim\_date
- dim\_country\_iso
- dim\_product
- dim\_customer
- dim\_extreme\_values / thresholds
- Slowly Changing Dimensions if applicable
- Conformed measures (e.g., revenue, margin, units)

Priority: High

Reason: Gold must become attractive for analysts; a strong dim model is the hook

### Column Name Standardization (NEW as requested)

#### Problems Today

- Inconsistent casing (CamelCase, snake\_case, mixed)
- Duplicated column names (e.g., id vs ID vs productId)
- Source-specific names leak (e.g., SKU\_ID vs item\_number)
- No shared dictionary

#### Create a Column Naming Standard

Rules:

1\. snake\_case for all tables (bronze may preserve source names).

2\. No spaces, no special characters.

3\. Consistent semantic prefixes, e.g.:

- dim\_ for dimension tables
- fact\_ for fact tables

4\. Reserved naming rules for common entities:

- \*\_id always primary key
- source\_system always origin indicator
- ingestion\_ts, created\_at, updated\_at mandatory for lineage

5\. Gold renaming dictionary that maps source names → standardized names.

Priority: High

Reason: Standard names are mandatory for interoperability, governance, and BI adoption.

## Medium Priority

### Reduce Schema Proliferation

Today you have:

- bronze\_pos\_eu, bronze\_pos\_fr, ...
- silver\_internal, silver\_reference, silver\_highjump\_historical, etc.

Fix: Adopt one of these models

#### Domain-first

- bronze\_pos
- silver\_pos
- gold\_pos
- bronze\_logistics
- silver\_logistics
- gold\_logistics

#### Layer-first

- bronze.pos
- bronze.highjump
- silver.pos
- gold.pos

## Long Term Improvements

### Implement Data Quality Monitoring

Add expectations using:

- Delta Live Tables expectations
- Unity Catalog data quality constraints
- Great Expectations / Deequ / Soda

### Metadata and Data Product Governance

- Data dictionary in Unity Catalog
- Ownership fields
- Certification of gold datasets
- Clear lifecycle policies

## 03\_06\_09 Months Plan

TBD
