# 01_generate_data.R

set.seed(12345)  # reproducibilidad

n <- 10000  # patients quantity

synthetic_data <- data.frame(
  patient_id = 1:n,
  age = rnorm(n, mean = 65, sd = 12),
  sex = sample(c("Male", "Female"), n, replace = TRUE),
  comorbidity_score = rpois(n, lambda = 2),
  drug_exposure = rbinom(n, 1, 0.4),
  follow_up_years = runif(n, 1, 5)
)

# Simular outcome con relación a edad, comorbilidad y exposición
synthetic_data$outcome <- rbinom(
  n,
  1,
  plogis(-3 +
           0.03 * synthetic_data$age +
           0.5 * synthetic_data$comorbidity_score -
           0.7 * synthetic_data$drug_exposure)
)

# Guardar CSV en carpeta data
write.csv(synthetic_data, "data/synthetic_ehr.csv", row.names = FALSE)

cat("Dataset sintético generado exitosamente!\n")

head(read.csv("data/synthetic_ehr.csv"))
