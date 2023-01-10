# Graphics in R
rm(list = ls(all.names = TRUE))

# 1. Base R     - plot, barplot, hist
# 2. ggplot2


# Load libraries
library(car)          # data
library(ggplot2)      # grammer of graphics
# help(package = ggplot2)
# library(stargazer)    # beautiful tables.
library(ggpubr)       # ggplot themes
library(jtools)       # apa theme

# Load some data
data("Salaries")
?Salaries
names(Salaries)
class(Salaries)

# check some observations
head(Salaries)

# check structure of data
str(Salaries)
View(Salaries)

# Data exploration
anyNA(Salaries)
colSums(is.na(Salaries))
hist(Salaries$salary)





# scatter plot
ggplot(data = Salaries, aes(x = yrs.since.phd, 
                            y = salary)) +
  geom_point()

# OR
ggplot(data = Salaries) +
  geom_point(mapping = aes(x = yrs.since.phd, 
                           y = salary))


# scatter plot with fit
ggplot(data = Salaries, aes(x = yrs.since.phd, 
                            y = salary)) +
  geom_point() +
  geom_smooth()

# scatter plot with line of best fit
ggplot(data = Salaries, aes(x = yrs.since.phd, 
                            y = salary)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x)
?geom_smooth


# ?geom_smooth

# grouping
ggplot(data = Salaries, aes(x = yrs.since.phd,
                            y = salary,
                            color = rank)) +
  geom_point()

ggplot(data = Salaries, aes(x = yrs.since.phd,
                            y = salary,
                            color = discipline)) + 
    geom_point()

ggplot(data = Salaries, aes(x = yrs.since.phd,
                            y = salary,
                           color = rank, 
                           shape = sex)) +
  geom_point()

# Aesthetics
# axis
# color
# shape
# facets

# facets
ggplot(data = Salaries, aes(x = yrs.since.phd,
                            y = salary)) +
  geom_point() +
  facet_grid(.~sex)

ggplot(data = Salaries, aes(x = yrs.since.phd,y = salary)) +
  geom_point() +
  facet_grid(.~discipline)

ggplot(data = Salaries, aes(x = yrs.since.phd, y = salary)) +
  geom_point() +
  facet_grid(sex ~ rank)



# simple bar plot
# for categorical variables

table(Salaries$rank)
prop.table(table(Salaries$rank))

ggplot(data = Salaries, aes(x = rank)) +
  geom_bar()

ggplot(data = Salaries, aes(x = sex)) +
  geom_bar()

ggplot(data = Salaries, aes(x = discipline)) +
  geom_bar()

# stacked bar plot
ggplot(data = Salaries, aes(x = rank, fill = sex)) +
  geom_bar()

ggplot(data = Salaries, aes(x = rank, fill = discipline)) +
  geom_bar()

# grouped bar plot
ggplot(data = Salaries, aes(x = rank, fill = sex)) +
  geom_bar(position = "dodge") +
  coord_flip()

# ggplot(data = Salaries, aes(x = rank)) +
#   geom_bar(position = "identity")
?geom_bar

# filled bar plot
ggplot(data = Salaries, aes(x = rank, fill = sex)) +
  geom_bar(position = "fill")


# histogram
# distribution of data
ggplot(data = Salaries, aes(x = salary)) +
  geom_histogram()

ggplot(data = Salaries) +
  geom_histogram(mapping = aes(x = salary))

# Skewness and kurtosis
library(e1071)
help(package=e1071)

### compute the skewness
skewness(as.numeric(Salaries$salary), type = 1)
skewness(as.numeric(Salaries$salary), type = 2)
skewness(as.numeric(Salaries$salary), type = 3)

### compute the kurtosis
kurtosis(Salaries$salary)


# frequency polygon
ggplot(data = Salaries, aes(x = salary)) +
  geom_freqpoly()

# grouped frequency polygons
ggplot(data = Salaries, aes(x = salary, color = rank)) +
  geom_freqpoly(size = 0.6)

# size - thickness of line
ggplot(data = Salaries, aes(x = salary, color = rank)) +
  geom_freqpoly(size = 1)


