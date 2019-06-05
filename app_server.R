# File inspired by Chapter 19 Exercise 7 app_server.R
# server.R

# Read in tools for making charts
source("final_project/scripts/map.R")
source("final_project/scripts/bar.R")
source("final_project/scripts/diverging.R")

# Start shinyServer
server <- function(input, output) {
   #Renders a shiny object which displays the demographics bar chart
  output$map <- renderPlot({
    return(surplus_map(input$map_year, input$map_metric))
  })
  
  output$bar <- renderPlot({
    return(state_info(input$bar_year, input$bar_state))
  })
  
  output$div <- renderPlot({
    return(divergingMap(input$div_state))
  })
}
