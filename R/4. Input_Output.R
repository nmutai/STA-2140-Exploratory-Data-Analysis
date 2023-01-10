# Input/Output in R
# Input
# Clear work space

rm(list = ls(all.names = TRUE))

# Set working directory
setwd("C:/Users/ncher/Dropbox/TTU/Msc. Data_science/import")

# Importing data into R

# Excel file

# Csv

resp1 <- read.csv("Resp1.csv", header = TRUE, sep = ";")
head(resp1)

# Excel sheet

library(readxl)

dfb <- read_excel("boston1.xls")
head(dfb)

# Specify a sheet

dfb <- read_excel("boston1.xls",sheet = "First")

head(dfb)

# Txt file
resp2 <- read.table("Resp2.txt", header = T)
head(resp2)

# SPSS
library(foreign)
dat <- read.spss(file = "dat2.sav", 
                 use.value.labels = FALSE,
                 to.data.frame = TRUE)
head(dat)

# STATA
library(haven)
dat <- read_dta(file = "dat.dta")
head(dat)

# SAS  
library(haven)
dat_1 <- read_sas("airline.sas7bdat")
head(dat_1)

library(sas7bdat)
dat_2 <- read_sas("airline.sas7bdat")
head(dat_2)



###############################################

## Output


# Set working directory
this.dir <- dirname(rstudioapi::getSourceEditorContext()$path)
setwd(this.dir)

# Exporting data from R

# Excel file

# Csv

dat <- airquality

write.csv(dat, file = "dat.csv")


# Excel sheet
library(writexl)
write_xlsx(dat, "dat.xlsx")


# Txt file
dat <- airquality
write.table(dat, "dat.txt", sep="\t")


# SPSS
library(foreign)
write.foreign(dat, "dat.txt", "dat.sav",
              package = "SPSS")

# STATA
library(foreign)
write.dta(dat, "dat.dta")

# SAS
library(foreign)
write.foreign(dat, "dat.txt", "dat.sas",
              package = "SAS")

write.foreign(dat, "dat.txt", "dat.sas7bdat",
              package = "SAS")



