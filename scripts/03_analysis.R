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
