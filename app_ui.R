# File inspired by Chapter 19 Exercise 7 app_ui.R
# ui.R
library(shiny)
library(plotly)
library(shinythemes)

# ==== Overview ====

# Overview sidebar
overview_panel <- mainPanel(
  h4(id = "fh4", "The Data Tamers' Group Project"),
  
  tags$hr(),
  
  h3(id = "fh3", "The Data Set"),
  
  div(id = "wrapper",
    div(id = "main",
      p(
        tags$a(
          href = "https://nces.ed.gov/ccd/f33agency.asp",
          tags$strong("The data set")
        ),
        "this project centers around
          is the data from the \"Local Education Agency (School District)
          Finance Survey\", also known as
          survey F-33. This survey is conducted yearly by the federal 
          government of the USA, and aggregates information
          on salaries, debt, student numbers, funding, expenditures, 
          and other monetary figures for all primary
          and secondary schools. Each school district in the entirety 
          of the USA is represented. For our analysis, we used 
          the publicly released data, which spans from 1995 up to 2016."
      ),
      
      p("To look at the data, we are using compiled datasets 
          from the U.S. Census Bureau as authorized
          by Title 13, United States Code, Section 161 and 182. 
          Due to the large volume of data, we narrowed our analysis down to
          columns for funding sources, salaries, and basic expenditures, and
          the data are grouped by state."),
      
      p("Since the population in each state varies widely, our data is
        normalized according to student counts.",
        
        tags$strong(" A unit of money 
        in this data set is not measured in USD, 
        but instead USD per student.")
        
        
      )
    ),
    
    div(
      tags$img(src = "federalrevenue.gif", width = "100%"),
      tags$em("Federal primary/secondary school funding from 1995 to 2016.")
    )
  )
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
      "Total Revenue" = "Total Revenue",
      "Federal Revenue" = "Federal Revenue",
      "State Revenue" = "State Revenue",
      "Local Revenue" = "Local Revenue",
      "Total Expenditures" = "Total Expenditures",
      "Salaries" = "Salaries",
      "Teacher Revenue" = "Teacher Revenue"
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
  sliderInput(
    "bar_year",
    label = "Year",
    min = 1995,
    max = 2016,
    value = 1995,
    step = 1
  ),
  
  # Select dropdown for which state to display
  selectInput(
    "state",
    label = "State",
    choices = list(
      "USA" = "USA",
      "Alabama" = "AL",
      "Alaska" = "AK",
      "Arizona" = "AZ",
      "Arkansas" = "AR",
      "California" = "CA",
      "Colorado" = "CO",
      "Connecticut" = "CT",
      "Delaware" = "DE",
      "Florida" = "FL",
      "Georgia" = "GA",
      "Hawaii" = "HI",
      "Idaho" = "ID",
      "Illinois" = "IL",
      "Indiana" = "IN",
      "Iowa" = "IA",
      "Kansas" = "KS",
      "Kentucky" = "KY",
      "Louisiana" = "LA",
      "Maine" = "ME",
      "Maryland" = "MD",
      "Massachusetts" = "MA",
      "Michigan" = "MI",
      "Minnesota" = "MN",
      "Mississippi" = "MS",
      "Missouri" = "MO",
      "Montana" = "MT",
      "Nebraska" = "NE",
      "Nevada" = "NV",
      "New Hampshire" = "NH",
      "New Jersey" = "NJ",
      "New Mexico" = "NM",
      "New York" = "NY",
      "North Carolina" = "NC",
      "North Dakota" = "ND",
      "Ohio" = "OH",
      "Oklahoma" = "OK",
      "Oregon" = "OR",
      "Pennsylvania" = "PA",
      "Rhode Island" = "RI",
      "South Carolina" = "SC",
      "South Dakota" = "SD",
      "Tennessee" = "TN",
      "Texas" = "TX",
      "Utah" = "UT",
      "Vermont" = "VT",
      "Virginia" = "VA",
      "Washington" = "WA",
      "West Virginia" = "WV",
      "Wisconsin" = "WI",
      "Wyoming" = "WY",
      "District of Columbia" = "DC"
    ),
    selected = "USA"
  )
)

# the Main Panel, which holds the graph for population
bar_main_content <- mainPanel(
  #plotOutput("bar", height = "800px")
)

# populations tab panel, which has the pops sidebar and main content.
bar_panel <- tabPanel(
  "Comparing Funding in a Single Year",

  # Title for the pops panel
  titlePanel("Comparing Funding in a Single Year"),

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
  "Primary/Seconday School Funding",
  overview_page,
  map_panel,
  bar_panel,
  div_panel,
  summary_panel,
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
  ),
  theme = shinytheme("united")
)
