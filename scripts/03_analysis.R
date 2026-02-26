#Project: Synthetic EHR Cohort Study
#Author: Oscar Santiago Mendez Ruiz
#Date: 2026
# 03_analysis.R
# Multivariable logistic regression analysis

library(dplyr)

cohort <- read.csv("data/cohort_dataset.csv")

# Fit multivariable logistic regression model
model <- glm(
  outcome ~ drug_exposure + age + sex + comorbidity_score,
  data = cohort,
  family = binomial()
)

summary(model)

# Save model coefficients
results <- summary(model)$coefficients
write.csv(results, "data/model_results.csv")

cat("Analysis completed successfully.\n")
# Extract coefficients
coef_table <- summary(model)$coefficients

# Calculate Odds Ratios and 95% CI
odds_ratios <- exp(coef(model))
conf_int <- exp(confint(model))

results <- data.frame(
  Variable = names(odds_ratios),
  Odds_Ratio = odds_ratios,
  CI_lower = conf_int[,1],
  CI_upper = conf_int[,2]
)

write.csv(results, "data/model_results.csv", row.names = FALSE)

cat("Analysis completed successfully.\n")

# Descriptive statistics by exposure group
descriptive_table <- cohort %>%
  group_by(drug_exposure) %>%
  summarise(
    mean_age = mean(age),
    mean_comorbidity = mean(comorbidity_score),
    outcome_rate = mean(outcome)
  )

write.csv(descriptive_table, "data/descriptive_table.csv", row.names = FALSE)
