library(readr)
library(dplyr)

runkeeper_file <- './datasets/cardioActivities.csv'
df_activities <- read_csv(runkeeper_file)
df_activities$Date <- as.Date(df_activities$Date)
rownames(df_activities) <- df_activities$Date

cols_to_drop <- c("Friend's Tagged", 'Route Name', 'GPX File', 'Activity Id', 'Calories Burned', 'Notes')
df_activities <- df_activities %>% select(-one_of(cols_to_drop))
df_activities$Type <- gsub('Other', 'Unicycling', df_activities$Type)
df_run <- df_activities[df_activities$Type == 'Running',]
df_run <- df_run[order(df_run$Date),]
runs_subset_2015_2018 <- subset(df_run, Date >= as.Date('2015-01-01') & Date <= as.Date('2018-12-31'))

annual_means <- aggregate(. ~ format(Date, '%Y'), runs_subset_2015_2018[,c('Date','Distance (km)', 'Average Speed (km/h)', 'Climb (m)', 'Average Heart Rate (bpm)')], mean)
weekly_means <- aggregate(. ~ format(Date, '%Y-%U'), runs_subset_2015_2018[,c('Date','Distance (km)', 'Average Speed (km/h)', 'Climb (m)', 'Average Heart Rate (bpm)')], mean)
weekly_counts <- table(format(runs_subset_2015_2018$Date, '%Y-%U'))
weekly_counts_average <- mean(weekly_counts)

cat("How my average run looks in last 4 years:\n")
print(annual_means)
cat("\nWeekly averages of last 4 years:\n")
print(weekly_means)
cat("\nHow many trainings per week I had on average:\n")
print(weekly_counts_average)
