########
# This file systematically runs univariate regressions for average prices and total returns, and extract the model p-values and r-squares.
########

# Import data
nba_data <- read.csv("~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Analysis/NBA_Tickets.csv")

# Split data into 3 pricing levels
nba_data_low <- subset(nba_data, section_lmh == 'Low')
nba_data_med <- subset(nba_data, section_lmh == 'Med')
nba_data_high <- subset(nba_data, section_lmh == 'Hig')

# Declare all variables
variables <- c('Home_Team', 'Away_Team', 'StarScore', 'Overall_PCT', 'Overall_Streak', 'Past_Overall_PCT', 'Article_Search_Overall', 'National_TV', 'Holiday.Weekend', 'Afternoon')


######################## Extracting pvalue ###########################

# Function extracts model p-va;ie
lmp <- function (modelobject) {
  if (class(modelobject) != "lm") stop("Not an object of class 'lm' ")
  f <- summary(modelobject)$fstatistic
  p <- pf(f[1],f[2],f[3],lower.tail=F)
  attributes(p) <- NULL
  return(p)
}

#### Regressions on Return

# Low section

fit_Home_Team <- lm(total_return ~ Home_Team, data = nba_data_low)
Home_Team <- lmp(fit_Home_Team)
fit_Away_Team <- lm(total_return ~ Away_Team.x, data = nba_data_low)
Away_Team <- lmp(fit_Away_Team)
fit_StarScore <- lm(total_return ~ StarScore, data = nba_data_low)
StarScore <- lmp(fit_StarScore)
fit_Overall_PCT <- lm(total_return ~ Overall_PCT, data = nba_data_low)
Overall_PCT <- lmp(fit_Overall_PCT)
fit_Overall_Streak <- lm(total_return ~ Overall_Streak, data = nba_data_low)
Overall_Streak <- lmp(fit_Overall_Streak)
fit_Past_Overall_PCT <- lm(total_return ~ Past_Overall_PCT, data = nba_data_low)
Past_Overall_PCT <- lmp(fit_Past_Overall_PCT)
fit_Article_Search_Overall <- lm(total_return ~ Article_Search_Overall, data = nba_data_low)
Article_Search_Overall <- lmp(fit_Article_Search_Overall)
fit_National_TV <- lm(total_return ~ National_TV, data = nba_data_low)
National_TV <- lmp(fit_National_TV)
fit_Holiday.Weekend <- lm(total_return ~ Holiday.Weekend, data = nba_data_low)
Holiday.Weekend <- lmp(fit_Holiday.Weekend)
fit_Afternoon <- lm(total_return ~ Afternoon, data = nba_data_low)
Afternoon <- lmp(fit_Afternoon)

return_values_low <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)


# Med section

fit_Home_Team <- lm(total_return ~ Home_Team, data = nba_data_med)
Home_Team <- lmp(fit_Home_Team)
fit_Away_Team <- lm(total_return ~ Away_Team.x, data = nba_data_med)
Away_Team <- lmp(fit_Away_Team)
fit_StarScore <- lm(total_return ~ StarScore, data = nba_data_med)
StarScore <- lmp(fit_StarScore)
fit_Overall_PCT <- lm(total_return ~ Overall_PCT, data = nba_data_med)
Overall_PCT <- lmp(fit_Overall_PCT)
fit_Overall_Streak <- lm(total_return ~ Overall_Streak, data = nba_data_med)
Overall_Streak <- lmp(fit_Overall_Streak)
fit_Past_Overall_PCT <- lm(total_return ~ Past_Overall_PCT, data = nba_data_med)
Past_Overall_PCT <- lmp(fit_Past_Overall_PCT)
fit_Article_Search_Overall <- lm(total_return ~ Article_Search_Overall, data = nba_data_med)
Article_Search_Overall <- lmp(fit_Article_Search_Overall)
fit_National_TV <- lm(total_return ~ National_TV, data = nba_data_med)
National_TV <- lmp(fit_National_TV)
fit_Holiday.Weekend <- lm(total_return ~ Holiday.Weekend, data = nba_data_med)
Holiday.Weekend <- lmp(fit_Holiday.Weekend)
fit_Afternoon <- lm(total_return ~ Afternoon, data = nba_data_med)
Afternoon <- lmp(fit_Afternoon)

return_values_med <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)



# High section

