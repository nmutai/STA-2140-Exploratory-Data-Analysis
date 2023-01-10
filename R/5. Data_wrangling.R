# Data Wrangling/data manipulation
# Clean work space
rm(list = ls(all.names = TRUE))

# Data science process

# 1. Import
# 2. Tidy   - clean names
#           - Each variable is stored in a column
#           - Each cell stores a single value
# Workshop on R packages for data cleaning
# 3. Transform - dplyr - data manipulation
# 4. Visualize - ggplot2
# 5. Model
# 6. Communicate
# Set working directory

setwd("C:/Users/ncher/Dropbox/R_training")

# Import data
mydata <- read.csv("https://raw.githubusercontent.com/deepanshu88/data/master/sampledata.csv")
head(mydata)
names(mydata)
colnames(mydata)

# Clean names
library(janitor) # clean names
help(package=janitor)

# Clean column names
?make_clean_names
names(mydata) <- make_clean_names(names(mydata),case = "snake")
names(mydata) <- make_clean_names(names(mydata),case = "big_camel")
names(mydata) <- make_clean_names(names(mydata),case = "all_caps")
names(mydata) <- make_clean_names(names(mydata),case = "sentence")
names(mydata)

anyNA(mydata)
# no missing values

# missing values per column
colSums(is.na(mydata))


# Ignore - complete case analysis - response rate.
# Impute - mean imputation, median, 
# Multiple Imputation


# Dplyr
# What is dplyr
# The dplyr is a powerful R-package to manipulate,
# clean and summarize unstructured data.
# In short, it makes data exploration and data manipulation easy and fast in R.


# Install dplyr
# install.packages("dplyr")

# Load dplyr
library(dplyr)


# dplyr functions
# dplyr Function 	  Description 	               Equivalent SQL
# select() 	        Selecting columns (variables)  SELECT
# filter() 	        Filter (subset) rows. 	       WHERE
# group_by() 	      Group the data 	           GROUP BY
# summarise() 	    Summarise (or aggregate) data 	-
# arrange() 	      Sort the data 	                ORDER BY
# join() 	          Joining data frames (tables) 	  JOIN
# mutate() 	        Creating New Variables 	        COLUMN ALIAS


# SELECT firstname, last name
#     FROM Empployees
#     WHERE Age > 30
#     GROUP BY 



# Import data
mydata <- read.csv("https://raw.githubusercontent.com/deepanshu88/data/master/sampledata.csv")
head(mydata)

# 1. sample_n - select random rows
sample_n(mydata, 3)

set.seed(123)
# ?set.seed
sample_n(mydata, 3)
nrow(mydata)

# 2. sample_frac function returns randomly N% of rows
sample_frac(mydata, 0.2)

# 3. distinct function is used to eliminate duplicates.
x1 <- distinct(mydata)
x1
nrow(x1)

# 4. .keep_all function is used to retain all other variables in the output data frame.
x2 <- distinct(mydata, Index, .keep_all <- TRUE)
x22 <- distinct(mydata, State, .keep_all <- TRUE)
my_unique_data <- mydata[!duplicated(mydata$Index),]
my_unique_data_2 <- mydata[!duplicated(mydata$State),]
nrow(my_unique_data_2)

# 5. Remove Duplicates Rows based on multiple variables
x2 <- distinct(mydata, Index, Y2003, .keep_all <- TRUE)
x2
x23 <- distinct(mydata, State, Y2003, .keep_all <- TRUE)


# 6. select() Function
# It is used to select only desired variables.
#
# select() syntax : select(data, ....)
# data : Data Frame
# .... : Variables by name or by function

mydata2 <- select(mydata, Index, State)
head(mydata2)
head(select(mydata, Y2002, Y2003))

head((select(mydata, Index, State, Y2002, Y2003)))

mydata22 <- select(mydata, Index, State:Y2006)
head(mydata22)


# 7. Dropping Variables
# The minus sign before a variable tells R to drop the variable.
mydata22 <- select(mydata, -Index, -State, -Y2002)
head(mydata22)

# The above code can also be written like :
mydata22 <- select(mydata, -c(Index, State))


# 8. Selecting or Dropping Variables starts with 'Y'
# The starts_with() function is used to select variables starts with an alphabet.
mydata3 <- select(mydata, starts_with("Y"))
head(mydata3)
names(mydata3)

# Adding a negative sign before starts_with() implies dropping the variables
# starts with 'Y'
mydata33 <- select(mydata, -starts_with("Y"))
head(mydata33)
names(mydata33)

# The following functions helps you to select variables based on their names.

# Helpers 	            Description
# starts_with() 	    Starts with a prefix
# ends_with() 	        Ends with a prefix
# contains() 	        Contains a literal string
# matches()         	Matches a regular expression
# num_range() 	        Numerical range like x01, x02, x03.
# one_of() 	            Variables in character vector.
# everything() 	        All variables.


