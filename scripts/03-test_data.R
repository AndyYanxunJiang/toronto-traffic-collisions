#### Preamble ####
# Purpose: Sanity check of the cleaned collision data
# Author: Andy Jiang
# Date: 23 September 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites: Need to have cleaned data
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Load cleaned data ####
data <- read_csv("data/analysis_data/cleaned_collision_data.csv")

#### Test for negative number of collisions ####
negative_check <- all(data$FATALITIES >= 0, na.rm = TRUE) &
  all(data$INJURY_COLLISIONS >= 0, na.rm = TRUE) &
  all(data$FTR_COLLISIONS >= 0, na.rm = TRUE) &
  all(data$PD_COLLISIONS >= 0, na.rm = TRUE)

### Test if fatalities are either NA or positive integers ###
valid_fatalities_check <- all(is.na(data$FATALITIES) | data$FATALITIES >= 0)

### Test for valid neighborhood names ###
neighborhood_check <- all(!is.na(data$NEIGHBOURHOOD_158) | 
                            data$NEIGHBOURHOOD_158 == "NSA")

### Test for valid collision hour (0 to 23) ###
valid_hour_check <- all(data$OCC_HOUR >= 0 & data$OCC_HOUR <= 23, na.rm = TRUE)