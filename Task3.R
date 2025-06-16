library(readr)
library(dplyr)

runkeeper_file <- './datasets/cardioActivities.csv'
df_activities <- read_csv(runkeeper_file)
df_activities$Date <- as.Date(df_activities$Date)
rownames(df_activities) <- df_activities$Date

cols_to_drop <- c("Friend's Tagged",'Route Name','GPX File','Activity Id','Calories Burned', 'Notes')
df_activities <- df_activities %>% select(-one_of(cols_to_drop))
activity_type_counts <- table(df_activities$Type)
df_activities$Type <- gsub('Other', 'Unicycling', df_activities$Type)

avg_hr_cycle <- mean(df_activities$`Average Heart Rate (bpm)`[df_activities$Type == 'Cycling'], na.rm=TRUE)
avg_hr_run <- mean(df_activities$`Average Heart Rate (bpm)`[df_activities$Type == 'Running'], na.rm=TRUE)

df_cycle <- df_activities[df_activities$Type == 'Cycling',]
df_run <- df_activities[df_activities$Type == 'Running',]
df_walk <- df_activities[df_activities$Type == 'Walking',]

df_cycle$`Average Heart Rate (bpm)`[is.na(df_cycle$`Average Heart Rate (bpm)`)] <- as.integer(avg_hr_cycle)
df_run$`Average Heart Rate (bpm)`[is.na(df_run$`Average Heart Rate (bpm)`)] <- as.integer(avg_hr_run)
df_walk$`Average Heart Rate (bpm)`[is.na(df_walk$`Average Heart Rate (bpm)`)] <- 110

print(df_activities)

missing_values <- colSums(is.na(df_activities))
cat('\nMissing Values Count in df_activities:\n')
print(missing_values)
