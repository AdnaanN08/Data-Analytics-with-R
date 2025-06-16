library(readr)
library(dplyr)
library(ggplot2)
library(forecast)

runkeeper_file <- './datasets/cardioActivities.csv'
df_activities <- read_csv(runkeeper_file)
df_activities$Date <- as.Date(df_activities$Date)
rownames(df_activities) <- df_activities$Date

cols_to_drop <- c("Friend's Tagged", 'Route Name', 'GPX File', 'Activity Id', 'Calories Burned', 'Notes')
df_activities <- df_activities %>% select(-one_of(cols_to_drop))
df_run <- df_activities[df_activities$Type == 'Running',]
df_run <- df_run[order(df_run$Date),]
df_run_subset <- subset(df_run, Date >= as.Date('2013-01-01') & Date <= as.Date('2018-12-31'))
df_run_dist_wkly <- tapply(df_run_subset$`Distance (km)`, format(df_run_subset$Date, '%Y-%U'), sum)
df_run_dist_wkly_ts <- ts(df_run_dist_wkly, frequency=52)
decomposed <- decompose(df_run_dist_wkly_ts)

plot(decomposed)
