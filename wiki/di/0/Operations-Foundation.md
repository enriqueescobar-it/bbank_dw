# Operations\-Foundation

# Modern AI-Data Stack

For a Databricks, Snowflake, Fabric, or AWS Lakehouse environment.

```bash
SDLC                → Software Product
Data Product        → Trusted Data Asset
Data Science (DSLC) → Trained Predictive Model
MLOps               → Operationalized ML Service
LLMOps              → Operationalized GenAI System
```

| Layer | Owner | Framework |  |
| --- | --- | --- | --- |
| Application Layer | Software Engineering | SDLC | Applications consuming data and AI |
| Data Operations Layer | Data Scientist | DSLC | Experiments, features, trained models |
| Data Platform Layer | Data Engineering | Data Product Lifecycle | Gold layer, semantic models, governed datasets |
| Prediction Layer | Data Science | MLOps Lifecycle | Production ML services and monitoring |
| Generative AI Layer | AI Engineering | LLMOps Lifecycle | RAG, AI assistants, agents, copilots |

```bash
Lakehouse Foundation
Landing/ Staging/ Bronze/ Silver
-------------------------
        │
Business Capability
-------------------------
        │
        ▼
Data Product Lifecycle
        │
Gold Layer
Semantic Layer
Data Products
-------------------------
        │
        ▼
Data Science Lifecycle
-------------------------
        │
        ▼
MLOps Lifecycle
        │
    MLOps
        │
        ▼
    ML Models
-------------------------
        │
        ▼
LLMOps Lifecycle
        │
        ▼
      LLMOps
        │
        ▼
AI Agents / Copilots
-------------------------
        │
        ▼
Applications (SDLC)
```

# Modern Folder Structure for AI-Data Stack

## DevOps

```bash
devops-infra/
├── .azuredevops
│   └── azure-pipelines.yml
├── .github
│   ├── CODEOWNERS
│   ├── pull_request_template.md
│   └── workflows
│       ├── ci.yml
│       ├── dbx-validate.yml
│       └── terraform-plan.yml
├── copier.yml
└── infra
    ├── .terraform-docs.yml
    ├── .tflint.hcl
    ├── ansible
    │   ├── group_vars
    │   │   └── .gitkeep
    │   ├── inventory
    │   │   └── .gitkeep
    │   ├── playbooks
    │   │   └── .gitkeep
    │   └── roles
    │       └── .gitkeep
    ├── environments
    │   ├── dev
    │   │   ├── backend.tfvars
    │   │   └── terraform.tfvars
    │   ├── prod
    │   │   ├── backend.tfvars
    │   │   └── terraform.tfvars
    │   ├── sandbox
    │   │   ├── backend.tfvars
    │   │   └── terraform.tfvars
    │   └── staging
    │       ├── backend.tfvars
    │       └── terraform.tfvars
    ├── helm
    │   └── README.md
    ├── kubernetes
    │   ├── manifests
    │   │   └── .gitkeep
    │   └── README.md
    ├── modules
    │   ├── compliance
    │   │   └── .gitkeep
    │   ├── iam
    │   │   └── .gitkeep
    │   └── network
    │       └── .gitkeep
    ├── pipelines
    │   ├── tf-apply.yml
    │   └── tf-plan.yml
    ├── policies
    │   ├── compliance
    │   │   └── .gitkeep
    │   ├── iam
    │   │   └── .gitkeep
    │   └── network
    │       └── .gitkeep
    ├── README.md
    ├── scripts
    │   └── .gitkeep
    └── terraform
        ├── backend.tf
        ├── data.tf
        ├── locals.tf
        ├── main.tf
        ├── outputs.tf
        ├── providers.tf
        ├── variables.tf
        └── versions.tf
```

## DataOps

```bash
dataops-infra/
├── copier.yml
└── dataops
    ├── configs
    │   ├── airflow
    │   │   └── .gitkeep
    │   ├── gx
    │   │   └── .gitkeep
    │   └── kafka
    │       └── .gitkeep
    ├── data_contracts
    │   ├── owners
    │   │   └── .gitkeep
    │   ├── quality_rules
    │   │   └── .gitkeep
    │   ├── schemas
    │   │   └── README.md
    │   └── sla
    │       └── .gitkeep
    ├── data_quality
    │   └── gx
    │       └── .gitkeep
    ├── governance
    │   ├── glossary
    │   │   └── .gitkeep
    │   ├── naming
    │   │   └── .gitkeep
    │   └── ownership
    │       └── .gitkeep
    ├── ingestion
    │   ├── cdc
    │   │   └── .gitkeep
    │   ├── connectors
    │   │   └── .gitkeep
    │   └── schemas
    │       └── README.md
    ├── lineage
    │   ├── extractors
    │   │   └── .gitkeep
    │   ├── namespaces
    │   │   └── .gitkeep
    │   └── openlineage
    │       └── .gitkeep
    ├── observability
    │   ├── alerts
    │   │   └── .gitkeep
    │   ├── monitors
    │   │   └── .gitkeep
    │   ├── routing
    │   │   └── .gitkeep
    │   ├── runbooks.md
    │   └── telemetry
    │       └── .gitkeep
    ├── orchestration
    │   ├── airflow
    │   │   └── .gitkeep
    │   ├── MIGRATION.md
    │   └── prefect
    │       └── .gitkeep
    ├── README.md
    ├── tests
    │   ├── e2e
    │   │   └── .gitkeep
    │   ├── fixtures
    │   │   ├── .gitkeep
    │   │   └── ingestion
    │   │       └── .gitkeep
    │   └── integration
    │       └── .gitkeep
    └── transformation
        └── dbt
            ├── analyses
            │   └── .gitkeep
            ├── dbt_project.yml
            ├── macros
            │   └── .gitkeep
            ├── models
            │   └── .gitkeep
            ├── packages.yml
            ├── seeds
            │   └── .gitkeep
            ├── snapshots
            │   └── .gitkeep
            └── tests
                └── .gitkeep
```

