# Set working directory

setwd("D:/Udemy/1. Bogba/Statistics with R - beginner/data")

demo <- read.csv("demographics.csv")

# View(demo)

##########
### how to compute skewness and kurtosis
### with the e1071 package
##########

### we will use the variable income for our examples

### load the package

library(e1071)

### compute the skewness

skewness(demo$income)

### compute the kurtosis

kurtosis(demo$income)
