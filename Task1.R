# Install required packages
install.packages("readr")
install.packages("dplyr")

# Load required library
library(readr)
library(dplyr)

runkeeper_file <- 'datasets/cardioActivities.csv'
df_activities <- read_csv(runkeeper_file)
df_activities$Date <- as.Date(df_activities$Date)

# Set Date as row names (index)
rownames(df_activities) <- df_activities$Date

# Display 3 random rows
print(df_activities[sample(nrow(df_activities), 3), ])

# Summary of activities
str(df_activities)
