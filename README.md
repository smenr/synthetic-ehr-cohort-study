# Synthetic EHR Cohort Study (R + Python)
This project simulates a synthetic electronic health record (EHR) cohort
to demonstrate reproducible epidemiological analysis using R and Python.

The objective is to estimate the association between drug exposure
and a binary clinical outcome adjusting for age and comorbidity.
- Synthetic patient-level data were generated in R.
- A cohort dataset was saved in CSV format.
- Logistic regression analysis was conducted in Python (statsmodels).
- Odds ratios and 95% confidence intervals were estimated.
- Descriptive and regression figures were generated using matplotlib.
- Drug exposure was associated with reduced odds of the outcome
(OR ≈ 0.47), adjusting for age and comorbidity score.

Figures illustrating age distribution and outcome by exposure
are available in the `figures/` directory.
To reproduce the analysis:

1. Run `scripts/01_generate_data.R` to generate the dataset.
2. Open `python_code/04_analysis_python.ipynb`.
3. Run all cells to reproduce the regression analysis and figures.
