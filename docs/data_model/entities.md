# Core Entities

## 1. Landlord

Represents a person or organisation that owns or manages rental properties.

Example fields:
- landlord_id
- landlord_type
- landlord_name
- email
- phone
- registration_date
- status

## 2. Property

Represents a rental property registered with the RTB-like system.

Example fields:
- property_id
- landlord_id
- address_line_1
- county
- eircode
- property_type
- number_of_bedrooms
- registration_status
- registration_date

## 3. Tenancy

Represents a rental agreement between a tenant and landlord for a property.

Example fields:
- tenancy_id
- property_id
- landlord_id
- tenant_id
- rent_amount
- rent_frequency
- tenancy_start_date
- tenancy_end_date
- tenancy_status

## 4. Tenant

Represents a tenant linked to a tenancy.

Example fields:
- tenant_id
- tenant_reference
- county
- age_band
- tenancy_count

## 5. Dispute Case

Represents a complaint, dispute, or case raised against a tenancy/property/landlord.

Example fields:
- case_id
- tenancy_id
- property_id
- case_type
- case_priority
- case_status
- opened_date
- closed_date
- assigned_officer