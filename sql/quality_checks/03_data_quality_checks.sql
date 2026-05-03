-- =====================================================
-- LANDLORD QUALITY CHECKS
-- =====================================================

-- LQ001: landlord_id must not be null
SELECT *
FROM landlord_source
WHERE landlord_id IS NULL OR landlord_id = '';

-- LQ002: landlord_id must be unique
SELECT landlord_id, COUNT(*) AS duplicate_count
FROM landlord_source
GROUP BY landlord_id
HAVING COUNT(*) > 1;

-- LQ003: email must contain @ and valid-looking domain
SELECT *
FROM landlord_source
WHERE email NOT LIKE '%@%.%';

-- LQ004: phone should not be null for active landlords
SELECT *
FROM landlord_source
WHERE status = 'Active'
  AND (phone IS NULL OR phone = '');

-- LQ005: status must be Active or Inactive
SELECT *
FROM landlord_source
WHERE status NOT IN ('Active', 'Inactive');


-- =====================================================
-- PROPERTY QUALITY CHECKS
-- =====================================================

-- PQ001: property_id must not be null
SELECT *
FROM property_source
WHERE property_id IS NULL OR property_id = '';

-- PQ002: property_id must be unique
SELECT property_id, COUNT(*) AS duplicate_count
FROM property_source
GROUP BY property_id
HAVING COUNT(*) > 1;

-- PQ003: landlord_id must exist in landlord_source
SELECT p.*
FROM property_source p
LEFT JOIN landlord_source l
    ON p.landlord_id = l.landlord_id
WHERE l.landlord_id IS NULL;

-- PQ004: eircode should not be null
SELECT *
FROM property_source
WHERE eircode IS NULL OR eircode = '';

-- PQ005: registration_status must be Registered, Expired, or Pending
SELECT *
FROM property_source
WHERE registration_status NOT IN ('Registered', 'Expired', 'Pending');


-- =====================================================
-- TENANT QUALITY CHECKS
-- =====================================================

-- TQ001: tenant_id must not be null
SELECT *
FROM tenant_source
WHERE tenant_id IS NULL OR tenant_id = '';

-- TQ002: tenant_id must be unique
SELECT tenant_id, COUNT(*) AS duplicate_count
FROM tenant_source
GROUP BY tenant_id
HAVING COUNT(*) > 1;

-- TQ003: age_band should not be null
SELECT *
FROM tenant_source
WHERE age_band IS NULL OR age_band = '';


-- =====================================================
-- TENANCY QUALITY CHECKS
-- =====================================================

-- TNQ001: tenancy_id must not be null
SELECT *
FROM tenancy_source
WHERE tenancy_id IS NULL OR tenancy_id = '';

-- TNQ002: tenancy_id must be unique
SELECT tenancy_id, COUNT(*) AS duplicate_count
FROM tenancy_source
GROUP BY tenancy_id
HAVING COUNT(*) > 1;

-- TNQ003: property_id must exist in property_source
SELECT t.*
FROM tenancy_source t
LEFT JOIN property_source p
    ON t.property_id = p.property_id
WHERE p.property_id IS NULL;

-- TNQ004: landlord_id must exist in landlord_source
SELECT t.*
FROM tenancy_source t
LEFT JOIN landlord_source l
    ON t.landlord_id = l.landlord_id
WHERE l.landlord_id IS NULL;

-- TNQ005: tenant_id must exist in tenant_source
SELECT t.*
FROM tenancy_source t
LEFT JOIN tenant_source te
    ON t.tenant_id = te.tenant_id
WHERE te.tenant_id IS NULL;

-- TNQ006: rent_amount must be greater than 0
SELECT *
FROM tenancy_source
WHERE rent_amount <= 0;

-- TNQ007: suspicious monthly rent
SELECT *
FROM tenancy_source
WHERE rent_frequency = 'Monthly'
  AND (rent_amount < 300 OR rent_amount > 5000);

-- TNQ008: tenancy_status must be Active or Closed
SELECT *
FROM tenancy_source
WHERE tenancy_status NOT IN ('Active', 'Closed');


-- =====================================================
-- DISPUTE CASE QUALITY CHECKS
-- =====================================================

-- CQ001: case_id must not be null
SELECT *
FROM dispute_case_source
WHERE case_id IS NULL OR case_id = '';

-- CQ002: tenancy_id must exist in tenancy_source
SELECT c.*
FROM dispute_case_source c
LEFT JOIN tenancy_source t
    ON c.tenancy_id = t.tenancy_id
WHERE t.tenancy_id IS NULL;

-- CQ003: property_id must exist in property_source
SELECT c.*
FROM dispute_case_source c
LEFT JOIN property_source p
    ON c.property_id = p.property_id
WHERE p.property_id IS NULL;

-- CQ004: case_type must be valid
SELECT *
FROM dispute_case_source
WHERE case_type NOT IN ('Rent Dispute', 'Deposit Issue', 'Maintenance', 'Eviction');

-- CQ005: case_status must be Open or Closed
SELECT *
FROM dispute_case_source
WHERE case_status NOT IN ('Open', 'Closed');

-- CQ006: closed_date must be populated when case_status is Closed
SELECT *
FROM dispute_case_source
WHERE case_status = 'Closed'
  AND closed_date IS NULL;