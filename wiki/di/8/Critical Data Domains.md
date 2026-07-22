# Critical Data Domains

This page presents the proposed Data Domain and Subdomain framework for the Data Warehouse, developed by analyzing existing data assets and their business meaning. It also identifies which domains are represented in the BR files and therefore considered critical within the current scope, providing a consistent foundation for data classification and the future assignment of accountable Data Owners and Data Stewards.

Given the following identified data domains and subdomains using the following logic. A further step was performed to identify which of those domains/subdomains are included in the BR files which are critical assets for the Data Team and Clients.


## Data domains map

## Domain presence in BR files

This section summarizes the analysis of the BR files to identify which data domains and subdomains are represented in each file. The classification is based on the business meaning of the data, supported by specific fields found in each file, rather than solely on file names or technical structures. Because a single BR file may contain data from multiple domains, the table provides traceability between the file’s content, the assigned domain and subdomain, the supporting evidence, and the rationale for each classification. Domains identified in these files are considered critical within the scope of the Data Domain initiative.

The following BR Files where analyzed:

- **BR-01**
- **BR-02**
- **BR-07**
- **BR-08**
- **BR-10**

| **BR File** | **Primary Content** | **Domain** | **Subdomain** | **Evidence** | **Why This Classification** |
| --- | --- | --- | --- | --- | --- |
| BR-01 | Customer master | Customer | customer\_profile | CIF, type, BBD ID, name, CPF/CNPJ, Pershing ID, Q2 IDs | Identifies and describes the customer. |
| BR-01 | Customer relationship/status | Risk | kyc\_aml | ID valid, W-8 current, shared information | Represents compliance and tax-documentation controls. |
| BR-01 | Technical traceability | Operations | metadata | RecordID, created\_dt, Additional fields | Used to trace/load the dataset rather than describe a business object. |
| BR-02 | Account master and balance | Account | account\_core; account\_balance | Account number/type/status, dates, primary CIF, balance/date, new money | Describes the account and its account-level balance. |
| BR-02 | Financial performance | Finance | management\_accounting | Revenue MTD, profitability, non-interest income | Management reporting measures, not operational account balance. |
| BR-02 | Reusable codes | Reference | reference\_codes | Company, branch, product, officer, segment | Codes require shared definitions to interpret the account. |
| BR-07 | Deposit products | Deposit | deposit\_demand; deposit\_cd; deposit\_overnight | DDA, savings, Euro CDs, TimeDeposit | Explicit product categories. |
| BR-07 | Loan and card products | Loan | loan\_core; card\_credit | Letters of Credit, DMI Loan, Loan, Visa/Amex/EZ/credit cards | Explicit credit product categories. |
| BR-07 | Investment classifications | Treasury | securities\_positions | BradescoInvestUS, Pershing Cash/Investment, APEX, SEI | Classifies accounts associated with investment/custody platforms and positions. |
| BR-07 | Product-code dictionary | Reference | reference\_codes | Single-letter/group code, product short name, description | Authoritative mapping needed to interpret account/product types. |
| BR-08 | Customer-account linkage | Customer | customer\_relations | CIF, account number, relationship type, BBD ID | Connects customer and account and defines relationship. |
| BR-08 | Account reference | Account | account\_core | Account type and account number | Identifies the related account. |
| BR-09 | Monthly account balances | Account | account\_core; account\_balance | Account attributes, balance, average balance, new money | Account master and monthly balance measures. |
| BR-09 | Management performance | Finance | management\_accounting | Revenue, profitability, interest, FTP, NII, non-interest income/expense | Internal financial performance measures. |
| BR-10 | Security positions/valuation | Treasury | securities\_positions | Portfolio, ISIN, quantity, prices, position value, valuation balance, accrued interest | Security-level holdings and valuation are not generic account balances or trades. |
| BR-10 | Currency valuation | Treasury | fx | CCY, FX rate | Currency and FX rate are used in valuation. |
| BR-10 | Account/customer linkage | Account; Customer | account\_core; customer\_profile | Customer number, account number, CPF, Brazil account | Identifiers link positions to the account and customer. |
| BR-10 | Report traceability | Operations | metadata | Reference date, creation report date | Technical/reporting dates provide traceability. |

## Critical Domain Summary

| **Domain** | **Critical Subdomains Present** | **BR Files** | **Why Critical / Why Not** | **Priority** |
| --- | --- | --- | --- | --- |
| Account | account\_core; account\_balance | BR-02, BR-08, BR-09, BR-10 | Core account and balance data directly support the ability to show updated balances. | 1 - Highest |
| Customer | customer\_profile; customer\_relations | BR-01, BR-08, plus customer keys across files | Customer identity and customer-account relationships are required to associate balances and products with the correct client. | 1 - Highest |
| Risk | kyc\_aml | BR-01 | ID validation, W-8 status, tax identifiers, and information-sharing indicators are represented. | 2 - High |
| Deposit | deposit\_demand; deposit\_cd; deposit\_overnight | BR-07 | Demand, savings, CD, and time-deposit product classifications are explicitly present. | 2 - High |
| Loan | loan\_core; card\_credit | BR-07 | Loan, mortgage, letters of credit, and card-credit classifications are explicitly present. | 2 - High |
| Treasury | fx; securities\_positions | BR-10; BR-07 | BR-10 contains instrument positions, pricing, valuation, currency, and FX data. It does not contain executed trades. | 1 - Highest |
| Finance | management\_accounting | BR-02, BR-09 | Revenue, profitability, FTP, interest, and income/expense metrics are explicitly present. | 2 - High |
| Payments | None | None | No ACH or wire transaction content is present in the provided BR structures. | 3 - Retain only |
| Reference | reference\_codes | BR-07 and codes across files | Reusable product, account, relationship, branch, officer, currency, and status codes are necessary to interpret BR data. | 1 - Highest |
| Operations | metadata | BR-01, BR-02, BR-08, BR-09, BR-10 | Record IDs, creation dates, report/reference dates, and technical fields provide traceability. No explicit DQ results are present. | 3 - Supporting |

