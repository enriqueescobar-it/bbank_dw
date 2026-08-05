# Tables design and structure

# Index and Subindex

1. Purpose and Scope
    1. Proposed Structure at a Glance
2. Why This Structure
3. Metadata Catalog Tables
    1. metadata\_data\_product
    2. metadata\_object
    3. metadata\_column
    4. metadata\_glossary
4. Pilot Platinum Tables
    1. nna\_transaction\_detail
    2. nna\_monthly\_summary
    3. transaction\_activity\_monthly
5. Relationships and Processing Rules
6. Implementation Recommendations
7. Reference Rationale

AI-ready data products for MCP and future AI consumption  
Pilot: NNA and Transaction Tracking 


This document defines the proposed metadata catalog and the three Platinum tables for the NNA and Transaction Tracking pilot. It is written for publication in Confluence and for technical review by Data, Governance, Architecture, AI and MCP teams. 

**Design principle  **Keep transaction facts separate from reusable metadata. The Platinum tables provide governed business-ready records and aggregates; the metadata tables explain what those assets mean, who owns them, how they may be used and how an AI service should discover them. 

### 1.1 Proposed Structure at a Glance

|  |  |  |
| --- | --- | --- |
| **Layer**  | **Tables**  | **Primary role**  |
| Metadata catalog  | metadata\_data\_product; metadata\_object; metadata\_column; metadata\_glossary  | Business context, ownership, discoverability, classification and definitions  |
| Pilot detail  | nna\_transaction\_detail  | Canonical governed transaction foundation  |
| Pilot summaries  | nna\_monthly\_summary; transaction\_activity\_monthly  | Approved monthly measures and trend features  |

 

## Why This Structure

The structure extends the practical idea of a consumption layer beyond generic Gold marts. The Platinum layer is use-case-oriented: it provides curated, secure and descriptively named objects for an AI product while preserving Gold as the trusted upstream business layer. This is consistent with commentary that modern AI workloads often need extensions to the classic Bronze/Silver/Gold model, including dedicated security, semantic and AI-consumption structures. 

For MCP, metadata is not optional decoration. AI agents need reliable schema, column and relationship context to avoid inventing tables, columns or joins. A dedicated product/object/column catalog gives the MCP service structured context that can be discovered and returned predictably. 

The separation also supports safer access. The data-product record declares whether MCP access is approved; object and column records expose only governed structures; database permissions and row-level security remain the enforcement layer. Production MCP implementations should be read-only by default, narrowly scoped, bounded and auditable. 

## Metadata Catalog Tables

The metadata catalog follows a simple hierarchy: one data product has many objects, and one object has many columns. Glossary terms provide reusable business language and synonyms. All names use lowercase snake\_case. 

### 3.1 metadata\_data\_product

**Purpose: **Registers the AI data product, its accountability, risk posture, lifecycle and approved consumption boundaries. 

**Grain: **One row per data product. 

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Column**  | **Suggested type**  | **Key**  | **Business definition**  | **Source**  |
| data\_product\_id  | bigint  | PK  | Unique identifier for the data product.  | System / Governance  |
| data\_product\_name  | varchar(200)  |   | Business-friendly name of the data product.  | Manual / Governance  |
| data\_product\_description  | varchar(max)  |   | Business description, purpose and intended outcomes.  | Manual / Governance  |
| domain\_name  | varchar(150)  |   | Primary governed data domain.  | Manual / Governance  |
| business\_line  | varchar(150)  |   | Business line served by the product.  | Manual / Governance  |
| business\_owner  | varchar(200)  |   | Accountable business owner.  | Manual / Governance  |
| data\_steward  | varchar(200)  |   | Responsible data steward.  | Manual / Governance  |
| classification  | varchar(50)  |   | Overall data classification level.  | Manual / Governance  |
| contains\_pii  | bit  |   | Indicates whether the product contains PII.  | Manual / Governance  |
| refresh\_frequency  | varchar(50)  |   | Expected refresh cadence.  | Manual / Governance  |
| is\_mcp\_accessible  | bit  |   | Indicates approval for exposure through MCP.  | Manual / Governance  |
| approved\_use\_cases  | varchar(max)  |   | Approved business and AI use cases.  | Manual / Governance  |
| unsupported\_use\_cases  | varchar(max)  |   | Restricted, unsupported or misleading uses.  | Manual / Governance  |
| status  | varchar(30)  |   | Lifecycle state such as proposed, active, deprecated.  | Manual / Governance  |

 

