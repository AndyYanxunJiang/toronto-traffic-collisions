#### Preamble ####
# Purpose: Sanity check of the cleaned collision data
# Author: Andy Jiang
# Date: 23 September 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites: Need to have cleaned the data

#### Workspace setup ####
library(tidyverse)

#### Load cleaned data ####
data <- read_csv("data/analysis_data/cleaned_collision_data.csv")

### Test if fatalities are either NA or positive integers ###
valid_fatalities_check <- all(is.na(data$FATALITIES) | data$FATALITIES >= 0)

### Test for valid collision hour (0 to 23) ###
valid_hour_check <- all(data$OCC_HOUR >= 0 & data$OCC_HOUR <= 23, na.rm = TRUE)

### Test if `INJURY_COLLISIONS`, `FTR_COLLISIONS`, and `PD_COLLISIONS`
### contain only "YES", "NO", or "None" ###
valid_collision_check <- all(
  data$INJURY_COLLISIONS %in% c("YES", "NO", "None") &
    data$FTR_COLLISIONS %in% c("YES", "NO", "None") &
    data$PD_COLLISIONS %in% c("YES", "NO", "None")
)

### Test if `OCC_YEAR` is from 2014 to 2024 ###
valid_year_check <- all(data$OCC_YEAR >= 2014 & 
                          data$OCC_YEAR <= 2024, na.rm = TRUE)

### Test if `OCC_MONTH` contains valid month names ###
valid_month_names <- c(
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November",
  "December"
)

valid_month_check <- all(data$OCC_MONTH %in% valid_month_names, na.rm = TRUE)
