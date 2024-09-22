#### Preamble ####
# Purpose: Simulates traffic collision data for analysis.
# Author: Andy Jiang
# Date: 22 September 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(304)

# Define the start and end date
start_date <- as.Date("2018-01-01")
end_date <- as.Date("2023-12-31")

# Set the number of random dates you want to generate
number_of_dates <- 100

# Simulate a dataset of 100 random traffic collision observations.

# Data features:
# - 'division' indicating the police division where the collision occurred
# - 'fatalities', 'injury_collisions', 'ftr_collisions', and 'pd_collisions'
#   using Poisson distribution
# NOTE: Fail to Remain (FTR) collisions and property damage (PD) collisions
# - Binary indicators for 'automobile', 'pedestrian', and 'bicycle'
#   involvement in the collisions
simulated_data <- tibble(
  dates = as.Date(
    runif(n = number_of_dates,
          min = as.numeric(start_date), max = as.numeric(end_date)),
    origin = "1970-01-01"
  ),
  division = sample(1:14, number_of_dates, replace = TRUE),
  fatalities = rpois(n = number_of_dates, lambda = 0.05),
  injury_collisions = rpois(n = number_of_dates, lambda = 1),
  ftr_collisions = rpois(n = number_of_dates, lambda = 0.5),
  pd_collisions = rpois(n = number_of_dates, lambda = 2),
  automobile = sample(c(0, 1), number_of_dates, replace = TRUE),
  pedestrian = sample(c(0, 1), number_of_dates, replace = TRUE),
  bicycle = sample(c(0, 1), number_of_dates, replace = TRUE)
)

#### Write_csv ####
write_csv(simulated_data, file = "data/raw_data/simulated_collision_data.csv")
