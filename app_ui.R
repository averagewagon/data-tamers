# File inspired by Chapter 19 Exercise 7 app_ui.R
# ui.R
library(shiny)
library(plotly)

# ==== Overview ====

# Overview sidebar
overview_panel <- mainPanel(
  HTML("<h2>The Data Tamers' Group Project</h2>
        <hr><hr>
        <h3>The Data Set</h3>
        <p>
          For this project, we are looking at the domain of education with a focus on the financial<br>
          characteristics of schools over the past twenty years and how they has differ over time<br>
          and geographic location.
        </p>
        <p>
          To look into this, we are using compiled datasets from the U.S. Census Bureau as authorized<br>
          by Title 13, United States Code, Section 161 and 182. Under this authorization, we are able<br>
          to access surveys of every school in the United States, including Washington D.C., in order<br>
          to collect information on education finance data such as revenue, expenditure, debt, and<br>
          assets of elementary and secondary public school systems.
        </p>
        <p>
          When we started this project we decided to dive into education data with the hopes of seeing<br>
          how time, geography, and social/political/historical events affected the data. Even though<br>
          we found data to suppart us on this journey (student incarceration data and school<br>
          shootings data) we got too enveloped within the mass amount of financial data we gathered.
        </p>
       ")
)

overview_sidebar_panel <- sidebarPanel(
  HTML("<h3>The Questions</h3>
        <ul>
          <li>Over the 20 year period, how do the different metric change across the states?</li>
          <li>Which states went into debt over the different years?</li>
          <li>What is the distribution of each metric for each state for a given year?</li>
        </ul>
       ")
)

overview_page <- tabPanel(
  "Overview",
  titlePanel("USA Education Funding over the years."),
  
  sidebarLayout(
    overview_panel,
    
    overview_sidebar_panel
  )
)

# ==== Map ====

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

# ==== Bar ====

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

# ==== Summary ====

div_sidebar_content <- sidebarPanel(
  
)

div_main_content <- mainPanel(
  
)

# populations tab panel, which has the pops sidebar and main content.
div_panel <- tabPanel(
  "Diverging Bar Chart",
  
  # Title for the pops panel
  titlePanel("Debt Calculations"),
  
  # Sidebar layout
  sidebarLayout(
    
    # Controls that change graph content
    div_sidebar_content,
    
    # The bar graph for pops, split by county
    div_main_content
  )
)

# ==== Summary ====

summary_sidebar_content <- sidebarPanel(
  
)

summary_main_content <- mainPanel(
  
)

# populations tab panel, which has the pops sidebar and main content.
summary_panel <- tabPanel(
  "Summary",
  
  # Title for the pops panel
  titlePanel("Summary Information and Takeaways"),
  
  # Sidebar layout
  sidebarLayout(
    
    # Controls that change graph content
    summary_sidebar_content,
    
    # The bar graph for pops, split by county
    summary_main_content
  )
)

# ==== ui initializing ====

# Final UI definition
ui <- navbarPage(
  "Education Funding",
  overview_page,
  map_panel,
  bar_panel,
  div_panel,
  summary_panel
)
