# Project Workflow

## Simple Explanation

This project simulates how RTB-style rental data moves from messy source systems into trusted reporting and analytics.

## Workflow

1. Source systems create raw data:
   - landlord data
   - property data
   - tenant data
   - tenancy/rent data
   - dispute/case data

2. Raw CSV files are loaded into SQL source tables.

3. Data quality checks identify problems:
   - missing IDs
   - duplicate records
   - invalid emails
   - missing Eircodes
   - suspicious rent amounts
   - invalid references between tables

4. Clean staging tables store standardised records with:
   - is_valid
   - quality_issue_notes

5. Reporting tables will be created from valid and trusted data.

6. Power BI will show insights such as:
   - average rent by county
   - rent trends
   - dispute volumes
   - data quality issues
   - compliance risk

7. Later, APIs can expose clean data to other systems.