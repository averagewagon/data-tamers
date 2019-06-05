# General setup
library("dplyr")
library("ggplot2")
library(stringr)

# Draw the map showing state surplus amount
surplus_map <- function(given_year, given_metric) {
  altered_metric = str_replace(given_metric, " ", ".")
  # Load shapefile of U.S. states
  state_shape <- map_data("state")
  # Create a blank map of U.S. states
  usa_map <- ggplot(state_shape) +
    geom_polygon(
      mapping = aes(x = long, y = lat, group = group),
      color = "white",
      size = .1
    ) +
    coord_map()
  # Load funding data
  intermediate_df <- read.csv("data/funding/prepped/aggregate.csv", stringsAsFactors = F)
  col <- intermediate_df[[altered_metric]]
  max <- max(col)
  min <- min(col)
  
  funding_data <- intermediate_df %>%
    filter(Year == given_year) %>%
    mutate(state = tolower(State.Name))
  funding_data$observation <- funding_data[[altered_metric]]
  # Join eviction data to the U.S. shapefile
  state_shape <- map_data("state") %>%
    rename(state = region) %>%
    left_join(funding_data, by = "state")
  # Fill in the map
  ggplot(state_shape) +
    geom_polygon(
      mapping = aes(x = long, y = lat, group = group, fill = observation),
      color = "white",
      size = .1
    ) +
    coord_map() +
    scale_fill_viridis_c(limits = c(min, max)) +
    labs(
      fill = "Revenue/Expenditure ($)",
      title = paste(given_metric, "in", given_year)
    ) +
    # Add a minimalist theme
    theme_bw() +
    theme(
      plot.title = element_text(size = 24, face = "bold"),
      axis.line = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      axis.title = element_blank(),
      plot.background = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.border = element_blank()
    )
}