# 9. Selecting Variables contain 'I' in their names
mydata4 <- select(mydata, contains("S"))
names(mydata4)


# 10. Reorder Variables
mydata5 <- select(mydata, State, everything())
names(mydata5)


# 11. rename() Function
# It is used to change variable name.
#
# rename() syntax : rename(data , new_name = old_name)
# data : Data Frame
# new_name : New variable name you want to keep
# old_name : Existing Variable Name

# In the following code, we are renaming 'Index' variable to 'Index1'.
mydata6 <- rename(mydata, Index2 = Index)
names(mydata6)[1]
mydata6$Index1

# 12. filter() Function
# It is used to subset data with matching logical conditions.
#
# filter() syntax : filter(data , ....)
# data : Data Frame
# .... : Logical Condition

mydata7 <- filter(mydata, State == "Alabama")
head(mydata7)
mydata7$Index


# 13. Multiple Selection Criteria
# The %in% operator can be used to select multiple items.
# In the following program, we are telling R to select rows against 'A' and 'C'
# in column 'Index'.

mydata7 <- filter(mydata, Index %in% c("M", "N"))
head(mydata7)

mydata78 <- filter(mydata, Index %in% c("M", "N"))
head(mydata78)

# AND' Condition in Selection Criteria
# Suppose you need to apply 'AND' condition.
# In this case, we are picking data for 'A' and 'C' in the column 'Index' and
# income greater than 1.3 million in Year 2002.

mydata8 <- filter(mydata6, Index2 %in% c("A", "C") & Y2002 >= 1300000)


# 'OR' Condition in Selection Criteria
# The 'I' denotes OR in the logical condition. It means any of the two conditions.

mydata9 <- filter(mydata6, Index2 %in% c("A", "C") | Y2002 >= 1300000)

# NOT Condition
# The "!" sign is used to reverse the logical condition.

mydata10 <- filter(mydata, !Index %in% c("A", "C"))
mydata10$Index

# CONTAINS Condition
# The grepl function is used to search for pattern matching.
# In the following code, we are looking for records wherein column state
# contains 'Ar' in their name.

mydata10 <- filter(mydata6, grepl("Ar", State))


# summarise() Function
# It is used to summarize data.

# summarise() syntax : summarise(data , ....)
# data : Data Frame
# ..... : Summary Functions such as mean, median etc

# Summarize selected variables
# In the example below, we are calculating mean and median for the variable Y2015.
mean(mydata$Y2015)
median(mydata$Y2015)
summarise(mydata, Y2015_mean = mean(Y2015), Y2015_med = median(Y2015))


# Summarize Multiple Variables

# The summarise_at function allows us to select multiple variables by their names.

# NB
summarise(mydata, vars(Y2005, Y2006), funs(n(), mean, median))

# `funs()` was deprecated in dplyr 0.8.0.

# Use list
summarise_at(mydata, vars(Y2005, Y2006), list(n = ~ n(), mean = mean, median = median))


# Summarize with Custom Functions

summarise_at(mydata, vars(Y2011, Y2012), funs(mean, median), 
             na.rm = TRUE)


summarise_at(mydata, 
             vars(Y2011, Y2012),
       funs(n(),
         missing = sum(is.na(.)), mean(., na.rm = TRUE),
         median(., na.rm = TRUE)
    )
)

# How to apply non standard functions

set.seed(222)
mydata <- data.frame(X1 = sample(1:100, 100), X2 = runif(100))
summarise_at(mydata, vars(X1, X2), function(x) var(x - mean(x)))


# Summarize all Numeric Variables
# The summarise_if function allows you to summarise conditionally.

summarise_if(mydata, is.numeric, funs(n(), mean, median))


# Alternative Method :
# First, store data for all the numeric variables

numdata <- mydata[sapply(mydata, is.numeric)]

# Second, the summarise_all function calculates summary statistics for all the
# columns in a data frame

summarise_all(numdata, funs(n(), mean, median))


# Summarize Factor Variable
# We are checking the number of levels/categories and count of missing observations in a categorical (factor) variable.
# Read original data again.
mydata <- read.csv("https://raw.githubusercontent.com/deepanshu88/data/master/sampledata.csv")

summarise_all(mydata["Index"], funs(nlevels(.), nmiss = sum(is.na(.))))



# arrange() function
# Use : Sort data
# Syntax
#
# arrange(data_frame, variable(s)_to_sort)
# or
# data_frame %>% arrange(variable(s)_to_sort)

# To sort a variable in descending order, use desc(x).
# Sort Data by Multiple Variables
# The default sorting order of arrange() function is ascending. In this example,
# we are sorting data by multiple variables.

arrange(mydata, Index, Y2011)

# Suppose you need to sort one variable by descending order and other variable by ascending oder.

arrange(mydata, desc(Index), Y2011)


# Pipe operator

# Used to nest operations

# Syntax :
#
#     filter(data_frame, variable == value)
# or
# data_frame %>% filter(variable == value)


