library("shiny")
library("ggplot2")

# ==== Map ====
widgets_map <- sidebarPanel(
  
)

content_map <- mainPanel(
  
)

map <- tabPanel(
  "Interactive Map",
  sidebarLayout(
    
  )
)

# ==== Diverging Bar ====
widgets_bar <- sidebarPanel(
  
)

content_bar <- mainPanel(
  
)

diverging_bar <- tabPanel(
  "Diverging bar",
  sidebarLayout(
    
  )
)

# ==== Trend Line ====
widgets_trend <- sidebarPanel(
  
)

content_trend <- mainPanel(
  
)

trend_line <- tabPanel(
  "Trend Lines",
  sidebarLayout(
    
  )
)

ui <- navbarPage(
  "Education Funding",
  map,
  diverging_bar,
  trend_line
)