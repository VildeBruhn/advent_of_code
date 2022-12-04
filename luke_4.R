##############
### Luke 4 ###
##############

rm(list = ls())
setwd("/Users/vildeki/Desktop/advent_of_code/")
library(tidyverse)

## OPPGAVE 1 ##

# read in file
cleaning_list <- read.table("input_4.txt", col.names = c("elf_1", "elf_2"), sep = ",")

# split columns and make data frame
cleaning_list1 <- data.frame(do.call('rbind', strsplit(as.character(cleaning_list$elf_1),'-',fixed=TRUE)))
cleaning_list2 <- data.frame(do.call('rbind', strsplit(as.character(cleaning_list$elf_2),'-',fixed=TRUE)))
cleaning_list <- cbind(cleaning_list1, cleaning_list2)
cleaning_list <- cleaning_list %>% add_column(within = NA)
colnames(cleaning_list) <- c("elf_11", "elf_12", "elf_21", "elf_22", "within")
cleaning_list <- as.data.frame(mapply(as.numeric, cleaning_list))

# find assignments that fully contain the other
cleaning_list$within <- ifelse(cleaning_list$elf_11 >= cleaning_list$elf_21 & cleaning_list$elf_12 <= cleaning_list$elf_22,
                               TRUE, cleaning_list$within)

cleaning_list$within <- ifelse(cleaning_list$elf_21 >= cleaning_list$elf_11 & cleaning_list$elf_22 <= cleaning_list$elf_12,
                               TRUE, cleaning_list$within)

# number of full overlaps
sum(na.omit(cleaning_list$within))
  #433


## OPPGAVE 2 ##

# add column
cleaning_list <- cleaning_list %>% add_column(overlap = NA)
cleaning_list$overlap <- as.numeric(cleaning_list$overlap)

# find overlaps and sum
cleaning_list$overlap <- ifelse(cleaning_list$elf_12 >= cleaning_list$elf_21 & cleaning_list$elf_11 <= cleaning_list$elf_22, 
                                TRUE, cleaning_list$overlap)


sum(na.omit(cleaning_list$overlap))
  #852
