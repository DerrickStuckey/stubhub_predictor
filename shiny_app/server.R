# server.R
# aprs <- read.csv("~/Desktop/GW/R-wd/test-app/data/Approvals.csv")
library(shiny)
library(plyr)
library(ggplot2)

nba <- read.csv('~/Desktop/GW/Fall2014/Programming/Group Project/codes_/app/data/NBA_Tickets.csv', stringsAsFactors=FALSE)

choose_home_team <- function(homeTeam) {
  x <- subset(nba, Home_Team == homeTeam)
  uniqueV <- sort(unique(x$Away_Team.x))
  uniqueV[1] <- 'None'
  return(uniqueV)
}

filter_dates <- function(homeTeam, awayTeam){
  nba2 <- subset(nba, Home_Team == homeTeam & Away_Team.x == awayTeam)
  dates <- as.character(sort(unique(nba2$Date)))
  return(dates)
}

price_table <- function(homeTeam, awayTeam, gameDate){
  nba2 <- subset(nba, Home_Team == homeTeam & Away_Team.x == awayTeam & Date == gameDate)
  price_table <- data.frame(nba2$section_lmh, nba2$overall_avg_price, nba2$opening_price, nba2$closing_price, nba2$total_return)
  names(price_table) <- c('Section', 'Average Price', 'Opening Price', 'Closing Price', 'Return')
  return(price_table)
}

performance_table <- function(homeTeam, awayTeam, gameDate){
  nba2 <- subset(nba, Home_Team == homeTeam & Away_Team.x == awayTeam & Date == gameDate)
  performance_table <- data.frame(nba2$Home_PCT, nba2$Away_PCT)
  names(performance_table) <- c('Home Performance', 'Away Performance')
  performance_table <- performance_table[1,]
  return(performance_table)
}

star_article_table <- function(homeTeam, awayTeam, gameDate){
  nba2 <- subset(nba, Home_Team == homeTeam & Away_Team.x == awayTeam & Date == gameDate)
  star_article_table <- data.frame(nba2$Home_Star_Score, nba2$Away_Star_Score, nba2$Home_Article_Count, nba2$Away_Article_Count)
  names(star_article_table) <- c('Home Star Score', 'Away Star Score', 'Home Articles', 'Away Articles')
  star_article_table <- star_article_table[1,]
  return(star_article_table)
}

schedule_table <- function(homeTeam, awayTeam, gameDate){
  nba2 <- subset(nba, Home_Team == homeTeam & Away_Team.x == awayTeam & Date == gameDate)
  schedule_table <- data.frame(nba2$National_TV, nba2$Holiday.Weekend, nba2$Afternoon)
  schedule_table$ntv <- 'No'
  schedule_table$ntv[schedule_table$National_TV == 1] <- 'Yes'
  schedule_table$hwg <- 'No'
  schedule_table$hwg[schedule_table$Holiday.Weekend == 1] <- 'Yes'
  schedule_table$aft <- 'No'
  schedule_table$aft[schedule_table$Afternoon == 1] <- 'Yes'
  schedule_table <- schedule_table[c(4, 5, 6)]
  names(schedule_table) <- c('National TV', 'Holiday or Weekend Game', 'Afternoon Game')
  schedule_table <- schedule_table[1,]
  return(schedule_table)
}

nba_plot_all <- function(homeTeam){
  nba_plot_all <- subset(nba, Home_Team == homeTeam)
  nba_plot_all <- transform(nba_plot_all, Date = as.Date(Date))
  nba_plot_all <- arrange(nba_plot_all, Date)
  return(nba_plot_all)
}

nba_plot_game <- function(homeTeam, awayTeam, gameDate){
  nba_plot_game <- subset(nba, Home_Team == homeTeam & Away_Team.x == awayTeam & Date == gameDate)
  nba_plot_game <- transform(nba_plot_game, Date = as.Date(Date))
  return(nba_plot_game)
}

nba_blank <- data.frame(X = '', Date = '', Home_Team = '', Away_Team.x = '', event_id = '', overall_avg_price = 0, total_observations = 0, days_out = 0, section_lmh = '', closing_price = 0, opening_price = 0, total_return = 0, ll = 0, Home_Star_Score = 0, Away_Star_Score = 0, StarScore = 0, Home_PCT= 0, Home_Streak = 0, Away_PCT = 0, Away_Streak = 0, Overall_PCT = 0, Overall_Streak = 0, Past_Home_PCT = 0, Past_Away_PCT = 0, Past_Overall_PCT = 0, Home_Article_Count = 0, Away_Article_Count = 0, Article_Search_Overall = 0, Excel_Date = '', Away_Team.y = '', National_TV_Channel = 0, National_TV = 0, Holiday.Weekend = 0, Afternoon = 0)

none <- 'None'

