library(dplyr)
# Import CSV from computer
transit_costs_table <- read.csv("Transit_Costs.csv")

# Change from character to integer
transit_costs_table$End.year <- as.integer(transit_costs_table$End.year)
transit_costs_table$Start.year <- as.integer(transit_costs_table$Start.year)

# Add column with years it took to create the transit project
end_year <- transit_costs_table$End.year
start_year <- transit_costs_table$Start.year
transit_costs_table$Project_Year_Length <- end_year - start_year
transit_costs_table <- transit_costs_table %>% relocate(Project_Year_Length, .before = RR.)

# Average
average_project_time <- mean(transit_costs_table$Project_Year_Length, na.rm = TRUE)
average_project_time

# Number of total observations
count <- length(transit_costs_table$Project_Year_Length)
count

# Number of NA
na_count <- sum(is.na(transit_costs_table$Project_Year_Length))
na_count

# Number of nonNA observations
real_count <- count - na_count
real_count

# Table without NA
# Source: https://www.statology.org/r-remove-rows-with-na-in-one-column/
transit_costs_clean <- transit_costs_table[!is.na(transit_costs_table$Project_Year_Length),]
