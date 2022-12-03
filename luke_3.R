##############
### Luke 3 ###
##############

rm(list = ls())
setwd("/Users/vildeki/Desktop/advent_of_code/")
library(tidyverse)

## OPPGAVE 1 ##

# read in file, add empty columns
item_list <- read.table("input_3.txt", col.names = "items")
item_list <- item_list %>% add_column(items_1 = NA, items_2 = NA, sim_item = NA, number = NA)

# split items
for (i in 1:300){
  item_list$items_1[i] <- str_sub(item_list$items[i], start = 1, end = nchar(item_list$items[i])/2)
  item_list$items_2[i] <- str_sub(item_list$items[i], start = (nchar(item_list$items[i])/2) + 1, end = -1)
}

# find similar items
for (i in 1:300){
  a <- unlist(strsplit(item_list$items_1[i],""))
  b <- unlist(strsplit(item_list$items_2[i],""))
  item_list$sim_item[i] <- intersect(a,b)
}

# make letter vector
letter <- letters[seq( from = 1, to = 26 )]
letter <- append(letter, LETTERS[seq( from = 1, to = 26 )])

# find numbers and sum
for (i in 1:300){
  item_list$number[i] <- match(item_list$sim_item[i], letter)
}

sum(item_list$number)
  #7763

## OPPGAVE 2 ##

# read in file
item_list2 <- read.table("input_3.txt", col.names = "items")

# find similar items in groups
sim_items <- c()
sequence <- seq(1, 298, 3)
for (i in sequence){
  a <- unlist(strsplit(item_list2$items[i], ""))
  b <- unlist(strsplit(item_list2$items[i+1], ""))
  c <- unlist(strsplit(item_list2$items[i+2], ""))
  x <- intersect(a,b)
  y <- intersect(x,c)
  sim_items <- append(sim_items, y)
}

# find numbers and sum
numbers <- c()
for (i in 1:100){
  numbers <- append(numbers, match(sim_items[i], letter))
}

sum(numbers)
  #2569
