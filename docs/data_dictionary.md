# Data Dictionary

## Dataset Overview

The dataset contains loan-level information used to analyse portfolio size,
funding activity, repayments, borrower characteristics and loan performance.

- Grain: One row represents one loan application
- Record count: 38,576
- Primary identifier: `id`
- Main date field: `issue\\\\\\\_date`
- Fact table: `Factloans`
- Date table: `DimDate`
- Metric selector: `Select Measure`

## Factloans Table

| Field | Data type | Description | Analytical use |
|---|---|---|---|
| `id` | Whole number | Unique identifier assigned to a loan application | Counts total loan applications |
| `member\\\\\\\_id` | Whole number | Anonymised member identifier | Reference identifier |
| `address\\\\\\\_state` | Text | Two-letter state code associated with the borrower | State-level portfolio analysis |
| `application\\\\\\\_type` | Text | Indicates whether the application was individual or joint | Application segmentation |
| `emp\\\\\\\_length` | Text | Borrower's employment-length category | Employment stability analysis |
| `emp\\\\\\\_title` | Text | Reported employment title | Borrower profile analysis |
| `grade` | Text | Credit-risk grade assigned to the loan | Risk segmentation |
| `sub\\\\\\\_grade` | Text | Detailed category within the primary loan grade | Detailed risk analysis |
| `home\\\\\\\_ownership` | Text | Borrower's home-ownership status | Borrower segmentation |
| `verification\\\\\\\_status` | Text | Indicates whether income details were verified | Verification analysis |
| `issue\\\\\\\_date` | Date | Date on which the loan was issued | Monthly, MTD and MoM analysis |
| `last\\\\\\\_credit\\\\\\\_pull\\\\\\\_date` | Date | Most recent date on which credit information was reviewed | Credit review reference |
| `last\\\\\\\_payment\\\\\\\_date` | Date | Date of the most recent payment | Repayment monitoring |
| `next\\\\\\\_payment\\\\\\\_date` | Date | Scheduled date of the next payment | Payment-schedule reference |
| `loan\\\\\\\_status` | Text | Current performance status of the loan | Good-loan and bad-loan classification |
| `purpose` | Text | Borrower's stated reason for taking the loan | Purpose-level analysis |
| `term` | Text | Contract duration, generally 36 or 60 months | Loan-term analysis |
| `annual\\\\\\\_income` | Decimal number | Borrower's reported annual income | Borrower affordability analysis |
| `dti` | Decimal number | Debt-to-income ratio | Borrower-risk indicator |
| `installment` | Decimal number | Scheduled periodic payment | Repayment-obligation analysis |
| `int\\\\\\\_rate` | Decimal number | Interest rate assigned to the loan | Pricing and risk analysis |
| `loan\\\\\\\_amount` | Decimal number | Principal amount approved and funded | Total Funded Amount |
| `total\\\\\\\_acc` | Whole number | Total number of credit accounts | Credit-profile analysis |
| `total\\\\\\\_payment` | Decimal number | Cumulative payment received | Total Amount Received |
| `Good vs Bad Loan` | Calculated text | Groups loan statuses into good and bad loans | Loan-quality reporting |

## DimDate Table

The `DimDate` table provides a continuous calendar for time-intelligence
calculations.

| Field | Data type | Description |
|---|---|---|
| `Date` | Date | Unique calendar date related to `Factloans\\\\\\\[issue\\\\\\\_date]` |
| `Year` | Whole number | Calendar year |
| `Month` | Text | Calendar month name |
| `Month Number` | Whole number | Numeric month used to sort month names |
| `Month-Year` | Text | Combined month and year label used in trends |

Remove any date-table fields from this document if they do not exist in the
final Power BI model.

## Select Measure Table

`Select Measure` is a disconnected selector table used on the Overview page.
It allows the user to switch the displayed metric without changing the visual.

Typical options include:

- Total Loan Applications
- Total Funded Amount
- Total Amount Received
- Average Interest Rate
- Average DTI

## Main Measures

| Measure | Definition |
|---|---|
| Total Loan Applications | Number of loan application records |
| Total Funded Amount | Sum of approved loan principal |
| Total Amount Received | Sum of cumulative borrower payments |
| Average Interest Rate | Average interest rate under the current filters |
| Average DTI | Average debt-to-income ratio under the current filters |
| MTD | Result for the latest month represented in the current context |
| Previous Month | Result for the preceding monthly period |
| MoM Percentage | Percentage change from the previous month |
| Good Loan Percentage | Good-loan applications divided by total applications |
| Bad Loan Percentage | Bad-loan applications divided by total applications |

The complete DAX definitions are available in `dax/measures.dax`.
