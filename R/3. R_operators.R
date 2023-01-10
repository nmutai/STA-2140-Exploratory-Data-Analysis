# Quick overview
# R operators

# 1. Assingment operators
# 2. Arithmetic operators
# 3. Relational operators
# 4. Logical operators
# 5. Mathematical operators

# 1. Assingment operator
# <- 
age <- 34
# -> 
35 -> Age
# ->>
36 ->> AGE
# = 

Age_2 = 40
# Common
# =
# <- 
# 2. Arithmetic operators
# +
# -
# *
# /
# ^
# %/% integer division
# %% modulus (remainder)

x <- 2
y <- 5
x + y
y - x
y/x
y*x
y%/%x # whole number
y%%x  # remainder
?sum
# How to query any arithmetic operator. 
? "%/%"
? "+"

# 3. Relational operators
# <   - less than
# >   - greater than
# <=  - less than or equal to
# >=  - gretaer than or equal to 
# ==  - equal to (=, ==)
# !=  - not equal to

?"<"
x < y
x > y
x == y
x != y
x>=y

# 4. Logical operators
# ! logical NOT - negates element wise
# & element wise logical AND
# && logical AND
# | element wise logical OR
# || logical OR
x <- c(TRUE, FALSE, FALSE, TRUE)
y <- c(FALSE, TRUE, FALSE, TRUE)

!x
!y
x&y
x&&y
x|y
x||y

# 5. Mathematical operators
a <- c(1,2,3,4,5)
b <- c(2,3,4,5,6)

a^2
m1 <- matrix(data = c(1,2,3,4), nrow = 2, ncol = 2)
m1
m2 <- matrix(data = c(4,3,2,1), nrow = 2, ncol = 2)
m2
# transpose - change rows to columns and col to rows
t(m1)

# inverse
a <- solve(m1)
?solve
a%*%m1 
abs(-3)
abs(3)
log(10)
exp(2)
pi
sin(pi)
s <- pi/2
sin(s)
cos(s)
tan(s)

