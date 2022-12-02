##############
### Luke 2 ###
##############

rm(list = ls())
setwd("Desktop/advent_of_code/")
library(tidyverse)

## OPPGAVE 1 ##

# read in file, add empty column, set colnames
cheat_sheet <-read.table("input_2.txt")
cheat_sheet <- cheat_sheet %>% add_column(points = NA)
colnames(cheat_sheet) <- c("play", "response", "points")

# add points
cheat_sheet$points <- ifelse(cheat_sheet$play == "A" & cheat_sheet$response == "X", 
                             4, cheat_sheet$points)
cheat_sheet$points <- ifelse(cheat_sheet$play == "A" & cheat_sheet$response == "Y", 
                             8, cheat_sheet$points)
cheat_sheet$points <- ifelse(cheat_sheet$play == "A" & cheat_sheet$response == "Z", 
                             3, cheat_sheet$points)
cheat_sheet$points <- ifelse(cheat_sheet$play == "B" & cheat_sheet$response == "X", 
                             1, cheat_sheet$points)
cheat_sheet$points <- ifelse(cheat_sheet$play == "B" & cheat_sheet$response == "Y", 
                             5, cheat_sheet$points)
cheat_sheet$points <- ifelse(cheat_sheet$play == "B" & cheat_sheet$response == "Z", 
                             9, cheat_sheet$points)
cheat_sheet$points <- ifelse(cheat_sheet$play == "C" & cheat_sheet$response == "X", 
                             7, cheat_sheet$points)
cheat_sheet$points <- ifelse(cheat_sheet$play == "C" & cheat_sheet$response == "Y", 
                             2, cheat_sheet$points)
cheat_sheet$points <- ifelse(cheat_sheet$play == "C" & cheat_sheet$response == "Z", 
                             6, cheat_sheet$points)

# find sum
sum(cheat_sheet$points)
  #13446


## OPPGAVE 2 ##

# read in file, add empty column, set colnames
cheat_sheet2 <-read.table("input_2.txt")
cheat_sheet2 <- cheat_sheet2 %>% add_column(points = NA)
colnames(cheat_sheet2) <- c("play", "response", "points")

# add points
cheat_sheet2$points <- ifelse(cheat_sheet2$play == "A" & cheat_sheet2$response == "X", 
                             3, cheat_sheet2$points)
cheat_sheet2$points <- ifelse(cheat_sheet2$play == "A" & cheat_sheet2$response == "Y", 
                             4, cheat_sheet2$points)
cheat_sheet2$points <- ifelse(cheat_sheet2$play == "A" & cheat_sheet2$response == "Z", 
                             8, cheat_sheet2$points)
cheat_sheet2$points <- ifelse(cheat_sheet2$play == "B" & cheat_sheet2$response == "X", 
                             1, cheat_sheet2$points)
cheat_sheet2$points <- ifelse(cheat_sheet2$play == "B" & cheat_sheet2$response == "Y", 
                             5, cheat_sheet2$points)
cheat_sheet2$points <- ifelse(cheat_sheet2$play == "B" & cheat_sheet2$response == "Z", 
                             9, cheat_sheet2$points)
cheat_sheet2$points <- ifelse(cheat_sheet2$play == "C" & cheat_sheet2$response == "X", 
                             2, cheat_sheet2$points)
cheat_sheet2$points <- ifelse(cheat_sheet2$play == "C" & cheat_sheet2$response == "Y", 
                             6, cheat_sheet2$points)
cheat_sheet2$points <- ifelse(cheat_sheet2$play == "C" & cheat_sheet2$response == "Z", 
                             7, cheat_sheet2$points)

# find sum
sum(cheat_sheet2$points)
  #13509




