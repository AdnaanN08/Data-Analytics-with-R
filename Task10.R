library(readr)
library(dplyr)

runkeeper_file <- './datasets/cardioActivities.csv'
df_activities <- read_csv(runkeeper_file)
df_activities$Date <- as.Date(df_activities$Date)
rownames(df_activities) <- df_activities$Date

cols_to_drop <- c("Friend's Tagged", 'Route Name', 'GPX File', 'Activity Id', 'Calories Burned', 'Notes')
df_activities <- df_activities %>% select(-one_of(cols_to_drop))
df_cycle <- df_activities[df_activities$Type == 'Cycling',]
df_run <- df_activities[df_activities$Type == 'Running',]
df_walk <- df_activities[df_activities$Type == 'Walking',]
df_run_walk_cycle <- rbind(df_walk, df_cycle, df_run)
df_run_walk_cycle <- df_run_walk_cycle[order(df_run_walk_cycle$Date, decreasing=TRUE),]
speed_col <- 'Average Speed (km/h)'
dist_climb_cols <- c('Distance (km)', 'Climb (m)')
df_totals <- aggregate(df_run_walk_cycle[,dist_climb_cols], by=list(Type=df_run_walk_cycle$Type), sum)
cat('Totals for different training types:\n')
print(df_totals)
df_summary <- df_run_walk_cycle %>% group_by(Type) %>% summarise(across(all_of(c(dist_climb_cols, speed_col)), list(mean=mean, sd=sd, min=min, max=max), na.rm=TRUE))
cat('Summary statistics for different training types:\n')
print(df_summary)
