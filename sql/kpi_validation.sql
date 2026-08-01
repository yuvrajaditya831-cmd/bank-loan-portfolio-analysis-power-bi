/*
    Bank Loan Analysis - KPI Validation
    Author: Yuvraj Aditya
    SQL dialect: Microsoft SQL Server
    Source table: bank_loan_data
*/

-- ============================================================
-- A. BANK LOAN REPORT | SUMMARY
-- ============================================================

-- Total Loan Applications
SELECT COUNT(id) AS Total_Applications
FROM bank_loan_data;

-- MTD Loan Applications
SELECT COUNT(id) AS Total_Applications
FROM bank_loan_data
WHERE MONTH(issue_date) = 12;

-- PMTD Loan Applications
SELECT COUNT(id) AS Total_Applications
FROM bank_loan_data
WHERE MONTH(issue_date) = 11;

-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data;

-- MTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 12;

-- PMTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 11;

-- Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected
FROM bank_loan_data;

-- MTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected
FROM bank_loan_data
WHERE MONTH(issue_date) = 12;

-- PMTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected
FROM bank_loan_data
WHERE MONTH(issue_date) = 11;

-- Average Interest Rate
SELECT AVG(int_rate) * 100 AS Avg_Int_Rate
FROM bank_loan_data;

-- MTD Average Interest Rate
SELECT AVG(int_rate) * 100 AS MTD_Avg_Int_Rate
FROM bank_loan_data
WHERE MONTH(issue_date) = 12;

-- PMTD Average Interest Rate
SELECT AVG(int_rate) * 100 AS PMTD_Avg_Int_Rate
FROM bank_loan_data
WHERE MONTH(issue_date) = 11;

-- Average DTI
SELECT AVG(dti) * 100 AS Avg_DTI
FROM bank_loan_data;

-- MTD Average DTI
SELECT AVG(dti) * 100 AS MTD_Avg_DTI
FROM bank_loan_data
WHERE MONTH(issue_date) = 12;

-- PMTD Average DTI
SELECT AVG(dti) * 100 AS PMTD_Avg_DTI
FROM bank_loan_data
WHERE MONTH(issue_date) = 11;


-- ============================================================
-- GOOD LOAN KPIs
-- ============================================================

-- Good Loan Percentage
SELECT
    COUNT(
        CASE
            WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id
        END
    ) * 100.0 / COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data;

-- Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_Amount_Received
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';


-- ============================================================
-- BAD LOAN KPIs
-- ============================================================

-- Bad Loan Percentage
SELECT
    COUNT(
        CASE
            WHEN loan_status = 'Charged Off' THEN id
        END
    ) * 100.0 / COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data;

-- Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications
FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount
FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_Amount_Received
FROM bank_loan_data
WHERE loan_status = 'Charged Off';


-- ============================================================
-- LOAN STATUS ANALYSIS
-- ============================================================

SELECT
    loan_status,
    COUNT(id) AS LoanCount,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM bank_loan_data
GROUP BY loan_status;

-- MTD Loan Status Analysis
SELECT
    loan_status,
    SUM(total_payment) AS MTD_Total_Amount_Received,
    SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status;


-- ============================================================
-- B. BANK LOAN REPORT | OVERVIEW
-- ============================================================

-- Monthly Overview
SELECT
    MONTH(issue_date) AS Month_Number,
    DATENAME(MONTH, issue_date) AS Month_Name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY
    MONTH(issue_date),
    DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date);

-- State Overview
SELECT
    address_state AS State,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state;

-- Term Overview
SELECT
    term AS Term,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term;

-- Employee Length Overview
SELECT
    emp_length AS Employee_Length,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;

-- Purpose Overview
SELECT
    purpose AS Purpose,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose;

-- Home Ownership Overview
SELECT
    home_ownership AS Home_Ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;


-- ============================================================
-- FILTER VALIDATION EXAMPLE: GRADE A
-- ============================================================

SELECT
    purpose AS Purpose,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose;
