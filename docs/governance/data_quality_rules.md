# Data Quality Rules

## Purpose

This document defines the validation rules used to assess source data quality before it is loaded into trusted reporting layers.

## Landlord Rules

| Rule ID | Field | Rule | Severity |
|---|---|---|---|
| LQ001 | landlord_id | Must not be null | Critical |
| LQ002 | landlord_id | Must be unique | Critical |
| LQ003 | email | Must contain @ and a valid domain | High |
| LQ004 | phone | Should not be null for active landlords | Medium |
| LQ005 | status | Must be Active or Inactive | High |

## Property Rules

| Rule ID | Field | Rule | Severity |
|---|---|---|---|
| PQ001 | property_id | Must not be null | Critical |
| PQ002 | property_id | Must be unique | Critical |
| PQ003 | landlord_id | Must exist in landlord_source | Critical |
| PQ004 | eircode | Should not be null | High |
| PQ005 | registration_status | Must be Registered, Expired, or Pending | High |

## Tenant Rules

| Rule ID | Field | Rule | Severity |
|---|---|---|---|
| TQ001 | tenant_id | Must not be null | Critical |
| TQ002 | tenant_id | Must be unique | Critical |
| TQ003 | age_band | Should not be null | Medium |

## Tenancy Rules

| Rule ID | Field | Rule | Severity |
|---|---|---|---|
| TNQ001 | tenancy_id | Must not be null | Critical |
| TNQ002 | tenancy_id | Must be unique | Critical |
| TNQ003 | property_id | Must exist in property_source | Critical |
| TNQ004 | landlord_id | Must exist in landlord_source | Critical |
| TNQ005 | tenant_id | Must exist in tenant_source | Critical |
| TNQ006 | rent_amount | Must be greater than 0 | Critical |
| TNQ007 | rent_amount | Monthly rent below 300 or above 5000 should be flagged | High |
| TNQ008 | tenancy_status | Must be Active or Closed | High |

## Dispute Case Rules

| Rule ID | Field | Rule | Severity |
|---|---|---|---|
| CQ001 | case_id | Must not be null | Critical |
| CQ002 | tenancy_id | Must exist in tenancy_source | Critical |
| CQ003 | property_id | Must exist in property_source | Critical |
| CQ004 | case_type | Must be Rent Dispute, Deposit Issue, Maintenance, or Eviction | High |
| CQ005 | case_status | Must be Open or Closed | High |
| CQ006 | closed_date | Must be populated when case_status is Closed | High |