### 3.2 metadata\_object

**Purpose: **Documents each table or view delivered by the data product, including its purpose and row-level grain. 

**Grain: **One row per physical or logical object. 

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Column**  | **Suggested type**  | **Key**  | **Business definition**  | **Source**  |
| object\_id  | bigint  | PK  | Unique identifier for an object.  | System / Governance  |
| data\_product\_id  | bigint  | FK  | References metadata\_data\_product.  | Manual / Governance  |
| object\_name  | varchar(256)  |   | Physical or logical object name, preferably schema-qualified.  | Manual / Governance  |
| object\_type  | varchar(30)  |   | Object type such as table or view.  | Manual / Governance  |
| grain  | varchar(500)  |   | Business grain defining what one row represents.  | Manual / Governance  |
| description  | varchar(max)  |   | Business description and intended use of the object.  | Manual / Governance  |
| created\_at  | datetime2  |   | Record creation timestamp.  | System  |
| updated\_at  | datetime2  |   | Most recent metadata update timestamp.  | System  |

 

### 3.3 metadata\_column

**Purpose: **Provides the column-level context needed by people, governance processes and MCP schema discovery. 

**Grain: **One row per column per object. 

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Column**  | **Suggested type**  | **Key**  | **Business definition**  | **Source**  |
| column\_id  | bigint  | PK  | Unique identifier for a column record.  | System / Governance  |
| object\_id  | bigint  | FK  | References metadata\_object.  | Manual / Governance  |
| column\_name  | varchar(128)  |   | Physical column name.  | Manual / Governance  |
| business\_description  | varchar(max)  |   | Plain-language meaning and interpretation.  | Manual / Governance  |
| classification  | varchar(50)  |   | Column-level classification.  | Manual / Governance  |
| data\_type  | varchar(100)  |   | Database data type, including precision or length.  | System / Governance  |
| is\_pii  | bit  |   | Indicates PII.  | Manual / Governance  |
| is\_sensitive  | bit  |   | Indicates other sensitive or restricted information.  | Manual / Governance  |
| created\_at  | datetime2  |   | Record creation timestamp.  | System  |
| updated\_at  | datetime2  |   | Most recent metadata update timestamp.  | System  |

 

### 3.4 metadata\_glossary

**Purpose: **Provides approved definitions and synonyms so users and AI services interpret business language consistently. 

**Grain: **One row per glossary term. 

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Column**  | **Suggested type**  | **Key**  | **Business definition**  | **Source**  |
| glossary\_id  | bigint  | PK  | Unique identifier for the glossary term.  | System / Governance  |
| business\_term  | varchar(200)  |   | Approved business term.  | Manual / Governance  |
| definition  | varchar(max)  |   | Authoritative business definition.  | Manual / Governance  |
| synonyms  | varchar(500)  |   | Alternate names, acronyms or phrases used in questions.  | Manual / Governance  |
| related\_element  | varchar(500)  |   | Related table, column, metric or rule.  | Manual / Governance  |
| created\_at  | datetime2  |   | Record creation timestamp.  | System  |
| updated\_at  | datetime2  |   | Most recent metadata update timestamp.  | System  |

 

**Recommended refinement  **For the pilot, related\_element can remain a descriptive field. For scale, replace or supplement it with metadata\_glossary\_relation(glossary\_id, object\_id, column\_id, relationship\_type) so a term can be linked reliably to multiple catalog elements without storing a comma-separated list. 

## Pilot Platinum Tables

The pilot uses Gold Transaction History as the principal source and an Officer Reference table to derive business\_line. The detail table is the canonical foundation; the two monthly tables are derived summaries optimized for recurring business questions and AI analytics. 

### 4.1 nna\_transaction\_detail

**Purpose: **Canonical, governed transaction foundation used to produce monthly summaries and answer transaction-level questions. 

