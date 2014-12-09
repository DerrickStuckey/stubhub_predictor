library(XML)

# Declare url
url <- paste("http://sportresults.lemons.se/20070814layout/showtable.php?event=nba&type=division&date=", Sys.Date(), sep = '')

# Scrape with HTML table scrapers
performance <- readHTMLTable(url)

# Extract appriate list element and select relevant columns and rows
performance <- performance[[2]]
performance <- performance[-c(1, 7, 13, 19, 25, 31),c(1, 4, 11)]

# Trasform streak to numeric value
streak <- unlist(performance[3])
streak <- sub("W ", "", streak)
streak <- sub("L ", "-", streak)
streak <- as.numeric(streak)
performance[3] <- streak

# Declare data frame names
names(performance) <- c('Team', 'PCT', 'Streak')

# Make necessary name transformations so that data matches
performance$Team <- as.character(performance$Team)
performance$Team[performance$Team == "LA Clippers"] <- "Los Angeles Clippers"
performance$Team[performance$Team == "Charlotte Hornets Bobcats"] <- "Charlotte Hornets"

# Write csv file
write.csv(performance, "~/Desktop/GW/Fall2014/Programming/Group Project/codes_/Data_Aggregation/Perf_Score_all.csv")
