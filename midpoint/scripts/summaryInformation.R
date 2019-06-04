# General setup
library("dplyr")
library("ggplot2")

# Summary information

get_funding_summary_info <- function(df) {
  funding_sum <- list(
    num_years = length(df)
    most_funded = get_most_funded(df)
    # 3. ____ = ____
    # 4. ____ = ____
    # 5. ____ = ____
  )
}

get_most_funded <- function(df) {
  df 
}