**Grain: **One row per account transaction. 

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Column**  | **Suggested type**  | **Key**  | **Business definition**  | **Source**  |
| account\_type  | varchar(50)  |   | Account type.  | Gold.Account\_Type  |
| account\_number  | varchar(50)  |   | Account number.  | Gold.Account\_Number  |
| transaction\_code  | varchar(30)  |   | Transaction code.  | Gold.Transaction\_Code  |
| transaction\_code\_description  | varchar(250)  |   | Business description of transaction code.  | Gold.Transaction\_Code\_Description  |
| transaction\_date  | date  |   | Transaction effective date.  | Gold.Transaction\_Date  |
| ach\_description  | varchar(250)  |   | ACH description.  | Gold.ACH\_Description  |
| flow\_direction  | char(1)  |   | I = inflow; O = outflow.  | Derived from Gold.I\_O  |
| cost\_center  | varchar(50)  |   | Cost center.  | Gold.Cost\_Center  |
| transaction\_amount  | decimal(19,4)  |   | Signed or normalized transaction amount.  | Gold.Amount  |
| officer  | varchar(50)  |   | Assigned officer identifier.  | Gold.officer  |
| customer\_number  | varchar(50)  |   | Customer identifier.  | Gold.Customer\_Number  |
| nna\_amount  | decimal(19,4)  |   | Approved Net New Assets amount.  | Gold.NNA  |
| customer\_name  | varchar(250)  |   | Customer display name.  | Gold.Customer\_Name  |
| group\_code  | varchar(50)  |   | Relationship group code.  | Gold.\[Group\]  |
| group\_name  | varchar(250)  |   | Relationship group name.  | Gold.Group\_Name  |
| relationship\_number  | varchar(50)  |   | Relationship identifier.  | Gold.Relationship\_Number  |
| relationship\_name  | varchar(250)  |   | Relationship name.  | Gold.Relationship\_Name  |
| year\_month  | char(6)  |   | Calendar month in YYYYMM format.  | Gold.YEARMONTH  |
| source\_created\_at  | datetime2  |   | Source record creation timestamp.  | Gold.CREATED\_DT  |
| business\_line  | varchar(150)  |   | Approved business line derived from officer mapping.  | Officer reference  |

 

### 4.2 nna\_monthly\_summary

**Purpose: **Provides approved monthly NNA measures and key counts for recurring questions and KPI analysis. 

**Grain: **One row per month, business line, officer, group, relationship and product class. 

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Column**  | **Suggested type**  | **Key**  | **Business definition**  | **Source**  |
| year\_month  | char(6)  |   | Year and month in YYYYMM format.  | Derived  |
| business\_line  | varchar(150)  |   | Business line.  | Detail  |
| officer\_id  | varchar(50)  |   | Officer identifier.  | Detail  |
| group\_code  | varchar(50)  |   | Group code.  | Detail  |
| group\_name  | varchar(250)  |   | Group name.  | Detail  |
| relationship\_number  | varchar(50)  |   | Relationship identifier.  | Detail  |
| relationship\_name  | varchar(250)  |   | Relationship name.  | Detail  |
| product\_class  | varchar(100)  |   | Governed product classification.  | Derived / Reference  |
| nna\_inflow\_amount  | decimal(19,4)  |   | Total approved NNA inflow.  | Aggregate  |
| nna\_outflow\_amount  | decimal(19,4)  |   | Total approved NNA outflow.  | Aggregate  |
| net\_new\_assets\_amount  | decimal(19,4)  |   | NNA inflow minus NNA outflow.  | Derived  |
| transaction\_count  | bigint  |   | Number of contributing transactions.  | Aggregate  |
| customer\_count  | bigint  |   | Number of distinct customers.  | Aggregate  |
| account\_count  | bigint  |   | Number of distinct accounts.  | Aggregate  |

 

### 4.3 transaction\_activity\_monthly

**Purpose: **Measures transaction behavior and month-over-month trends for anomaly detection, segmentation and conversational analytics. 

**Grain: **One row per month, customer, relationship, officer, transaction code and flow direction. 

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Column**  | **Suggested type**  | **Key**  | **Business definition**  | **Source**  |
| year\_month  | char(6)  |   | Year and month in YYYYMM format.  | Derived  |
| customer\_number  | varchar(50)  |   | Customer identifier.  | Detail  |
| relationship\_number  | varchar(50)  |   | Relationship identifier.  | Detail  |
| officer\_id  | varchar(50)  |   | Officer identifier.  | Detail  |
| transaction\_code  | varchar(30)  |   | Transaction code.  | Detail  |
| flow\_direction  | char(1)  |   | I = inflow; O = outflow.  | Detail  |
| transaction\_count  | bigint  |   | Number of transactions.  | Aggregate  |
| total\_transaction\_amount  | decimal(19,4)  |   | Total transaction amount.  | Aggregate  |
| inflow\_amount  | decimal(19,4)  |   | Total inflow amount.  | Aggregate  |
| outflow\_amount  | decimal(19,4)  |   | Total outflow amount.  | Aggregate  |
| average\_transaction\_amount  | decimal(19,4)  |   | Average transaction amount.  | Aggregate  |
| maximum\_transaction\_amount  | decimal(19,4)  |   | Maximum transaction amount.  | Aggregate  |
| prior\_month\_transaction\_count  | bigint  |   | Prior month transaction count.  | Derived  |
| prior\_month\_total\_amount  | decimal(19,4)  |   | Prior month total amount.  | Derived  |
| transaction\_count\_change\_pct  | decimal(9,4)  |   | Percentage change in count versus prior month.  | Derived  |
| transaction\_amount\_change\_pct  | decimal(9,4)  |   | Percentage change in total amount versus prior month.  | Derived  |

 