fit_Home_Team <- lm(total_return ~ Home_Team, data = nba_data_high)
Home_Team <- lmp(fit_Home_Team)
fit_Away_Team <- lm(total_return ~ Away_Team.x, data = nba_data_high)
Away_Team <- lmp(fit_Away_Team)
fit_StarScore <- lm(total_return ~ StarScore, data = nba_data_high)
StarScore <- lmp(fit_StarScore)
fit_Overall_Streak <- lm(total_return ~ Overall_Streak, data = nba_data_high)
fit_Overall_PCT <- lm(total_return ~ Overall_PCT, data = nba_data_high)
Overall_PCT <- lmp(fit_Overall_PCT)
Overall_Streak <- lmp(fit_Overall_Streak)
fit_Past_Overall_PCT <- lm(total_return ~ Past_Overall_PCT, data = nba_data_high)
Past_Overall_PCT <- lmp(fit_Past_Overall_PCT)
fit_Article_Search_Overall <- lm(total_return ~ Article_Search_Overall, data = nba_data_high)
Article_Search_Overall <- lmp(fit_Article_Search_Overall)
fit_National_TV <- lm(total_return ~ National_TV, data = nba_data_high)
National_TV <- lmp(fit_National_TV)
fit_Holiday.Weekend <- lm(total_return ~ Holiday.Weekend, data = nba_data_high)
Holiday.Weekend <- lmp(fit_Holiday.Weekend)
fit_Afternoon <- lm(total_return ~ Afternoon, data = nba_data_high)
Afternoon <- lmp(fit_Afternoon)

return_values_high <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)


#### Regressions on Average Price

# Low section

fit_Home_Team <- lm(overall_avg_price ~ Home_Team, data = nba_data_low)
Home_Team <- lmp(fit_Home_Team)
fit_Away_Team <- lm(overall_avg_price ~ Away_Team.x, data = nba_data_low)
Away_Team <- lmp(fit_Away_Team)
fit_StarScore <- lm(overall_avg_price ~ StarScore, data = nba_data_low)
StarScore <- lmp(fit_StarScore)
fit_Overall_PCT <- lm(overall_avg_price ~ Overall_PCT, data = nba_data_low)
Overall_PCT <- lmp(fit_Overall_PCT)
fit_Overall_Streak <- lm(overall_avg_price ~ Overall_Streak, data = nba_data_low)
Overall_Streak <- lmp(fit_Overall_Streak)
fit_Past_Overall_PCT <- lm(overall_avg_price ~ Past_Overall_PCT, data = nba_data_low)
Past_Overall_PCT <- lmp(fit_Past_Overall_PCT)
fit_Article_Search_Overall <- lm(overall_avg_price ~ Article_Search_Overall, data = nba_data_low)
Article_Search_Overall <- lmp(fit_Article_Search_Overall)
fit_National_TV <- lm(overall_avg_price ~ National_TV, data = nba_data_low)
National_TV <- lmp(fit_National_TV)
fit_Holiday.Weekend <- lm(overall_avg_price ~ Holiday.Weekend, data = nba_data_low)
Holiday.Weekend <- lmp(fit_Holiday.Weekend)
fit_Afternoon <- lm(overall_avg_price ~ Afternoon, data = nba_data_low)
Afternoon <- lmp(fit_Afternoon)

avg_values_low <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)


# Med section

fit_Home_Team <- lm(overall_avg_price ~ Home_Team, data = nba_data_med)
Home_Team <- lmp(fit_Home_Team)
fit_Away_Team <- lm(overall_avg_price ~ Away_Team.x, data = nba_data_med)
Away_Team <- lmp(fit_Away_Team)
fit_StarScore <- lm(overall_avg_price ~ StarScore, data = nba_data_med)
StarScore <- lmp(fit_StarScore)
fit_Overall_PCT <- lm(overall_avg_price ~ Overall_PCT, data = nba_data_med)
Overall_PCT <- lmp(fit_Overall_PCT)
fit_Overall_Streak <- lm(overall_avg_price ~ Overall_Streak, data = nba_data_med)
Overall_Streak <- lmp(fit_Overall_Streak)
fit_Past_Overall_PCT <- lm(overall_avg_price ~ Past_Overall_PCT, data = nba_data_med)
Past_Overall_PCT <- lmp(fit_Past_Overall_PCT)
fit_Article_Search_Overall <- lm(overall_avg_price ~ Article_Search_Overall, data = nba_data_med)
Article_Search_Overall <- lmp(fit_Article_Search_Overall)
fit_National_TV <- lm(overall_avg_price ~ National_TV, data = nba_data_med)
National_TV <- lmp(fit_National_TV)
fit_Holiday.Weekend <- lm(overall_avg_price ~ Holiday.Weekend, data = nba_data_med)
Holiday.Weekend <- lmp(fit_Holiday.Weekend)
fit_Afternoon <- lm(overall_avg_price ~ Afternoon, data = nba_data_med)
Afternoon <- lmp(fit_Afternoon)

