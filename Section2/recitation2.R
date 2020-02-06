#####################################################
# Section 2 for POL-UA 850 
#####################################################
rm(list = ls()) # Clear your workspace


##################
# Data Structure
##################

## ------------ 1. Matrix ------------ ##

m1 <- matrix(data = 1:20, nrow = 5, ncol = 4)
m1

m1[2,3]      # subsetting, 2 dimensions
m1[2,c(1,4)]

rownames(m1) <- c("a", "b", "c", "d", "e")
colnames(m1) <- c("A", "B", "C", "D")
m1

m2 <- matrix(data = 1:20, nrow = 5, byrow = TRUE)
m2

##### transpose
t(m1)    # now, transpose(m1) is equal to m2

##### Advanced: operations with vector and matrix

vec1 <- c(1:4)

m1 + vec1  
m1 %*% vec1  ### multiply
solve(m1)  ### inverse


## ------------ 2. Array ------------ ##

dim1 <- c("a1", "a2")
dim2 <- c("b1", "b2", "b3")
dim3 <- c("c1", "c2", "c3", "c4")

z <- array(1:24, dim = c(2, 3, 4), dimnames = list(dim1, dim2, dim3))
z

z[1,2,3]

## ------------ 3. List ------------ ##

l1 <- list(a = c(1, 3, 5, 7, 10),
           b = rep("name", 10),
           c = matrix(1:10, 2))

l1

l1[1]  ### use [] to see what is in the list
l1["a"]  ### similarly

l1[[1]]  ### use [[]] to extract the excat elements
l1$a   ### Or you can directly use $ to extract


##### excise: what is tmp[2,4] ?
tmp <- l1$c 
tmp[2,4]

########  You can also put list in the list

l2 <- list(a = list(b = 1:10, c = "name"), d = 1:20)
l2

### what is the difference ?
l2[[1]]
l2[1]



########################
# Relational Operators
########################

## ------------ 1. Logical Operators ------------ ##

class(TRUE)

as.integer(TRUE)
as.integer(FALSE)

x <- c(TRUE, FALSE, TRUE) # a vector with logical values

mean(x) # proportion of TRUEs
sum(x) # number of TRUEs

FALSE & TRUE
TRUE & TRUE
TRUE | FALSE
FALSE | FALSE
TRUE & FALSE & TRUE

## ----------- 2. LOGICAL OPERATORS AND MATHEMATICAL RELATIONSHIPS ---------- ##

4 == 4
4 > 3

x <- c(3, 2, 1, -2, -1)
x == -1
x >= 2
x != 1

## logical conjunction of two vectors with logical values
(x > 0) & (x <= 2)

## logical disjunction of two vectors with logical values
(x > 2) | (x <= -1)


## ---------- 3. Practice with STAR datset ------------ ##

star <- read.csv("STAR.csv")
head(star, n = 10)  #### show first 10 rows

star$classtype == "small"

sum(star$classtype == "small")/nrow(star)  
mean(star$classtype == "small")

tmp1 <- (star$classtype == "small") & (star$reading >= 600)
tmp2 <- (star$classtype == "regular") & (star$reading >= 600)

mean(tmp1)
mean(tmp2)


##################
# Basic Functions 
##################

### ifelse

ifelse(star$classtype == "regular", 1, 0)  

star$regular <- ifelse(star$classtype == "regular", 1, 0) ## create a new var
head(star, n=4)

star$treatment <- ifelse(star$classtype == "small", 1, 0) ## create a new var

mean(star$math) 
mean(star$math[star$treatment == 1])  ## mean for treatment group

#### difference-in-means estimators
mean(star$math[star$treatment==1]) - mean(star$math[star$treatment==0])
mean(star$reading[star$treatment==1]) - mean(star$reading[star$treatment==0])
mean(star$graduated[star$treatment==1]) - mean(star$graduated[star$treatment==0])


### subset

subset(star, classtype == "small")  

## sub dataset only contains small class
star_small <- subset(star, classtype == "small") 
star_small

star_regular <- subset(star, classtype == "regular") 

### now, we can use this new data.frame
mean(star_small$math) - mean(star_regular$math)
mean(star_small$reading) - mean(star_regular$reading)
mean(star_small$graduated) - mean(star_regular$graduated)

### advanced

star_small_grad <- subset(star, 
                          subset = (classtype == "small" & graduated == 1)) 
star_small_nongrad <- subset(star, 
                             subset = (classtype == "small" & graduated == 0))

mean(star_small_grad$reading) - mean(star_small_nongrad$reading)
mean(star_small_grad$math) - mean(star_small_nongrad$math)