## Relationships and Processing Rules

|  |  |
| --- | --- |
| **Rule**  | **Definition**  |
| Product hierarchy  | metadata\_data\_product 1:M metadata\_object; metadata\_object 1:M metadata\_column.  |
| Detail to summaries  | Both monthly summaries are derived exclusively from governed nna\_transaction\_detail plus approved reference mappings.  |
| Officer mapping  | Join transaction officer to the approved Officer Reference using the documented key and effective-date rule.  |
| Flow direction  | Standardize values to I and O; reject or flag unexpected source values.  |
| NNA  | Use one approved calculation and sign convention. Document excluded transaction codes and exceptions.  |
| Month  | Derive year\_month from transaction\_date, not load date, unless business explicitly approves another rule.  |
| Security  | Apply row-level filtering using business\_line, team/officer entitlement or another approved access mapping.  |
| Auditability  | Retain source timestamps and add pipeline load timestamps, batch/run ID and data-quality status during implementation.  |


## Implementation Recommendations

|  |  |  |
| --- | --- | --- |
| **Priority**  | **Recommendation**  | **Reason**  |
| Required  | Add a stable transaction\_id or documented composite key to nna\_transaction\_detail.  | The stated grain needs a testable unique key.  |
| Required  | Add loaded\_at, pipeline\_run\_id and data\_quality\_status to Platinum objects.  | Supports lineage, troubleshooting and audit.  |
| Required  | Use IDs for owner/steward and business line where master data exists, while retaining names for readability.  | Names change and are weaker references.  |
| Recommended  | Create reference-value metadata for flow\_direction, classification, status, product\_class and transaction codes.  | Prevents inconsistent values and improves AI interpretation.  |
| Recommended  | Add effective dates to the officer-to-business-line mapping.  | Preserves correct historical attribution.  |
| Scale-up  | Normalize approved and unsupported use cases if many values must be queried independently.  | Avoids unstructured lists as the catalog grows.  |

 

## Reference Rationale

The references below support the architectural direction, not every physical column. The proposed columns are tailored to the pilot and governance needs. 

1. **Data Engineering Weekly, “Revisiting Medallion Architecture,” 2025.** Discusses extending the conventional medallion pattern for modern workloads, rather than treating Bronze/Silver/Gold as the final limit. <https://www.dataengineeringweekly.com/p/revisiting-medallion-architecture>  

1. **DBConvert Streams, “What a good database MCP server gets right,” June 17, 2026.** Supports read-only defaults, narrow tools, request scoping, bounded results and structured output. <https://streams.dbconvert.com/blog/what-a-good-database-mcp-server-gets-right/>  

1. **Ossama El Sanharawi, “Building AI Agents That Query SQL Databases,” October 22, 2025.** Shows MCP-based schema discovery and emphasizes least-privilege, read-only access for production. <https://medium.com/@elsossama/building-ai-agents-that-query-sql-databases-two-practical-methods-mcp-server-langchain-00d5007d6e05>  

1. **IBM Developer, “Build context-aware AI apps using MCP,” July 23, 2025.** Supports MCP as a standardized client-server context layer connecting AI applications with enterprise data and tools. <https://dev.to/ibmdeveloper/build-context-aware-ai-apps-using-mcp-3mhg>  

1. **Exasol, “What If Your Database Could Talk to AI? (MCP),” July 24, 2026.** Directly supports live metadata discovery to ground table names, columns, types and relationships, reducing guesses in generated SQL. <https://www.exasol.com/blog/database-talk-to-ai-mcp/>  
