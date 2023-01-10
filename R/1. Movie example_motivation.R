## -----------------------------------------------------------------------
## Clear work space
rm(list = ls(all.names = TRUE))

## Set working directory
setwd("C:/Users/ncher/Dropbox/TTU/Teaching/Jan_April_2023/Exploratory_data_analysis")


# Load libraries
library(psych)
library(ggplot2)


## -----------------------------------------------------------------------
## Import the data
movies <- read.csv("movie.csv")


# Check the data
head(movies)
tail(movies)
headTail(movies)
anyNA(movies)
colSums(is.na(movies))
str(movies)
# View(movies)
# edit(movies)


## -----------------------------------------------------------------------
## Rename the column names
colnames(movies)
colnames(movies) <- c("Film","Genre", "CriticRating", "AudienceRating",
                      "BudgetMillions","Year")


## -----------------------------------------------------------------------
# factor(movies$Year)
## convert year to factor - categorical
movies$Year <- factor(movies$Year)


## ----fig.width=5, fig.height=2------------------------------------------
# Visualization
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))


## ----fig.width=5, fig.height=2.2----------------------------------------
# Add geometry - point
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating)) + 
    geom_point()


## ----fig.width=5, fig.height=2.2----------------------------------------
# Add colour
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre)) + 
    geom_point()


## ----fig.width=5, fig.height=2.2----------------------------------------
# Add size
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre, 
                         size = Genre)) + geom_point()


## ----fig.width=5, fig.height=2.2----------------------------------------
# Add size better way
ggplot(data = movies,aes(x = CriticRating, y = AudienceRating, colour = Genre, 
                         size = BudgetMillions)) + geom_point()


## ----fig.width=5, fig.height=2.2----------------------------------------
p <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre,
              size = BudgetMillions))

p

## ----fig.width=5, fig.height=2.2----------------------------------------
# plotting with layers
# create an object
p + 
  geom_point()


## ----fig.width=5, fig.height=2.2----------------------------------------
p + 
  geom_line()


## ----fig.width=5, fig.height=2.2----------------------------------------
p + 
  geom_point() + geom_line()


## ----fig.width=5, fig.height=2.2----------------------------------------
p + 
  geom_line() + geom_point()


