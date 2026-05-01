-- 03_import_data.sql
-- Imports raw CSV into staging table using MySQL LOCAL INFILE via Workbench
-- Run as root after table is created (01_create_tables.sql)
-- Update the INFILE path below to match your local data/raw/ directory
-- Note: LINES TERMINATED BY '\n' — if import returns 0 rows, try '\r\n'

TRUNCATE TABLE ida_loan_analysis.ida_statement_credits_grants_guarantees;

LOAD DATA LOCAL INFILE 'C:/project_path/data/raw/dataset.csv'
INTO TABLE ida_loan_analysis.ida_statement_credits_grants_guarantees
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    end_of_period, 
    credit_number, 
    region,
    country_code,
    country,
    borrower,
    credit_status,
    service_charge_rate,
    currency_of_commitment,
    project_id,
    project_name,
    original_principal_amount_us_,
    cancelled_amount_us_,
    undisbursed_amount_us_,
    disbursed_amount_us_,
    repaid_to_ida_us_,
    due_to_ida_us_,
    exchange_adjustment_us_,
    borrowers_obligation_us_,
    sold_3rd_party_us_,
    repaid_3rd_party_us_,
    due_3rd_party_us_,
    credits_held_us_,
    first_repayment_date,
    last_repayment_date,
    agreement_signing_date,
    board_approval_date,
    effective_date_most_recent,
    closed_date_most_recent,
    last_disbursement_date
);