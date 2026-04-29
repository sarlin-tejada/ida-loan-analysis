-- 01_create_tables.sql
-- Raw import table — all columns stored as VARCHAR, mirrors source data dictionary exactly
-- Source: IDA Statement of Credits, Grants and Guarantees (World Bank, April 10, 2026)

USE ida_loan_analysis;
CREATE TABLE IF NOT EXISTS ida_statement_credits_grants_guarantees (
    id                              INT AUTO_INCREMENT PRIMARY KEY,
    end_of_period                   VARCHAR(255),
    credit_number                   VARCHAR(255),
    region                          VARCHAR(255),
    country_code                    VARCHAR(255),
    country                         VARCHAR(255),
    borrower                        VARCHAR(255),
    credit_status                   VARCHAR(255),
    service_charge_rate             VARCHAR(255),
    currency_of_commitment          VARCHAR(255),
    project_id                      VARCHAR(255),
    project_name                    VARCHAR(255),
    original_principal_amount_us_   VARCHAR(255),
    cancelled_amount_us_            VARCHAR(255),
    undisbursed_amount_us_          VARCHAR(255),
    disbursed_amount_us_            VARCHAR(255),
    repaid_to_ida_us_               VARCHAR(255),
    due_to_ida_us_                  VARCHAR(255),
    exchange_adjustment_us_         VARCHAR(255),
    borrowers_obligation_us_        VARCHAR(255),
    sold_3rd_party_us_              VARCHAR(255),
    repaid_3rd_party_us_            VARCHAR(255),
    due_3rd_party_us_               VARCHAR(255),
    credits_held_us_                VARCHAR(255),
    first_repayment_date            VARCHAR(255),
    last_repayment_date             VARCHAR(255),
    agreement_signing_date          VARCHAR(255),
    board_approval_date             VARCHAR(255),
    effective_date_most_recent      VARCHAR(255),
    closed_date_most_recent         VARCHAR(255),
    last_disbursement_date          VARCHAR(255)
);