## Overall Assessment

Conception switch `Files → Fields → Categorization` to `Business Concepts → Canonical Entities → Data Products → Physical Models`

| Area | Assessment |
| --- | --- |
| Data Governance | Good |
| Business Classification | Good |
| Banking Domain Modeling | Moderate |
| ISO 20022 Alignment | Weak |
| BIAN Alignment | Moderate |
| Canonical Model Design | Weak |
| AI-Ready Data Platform Readiness | Weak-Moderate |
| Long-Term Maintainability | Moderate |

### Pros & Cons

Governance centric conceptions but ISO 20022 begins with business concepts and relationships, not products.

| **Pros** | **Cons** |
| --- | --- |
| organizational domains | canonical financial business entities |
| reporting domains | ISO 20022 business objects |
| product-oriented classifications | enterprise master data domains |

### Areas Mixed Inside Domain Hierarchy

| **Business Entities** | **Product Types** | **Functional Areas** | **Technical Areas** |
| --- | --- | --- | --- |
| 1. Customer 2. Account 3. Balance 4. Security Position 5. Fx Rate 6. Relationship | 1. Deposit 2. Loan 3. Credit Card | 1. Treasury (Function, not canonical entity) 2. Finance (Function) 3. Risk (Function/ Capability) 4. Compliance (Function) | 1. Operations 2. Metadata 3. Audit Data 4. Processing Information 5. Data Quality Results 6. Lineage Information |

### Overlaps

| **Concept** | **Belonging Domains** |
| --- | --- |
| Treasury account | 1. Account 2. Treasury |
| Deposit account | 1. Account 2. Deposit |
| Loan account | 1. Account 2. Loan |

### Grey Areas

#### Treasury to Split

Is a organizational function or not?

Treasury is usually:

- a business function
- a department
- an operating unit

```bash
Treasury
  - securities_positions
  - fx
```

Iso 20022

```bash
Market Data
    FX Rates

Investment Holdings
    Securities Positions

Portfolio
```

#### Account to Broad

Currently we have under account the following two account\_{core,balance}

It should be broader

```bash
Account
Account Balance
Account Ownership
Account Status
Account Relationship
```

#### Metadata to Business Domain

From Operations/Metadata to shared, Metadata should usually exist as a separate cross-cutting concern.

```bash
Platform Metadata
Data Lineage
Audit
Data Quality
Processing Metadata
```

#### Deposit & Loan to Product

A deposit is usually a product. A loan is usually a product. Neither is a fundamental business entity

```bash
Product
 ├── Deposit Product
 ├── Loan Product
 ├── Credit Card Product
 └── Investment Product
```

#### Product to Add

| Product Type | Current Domain | Recommended |
| --- | --- | --- |
| Deposit | Deposit | Product |
| Savings | Deposit | Product |
| CD | Deposit | Product |
| Loan | Loan | Product |
| Credit Card | Loan | Product |
| Mortgage | Loan | Product |

#### Customer to Party

ISO 20022 heavily relies on the concept of Party rather than Customer.

This becomes important later for:

- AML
- KYC
- Payments
- Securities
- BIAN
- MDM

```bash
Party
    Person
    Organization
    Customer
    Relationship Manager
    Beneficial Owner
```

#### Transaction to Add

ISO 20022 is fundamentally transaction-centric. Without a Transaction domain the model will eventually hit a scalability wall. Future banking platforms inevitably need:

```bash
Payment
Transfer
Settlement
Trade
Cash Movement
Adjustment
Fee
```

#### Gold/ Platinum/ Feature Store to be Increased

| **Before** | **After** |
| --- | --- |
| customeraccountdepositloantreasury | partyaccountproductpositiontransactionfinancial\_performancerisk\_compliancereference\_datamarket\_data |

## Final Scorecard

| Category | Score | Ease of Improvement |
| --- | --- | --- |
| Governance Exercise | 8/10 | Very Easy (+1 to +1.5 points) |
| Banking Domain Model | 6/10 | Moderate (+2 points) |
| ISO 20022 Alignment | 4/10 | Difficult (+4 points required) |
| Gold Layer Canonical Model | 5/10 | Moderate (+3 points) |
| Future AI/Data Product Readiness | 6/10 | Moderate (+2 points) |
| Metadata Separation | 5/10 | Easy (+2 points) |
| Domain Taxonomy Consistency | 5/10 | Easy (+3 points) |
| Enterprise MDM Readiness | 5/10 | Moderate (+3 points) |