## SemanticOps

```bash
semantic-infra
├── copier.yml
└── dataops
    ├── bi
    │   ├── genie
    │   │   └── .gitkeep
    │   └── sigma_bi
    │       └── .gitkeep
    ├── contracts
    │   ├── metric_slas
    │   │   └── .gitkeep
    │   ├── output_schemas
    │   │   └── .gitkeep
    │   └── README.md
    ├── databricks_metrics
    │   ├── certifications
    │   │   └── .gitkeep
    │   ├── metric_views
    │   │   ├── .gitkeep
    │   │   ├── gold_bi
    │   │   │   └── .gitkeep
    │   │   └── platinum_bi
    │   │       └── .gitkeep
    │   ├── permissions
    │   │   └── .gitkeep
    │   └── smoke_tests
    │       └── .gitkeep
    ├── dbt_semantic
    │   ├── exports
    │   │   └── .gitkeep
    │   ├── saved_queries
    │   │   └── .gitkeep
    │   ├── semantic_models
    │   │   ├── .gitkeep
    │   │   ├── dimensions
    │   │   │   └── .gitkeep
    │   │   └── entities
    │   │       └── .gitkeep
    │   └── tests
    │       └── .gitkeep
    ├── entities
    │   └── .gitkeep
    ├── metrics
    │   ├── finance
    │   │   └── .gitkeep
    │   ├── hr
    │   │   └── .gitkeep
    │   ├── README.md
    │   ├── sales
    │   │   └── .gitkeep
    │   └── supply_chain
    │       └── .gitkeep
    ├── README.md
    └── tests
        ├── certification_checks
        │   └── .gitkeep
        └── integration
            └── .gitkeep
```

# Lifecycle Side-by-Side Comparison

| Phase | SDLC | DSLC | Data Product Lifecycle | MLOps Lifecycle | LLMOps Lifecycle |
| --- | --- | --- | --- | --- | --- |
| 1 | Business Requirements |  | Business Domain Identification | Business Problem Definition | AI Use Case Definition |
| 2 | Solution Design |  | Data Product Design | Data Understanding | Knowledge Source Discovery |
| 3 | Development |  | Data Acquisition | Feature Engineering | Document Acquisition |
| 4 | Testing |  | Transformation & Modeling | Model Development | Chunking & Embeddings |
| 5 | Deployment |  | Publish Data Product | Model Validation | RAG / Prompt Development |
| 6 | Operations |  | Consumption & Adoption | Deployment | Evaluation & Guardrails |
| 7 | Maintenance |  | Monitoring & Quality | Monitoring | Deployment |
| 8 | Enhancement |  | Continuous Improvement | Retraining | Monitoring & Continuous Learning |

# Enterprise Lifecycle Comparison Matrix

|  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- |
| Phase | SDLC | DSLC | Data Product Lifecycle | MLOps Lifecycle | LLMOps Lifecycle |
| 1. Strategy & Discovery | Business Requirements Definition | Business Problem Definition | Business Domain Definition - Identification | Business Problem ML Definition | AI Use Case Definition |
| 1. Design & Analysis | Solution Design | Data Understanding & Exploration | Data Product Design | Data Understand & Assessment | Knowledge Source Discovery |
| 1. Foundation Build | Setup development foundation | Data Preparation & Feature Engineering | Data Acquisition | Feature Engineering | Document Acquisition |
| 1. Core Development | Develop application | Model Development & Experimentation | Transformation & Modeling | Model Development & Training | Chunking & Embeddings |
| 1. Validation & Readiness | Test and validate solution | Model Evaluation & Validation | Certify and govern product | Validate model performance | Evaluate prompts and guardrails |
| 1. Production Deployment | Deploy application | Deploy Predictive Solution | Publish data product | Deploy model | Deploy AI system |
| 1. Operations & Monitoring | Operate and monitor application | Monitor Model Performance | Monitor data product quality | Monitor model behavior | Monitor AI quality, safety, and cost |
| 1. Continuous Evolution | Enhance and modernize | Retrain and Improve Models | Improve and evolve product | Retrain and optimize | Continuously learn and optimize |

# Agile Mapping Across All Four Lifecycles

A useful way to operationalize this in Azure DevOps, Jira, or GitHub Projects:

| Agile Level | SDLC | DSLC | Data Product Lifecycle | MLOps Lifecycle | LLMOps Lifecycle |
| --- | --- | --- | --- | --- | --- |
| Epic | Customer Portal | Product churn prediction modelling | Customer 360 Product | Churn Prediction | Customer Support Copilot |
| Feature | Account Management | Customer Feature Store | Customer Dimension | Feature Store | RAG Knowledge Base |
| Story | Build Login API | Build Platinum Customer Features | Build Gold Customer Table | Engineer Features | Build Embeddings |
| Task | Create Endpoint | Train model | Write dbt Model | Tune XGBoost | Create Vector Index |

# Children
