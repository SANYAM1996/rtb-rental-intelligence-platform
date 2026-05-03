CREATE TABLE landlord_source (
    landlord_id VARCHAR(20),
    landlord_type VARCHAR(50),
    landlord_name VARCHAR(200),
    email VARCHAR(200),
    phone VARCHAR(50),
    registration_date DATE,
    status VARCHAR(50)
);

CREATE TABLE property_source (
    property_id VARCHAR(20),
    landlord_id VARCHAR(20),
    address_line_1 VARCHAR(200),
    address_line_2 VARCHAR(200),
    county VARCHAR(100),
    eircode VARCHAR(20),
    property_type VARCHAR(50),
    number_of_bedrooms INT,
    registration_status VARCHAR(50),
    registration_date DATE
);

CREATE TABLE tenant_source (
    tenant_id VARCHAR(20),
    tenant_reference VARCHAR(50),
    county VARCHAR(100),
    age_band VARCHAR(20)
);

CREATE TABLE tenancy_source (
    tenancy_id VARCHAR(20),
    property_id VARCHAR(20),
    landlord_id VARCHAR(20),
    tenant_id VARCHAR(20),
    rent_amount DECIMAL(10,2),
    rent_frequency VARCHAR(50),
    tenancy_start_date DATE,
    tenancy_end_date DATE,
    tenancy_status VARCHAR(50)
);

CREATE TABLE dispute_case_source (
    case_id VARCHAR(20),
    tenancy_id VARCHAR(20),
    property_id VARCHAR(20),
    case_type VARCHAR(100),
    case_priority VARCHAR(50),
    case_status VARCHAR(50),
    opened_date DATE,
    closed_date DATE,
    assigned_officer VARCHAR(100)
);