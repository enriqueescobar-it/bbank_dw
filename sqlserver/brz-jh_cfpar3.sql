-- NAME: BRONZE_JH_CFPAR3
-- CATEGORY: MODEL
-- MATURITY LEVEL: 0
-- LAYER: BRONZE
-- FREQUENCY: MONTHLY
-- LOAD TYPE: FULL LOAD
-- TYPE: SOURCE
-- DATE: November 24, 2025



WITH data as (
   SELECT * FROM (
   VALUES
        ('', '1' , 'Marital Status', 'D', 'Divorce'),
        ('', '1' , 'Marital Status', 'S', 'Single'),
        ('', '1' , 'Marital Status', 'U', 'Unknown'),
        ('', '1' , 'Marital Status', 'M', 'Married'),
        ('', '1' , 'Marital Status', 'W', 'Widowed'),
        ('', '2' , 'Electronic Banking Services', 'A', 'ATM Card'),
        ('', '2' , 'Electronic Banking Services', 'C', 'Credit Card Visa'),
        ('', '2' , 'Electronic Banking Services', 'E', 'ATM & Debit Visa/MC'),
        ('', '2' , 'Electronic Banking Services', 'G', 'ATM & Master Card CC'),
        ('', '2' , 'Electronic Banking Services', 'I', 'All'),
        ('', '2' , 'Electronic Banking Services', 'B', 'Debit Card Visa/MC'),
        ('', '2' , 'Electronic Banking Services', 'D', 'Credit Card MC'),
        ('', '2' , 'Electronic Banking Services', 'F', 'ATM & Visa CC'),
        ('', '2' , 'Electronic Banking Services', 'H', 'Debit & Credit'),
        ('', '2' , 'Electronic Banking Services', 'J', 'None'),
        ('', '2' , 'Electronic Banking Services', 'K', 'PBFConnection Email'),
        ('', '2' , 'Electronic Banking Services', 'L', 'PBF Online Banking'),
        ('', '3' , 'HIGH', '1', 'PEP'),
        ('', '3' , 'HIGH', '2', 'HIG VOLUME'),
        ('', '3' , 'HIGH', '3', ''),
        ('', '4' , 'Non Insiders Codes', 'A', 'Affiliate'),
        ('', '4' , 'Non Insiders Codes', 'F', 'Forclosure Account'),
        ('', '4' , 'Non Insiders Codes', 'C', 'Director-Affiliate'),
        ('', '4' , 'Non Insiders Codes', 'G', 'Group Employee'),
        ('', '4' , 'Non Insiders Codes', 'H', 'Representative Offic'),
        ('', '4' , 'Non Insiders Codes', 'I', 'Rep Offices Employee'),
        ('', '4' , 'Non Insiders Codes', 'S', 'Shareholder-Under10%'),
        ('', '4' , 'Non Insiders Codes', 'U', 'Subsidiary'),
        ('', '4' , 'Non Insiders Codes', 'Z', 'Officer-Other Bank'),
        ('', '4' , 'Non Insiders Codes', 'W', 'Waive')
) AS t (CP3RID,CP3UIC,CP3UID,CP3UCD,CP3DSC)
)

SELECT *, GETUTCDATE() AS LOADED_AT FROM data