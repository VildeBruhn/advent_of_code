##############
### Luke 1 ###
##############

## OPPGAVE 1 ##

rm(list = ls())

setwd("Desktop/advent_of_code/")

# read in file
df <- read.table("input_1_1.txt", blank.lines.skip = FALSE)

# convert into list of lists by blank lines (rows)
n <- rowSums(is.na(df)) == ncol(df)
cs <- cumsum(n) + 1
s <- split(df[!n, ], cs[!n])

# find the sum for each list
x <- lapply(s, sum)

# convert list of lists into data frame (there is only one number per list now)
y <- as.data.frame(do.call(cbind, x))

# find max value
max(y)
# 71502


## OPPGAVE 2 ##

# transpose data frame (columns to rows)
y <- as.data.frame(t(y))

# order by decending
z <- y[order(-y$V1),]

# find sum of three first values
sum(z[1:3])
# 208191
