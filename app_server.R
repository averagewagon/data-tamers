# File inspired by Chapter 19 Exercise 7 app_server.R
# server.R
library(dplyr)
library(ggplot2)

# Read in tools for making charts

# Start shinyServer
server <- function(input, output) {
   #Renders a shiny object which displays the demographics bar chart
  output$map <- renderPlot({
    return(build_demographics(midwest, input$set, input$layout))
  })
}
