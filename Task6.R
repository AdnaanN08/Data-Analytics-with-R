library(readr)
library(dplyr)
library(ggplot2)

runkeeper_file <- './datasets/cardioActivities.csv'
df_activities <- read_csv(runkeeper_file)
df_activities$Date <- as.Date(df_activities$Date)
rownames(df_activities) <- df_activities$Date

cols_to_drop <- c("Friend's Tagged", 'Route Name', 'GPX File', 'Activity Id', 'Calories Burned', 'Notes')
df_activities <- df_activities %>% select(-one_of(cols_to_drop))
df_run <- df_activities[df_activities$Type == 'Running',]
df_run <- df_run[order(df_run$Date),]
runs_subset_2015_2018 <- subset(df_run, Date >= as.Date('2015-01-01') & Date <= as.Date('2018-12-31'))

runs_distance <- runs_subset_2015_2018$`Distance (km)`
runs_hr <- runs_subset_2015_2018$`Average Heart Rate (bpm)`

par(mfrow=c(2,1))
plot(runs_subset_2015_2018$Date, runs_distance, type='l', col='blue', ylab='Distance', main='Historical data with averages')
average_hr <- mean(runs_hr, na.rm=TRUE)
abline(h=average_hr, col='gray', lty=2)
plot(runs_subset_2015_2018$Date, runs_hr, type='l', col='red', ylab='Heart Rate', main='Heart Rate with Average Line')
abline(h=average_hr, col='gray', lty=2)
par(mfrow=c(1,1))
