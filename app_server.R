# File inspired by Chapter 19 Exercise 7 app_server.R
# server.R
library(dplyr)
library(ggplot2)

# Read in tools for making charts
source("final_project/scripts/map.R")

# Start shinyServer
server <- function(input, output) {
   #Renders a shiny object which displays the demographics bar chart
  output$map <- renderPlot({
    return(surplus_map(input$map_year, input$map_metric))
  })
}
