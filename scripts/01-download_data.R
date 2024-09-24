#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Andy Jiang
# Date: 22 September 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("ec53f7b2-769b-4914-91fe-a37ee27a90b3")
package

# get all resources for this package
resources <- list_package_resources("ec53f7b2-769b-4914-91fe-a37ee27a90b3")

# identify datastore resources; by default, Toronto Open Data sets datastore
# resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv'))

# load the first datastore resource as a sample
collision_data <- filter(datastore_resources, row_number()==1) %>%
  get_resource()

# Save the data
write.csv(collision_data, "data/raw_data/raw_collision_data.csv")