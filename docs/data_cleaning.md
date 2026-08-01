`DimDate\\\[Date]` → `Factloans\\\[issue\\\_date]`

The date table supports:

- Monthly trends
- Month-to-date metrics
- Previous-month metrics
- Month-over-month comparisons

### 7. Loan-quality classification

Loan status was grouped into a simplified portfolio-quality category:

| Loan status | Classification |
|---|---|
| Fully Paid | Good Loan |
| Current | Good Loan |
| Charged Off | Bad Loan |

This classification supports the good-loan and bad-loan sections of the Summary
page.

### 8. Metric validation

Headline metrics were recalculated independently in SQL and compared with the
Power BI results.

Validation included:

- Total Loan Applications
- Total Funded Amount
- Total Amount Received
- Average Interest Rate
- Average DTI
- MTD and MoM results
- Good-loan and bad-loan percentages

The validation queries are available in `sql/kpi\\\_validation.sql`.

## Quality-Control Principles

- Original loan amounts were not manually altered.
- Missing optional values were not replaced without a business reason.
- Loan IDs were checked before being used for application counts.
- Time calculations use `issue\\\_date`.
- Percentage fields are stored numerically and formatted only for presentation.
- SQL and Power BI use the same loan-quality classification.
