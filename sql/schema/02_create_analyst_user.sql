-- 02_create_analyst_user.sql
-- Run as root after container is up.
-- Replace 'analyst_password' with the value from your .env before running.

CREATE USER IF NOT EXISTS 'analyst'@'%' IDENTIFIED BY 'analyst_password';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER
    ON `ida_loan_analysis`.*
    TO 'analyst'@'%';

FLUSH PRIVILEGES;
