library(readr)
library(dplyr)
library(ggplot2)

runkeeper_file <- './datasets/cardioActivities.csv'
df_activities <- read_csv(runkeeper_file)
df_activities$Date <- as.Date(df_activities$Date)
rownames(df_activities) <- df_activities$Date

cols_to_drop <- c("Friend's Tagged", 'Route Name', 'GPX File', 'Activity Id', 'Calories Burned', 'Notes')
df_activities <- df_activities %>% select(-one_of(cols_to_drop))
df_activities$Type <- gsub('Other', 'Unicycling', df_activities$Type)
df_run <- df_activities[df_activities$Type == 'Running',]
df_run <- df_run[order(df_run$Date),]
runs_subset_2013_2018 <- subset(df_run, Date >= as.Date('2013-01-01') & Date <= as.Date('2018-12-31'))

par(mfrow=c(2,2))
plot(runs_subset_2013_2018$Date, runs_subset_2013_2018$`Average Speed (km/h)`, main="avg Speed", xlab="Date", ylab="Avg Speed", pch=16)
plot(runs_subset_2013_2018$Date, runs_subset_2013_2018$`Distance (km)`, main="Distance (km)", xlab="Date", ylab="Distance", pch=16)
plot(runs_subset_2013_2018$Date, runs_subset_2013_2018$`Average Heart Rate (bpm)`, main="Average Heart Rate (bpm)", xlab="Date", ylab="Heart Rate", pch=16)
plot(runs_subset_2013_2018$Date, runs_subset_2013_2018$`Average Pace`, main="Avg Pace", xlab="Date", ylab="Pace", pch=16)
par(mfrow=c(1,1))
