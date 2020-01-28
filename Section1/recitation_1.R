#####################################################
# Section 1 for POL-UA 850 
#####################################################

rm(list = ls()) # Clear your workspace

##########
# Warm up
##########
## ------------ 1. BASIC ARITHMETIC OPERATIONS ------------ ##

5 - 3
5 / 3
5 ^ 3
5 * (10 - 3)
sqrt(4)

## ------------ 2. CREATING OBJECTS ------------ ##

apple <- 5
apple
print(apple)

result <- 5 + 3
result

result <- 5 - 3
result

kosuke <- "instructor"
kosuke
kosuke <- "instructor and author"
kosuke

Result <- "5"
Result
result

class(result)
Result
class(Result)
class(sqrt)


##################
# Data Structure
##################

## ------------ 1. VECTORS ------------ ##

world.pop <- c(2525779, 3026003, 3691173, 4449049, 5320817,
               6127700, 6916183)    ### use c() to create vectors
world.pop

wrong_vector <- c(343, 23, "Jiawei")  ### donot pur different classes in one vector 
wrong_vector   ### see what happened

pop.first <- c(2525779, 3026003, 3691173)
pop.second <- c(4449049, 5320817, 6127700, 6916183)
pop.all <- c(pop.first, pop.second)
pop.all

world.pop[2]
world.pop[c(2, 4)] 
world.pop[c(4, 2)] 
world.pop[-3]

pop.million <- world.pop / 1000
pop.million

pop.rate <- world.pop / world.pop[1]
pop.rate

pop.increase <- world.pop[-1] - world.pop[-7]
percent.increase <- (pop.increase / world.pop[-7]) * 100
percent.increase
percent.increase[c(1, 2)] <- c(20, 22)
percent.increase


## ------------ 2. MATRIX ------------ ##

y <- matrix(data = 1:20, nrow = 5, ncol = 4)
y

x <- matrix(1:20, nrow = 5)    # if you are lazy as me, try this
x

z <- matrix(1:20, nrow = 5, byrow = TRUE) 

z[2,3]

z[,2] <- c(1,2,3,4,5)

## ------------ 3. Data Frame ------------ ##

dt <- data.frame(var1 = 1:10, var2 = rep("name",10))

var1 <- 1:10
var2 <- rep("name",10)

dt1 <- data.frame(var1, var2)

############## working with a data set 

STAR <- read.csv("STAR.csv")   ### why fail?


######## working directory
getwd()
setwd("~/Documents/UA850/recitation 1")   ### type in your own path
getwd()

STAR <- read.csv("STAR.csv") 
class(STAR)

# If file already in R format, use following line instead
#load("STAR.RData") 

# Getting a description of the data
names(STAR) # look at variable names
nrow(STAR) # n. of observations
ncol(STAR) # n. of variables
dim(STAR) # dimensionality of the data set
summary(STAR) # summary statistics of all variables

# Call a specific variable: use the $ sign!
STAR$reading

# Extract a variable as a separate vector
reading.score <- c(STAR$reading)
reading.score

# Compute the mean of a vector
mean(reading.score)

## calculate sum of math and reading scores
STAR$total.score <- STAR$math + STAR$reading

## calculate mean b/w math and reading scores
STAR$mean.score <- (STAR$math + STAR$reading) / 2

head(STAR) # two more variables now in our data!

## calculate mean of the difference b/w math and reading scores

# One way
mean(STAR$math - STAR$reading)

# Another (more elegant!) way
STAR$diff.score <- STAR$math - STAR$reading
mean(STAR$diff.score)

# Comparing means across the two scores
mean(STAR$math)
mean(STAR$reading)

# So are people better, on average, at math or at reading?

# Individual scores as % of the mean score
STAR$math.pct <- STAR$math / mean(STAR$math)*100
STAR$read.pct <- STAR$reading / mean(STAR$reading)*100

head(STAR)


#################
# Basic Functions
#################

length(world.pop) # n. elements in a vector 
min(world.pop)  # lowest value in a vector    
max(world.pop)  # highest value in a vector   
range(world.pop)  # range of a vector   
mean(world.pop)   # mean of a vector  
sum(world.pop) / length(world.pop) # mean of a vector (alternative)

# create a vector with decades
year <- seq(from = 1950, to = 2010, by = 10)
year

seq(to = 2010, by = 10, from = 1950)

# same, but in reverse order!
seq(from = 2010, to = 1950, by = -10)

# vectors collecting consecutive values
2008:2012
2012:2008

# assigning labels to our new vector
names(world.pop) 
names(world.pop) <- year
names(world.pop)
world.pop

## ------------ 5. CREATING YOUR OWN FUNCTIONS ------------ ##

## myfunction <- function(input1, input2, ..., inputN) {
## 
##     DEFINE `output' USING INPUTS
## 
##     return(output)
## }

my.summary <- function(x){ # function takes one input
  s.out <- sum(x)
  l.out <- length(x)
  m.out <- s.out / l.out
  out <- c(s.out, l.out, m.out) # define the output
  names(out) <- c("sum", "length", "mean") # add labels
  return(out) # end function by calling output
}
z <- 1:10
my.summary(z)
my.summary(world.pop)




## ------------ 8. SAVING OBJECTS ------------ ##

# save.image("qss/INTRO/Chapter1.RData")

#save(STAR, file = "Chapter1.RData")

#write.csv(STAR, file = "STAR.csv")