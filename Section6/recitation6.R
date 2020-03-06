###################################################################
# Section 6 for POL UA 850 
###################################################################

# Make sure you do setwd() before loading the data

rm(list=ls())

## Loading the data

face <- read.csv("~/Documents/UA850/recitation 6/face.csv") 

summary(face)

dim(face)

head(face)

## Two-Party vote share for Democrats and Republicans 

face$d.share <- face$d.votes / (face$d.votes + face$r.votes)
face$r.share <- face$r.votes / (face$d.votes + face$r.votes)

## Margin for Democrats

face$diff.share <- face$d.share - face$r.share

## Get sense of the relationship: scatter plot

plot(face$d.comp, face$diff.share, pch = 16,
     col = ifelse(face$w.party == "R", "red", "blue"),
     xlim = c(0,1), ylim = c(-1,1),
     xlab = "Competence scores for Democrats",
     ylab = "Democratic margin in vote share",
     main = "Facial competence and vote share")

## Quantifying the relationship: correlation

cor(face$d.comp, face$d.share)

## A better quantification: linear model

fit <- lm(diff.share ~ d.comp, data = face) # fit the model
fit

lm(diff.share ~ d.comp, data = face)

coef(fit) # get estimated coefficients

head(fitted(fit)) # get fitted or predicted values

## Visualizing Regression: regression line in scatter plot

plot(face$d.comp, face$diff.share, xlim = c(0, 1.05), ylim = c(-1,1),
     xlab = "Competence scores for Democrats",
     ylab = "Democratic margin in vote share",
     main = "Facial competence and vote share")

abline (fit) #add regression line
abline (v=0, lty = "dashed")

## Evaluating Precision: residuals and RMSE

epsilon.hat <- resid(fit) # residuals

sqrt(mean(epsilon.hat^2)) # RMSE using definition