avg_values_med <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)


# High section

fit_Home_Team <- lm(overall_avg_price ~ Home_Team, data = nba_data_high)
Home_Team <- lmp(fit_Home_Team)
fit_Away_Team <- lm(overall_avg_price ~ Away_Team.x, data = nba_data_high)
Away_Team <- lmp(fit_Away_Team)
fit_StarScore <- lm(overall_avg_price ~ StarScore, data = nba_data_high)
StarScore <- lmp(fit_StarScore)
fit_Overall_PCT <- lm(overall_avg_price ~ Overall_PCT, data = nba_data_high)
Overall_PCT <- lmp(fit_Overall_PCT)
fit_Overall_Streak <- lm(overall_avg_price ~ Overall_Streak, data = nba_data_high)
Overall_Streak <- lmp(fit_Overall_Streak)
fit_Past_Overall_PCT <- lm(overall_avg_price ~ Past_Overall_PCT, data = nba_data_high)
Past_Overall_PCT <- lmp(fit_Past_Overall_PCT)
fit_Article_Search_Overall <- lm(overall_avg_price ~ Article_Search_Overall, data = nba_data_high)
Article_Search_Overall <- lmp(fit_Article_Search_Overall)
fit_National_TV <- lm(overall_avg_price ~ National_TV, data = nba_data_high)
National_TV <- lmp(fit_National_TV)
fit_Holiday.Weekend <- lm(overall_avg_price ~ Holiday.Weekend, data = nba_data_high)
Holiday.Weekend <- lmp(fit_Holiday.Weekend)
fit_Afternoon <- lm(overall_avg_price ~ Afternoon, data = nba_data_high)
Afternoon <- lmp(fit_Afternoon)

avg_values_high <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)


### Group them

influencers_pval <- data.frame(variables, return_values_low, return_values_med, return_values_high, avg_values_low, avg_values_med, avg_values_high)

# Write csv
write.csv(influencers_pval, "~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Analysis/influencers_pvalue.csv")





######################## Extracting rsquared ###########################


#### Return

# Low section

fit_Home_Team <- lm(total_return ~ Home_Team, data = nba_data_low)
Home_Team <- summary(fit_Home_Team)$r.squared
fit_Away_Team <- lm(total_return ~ Away_Team.x, data = nba_data_low)
Away_Team <- summary(fit_Away_Team)$r.squared
fit_StarScore <- lm(total_return ~ StarScore, data = nba_data_low)
StarScore <- summary(fit_StarScore)$r.squared
fit_Overall_PCT <- lm(total_return ~ Overall_PCT, data = nba_data_low)
Overall_PCT <- summary(fit_Overall_PCT)$r.squared
fit_Overall_Streak <- lm(total_return ~ Overall_Streak, data = nba_data_low)
Overall_Streak <- summary(fit_Overall_Streak)$r.squared
fit_Past_Overall_PCT <- lm(total_return ~ Past_Overall_PCT, data = nba_data_low)
Past_Overall_PCT <- summary(fit_Past_Overall_PCT)$r.squared
fit_Article_Search_Overall <- lm(total_return ~ Article_Search_Overall, data = nba_data_low)
Article_Search_Overall <- summary(fit_Article_Search_Overall)$r.squared
fit_National_TV <- lm(total_return ~ National_TV, data = nba_data_low)
National_TV <- summary(fit_National_TV)$r.squared
fit_Holiday.Weekend <- lm(total_return ~ Holiday.Weekend, data = nba_data_low)
Holiday.Weekend <- summary(fit_Holiday.Weekend)$r.squared
fit_Afternoon <- lm(total_return ~ Afternoon, data = nba_data_low)
Afternoon <- summary(fit_Afternoon)$r.squared

return_values_low <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)


# Med section

