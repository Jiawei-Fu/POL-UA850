#####################################################
# Section 4 for POL-UA 850 
#####################################################
rm(list = ls()) # Clear your workspace
setwd("~/Documents/UA850")  ## put in your own working directory


########################
# Histograms
########################

## Load the dataset
bes <- read.csv("BES.csv") # reads and stores data

## Understand the data
## (Read about description of variables and unit of observation)
head(bes) # shows first observations

## Simple Histogram of the age variable 
hist(bes$age)

## This looks ugly! Let's make it nicer
hist(bes$age, main = "Histogram of Age, Brexit Survey",
xlab = "Age", col = "mediumpurple3")

## Histograms to detect relationships: age for Brexit opponents
hist(bes$age[bes$leave == 0], main = "Histogram of Age, Brexit Opponents",
     xlab = "Age", col = "springgreen4")

## Histograms to detect relationships: age for Brexit supporters
hist(bes$age[bes$leave == 1], main = "Histogram of Age, Brexit Supporters",
     xlab = "Age", col = "red4")

# Q: What do we learn about the relationship b/w age and Brexit support?

## Adding a line of reference to mean of distribution
hist(bes$age[bes$leave == 1], main = "Histogram of Age, Brexit Supporters",
     xlab = "Age", col = "red4")
abline(v=mean(bes$age, na.rm = TRUE))

## Making it a Density Histogram
hist(bes$age[bes$leave == 1], main = "Histogram of Age, Brexit Supporters",
     xlab = "Age", col = "red4", freq = FALSE)
abline(v=mean(bes$age, na.rm = TRUE))



########################
# Scatter Plots
########################

x <- c(1,4,7,9,10)
y <- c(12, 15, 18, 20, 21)

plot(x,y)
plot(x,y, type = "l")
plot(x,y, type = "b")

plot(x,y, pch = 17)  # plot symbols
plot(x,y, type = "b", lty =3) # line type

plot(x,y, type = "b", lty =3,
     xlim = c(-1, 13))

plot(x,y, type = "b", lty =3,
     xlim = c(-1, 13), ylim = c(10,22))

#### two plots using lines
x1 <- c(1,4,7,9,10)-1
y1 <- c(12, 15, 18, 20, 21)-4

plot(x,y, type = "b", lty =3,
     xlim = c(-1, 13), ylim = c(10,22))
lines(x1, y1, type = "b")   



plot(density(x))  # density plot
hist(x, freq = FALSE)
plot(density(y))
hist(y, freq = FALSE)

## Load the dataset
dis <- read.csv("UK_districts.csv") # reads and stores data

## Understand the data
## (Read about description of variables and unit of observation)
head(dis) # shows first observations

# Remove observations with NAs
dis1 <- na.omit(dis) 

# Check how many less observations
dim(dis1) 

# Scatterplot: How Leave Correlates with Education
plot(dis1$high_education, dis1$leave)

# Q: What do we learn about the relationship b/w education and Brexit support?

# Basic Windowdressing
plot(dis1$high_education, dis1$leave, main = "Education and Brexit Support,
by District", xlab = "Pct. With Higher Education", ylab = "Pct. Leave")

# Identifying "center" of data: add lines for mean of each variable
plot(dis1$high_education, dis1$leave, main = "Education and Brexit Support,
by District", xlab = "Pct. With Higher Education", ylab = "Pct. Leave")
abline(v = mean(dis1$high_education), lty = "dashed", col = "blue")
abline(h = mean(dis1$leave), lty = "dashed", col = "red")


