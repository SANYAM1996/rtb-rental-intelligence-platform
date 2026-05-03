-- Load sample CSV data into source tables.
-- Update file paths depending on your local machine or Azure/Fabric environment.

-- Example for SQL Server using BULK INSERT.
-- This may need path changes when running in Azure SQL or Fabric.

BULK INSERT landlord_source
FROM 'C:\path\to\rtb-rental-intelligence-platform\data\sample\landlord_source.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT property_source
FROM 'C:\path\to\rtb-rental-intelligence-platform\data\sample\property_source.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT tenant_source
FROM 'C:\path\to\rtb-rental-intelligence-platform\data\sample\tenant_source.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT tenancy_source
FROM 'C:\path\to\rtb-rental-intelligence-platform\data\sample\tenancy_source.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

BULK INSERT dispute_case_source
FROM 'C:\path\to\rtb-rental-intelligence-platform\data\sample\dispute_case_source.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);