fit_Home_Team <- lm(total_return ~ Home_Team, data = nba_data_med)
Home_Team <- summary(fit_Home_Team)$r.squared
fit_Away_Team <- lm(total_return ~ Away_Team.x, data = nba_data_med)
Away_Team <- summary(fit_Away_Team)$r.squared
fit_StarScore <- lm(total_return ~ StarScore, data = nba_data_med)
StarScore <- summary(fit_StarScore)$r.squared
fit_Overall_PCT <- lm(total_return ~ Overall_PCT, data = nba_data_med)
Overall_PCT <- summary(fit_Overall_PCT)$r.squared
fit_Overall_Streak <- lm(total_return ~ Overall_Streak, data = nba_data_med)
Overall_Streak <- summary(fit_Overall_Streak)$r.squared
fit_Past_Overall_PCT <- lm(total_return ~ Past_Overall_PCT, data = nba_data_med)
Past_Overall_PCT <- summary(fit_Past_Overall_PCT)$r.squared
fit_Article_Search_Overall <- lm(total_return ~ Article_Search_Overall, data = nba_data_med)
Article_Search_Overall <- summary(fit_Article_Search_Overall)$r.squared
fit_National_TV <- lm(total_return ~ National_TV, data = nba_data_med)
National_TV <- summary(fit_National_TV)$r.squared
fit_Holiday.Weekend <- lm(total_return ~ Holiday.Weekend, data = nba_data_med)
Holiday.Weekend <- summary(fit_Holiday.Weekend)$r.squared
fit_Afternoon <- lm(total_return ~ Afternoon, data = nba_data_med)
Afternoon <- summary(fit_Afternoon)$r.squared

return_values_med <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)



# High section

fit_Home_Team <- lm(total_return ~ Home_Team, data = nba_data_high)
Home_Team <- summary(fit_Home_Team)$r.squared
fit_Away_Team <- lm(total_return ~ Away_Team.x, data = nba_data_high)
Away_Team <- summary(fit_Away_Team)$r.squared
fit_StarScore <- lm(total_return ~ StarScore, data = nba_data_high)
StarScore <- summary(fit_StarScore)$r.squared
fit_Overall_Streak <- lm(total_return ~ Overall_Streak, data = nba_data_high)
fit_Overall_PCT <- lm(total_return ~ Overall_PCT, data = nba_data_high)
Overall_PCT <- summary(fit_Overall_PCT)$r.squared
Overall_Streak <- summary(fit_Overall_Streak)$r.squared
fit_Past_Overall_PCT <- lm(total_return ~ Past_Overall_PCT, data = nba_data_high)
Past_Overall_PCT <- summary(fit_Past_Overall_PCT)$r.squared
fit_Article_Search_Overall <- lm(total_return ~ Article_Search_Overall, data = nba_data_high)
Article_Search_Overall <- summary(fit_Article_Search_Overall)$r.squared
fit_National_TV <- lm(total_return ~ National_TV, data = nba_data_high)
National_TV <- summary(fit_National_TV)$r.squared
fit_Holiday.Weekend <- lm(total_return ~ Holiday.Weekend, data = nba_data_high)
Holiday.Weekend <- summary(fit_Holiday.Weekend)$r.squared
fit_Afternoon <- lm(total_return ~ Afternoon, data = nba_data_high)
Afternoon <- summary(fit_Afternoon)$r.squared

return_values_high <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)


#### Average Price

# Low section

fit_Home_Team <- lm(overall_avg_price ~ Home_Team, data = nba_data_low)
Home_Team <- summary(fit_Home_Team)$r.squared
fit_Away_Team <- lm(overall_avg_price ~ Away_Team.x, data = nba_data_low)
Away_Team <- summary(fit_Away_Team)$r.squared
fit_StarScore <- lm(overall_avg_price ~ StarScore, data = nba_data_low)
StarScore <- summary(fit_StarScore)$r.squared
fit_Overall_PCT <- lm(overall_avg_price ~ Overall_PCT, data = nba_data_low)
Overall_PCT <- summary(fit_Overall_PCT)$r.squared
fit_Overall_Streak <- lm(overall_avg_price ~ Overall_Streak, data = nba_data_low)
Overall_Streak <- summary(fit_Overall_Streak)$r.squared
fit_Past_Overall_PCT <- lm(overall_avg_price ~ Past_Overall_PCT, data = nba_data_low)
Past_Overall_PCT <- summary(fit_Past_Overall_PCT)$r.squared
fit_Article_Search_Overall <- lm(overall_avg_price ~ Article_Search_Overall, data = nba_data_low)
Article_Search_Overall <- summary(fit_Article_Search_Overall)$r.squared
fit_National_TV <- lm(overall_avg_price ~ National_TV, data = nba_data_low)
National_TV <- summary(fit_National_TV)$r.squared
fit_Holiday.Weekend <- lm(overall_avg_price ~ Holiday.Weekend, data = nba_data_low)
Holiday.Weekend <- summary(fit_Holiday.Weekend)$r.squared
fit_Afternoon <- lm(overall_avg_price ~ Afternoon, data = nba_data_low)
Afternoon <- summary(fit_Afternoon)$r.squared

