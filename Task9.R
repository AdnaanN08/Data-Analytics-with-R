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
df_run_subset <- subset(df_run, Date >= as.Date('2013-01-01') & Date <= as.Date('2018-12-31'))
df_run_dist_wkly <- tapply(df_run_subset$`Distance (km)`, format(df_run_subset$Date, '%Y-%U'), sum)
df_run_hr_all <- tapply(df_run_subset$`Average Heart Rate (bpm)`, format(df_run_subset$Date, '%Y-%U'), mean)

hr_zones <- c(0, 100, 125, 133, 142, 151, 173, 200)
zone_names <- c('Below 100','At 100','Risning', 'Easy', 'Moderate', 'Hard', 'Very Hard', 'Maximal')

hist(df_run_hr_all, breaks=hr_zones, col=rainbow(length(hr_zones)-1), main='Distribution of Heart Rate', xlab='Heart Rate (bpm)', ylab='Number of Runs')
axis(1, at=hr_zones, labels=zone_names, las=2)
