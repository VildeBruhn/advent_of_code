##############
### Luke 5 ###
##############

rm(list = ls())
setwd("/Users/vildeki/Desktop/advent_of_code/")
library(tidyverse)

## OPPGAVE 1 ##

# read in and manipulate file
moves <- read.table("input_5.txt", header = FALSE, skip = 10)
moves$V1 <- moves$V2
moves$V2 <- moves$V4
moves$V3 <- moves$V6 
moves <- moves[1:3]
colnames(moves) <- c("move", "from", "to")

crates <- read.fwf("input_5.txt", n = 8, widths = c(3,4,4,4,4,4,4,4,4), header = FALSE)
crates <- as.matrix(crates)
crates_list <- split(crates, rep(1:ncol(crates), each = nrow(crates)))
crates_list <- lapply(crates_list, function(z){ z[z != "    "]})

# find final stacks
len <- length(moves$move)
for (i in 1:len){
  move <- moves$move[i]
  from <- moves$from[i]
  to <- moves$to[i]
  crates_list[[to]] <- append(crates_list[[to]], crates_list[[from]][move:1], after = 0)
  crates_list[[from]] <- crates_list[[from]][-seq(1,move,1)]
}

# find top letters
top <- c()
for (i in 1:9){
  top <- append(top, crates_list[[i]][1])
}

print(top)
  #" [P]" " [S]" " [N]" " [R]" " [G]" " [B]" " [T]" " [F]" " [T]"


## OPPGAVE 2 ##

# get crate list
crates_list2 <- split(crates, rep(1:ncol(crates), each = nrow(crates)))
crates_list2 <- lapply(crates_list2, function(z){ z[z != "    "]})

# find final stacks
len <- length(moves$move)
for (i in 1:len){
  move <- moves$move[i]
  from <- moves$from[i]
  to <- moves$to[i]
  crates_list2[[to]] <- append(crates_list2[[to]], crates_list2[[from]][1:move], after = 0)
  crates_list2[[from]] <- crates_list2[[from]][-seq(1,move,1)]
}

# find top letters
top2 <- c()
for (i in 1:9){
  top2 <- append(top2, crates_list2[[i]][1])
}

print(top2)




