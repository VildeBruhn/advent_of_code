##############
### Luke 6 ###
##############

rm(list = ls())
setwd("/Users/vildeki/Desktop/advent_of_code/")
library(tidyverse)

## OPPGAVE 1 ##

# read in and manipulate file
buffer <- read_file("input_6.txt")
buffer <- unlist(strsplit(buffer, ""))

# find marker
len <- length(buffer)
counter <- 1
string_list <- c()
for (i in 1:len){
  string_list[i] <- str_flatten(buffer[counter:(counter+3)])
  counter <- counter + 1
}

unique_list <- c()
for (i in 1:len){
  x <- any(duplicated(unlist(strsplit(string_list[i], ""))))
  unique_list[i] <- x 
}

marker <- min(which(unique_list == FALSE)) + 3
  #1766


## OPPGAVE 2 ##

# find marker
counter2 <- 1
string_list2 <- c()
for (i in 1:len){
  string_list2[i] <- str_flatten(buffer[counter2:(counter2+13)])
  counter2 <- counter2 + 1
}

unique_list2 <- c()
for (i in 1:len){
  x <- any(duplicated(unlist(strsplit(string_list2[i], ""))))
  unique_list2[i] <- x 
}

marker <- min(which(unique_list2 == FALSE)) + 13
  #2383
