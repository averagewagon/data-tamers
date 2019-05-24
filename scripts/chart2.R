# General setup
library(tidyverse)
library(mapdata)
#library(maps)
library(stringr)
library(viridis)
library(viridisLite)

funding_of_year <- read.csv("../data/funding/prepped/prepf2016.csv", stringsAsFactors = FALSE)

states <- map_data("state")
states_base <- ggplot(data = states) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group)) + 
  coord_quickmap() +
  guides(fill = FALSE)  # do this to leave off the color legend

funds_use <- states_base + 
  geom_polygon(data = funding_of_year, aes(fill = Total.Revenue - Total.Expenditures), color = "black") +
  geom_polygon(color = "black", fill = NA) +
  theme_void() +
  scale_fill_gradientn(colours = rev(rainbow(2)),
                       breaks = 0,
                       trans = "log10")