avg_values_low <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)


# Med section

fit_Home_Team <- lm(overall_avg_price ~ Home_Team, data = nba_data_med)
Home_Team <- summary(fit_Home_Team)$r.squared
fit_Away_Team <- lm(overall_avg_price ~ Away_Team.x, data = nba_data_med)
Away_Team <- summary(fit_Away_Team)$r.squared
fit_StarScore <- lm(overall_avg_price ~ StarScore, data = nba_data_med)
StarScore <- summary(fit_StarScore)$r.squared
fit_Overall_PCT <- lm(overall_avg_price ~ Overall_PCT, data = nba_data_med)
Overall_PCT <- summary(fit_Overall_PCT)$r.squared
fit_Overall_Streak <- lm(overall_avg_price ~ Overall_Streak, data = nba_data_med)
Overall_Streak <- summary(fit_Overall_Streak)$r.squared
fit_Past_Overall_PCT <- lm(overall_avg_price ~ Past_Overall_PCT, data = nba_data_med)
Past_Overall_PCT <- summary(fit_Past_Overall_PCT)$r.squared
fit_Article_Search_Overall <- lm(overall_avg_price ~ Article_Search_Overall, data = nba_data_med)
Article_Search_Overall <- summary(fit_Article_Search_Overall)$r.squared
fit_National_TV <- lm(overall_avg_price ~ National_TV, data = nba_data_med)
National_TV <- summary(fit_National_TV)$r.squared
fit_Holiday.Weekend <- lm(overall_avg_price ~ Holiday.Weekend, data = nba_data_med)
Holiday.Weekend <- summary(fit_Holiday.Weekend)$r.squared
fit_Afternoon <- lm(overall_avg_price ~ Afternoon, data = nba_data_med)
Afternoon <- summary(fit_Afternoon)$r.squared

avg_values_med <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)


# High section

fit_Home_Team <- lm(overall_avg_price ~ Home_Team, data = nba_data_high)
Home_Team <- summary(fit_Home_Team)$r.squared
fit_Away_Team <- lm(overall_avg_price ~ Away_Team.x, data = nba_data_high)
Away_Team <- summary(fit_Away_Team)$r.squared
fit_StarScore <- lm(overall_avg_price ~ StarScore, data = nba_data_high)
StarScore <- summary(fit_StarScore)$r.squared
fit_Overall_PCT <- lm(overall_avg_price ~ Overall_PCT, data = nba_data_high)
Overall_PCT <- summary(fit_Overall_PCT)$r.squared
fit_Overall_Streak <- lm(overall_avg_price ~ Overall_Streak, data = nba_data_high)
Overall_Streak <- summary(fit_Overall_Streak)$r.squared
fit_Past_Overall_PCT <- lm(overall_avg_price ~ Past_Overall_PCT, data = nba_data_high)
Past_Overall_PCT <- summary(fit_Past_Overall_PCT)$r.squared
fit_Article_Search_Overall <- lm(overall_avg_price ~ Article_Search_Overall, data = nba_data_high)
Article_Search_Overall <- summary(fit_Article_Search_Overall)$r.squared
fit_National_TV <- lm(overall_avg_price ~ National_TV, data = nba_data_high)
National_TV <- summary(fit_National_TV)$r.squared
fit_Holiday.Weekend <- lm(overall_avg_price ~ Holiday.Weekend, data = nba_data_high)
Holiday.Weekend <- summary(fit_Holiday.Weekend)$r.squared
fit_Afternoon <- lm(overall_avg_price ~ Afternoon, data = nba_data_high)
Afternoon <- summary(fit_Afternoon)$r.squared

avg_values_high <- c(Home_Team, Away_Team, StarScore, Overall_PCT, Overall_Streak, Past_Overall_PCT, Article_Search_Overall, National_TV, Holiday.Weekend, Afternoon)


### Group them

influencers_rsq <- data.frame(variables, return_values_low, return_values_med, return_values_high, avg_values_low, avg_values_med, avg_values_high)


# Write csv
write.csv(influencers_rsq, "~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Analysis/influencers_rsquare.csv")