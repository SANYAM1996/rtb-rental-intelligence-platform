-- Clean staging tables
-- These tables hold cleaned, standardised data after source quality checks.

CREATE TABLE stg_landlord (
    landlord_id VARCHAR(20) PRIMARY KEY,
    landlord_type VARCHAR(50),
    landlord_name VARCHAR(200),
    email VARCHAR(200),
    phone VARCHAR(50),
    registration_date DATE,
    status VARCHAR(50),
    is_valid BIT,
    quality_issue_notes VARCHAR(500)
);

CREATE TABLE stg_property (
    property_id VARCHAR(20) PRIMARY KEY,
    landlord_id VARCHAR(20),
    address_line_1 VARCHAR(200),
    address_line_2 VARCHAR(200),
    county VARCHAR(100),
    eircode VARCHAR(20),
    property_type VARCHAR(50),
    number_of_bedrooms INT,
    registration_status VARCHAR(50),
    registration_date DATE,
    is_valid BIT,
    quality_issue_notes VARCHAR(500)
);

CREATE TABLE stg_tenant (
    tenant_id VARCHAR(20) PRIMARY KEY,
    tenant_reference VARCHAR(50),
    county VARCHAR(100),
    age_band VARCHAR(20),
    is_valid BIT,
    quality_issue_notes VARCHAR(500)
);

CREATE TABLE stg_tenancy (
    tenancy_id VARCHAR(20) PRIMARY KEY,
    property_id VARCHAR(20),
    landlord_id VARCHAR(20),
    tenant_id VARCHAR(20),
    rent_amount DECIMAL(10,2),
    rent_frequency VARCHAR(50),
    tenancy_start_date DATE,
    tenancy_end_date DATE,
    tenancy_status VARCHAR(50),
    is_valid BIT,
    quality_issue_notes VARCHAR(500)
);

CREATE TABLE stg_dispute_case (
    case_id VARCHAR(20) PRIMARY KEY,
    tenancy_id VARCHAR(20),
    property_id VARCHAR(20),
    case_type VARCHAR(100),
    case_priority VARCHAR(50),
    case_status VARCHAR(50),
    opened_date DATE,
    closed_date DATE,
    assigned_officer VARCHAR(100),
    is_valid BIT,
    quality_issue_notes VARCHAR(500)
);