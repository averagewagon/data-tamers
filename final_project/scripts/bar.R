# Load libraries
library("dplyr")
library("ggplot2")
library("stringr")

state_info <- function(df, year, state){
  
  # use stringr title function to make states have matching cases
  df["State.Name"] <- str_to_title(df[ ,"State.Name"])
  
  #create filtered data frame by year and state
  temp <- df %>% 
    filter(State.Name == state, Year == year)
  
  #include columns of interest
  temp <- temp[-1:-3]
  temp <- temp[-1]
  
  #create a column of values
  rownames(temp) <- "Values"
  
  #make temp a dataframe
  temp <- as.data.frame(t(temp))
  temp$'Metrics' <- rownames(temp)
  
  #plot dataframe
  ggplot(data = temp)+
    geom_col(mapping = aes(x = Metrics, y = Values))
}

df <- read.csv("aggregate.csv", stringsAsFactors = F)
state_info(df,"1995", "Alabama")
