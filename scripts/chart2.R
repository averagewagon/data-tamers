# General setup
library("dplyr")
library("ggplot2")

# Draw the map showing state surplus amount
surplus_map <- function(data_source, given_year) {
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
  funding_data <- funding_data(data_source, given_year)
  # Join eviction data to the U.S. shapefile
  state_shape <- map_data("state") %>%
    rename(state = region) %>%
    left_join(funding_data, by = "state")
  # Fill in the map
  ggplot(state_shape) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = surplus),
    color = "white",
    size = .1
  ) +
  coord_map() +
  scale_fill_continuous(low = "Red", high = "Yellow") +
  labs(fill = paste(given_year, "Surplus ($)")) +
  # Add a minimalist theme
  theme_bw() +
  theme(
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

# Load state funding data for a given year
funding_data <- function(data_source, given_year) {
  read.csv(data_source, stringsAsFactors = F) %>%
    filter(Year == given_year) %>%
    mutate(state = tolower(State.Name)) %>%
    mutate(surplus = Total.Revenue - Total.Expenditures)
}
