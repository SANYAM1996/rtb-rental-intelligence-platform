# Source Tables

## landlord_source

Raw landlord registration data.

Key fields:
- landlord_id
- landlord_type
- landlord_name
- email
- phone
- registration_date
- status

## property_source

Raw property registration data.

Key fields:
- property_id
- landlord_id
- address_line_1
- address_line_2
- county
- eircode
- property_type
- number_of_bedrooms
- registration_status
- registration_date

## tenant_source

Raw tenant reference data.

Key fields:
- tenant_id
- tenant_reference
- county
- age_band

## tenancy_source

Raw tenancy/rent agreement data.

Key fields:
- tenancy_id
- property_id
- landlord_id
- tenant_id
- rent_amount
- rent_frequency
- tenancy_start_date
- tenancy_end_date
- tenancy_status

## dispute_case_source

Raw dispute and complaint case data.

Key fields:
- case_id
- tenancy_id
- property_id
- case_type
- case_priority
- case_status
- opened_date
- closed_date
- assigned_officer