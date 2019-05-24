library(dplyr)
library(stringr)

prepFrame <- function(file) {
  df <- read.csv(paste("unprepped/", file, sep = ""), stringsAsFactors = FALSE)
  
  prepped <- na.exclude(df) %>% 
    filter(CCDNF == 1) %>% 
    filter(TOTALREV >= 0) %>% 
    filter(TFEDREV >= 0) %>% 
    filter(TSTREV >= 0) %>% 
    filter(TLOCREV >= 0) %>% 
    filter(TOTALEXP >= 0) %>% 
    filter(Z32 >= 0) %>% 
    filter(Z33 >= 0) %>% 
    filter(V33 >= 0)
  
  grouped <- prepped %>% 
    group_by(STABBR, STNAME) %>% 
    summarise("Students" = sum(as.numeric(V33)),
              "Total Revenue" = sum(as.numeric(TOTALREV) / Students),
              "Federal Revenue" = sum(as.numeric(TFEDREV) / Students),
              "State Revenue" = sum(as.numeric(TSTREV) / Students),
              "Local Revenue" = sum(as.numeric(TLOCREV) / Students),
              "Total Expenditures" = sum(as.numeric(TOTALEXP) / Students),
              "Salaries" = sum(as.numeric(Z32) / Students),
              "Teacher Revenue" = sum(as.numeric(Z33) / Students)) %>% 
    mutate("State Name" = STNAME) %>% 
    mutate("State Code" = STABBR)
  
  grouped = grouped[,c(12, 11, 3:10)]
  
  write.csv(grouped, paste("./prepped/prep", file, sep = ""), row.names=FALSE)
}

files = list.files(path = "./unprepped/")

lapply(files, prepFrame)