dt <- sample_n(select(mydata, Index, State), 10)
# or

mydata_sel <- select( mydata, Index, State)
a <- sample_n(mydata_sel, 10)

dt <- mydata %>%
    select(Index, State) %>%
    sample_n(10)
dt
#
# group_by() function
# Use : Group data by categorical variable
# Syntax :
#
#     group_by(data, variables)
# or
# data %>% group_by(variables)


# Summarise Data by Categorical Variable
# We are calculating count and mean of variables Y2011 and Y2012 by variable Index.

t <- summarise_at(group_by(mydata, Index), vars(Y2011, Y2012), 
                  funs(n(), mean(., na.rm = TRUE)))
t
# The above code can also be written like

t <- mydata %>%
    group_by(Index) %>%
    summarise_at(vars(Y2011:Y2015), funs(n(), 
                        mean(., na.rm = TRUE)))

# Since dplyr >= 1.0.0 version you may get the following warnings.
#
# #`summarise()` ungrouping output (override with `.groups` argument)
# #`summarise()` regrouping output by xxx (override with `.groups` argument)
#
# To suppress this warning you can use the following command.
#
# options(dplyr.summarise.inform=F)


# Filter Data within a Categorical Variable
# Suppose you need to pull top 2 rows from 'A', 'C' and 'I' categories of variable Index.
# %in% value matching
t <- mydata %>%
    filter(Index %in% c("A", "C", "I")) %>%
    group_by(Index)


# Summarize, Group and Sort Together

t1 <- mydata %>%
    group_by(Index) %>%
    summarise(
        Mean_2014 = mean(Y2014, na.rm = TRUE),
        Mean_2015 = mean(Y2015, na.rm = TRUE)) %>%
    arrange(desc(Index))


# mutate() function
# Use :Creates new variables
# Syntax :

# mutate(data_frame, expression(s) )
# or
# data_frame %>% mutate(expression(s))

# Create a new variable
# The following code calculates division of Y2015 by Y2014 and name it "change".
change = mydata$Y2015/mydata$Y2015

mydata1 <- mutate(mydata, change = Y2015 / Y2014)
mydata1$change

# Apply multiplication on only numeric variables
mydata12 <- mutate_at(mydata, vars(Y2008:Y2010), 
                      funs(Rank = min_rank(.)))

# join() function
# Use : Join two datasets
# Syntax :
#
# inner_join(x, y, by = )
# left_join(x, y, by = )
# right_join(x, y, by = )
# full_join(x, y, by = )
# semi_join(x, y, by = )
# anti_join(x, y, by = )
#
# x, y - datasets (or tables) to merge / join
# by - common variable (primary key) to join by.

# Common rows in both the tables

df1 <- data.frame(
    ID = c(1, 2, 3, 4, 5),
    w = c("a", "b", "c", "d", "e"),
    x = c(1, 1, 0, 0, 1),
    y = rnorm(5),
    z = letters[1:5])

df1$ID

df2 <- data.frame(
    ID = c(1, 7, 3, 6, 8),
    a = c("z", "b", "k", "d", "l"),
    b = c(1, 2, 3, 0, 4),
    c = rnorm(5),
    d = letters[2:6])
df2$ID
# INNER JOIN returns rows when there is a match in both tables.
# In this example, we are merging df1 and df2 with ID as common variable (primary key).
# ID 1 and 3 same
df3 <- inner_join(df1, df2, by = "ID")
df3

# Applying LEFT JOIN
# LEFT JOIN : It returns all rows from the left table, even if there are no matches in the right table.

left_join(df1, df2, by = "ID")


# Combine Data Vertically
# intersect(x, y)       - Rows that appear in both x and y.

# union(x, y)           - Rows that appear in either or both x and y.
# setdiff(x, y)         - Rows that appear in x but not y.

# Applying INTERSECT
# Prepare Sample Data for Demonstration

mtcars$model <- rownames(mtcars)
first <- mtcars[1:20, ]
second <- mtcars[10:32, ]

# INTERSECT selects unique rows that are common to both the data frames.

intersect(first, second)

# Applying UNION
# UNION displays all rows from both the tables and removes duplicate records from the combined dataset. By using union_all function, it allows duplicate rows in the combined dataset.

x <- data.frame(ID = 1:6, ID1 = 1:6)
y <- data.frame(ID = 1:6, ID1 = 1:6)
union(x, y)
union_all(x, y)


# Rows appear in one table but not in other table

setdiff(first, second)


# Other useful functions
# recode
# Used to recode categorical variables

char_vec <- sample(c("a", "b", "c"), 10, replace = TRUE)
char_vec_2 <- recode(char_vec, a = "Apple")
char_vec_2


gender <- factor(c(0,1,1,1,0,1,1,0), levels = c(0,1))
table(gender)
gender_2 <- recode(gender, "0"="1", "1"="2")
table(gender_2)








