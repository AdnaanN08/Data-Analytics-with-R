# Load required libraries
library(readr)
library(dplyr)

runkeeper_file <- 'datasets/cardioActivities.csv'
df_activities <- read_csv(runkeeper_file)
df_activities$Date <- as.Date(df_activities$Date)
rownames(df_activities) <- df_activities$Date

cols_to_drop <- c("Friend's Tagged",'Route Name','GPX File','Activity Id','Calories Burned', 'Notes')
# Delete unnecessary columns
df_activities <- df_activities %>% select(-all_of(cols_to_drop))

# Calculate activity type counts
activity_type_counts <- table(df_activities$Type)
cat("Activity Type Counts:\n")
print(activity_type_counts)

df_activities$Type <- gsub('Other', 'Unicycling', df_activities$Type)

# Count missing values
missing_values <- colSums(is.na(df_activities))
cat("\nMissing Values Count:\n")
print(missing_values)

print(df_activities)
