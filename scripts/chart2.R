# General setup
library(ggplot2)

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
funding <- read.csv("../data/funding/prepped/aggregate.csv", stringsAsFactors = F) %>%
  filter(Year == 2016) %>% # keep only 2016 data
  mutate(state = tolower(State.Name)) %>%
  mutate(surplus = Total.Revenue - Total.Expenditures)

# Join eviction data to the U.S. shapefile
state_shape <- map_data("state") %>%
  rename(state = region) %>%
  left_join(funding, by = "state")

# Define a minimalist theme for maps
minimalist_theme <- theme_bw() +
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

# Draw the map showing state surplus amount
surplus_map <- ggplot(state_shape) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = surplus),
    color = "white",
    size = .1
  ) +
  coord_map() + # use a map-based coordinate system
  scale_fill_continuous(low = "Red", high = "Yellow") +
  labs(fill = "Surplus ($)") +
  minimalist_theme