shinyServer(function(input, output) {         
  
  away_team_var <- reactive({
    
    if(input$home_team == 'None') {
      'None'
    }
    
    else if(input$home_team == 'Atlanta Hawks') {
      as.character(choose_home_team('Atlanta Hawks'))}
    
    else if(input$home_team == 'Boston Celtics') {
      as.character(choose_home_team('Boston Celtics'))}
    
    else if(input$home_team == 'Brooklyn Nets') {
      as.character(choose_home_team('Brooklyn Nets'))}
    
    else if(input$home_team == 'Charlotte Hornets') {
      as.character(choose_home_team('Charlotte Hornets'))}
    
    else if(input$home_team == 'Chicago Bulls') {
      as.character(choose_home_team('Chicago Bulls'))}
    
    else if(input$home_team == 'Cleveland Cavaliers') {
      as.character(choose_home_team('Cleveland Cavaliers'))}
    
    else if(input$home_team == 'Dallas Mavericks') {
      as.character(choose_home_team('Dallas Mavericks'))}
    
    else if(input$home_team == 'Denver Nuggets') {
      as.character(choose_home_team('Denver Nuggets'))}
    
    else if(input$home_team == 'Detroit Pistons') {
      as.character(choose_home_team('Detroit Pistons'))}
    
    else if(input$home_team == 'Indiana Pacers') {
      as.character(choose_home_team('Indiana Pacers'))}
    
    else if(input$home_team == 'Los Angeles Lakers') {
      as.character(choose_home_team('Los Angeles Lakers'))}
    
    else if(input$home_team == 'Memphis Grizzlies') {
      as.character(choose_home_team('Memphis Grizzlies'))}
    
    else if(input$home_team == 'Miami Heat') {
      as.character(choose_home_team('Miami Heat'))}
    
    else if(input$home_team == 'Milwaukee Bucks') {
      as.character(choose_home_team('Milwaukee Bucks'))}
    
    else if(input$home_team == 'New Orleans Pelicans') {
      as.character(choose_home_team('New Orleans Pelicans'))}
    
    else if(input$home_team == 'New York Knicks') {
      as.character(choose_home_team('New York Knicks'))}
    
    else if(input$home_team == 'Orlando Magic') {
      as.character(choose_home_team('Orlando Magic'))}
    
    else if(input$home_team == 'Philadelphia 76ers') {
      as.character(choose_home_team('Philadelphia 76ers'))}
    
    else if(input$home_team == 'Phoenix Suns') {
      as.character(choose_home_team('Phoenix Suns'))}
    
    else if(input$home_team == 'Sacramento Kings') {
      as.character(choose_home_team('Sacramento Kings'))}
    
    else if(input$home_team == 'San Antonio Spurs') {
      as.character(choose_home_team('San Antonio Spurs'))}
    
    else if(input$home_team == 'Toronto Raptors') {
      as.character(choose_home_team('Toronto Raptors'))}
    
    else if(input$home_team == 'Washington Wizards') {
      as.character(choose_home_team('Washington Wizards'))}

  })
  
  
  date_var <- reactive({
    
    if(input$home_team == 'None' | input$away_team == 'None')
    {none}
    
    else
    {filter_dates(input$home_team, input$away_team)}
  })
  
  
  price_var <- reactive({
    
    if(input$game_date == 'None')
    {data.frame()}
    
    else
    {price_table(input$home_team, input$away_team, input$game_date)}
  })
  
  
  performance_var <- reactive({
    
    if(input$game_date == 'None')
    {data.frame()}
    
    else
    {performance_table(input$home_team, input$away_team, input$game_date)}
  })
  
  
  star_article_var <- reactive({
    
    if(input$game_date == 'None')
    {data.frame()}
    
    else
    {star_article_table(input$home_team, input$away_team, input$game_date)}
  })
  
  
  schedule_var <- reactive({
    
    if(input$game_date == 'None')
    {data.frame()}
    
    else
    {schedule_table(input$home_team, input$away_team, input$game_date)}
  })
  
  
  plot_all_var <- reactive({
    
    if(input$game_date == 'None')
    {nba_blank}
    
    else
    {nba_plot_all(input$home_team)}
  })
  
  plot_game_var <- reactive({
    
    if(input$game_date == 'None')
    {nba_blank}
    
    else
    {nba_plot_game(input$home_team, input$away_team, input$game_date)}
  })

  
  output$at <- renderUI({
    selectInput(inputId = 'away_team', label = 'Select away team', choices = away_team_var(), selected = 'None')
  })
  
  
  output$gd <- renderUI({
    selectInput(inputId = 'game_date', label = 'Select game date', choices = date_var(), selected = 'None')
  })
  
  output$prices <- renderTable({
    price_var()
  })
  
  output$performance <- renderTable({
    performance_var()
  })
  
  output$star_article <- renderTable({
    star_article_var()
  })
  
  output$schedule <- renderTable({
    schedule_var()
  })
  
  output$avg_plot <- renderPlot({
    ggplot(data = plot_all_var(), aes(Date, overall_avg_price, group = section_lmh, colour = section_lmh)) +
      geom_line() +
      xlab("") +
      ylab("Average Price") +
      geom_point(data = plot_game_var(), aes(Date, overall_avg_price, colour = section_lmh), size = 3)
  })
  
  output$return_plot <- renderPlot({
    ggplot(data = plot_all_var(), aes(Date, total_return, group = section_lmh, colour = section_lmh)) +
      geom_line() +
      xlab("") +
      ylab("Return") +
      geom_point(data = plot_game_var(), aes(Date, total_return, colour = section_lmh), size = 3)
  })
  
}
)