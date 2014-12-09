#######
# This file reads multiple data source from csv files and aggregates the data into a single table.
#######


# Import returns
Return <- read.csv("~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Aggregation/total_return.csv")
Return  <- Return[-1]
names(Return)<- c("overall_avg_price", "total_observations", "event_id", "days_out", "Away_Team", "Home_Team", "section_lmh",   "closing_price", "opening_price", "total_return", "ll")

# Import star values
Star <-  read.csv("~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Aggregation/stars.csv")
Home_Star <- Star
names(Home_Star)<- c("Home_Team","Home_Star_Score")
Away_Star <- Star
names(Away_Star)<- c("Away_Team","Away_Star_Score")

# Import NBA games and IDs
Date <- read.csv("~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Aggregation/upcoming_nba_games.csv")
names(Date)<- c("event_id","Date")

# Import performance scores
Current_Perf <- read.csv("~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Aggregation/Perf_Score_all.csv")
Current_Perf_Home <- Current_Perf[-1]
names(Current_Perf_Home) <- c('Home_Team', 'Home_PCT', 'Home_Streak')
Current_Perf_Away <- Current_Perf[-1]
names(Current_Perf_Away) <- c('Away_Team', 'Away_PCT', 'Away_Streak')

# Import past performance
Past_Perf <- read.csv("~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Aggregation/2013-2014_Standings.csv")
Past_Perf_Home <- Past_Perf
names(Past_Perf_Home) <- c('Home_Team', 'Past_Home_PCT')
Past_Perf_Away <- Past_Perf
names(Past_Perf_Away) <- c('Away_Team', 'Past_Away_PCT')

# Import article search
Article_Search <- read.csv("~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Aggregation/Article_Search.csv")
Article_Search_Home <- Article_Search[-1]
names(Article_Search_Home) <- c('Home_Article_Count', 'Home_Team')
Article_Search_Away <- Article_Search[-1]
names(Article_Search_Away) <- c('Away_Article_Count', 'Away_Team')

# Import schedule
Schedule <- read.csv("~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Aggregation/NBA_Schedule.csv")

# Join data
total_data <- merge(Return, Home_Star)
total_data <- merge(total_data, Away_Star)
total_data$StarScore <- total_data$Home_Star_Score + total_data$Away_Star_Score
#total_data <- total_data[-c(8, 9)]


# Perform necessary transformations and calculations, and join all elements

total_data <- merge(total_data, Date)

total_data <- merge(total_data, Current_Perf_Home)
total_data <- merge(total_data, Current_Perf_Away)
total_data$Overall_PCT <- total_data$Home_PCT * 0.66 + total_data$Away_PCT * 0.44
total_data$Overall_Streak <- total_data$Home_Streak + total_data$Away_Streak

total_data <- merge(total_data, Past_Perf_Home)
total_data <- merge(total_data, Past_Perf_Away)
total_data$Past_Overall_PCT <- total_data$Past_Home_PCT * 0.66 + total_data$Past_Away_PCT * 0.44

total_data <- merge(total_data, Article_Search_Home)
total_data <- merge(total_data, Article_Search_Away)
total_data$Article_Search_Overall <- total_data$Home_Article_Count + total_data$Away_Article_Count

total_data <- merge(total_data, Schedule, by = c('Date', 'Home_Team'))


# Write csv file
write.csv(total_data, "~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Aggregation/NBA_Tickets_test.csv")
