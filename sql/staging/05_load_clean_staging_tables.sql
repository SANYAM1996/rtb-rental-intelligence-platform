-- Load cleaned landlord data into staging table

INSERT INTO stg_landlord (
    landlord_id,
    landlord_type,
    landlord_name,
    email,
    phone,
    registration_date,
    status,
    is_valid,
    quality_issue_notes
)
SELECT
    landlord_id,
    landlord_type,
    landlord_name,
    email,
    phone,
    registration_date,
    status,

    CASE
        WHEN landlord_id IS NULL OR landlord_id = '' THEN 0
        WHEN email NOT LIKE '%@%.%' THEN 0
        WHEN status NOT IN ('Active', 'Inactive') THEN 0
        ELSE 1
    END AS is_valid,

    CONCAT(
        CASE WHEN landlord_id IS NULL OR landlord_id = '' THEN 'Missing landlord_id; ' ELSE '' END,
        CASE WHEN email NOT LIKE '%@%.%' THEN 'Invalid email; ' ELSE '' END,
        CASE WHEN status NOT IN ('Active', 'Inactive') THEN 'Invalid status; ' ELSE '' END,
        CASE WHEN status = 'Active' AND (phone IS NULL OR phone = '') THEN 'Missing phone for active landlord; ' ELSE '' END
    ) AS quality_issue_notes

FROM landlord_source;