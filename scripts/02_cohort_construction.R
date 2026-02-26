#Project: Synthetic EHR Cohort Study
#Author: Oscar Santiago Mendez Ruiz
#Date: 2026
# 02_cohort_construction.R
# Define retrospective cohort from synthetic EHR dataset

library(dplyr)

data <- read.csv("data/synthetic_ehr.csv")

# Inclusion criteria: age ≥ 40
cohort <- data %>%
  filter(age >= 40)

# Create exposure group label
cohort <- cohort %>%
  mutate(
    exposure_group = ifelse(drug_exposure == 1, "Exposed", "Unexposed")
  )

write.csv(cohort, "data/cohort_dataset.csv", row.names = FALSE)

cat("Cohort constructed successfully.\n")
