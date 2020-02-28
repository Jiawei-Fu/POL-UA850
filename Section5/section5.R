#####################################################
# Section 5 for POL-UA 850 
#####################################################

rm(list = ls()) # Clear your workspace
setwd("~/Documents/UA850")  ## put in your own working directory


###################
## Mean and Median
##################

set.seed(1)
w <- rnorm(n = 500, mean = 20, sd = 3)  #### generate random sample
hist(w)

#### calculate mean by hand

sum(w)/length(w)
mean(w)   ### use built in mean() function to check

#### calculate median by hand
w[order(w)[length(w)/2]]
median(w)  ### use built in median() function to check


#####  robustness: mean vs median

w[1:10] <- 100 ### create 10 outliers
hist(w, xlim = c(0,100),breaks = 50)

mean(w)
median(w)   #### median is more robust

w[1:50] <- 100 ### create 50 outliers
hist(w, xlim = c(0,100),breaks = 50)

mean(w)
median(w)


##########################
# Correlation Coefficient
##########################

#### In R, var, sd, corr all use denominator n - 1. Be careful! 
#### In the dss, they use n instead. 


#### calculate var, sd, corr by hand

x <- rnorm(n = 100, mean = 20, sd = 3)      #### generate random points
y <- 5*x + rnorm(n = 100, mean = 0, sd = 5)

plot(x,y)  ### see correlation

#### var of x, with denominator n-1

var_x <- sum( (x - mean(x))^2 ) / (length(x)-1)
var_x

var(x) ### use R function


#### sd of x, with denominator n-1

sd_x <- sqrt(var_x)
sd_x

sd(x)

### corr of (x,y), remember the denominator should be the same with sd (or var)

z_x <- (x - mean(x)) / sd_x   ### calculate z score
z_y <- (y - mean(y)) / sd(y)
sum(z_x * z_y) / (length(x) - 1)

cor(x,y)  ### use R function to check



##### what if we use denominator n 
##### write a function: input: x,y output correlation coeficient; with denominator n

my_corr <- function(x, y){
  
  var_x <- sum( (x - mean(x))^2 ) / (length(x))
  var_y <- sum( (y - mean(y))^2 ) / (length(y))
  
  sd_x <- sqrt(var_x)
  sd_y <- sqrt(var_y)
  
  z_x <- (x - mean(x)) / sd_x
  z_y <- (y - mean(y)) / sd_y
  
  cor_xy <- sum(z_x * z_y) / (length(x))
  
  return(cor_xy)
}

my_corr(x,y)  ### our function uses denominator n 
cor(x,y)  ### remember, R function uses denominator n-1

### Above results are the same!!!
### Takeaway: use the same denominator when you calculate sd (or var) and corr


########## Application 

dis <- read.csv("UK_districts.csv") # load data
dim(dis)

plot(dis1$high_education, dis1$leave, main = "Education and Brexit Support,
by District", xlab = "Pct. With Higher Education", ylab = "Pct. Leave")

abline(v = mean(dis1$high_education), lty = "dashed", col = "blue")
abline(h = mean(dis1$leave), lty = "dashed", col = "red")


mean(dis1$high_education) 
median(dis1$high_education)

mean(dis1$leave)
median(dis1$leave)


cor(dis1$leave, dis1$high_education)
cor(dis1$high_education, dis1$leave)  ### change the order

my_corr(dis1$leave, dis1$high_education)  ### use our own function with denominator n