## ----fig.width=5, fig.height=2------------------------------------------
t <- ggplot(data = movies, aes(x = AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill = "White",colour = "Blue")


## ----fig.width=5, fig.height=2.2----------------------------------------
t <- ggplot(data = movies) ## the same data set.
t + geom_histogram(
  binwidth = 10,
  aes(x = AudienceRating),
  fill = "White",colour = "Blue")


## ----fig.width=5, fig.height=2.2----------------------------------------
t + geom_histogram(binwidth = 10,
  aes(x = CriticRating),
  fill = "White",colour = "Blue")


## ----fig.width=5, fig.height=2.2----------------------------------------
t <- ggplot()


## ----fig.width=5, fig.height=2.2----------------------------------------
## Statistical transformations
?geom_smooth
u <- ggplot(data = movies, aes(
    x = CriticRating, 
    y = AudienceRating,
    color = Genre))


## ----fig.width=5, fig.height=2.2----------------------------------------
u + geom_point()


## ----fig.width=5, fig.height=2.2----------------------------------------
u + 
  geom_point() + geom_smooth()


## ----fig.width=5, fig.height=2.2----------------------------------------
u + 
  geom_point() + 
  geom_smooth(fill = NA)


## -----------------------------------------------------------------------
u <- ggplot(data = movies, aes(
    x = Genre, 
    y = AudienceRating,color = Genre))


## ----fig.width=5, fig.height=2.2----------------------------------------
# Box plots
u + 
  geom_boxplot()


## ----fig.width=5, fig.height=2.2----------------------------------------
u + 
  geom_boxplot(size = 1.2)


## ----fig.width=5, fig.height=2.2----------------------------------------
u + 
  geom_boxplot(size = 1.2) + 
    geom_point()


## ----fig.width=5, fig.height=2.2----------------------------------------
u + 
  geom_boxplot(size = 1.2) + 
    geom_jitter()


## ----fig.width=5, fig.height=2.2----------------------------------------
u + 
  geom_jitter() + 
    geom_boxplot(size = 1.2, alpha = 0.5)


## ----fig.width=5, fig.height=2.2----------------------------------------
v <- ggplot(data = movies, aes(x = BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill = Genre),
                   colour = "Black")


## ----fig.width=5, fig.height=2.2----------------------------------------
v + geom_histogram(binwidth = 10, aes(fill = Genre),
                   colour = "Black") +
  facet_grid(Genre ~ ., scales = "free")


## ----fig.width=5, fig.height=2.2----------------------------------------
w <- ggplot(data = movies, 
            aes(x = CriticRating,
              y = AudienceRating,
              color = Genre))
w + geom_point(size = 3)


## ----fig.width=5, fig.height=2.2----------------------------------------
w + 
  geom_point(size = 3) +
  facet_grid(Genre ~ .)


## ----fig.width=5, fig.height=2.2----------------------------------------
w + 
  geom_point(size = 3) +
  facet_grid(. ~ Year)


## ----fig.width=5, fig.height=2.2----------------------------------------
w + geom_point(size = 3) +
  facet_grid(Genre ~ Year)


## ----fig.width=5, fig.height=2.2----------------------------------------
w + 
  geom_point(size = 3) +
  geom_smooth() +
  facet_grid(Genre ~ Year)


## ----fig.width=5, fig.height=2.2----------------------------------------
w + 
  geom_point(aes(size = BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre ~ Year)


## ----fig.width=5, fig.height=2.2----------------------------------------
m <- ggplot(data = movies,
            aes(x = CriticRating,
              y = AudienceRating,
              size = BudgetMillions,
              color = Genre))


## -----------------------------------------------------------------------
m + geom_point()


## ----fig.width=5, fig.height=2.2----------------------------------------
m + geom_point() + xlim(50, 100) +
  ylim(50, 100)


## ----fig.width=5, fig.height=2.2----------------------------------------
n <- ggplot(data = movies, 
            aes(x = BudgetMillions))


## ----fig.height=2, fig.width=5------------------------------------------
n + geom_histogram(binwidth = 10, 
                   aes(fill = Genre), 
                   color = "Black") + ylim(0, 50)


## ----fig.width=5, fig.height=2.2----------------------------------------
n + geom_histogram(binwidth = 10, 
                   aes(fill = Genre), 
                   color = "Black") +
  coord_cartesian(ylim = c(0, 50))


## ----fig.width=5, fig.height=2.2----------------------------------------
w + geom_point(aes(size = BudgetMillions)) +
  geom_smooth() + facet_grid(Genre ~ Year) +
  coord_cartesian(ylim = c(0, 100))


## ----fig.width=5, fig.height=2.2----------------------------------------
o <- ggplot(data = movies, 
            aes(x = BudgetMillions))


## ----fig.height=2, fig.width=5------------------------------------------
o + geom_histogram(binwidth = 10, 
                   aes(fill = Genre, 
                       color = "Black"))


## ----fig.height=2, fig.width=5------------------------------------------
h <- o + geom_histogram(binwidth = 10, 
                     aes(fill = Genre), 
                     color = "Black")


## ----fig.width=5, fig.height=2.2----------------------------------------
h + xlab("Money Axis") +
  ylab("Number of Movies")


## ----fig.width=5, fig.height=2.2----------------------------------------
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen",
  size = 10), axis.title.y = element_text(color = "Red", 
                                size = 10))


## ----fig.width=5, fig.height=2.2----------------------------------------
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen",
    size = 10),axis.title.y = element_text(color = "Red", 
    size = 10),axis.text.x = element_text(size = 10),
    axis.text.y = element_text(size = 10))


## ----fig.width=4, fig.height=1.5----------------------------------------
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen", 
  size = 5),axis.title.y = element_text(color = "Red", 
  size = 5),axis.text.x = element_text(size = 5),
    axis.text.y = element_text(size = 5),
    legend.title = element_text(size = 5),
    legend.text = element_text(size = 5),
legend.position = c(1,1), legend.justification = c(1,1))


## ----fig.width=4, fig.height=1.5----------------------------------------
h + xlab("Money Axis") + ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour = "DarkGreen", 
  size = 5),axis.title.y = element_text(colour = "Red", 
  size = 5),axis.text.x = element_text(size = 5),
    axis.text.y = element_text(size = 5),
    legend.title = element_text(size = 5),
    legend.text = element_text(size = 5),
    legend.position = c(1, 1),
    legend.justification = c(1, 1),
    plot.title = element_text(colour = "DarkBlue", 
                              size = 5))

