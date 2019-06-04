# Taken from chapter 19 exercise 7 from the book

# Load Shiny library
library(shiny)

# Source the ui and server files
source("app_ui.R")
source("app_server.R")

# Create the new shinyApp using the UI and server
shinyApp(ui = ui, server = server)
