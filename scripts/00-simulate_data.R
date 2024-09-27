#### Preamble ####
# Purpose: Simulates traffic collision data for pre-analysis
# Author: Andy Jiang
# Date: 22 September 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(tibble)
library(readr)

#### Simulate data ####
set.seed(304)

# Define the start and end date
start_date <- as.Date("2014-01-01")
end_date <- as.Date("2024-12-31")

# Set the number of random dates
number_of_dates <- 100

# Simulate 100 random traffic collision observations.

# Data features:
# - 'division' indicating the police division where the collision occurred
# - 'fatalities', 'injury_collisions', 'ftr_collisions', and 'pd_collisions'
#   using Poisson distribution
# NOTE: Fail to Remain (FTR) collisions and property damage (PD) collisions
# - Binary indicators for 'automobile', 'pedestrian', and 'bicycle'
#   involvement in the collisions

simulated_data <- tibble(
  dates = as.Date(
    runif(
      n = number_of_dates,
      min = as.numeric(start_date), max = as.numeric(end_date)
    ),
    origin = "1970-01-01"
  ),
  # Assign hour between 0 and 23
  hour = sample(0:23, number_of_dates, replace = TRUE),

  # Assign random police divisions
  division = sample(1:14, number_of_dates, replace = TRUE),

  # Generate fatalities
  fatalities = {
    temp <- rpois(n = number_of_dates, lambda = 0.05)
    ifelse(temp < 1, NA, temp)
  },

  # Generate collisions
  injury_collisions = ifelse(rpois(n = number_of_dates, lambda = 1) > 0,
    "YES", "NO"
  ),
  ftr_collisions = ifelse(rpois(n = number_of_dates, lambda = 0.5) > 0,
    "YES", "NO"
  ),
  pd_collisions = ifelse(rpois(n = number_of_dates, lambda = 2) > 0,
    "YES", "NO"
  ),

  # Generate involvement of vehicle or person
  automobile = ifelse(sample(c(0, 1), number_of_dates, replace = TRUE) == 1,
    "YES", "NO"
  ),
  pedestrian = ifelse(sample(c(0, 1), number_of_dates, replace = TRUE) == 1,
    "YES", "NO"
  ),
  bicycle = ifelse(sample(c(0, 1), number_of_dates, replace = TRUE) == 1,
    "YES", "NO"
  )
)

#### Write_csv ####
write_csv(simulated_data, file = "data/raw_data/simulated_collision_data.csv")


### Test simulated data ###

# Test 1: test that fatalities is either NA or greater than or equal to 1
test_fatalities <- all(is.na(simulated_data$fatalities)
                       | simulated_data$fatalities >= 1)
cat("Test 1 - Fatalities are either NA or >= 1:", test_fatalities, "\n")

# Test 2: test there are exactly 100 rows
test_row_count <- nrow(simulated_data) == 100
cat("Test 2 - Dataset has 100 rows:", test_row_count, "\n")

# Test 3: test "injury_collisions", "ftr_collisions", and "pd_collisions"
# only have "YES" or "NO" values
test_collisions <- all(simulated_data$injury_collisions %in% c("YES", "NO")) &&
  all(simulated_data$ftr_collisions %in% c("YES", "NO")) &&
  all(simulated_data$pd_collisions %in% c("YES", "NO"))
cat(
  "Test 3 - Collisions columns have 'YES' or 'NO' values:",
  test_collisions, "\n"
)

# Test 4: test "automobile", "pedestrian", and "bicycle" only have "YES" or "NO"
test_vehicle_person <- all(simulated_data$automobile %in% c("YES", "NO")) &&
  all(simulated_data$pedestrian %in% c("YES", "NO")) &&
  all(simulated_data$bicycle %in% c("YES", "NO"))
cat(
  "Test 4 - Vehicle and person involvement columns have 'YES' or 'NO':",
  test_vehicle_person, "\n"
)

# Test 5: Ensure that 'hour' column contains only values between 0 and 23
test_hour_range <- all(simulated_data$hour >= 0 & simulated_data$hour <= 23)
cat(
  "Test 5 - Hour column contains values between 0 and 23:",
  test_hour_range, "\n"
)
