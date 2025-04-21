# IMAGO Data Coding Challenge

This repository contains my submission for the IMAGO Data coding challenge. It includes both exploratory data analysis (EDA) 
and a proposed modern data pipeline using dbt and Snowflake.


# Part 1: Data Analysis & Understanding

The `notebooks/` directory contains a full exploratory notebook that tackles the initial diagnostic questions using `pandas`.

# Key questions answered:
- How many positions are linked to invoices missing payment info?
- How much revenue is attributed to the placeholder media ID `100000000`?
- How many invoices have no positions attached? 

  *Includes data type fixes, targeted quality checks, orphaned record analysis, and revenue attribution logic.*


## Part 2: Data Pipeline Proposal (dbt)

The `dbt/` directory mimics the structure of a dbt project and contains SQL models that represent a clean, modular transformation pipeline.

### Pipeline Structure

| Layer        | Purpose |
|--------------|---------|
| `staging/`   | Light cleaning and standardization of raw data |
| `intermediate/` | Filtering, validation, flagging of placeholder/invalid records |
| `marts/`     | Final fact and dimension tables for reporting (e.g. `fct_revenue`, `dim_customers`) |
| `tests/`     | Custom SQL-based tests to catch data issues (e.g. orphaned invoices, invalid characters) |

Includes data quality checks using `schema.yml` and `dbt-expectations`.

---

## Architecture Summary

- Data is ingested from legacy sources (Excel, Access) via SSIS pipelines
- Loaded into Snowflake's `raw` layer
- Transformed using dbt across structured layers: `staging` → `intermediate` → `marts`
- Tableau dashboards connect directly to production-ready models
- All failing rows are stored in a `tests` schema for review

 *Architecture Diagram Included in Presentation


## Communication & Stakeholder Awareness

This project also considers business alignment and risks. Specific conversations have been mapped for:

- Finance
- Accounting
- Sales
- BI/Analytics
- Backoffice
- Data Governance