# kernal density plot
ggplot(data = Salaries, aes(x = salary)) +
  geom_density(fill = "red")

# grouped kernal density plot
ggplot(data = Salaries, aes(x = salary, fill = rank)) +
  geom_density(alpha = .3)

ggplot(data = Salaries, aes(x = salary, fill = rank)) +
  geom_density(alpha = 1.3)


# boxplot
# distribution of a continuous variable
ggplot(data = Salaries, aes(x = rank, y = salary)) +
  geom_boxplot()


# cleveland dot plot
# df <- mtcars
# df$cars <- row.names(df)
# ggplot(data = df, aes(x = mpg, y = cyl)) +
#   geom_point()

# strip plot
# like a scatter plot
ggplot(data = Salaries, aes(x = salary, y = rank)) +
  geom_point()

# jittered strip plot
ggplot(data = Salaries, aes(x = salary, y = rank, color = rank)) +
  geom_jitter() +
  theme(legend.position = "none")


# line charts
?economics
ggplot(economics, aes(date, unemploy)) +
  geom_line()

# check class of data
class(economics$date)

ggplot(economics, aes(date, unemploy)) +
  geom_line(linetype = 1,
            color = "blue", size = 4)

# scales
?mtcars
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8), 
                     limits = c(1, 8)) +
  scale_y_continuous(breaks = c(5, 10, 15, 20, 25, 30, 35,40,45,50),
                     limits = c(5, 50))

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  scale_x_continuous(breaks = seq(1, 6, 1), limits = c(1, 6)) +
  scale_y_continuous(breaks = seq(5, 35, 5), limits = c(5, 35)) +
  theme_pubr()

ggplot(Salaries, aes(x = rank)) +
  geom_bar() +
  scale_x_discrete(limits = c("Prof", "AsstProf", "AssocProf"))


ggplot(Salaries, aes(x = rank)) +
  geom_bar() +
  scale_x_discrete(limits = c("Prof", "AsstProf", "AssocProf"),
    labels = c("Full\nProfessor", "Assistant\nProfessor",
      "Associate\nProfessor"))

ggplot(Salaries, aes(x = rank)) +
  geom_bar() +
  scale_x_discrete(limits = c("Prof", "AsstProf", "AssocProf"),
                   labels = c("Full Professor", "Assistant Professor",
                              "Associate Professor"))

# \n breaks the sentence
# colors/fills
ggplot(Salaries, aes(x = rank, fill = rank)) +
  geom_bar() +
  scale_fill_manual(values = c("red", "green", "blue"))

ggplot(Salaries, aes(x = rank, fill = rank)) +
  geom_bar() +
  scale_fill_brewer()

ggplot(Salaries, aes(x = rank, fill = rank)) +
  geom_bar() +
  scale_fill_brewer(palette = "PuRd")+
  theme_apa()

# annotations
ggplot(data = mtcars, aes(x = wt, y = mpg, color = factor(am))) +
  geom_point(size = 2) + 
    theme_apa() + 
    theme() + 
  labs(title = "Relationship of Auto Weight to Mileage",
       subtitle = "By Auto Transmission Type",
       caption = "Data from Motor Trend Magazine 1974",
       x = "Weight in Thousand Pounds",
       y = "Miles Per Gallon",
       color = "Transmission Type")



# Change theme
ggplot(data = mtcars, aes(x = wt, y = mpg, color = factor(am))) +
  geom_point(size = 2) +
  labs(title = "Relationship of Auto Weight to Mileage",
       subtitle = "By Auto Transmission Type",
       caption = "Data from Motor Trend Magazine 1974",
       x = "Weight in Thousand Pounds",
       y = "Miles Per Gallon",
       color = "Transmission Type") +
       theme(legend.position = "top")


library(ggplot2)
library(jtools)
library(ggpubr)



# https://ggplot2.tidyverse.org/reference/ggtheme.html
# ggplot(data = mtcars, aes(x = wt, y = mpg)) +
#   geom_point() +
#   geom_hline(yintercept = 20, color = "red") +
#   annotate("text", x = 5, y = 21,
#            label = "Average Mileage", color = "red")
