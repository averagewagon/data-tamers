# Load libraries
library("dplyr")
library("ggplot2")
library("stringr")

state_info <- function(year, state){
  df <- read.csv("data/funding/prepped/aggregate.csv", stringsAsFactors = F)
  
  # use stringr title function to make states have matching cases
  df["State.Name"] <- str_to_title(df[ ,"State.Name"])
  
  #create filtered data frame by year and state
  temp <- df %>% 
    filter(State.Name == state, Year == year)
  
  maxdf <- df %>%  filter(State.Name == state)
  
  max <- max(maxdf$Total.Revenue)
  
  #include columns of interest
  temp <- temp[-1:-3]
  temp <- temp[-1]
  
  #create a column of values
  final <- temp %>% 
    mutate("Total Revenue" = Total.Revenue,
           "Federal Revenue" = Federal.Revenue,
           "State Revenue" = State.Revenue,
           "Local Revenue" = Local.Revenue,
           "Total Salaries" = Salaries,
           "Teacher Salaries" = Teacher.Salaries) %>% 
    select("Total Revenue",
           "Federal Revenue",
           "State Revenue",
           "Local Revenue",
           "Total Salaries",
           "Teacher Salaries")
  
  order <- c("Total Revenue",
             "Federal Revenue",
             "State Revenue",
             "Local Revenue",
             "Total Salaries",
             "Teacher Salaries")
  
  rownames(final) <- "Values"
  
  #make temp a dataframe
  final <- as.data.frame(t(final))
  final$'Metrics' <- rownames(final)
  
  final$Metrics <- factor(final$Metrics, order)
  
  #plot dataframe
  ggplot(data = final) +
    geom_col(mapping = aes(x = Metrics, y = Values)) +
    ylim(0, max) 
}

