# Assumptions and Limitations

## Assumptions

### Loan-level grain

Each row is assumed to represent one loan application. The `id` field is treated
as the loan-level identifier.

### Portfolio-quality classification

The analysis uses the following simplified classification:

- Fully Paid and Current = Good Loan
- Charged Off = Bad Loan

This classification is intended for dashboard reporting and is not a complete
regulatory credit-risk framework.

### Date used for analysis

`issue\\\\\\\_date` is treated as the primary date for monthly, MTD and MoM
calculations.

### Financial measures

- `loan\\\\\\\_amount` represents the funded principal.
- `total\\\\\\\_payment` represents cumulative amount received.
- `int\\\\\\\_rate` and `dti` are stored as decimal values and displayed as percentages.
- Financial amounts are represented in US dollars.

## Limitations

### 1. Historical rather than live data

The report is based on the dates available in the supplied dataset. It is not
connected to a live loan-management system.

MTD therefore refers to the latest month in the dataset, not necessarily the
current calendar month.

### 2. Simplified good-versus-bad definition

Current loans are classified as good loans even though their final repayment
outcome is not yet known. A current loan could later become delinquent or
charged off.

### 3. Amount received is not the same as profit

`total\\\\\\\_payment` may include:

- Principal repayment
- Interest
- Fees
- Recovery payments

The dashboard does not include operating costs, acquisition costs, funding
costs, taxes or recovery expenses. Therefore, amount received should not be
treated as net profit.

### 4. Limited credit-risk information

The dataset does not provide every variable normally required for a complete
credit-risk assessment. Depending on the source, missing information may
include:

- Credit score
- Payment delinquency history
- Outstanding principal
- Days past due
- Collateral
- Recovery expenses
- Detailed borrower demographics

### 5. No causal conclusions

The report identifies patterns and associations. It does not prove that a
particular borrower characteristic causes repayment or default behaviour.

### 6. Portfolio concentration

Results may be influenced by the high proportion of 36-month and
debt-consolidation loans. Findings should not automatically be generalised to a
different loan portfolio.

### 7. Static refresh path

The PBIX may store a local file path for the source dataset. A user who downloads
the repository may need to update the path through Power BI Data Source Settings
before refreshing.

### 8. Dataset permissions

The raw dataset should be distributed only when its source and redistribution
rights have been confirmed. If those rights are unclear, the repository should
provide source instructions rather than a copy of the raw data.
