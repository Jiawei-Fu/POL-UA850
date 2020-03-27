########################################
## R codes for section 7
## Pol-850
########################################

setwd("~/Documents/UA850/recitation 7")

######## Model Fit ###############################
florida <- read.csv("florida.csv")
## regress Buchanan's 2000 votes on Perot's 1996 votes 
fit2 <- lm(Buchanan00 ~ Perot96, data = florida)
summary(fit2)

## compute TSS (total sum of squares) and SSR (sum of squared residuals) 
TSS2 <- sum((florida$Buchanan00 - mean(florida$Buchanan00))^2)
SSR2 <- sum(resid(fit2)^2)
## Coefficient of determination
(TSS2 - SSR2) / TSS2

R2 <- function(fit) {
  resid <- resid(fit) # residuals
  y <- fitted(fit) + resid # outcome variable 
  TSS <- sum((y - mean(y))^2)
  SSR <- sum(resid^2)
  R2 <- (TSS - SSR) / TSS
  return(R2)
} 

R2(fit2)

## built-in R function 
summary(fit2)$r.squared

plot(fitted(fit2), resid(fit2), xlim = c(0, 1500), ylim = c(-750, 2500), xlab = "Fitted values", ylab = "Residuals")
abline(h = 0)

florida$county[resid(fit2) == max(resid(fit2))]

## data without Palm Beach
florida.pb <- subset(florida, subset = (county != "PalmBeach"))
fit3 <- lm(Buchanan00 ~ Perot96, data = florida.pb)
summary(fit3)

## R^2 or coefficient of determination R2(fit3)

plot(fitted(fit3), resid(fit3), xlim = c(0, 1500), ylim = c(-750, 2500),
     xlab = "Fitted values", ylab = "Residuals",
     main = "Residual plot without Palm Beach") 

abline(h = 0) # horizontal line at 0
plot(florida$Perot96, florida$Buchanan00,
     xlab = "Perot's votes in 1996", ylab = "Buchanan's votes in 2000",
     main = "Regression Models' Comparison")

abline(fit2, lty = "dashed") # regression with Palm Beach
abline(fit3) # regression without Palm Beach
text(30000, 3250, "Palm Beach")
text(30000, 1500, "regression\n with Palm Beach") 
text(30000, 400, "regression\n without Palm Beach")

######### Multiple Regression (1) ###############

### create data 
x1 <- rnorm(n=500, mean=20, sd=4)
x2 <- rnorm(n=500, mean=5, sd=1)
x3 <- rnorm(n=500, mean=10, sd=5)

y <- 10 + 5*x1 + 3*x2 +10*x3 + rnorm(500)

m1 <- lm(y~x1)
summary(m1)

m2 <- lm(y~x1 + x2)
summary(m2)

m3 <- lm(y~ x1 + x2 + x3)
summary(m3)

######### Multiple Regression (2) ###############
social <- read.csv("social.csv") 
levels(social$messages) # base level is `Civic'

fit <- lm(primary2006 ~ messages, data = social)
summary(fit)

## create indicator variables
## social$Control <- ifelse(social$messages == "Control", 1, 0)
## social$Hawthorne <- ifelse(social$messages == "Hawthorne", 1, 0)
## social$Neighbors <- ifelse(social$messages == "Neighbors", 1, 0)
## ## fit the same regression as above by directly using indicator variables
## lm(primary2008 ~ Control + Hawthorne + Neighbors, data = social)
## create a data frame with unique values of `messages' 

unique.messages <- data.frame(messages = unique(social$messages)) 
unique.messages
unique(social$messages)

## make prediction for each observation from this new data frame 
predict(fit, newdata = unique.messages)
predict(fit, newdata = data.frame(messages = unique(social$messages)))


## sample average
tapply(social$primary2006, social$messages, mean)

## linear regression without intercept
fit.noint <- lm(primary2006 ~ -1 + messages, data = social) 
summary(fit.noint)

## estimated average effect of `Neighbors' condition 
coef(fit)["messagesNeighbors"] - coef(fit)["messagesControl"]
## difference in means 
mean(social$primary2006[social$messages == "Neighbors"]) -
mean(social$primary2006[social$messages == "Control"])

# Look at R-squared and Adjusted R-squared
R2(fit) # unadjusted R-squared calculation 
summary(fit)$adj.r.squared 
