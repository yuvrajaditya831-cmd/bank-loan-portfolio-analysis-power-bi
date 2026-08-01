# Business Insights and Recommendations

## Business Problem

I built this dashboard to help a lending team understand portfolio growth,
funding activity, repayment performance and loan quality from one report.

The intended users are:

- Portfolio managers
- Credit-risk analysts
- Lending operations managers
- Business and finance analysts

## Executive Summary

The portfolio contains 38,576 loan applications, approximately $435.8 million
in funded principal and $473.1 million in cumulative payments received.

Around 86.2% of applications are classified as good loans, while 13.8% are
classified as bad loans. The latest month recorded 4,314 applications,
representing approximately 6.9% month-over-month growth.

## Key Insights

### 1. The portfolio operates at meaningful scale

- Total Loan Applications: 38,576
- Total Funded Amount: approximately $435.8M
- Total Amount Received: approximately $473.1M
- Average Interest Rate: approximately 12.0%
- Average DTI: approximately 13.3%

The amount received is approximately 108.6% of the funded principal. This
reflects cumulative borrower payments, which can include interest. It should not
be interpreted directly as profit.

### 2. Most applications are currently performing

- Good Loan Applications: approximately 33.2K
- Good Loan Percentage: approximately 86.2%
- Bad Loan Applications: approximately 5.3K
- Bad Loan Percentage: approximately 13.8%

The majority of the portfolio is performing, but the bad-loan segment remains
large enough to require active risk monitoring.

### 3. The charged-off segment shows a material recovery gap

Bad loans account for approximately $65.5M of funded amount but only about
$37.3M in amount received.

This means the cumulative amount received from the bad-loan segment is roughly
57% of its funded principal. This is a portfolio-risk indicator rather than a
final accounting loss calculation.

### 4. The latest month shows positive business momentum

- MTD Loan Applications: 4,314
- Application MoM Growth: approximately 6.9%
- Funded Amount MoM Growth: approximately 13.0%
- Amount Received MoM Growth: approximately 15.8%

Funding and receipts increased faster than application volume during the latest
month. The team should check whether this was caused by larger average loan
sizes, improved collections or a change in borrower mix.

### 5. The portfolio is concentrated in shorter-term loans

Approximately 28.2K applications use a 36-month term, representing about 73% of
all applications. Roughly 10.3K applications use a 60-month term.

The shorter term dominates the portfolio, which may reduce duration exposure
but can result in higher monthly repayment obligations for borrowers.

### 6. Debt consolidation is the largest borrowing purpose

Approximately 18.2K applications, or about 47% of the portfolio, are associated
with debt consolidation.

This makes debt consolidation the largest purpose concentration and an
important segment for monitoring repayment behaviour, grade, interest rate and
DTI.

## Recommendations

### 1. Strengthen risk monitoring for bad-loan segments

Break the charged-off portfolio down by:

- Loan grade and sub-grade
- DTI band
- Interest-rate band
- Loan purpose
- Employment length
- State
- Loan term

The lending team should identify combinations with unusually high charged-off
rates before changing approval policies.

### 2. Monitor portfolio concentration

Because 36-month loans and debt-consolidation applications dominate the
portfolio, create concentration thresholds and review them monthly.

Growth in these segments should be evaluated alongside their bad-loan rates,
not only their application counts.

### 3. Add an early-warning view

Create risk alerts for borrowers or segments showing:

- High DTI
- High interest rate
- Riskier loan grade
- Longer loan term
- Delayed or missing payments

This would help the operations team act before an account reaches charged-off
status.

### 4. Track growth and collections together

Application growth should be reviewed alongside:

- Average loan amount
- Collection rate
- Bad-loan percentage
- Grade distribution
- Amount received versus amount funded

This prevents strong application growth from hiding a decline in portfolio
quality.

### 5. Expand the data available for future analysis

Future versions could include:

- Credit score
- Delinquency history
- Outstanding principal
- Payment-due amount
- Days past due
- Recovery cost
- Loan profitability
- Customer acquisition channel

These fields would support stronger credit-risk and profitability analysis.
