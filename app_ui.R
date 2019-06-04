# File inspired by Chapter 19 Exercise 7 app_ui.R
# ui.R
library(shiny)
library(plotly)

# Overview sidebar
overview_panel <- mainPanel(

  h2("The Data Tamers' Group Project"),
  
  tags$hr(),
  
  tags$hr(),
  
  h3("The Data Set"),
  
  p("blah")
)

overview_sidebar_panel <- sidebarPanel(
  h3("The Questions"),
  
  p("blah")
)

overview_page <- tabPanel(
  "Overview",
  titlePanel("USA Education Funding over the years."),
  
  sidebarLayout(
    overview_panel,
    
    overview_sidebar_panel
  )
)

# Sidebar for the map page
map_sidebar_content <- sidebarPanel(
  sliderInput(
    "map_year",
    label = "Year",
    min = 1995,
    max = 2016,
    value = 1995,
    step = 1
  ),

  # Radio Buttons which select the display format
  selectInput(
    "map_metric",
    label = "Statistic",
    choices = list(
      "Total Revenue" = "Total.Revenue",
      "Federal Revenue" = "Federal.Revenue",
      "State Revenue" = "State.Revenue",
      "Local Revenue" = "Local.Revenue",
      "Total Expenditures" = "Total.Expenditures",
      "Salaries" = "Salaries",
      "Teacher Revenue" = "Teacher.Revenue",
      "Students" = "Students"
    ),
    selected = "Total Revenue"
  )

)

# Main panel - map plot
map_main_content <- mainPanel(
  plotOutput("map", height = "800px")
)

# map tab panel
map_panel <- tabPanel(
  "Map of USA Funding Statistics",
  titlePanel("Map of USA Funding Statistics"),
  # Sidebar layout for the page
  sidebarLayout(
    # The controls which change the map
    map_sidebar_content,

    # The map
    map_main_content
  )
)

# Sidebar for the population information page
bar_sidebar_content <- sidebarPanel(
  # Select dropdown for which state to display
  selectInput(
    "state",
    label = "State",
    choices = list(
      "Illinois" = "IL",
      "Indiana" = "IN",
      "Michigan" = "MI",
      "Ohio" = "OH",
      "Wisconsin" = "WI"
    ),
    selected = "Illinois"
  ),

  # Radio Buttons for the population information
  radioButtons(
    "pop",
    label = "Type of Population",
    choices = list(
      "Population" = "Population",
      "Adults" = "Adults",
      "Children" = "Children",
      "Population Density" = "Population Density"
    ),
    selected = "Population"
  )
)

# the Main Panel, which holds the graph for population
bar_main_content <- mainPanel(
  
)

# populations tab panel, which has the pops sidebar and main content.
bar_panel <- tabPanel(
  "Population by County",

  # Title for the pops panel
  titlePanel("Population in one state"),

  # Sidebar layout
  sidebarLayout(

    # Controls that change graph content
    bar_sidebar_content,

    # The bar graph for pops, split by county
    bar_main_content
  )
)

# Final UI definition
ui <- navbarPage(
  "Midwest Population",
  overview_page,
  map_panel,
  bar_panel
)
