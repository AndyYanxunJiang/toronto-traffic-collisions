#### Preamble ####
# Purpose: Clean the traffic collision data
# Author: Andy Jiang
# Date: 23 September 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites: Raw data downloaed
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Load raw data ####
raw_data <- read_csv("data/raw_data/raw_collision_data.csv")

#### Clean data by removing specified columns ####
# Specific date(day) and precise location removed, not needed for my analysis.
# id, police division and neighbourhood number removed, useless info.
cleaned_data <- raw_data %>%
  select(-...1, -OCC_DATE, -X_id, -DIVISION, -HOOD_158, -LONG_WGS84,
         -LAT_WGS84, -geometry)

#### Save the cleaned data ####
write_csv(cleaned_data, "data/cleaned_data/cleaned_collision_data.csv")
