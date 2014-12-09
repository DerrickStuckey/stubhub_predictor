library(shiny)


nba <- read.csv('~/Desktop/GW/Fall2014/Programming/Group Project/codes_/app/data/NBA_Tickets.csv', stringsAsFactors=FALSE)
all_home <- as.character(sort(unique(nba$Home_Team)))
all_home[1] <- 'None'

# ui.R

shinyUI(fluidPage(
  titlePanel("Pricing Analysis"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = 'home_team', label = 'Select home team', choices = all_home, selected = 'None'),
      uiOutput('at'),
      uiOutput('gd')
    ),
    mainPanel(
      h4('Pricing Summary'),
      tableOutput('prices'),
      h4('Current team perfomance'),
      tableOutput('performance'),
      h4('Star Score and Numer of ESPN Articles (20 days)'),
      tableOutput('star_article'),
      h4('Schedule'),
      tableOutput('schedule'),
      plotOutput('avg_plot'),
      plotOutput('return_plot')
    )
  )
))

