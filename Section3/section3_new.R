#####################################################
# Section 3 for POL-UA 850 
#####################################################
rm(list = ls()) # Clear your workspace
setwd("~/Documents/UA850")  ## put in your own working directory


########################
# Population Characteristics
########################

## Load the dataset
bes <- read.csv("BES.csv") # reads and stores data

## Understand the data
## (Read about description of variables and unit of observation)
head(bes) # shows first observations

### Exercise #1:
## Identify each variable's type
## (character vs. numeric; binary vs. non-binary)

### Put answers here:


## Identify the number of observations
dim(bes) # provides dimensions of dataframe: rows, columns

########################
# Frequency Tables
########################
## Frequency table using the leave variable
freq_table <- table(bes$leave) # object with frequency table

### Exercise #2: Creating a frequency table using the vote variable



########################
# Proportion Tables
########################

## option a: create frequency table first
## then create proportion table
freq_table <- table(bes$vote) 
prop.table(freq_table)

## option b: do it all at once
prop.table(table(bes$vote)) # creates table of proportions

### Exercise #3: Creating a proportion table using the education variable


##############
## for loop ##
##############

### for (variable in vector) {
  
### }

for (i in 1:10) {
  print("Hello world!")
}


#######  write your own table function #####

my_table <- function(x){
  
  var <- unique(x)          ### uniqe value of the input vector
  num_var <- length(var)    ### how many uniqe values
  
  rec <- rep(NA,num_var)   ### create a vector to record the results
  
  for (i in 1:num_var) {
    rec[i] <- sum(x == var[i])  ### calculate the frequence of each uniqe value
  }
  
  names(rec) <- var
  
  return(rec)
}

my_table(bes$vote)
table(bes$vote) 


############## write your own prop.table function



#############



########################
# Missing Data
########################
## Handling missing data
# table() including NAs
table(bes$education, exclude=NULL) 

# mean() without removing NAs
mean(bes$leave) 

# mean() removing NAs
mean(bes$leave, na.rm=TRUE) 

# removes observations with NAs if 
##at least ONE column contains an NA value
bes1 <- na.omit(bes) 

########################
# Two-Way Tables
########################
## Two-way frequency tables
table(bes1$leave, bes1$education) 

### Exercise #4: With a partner, discuss how to interpret 
### the output of the two-way frequency table


## Two-way tables of proportions
prop.table(table(bes1$leave, bes1$education)) 

## Advanced: margins
## Proportion of different education levels 
## within Brexit supports and non-supporters
prop.table(table(bes1$leave, bes1$education), margin=1) 

## Proportion of Brexit supporters and non-supporters 
## within different education levels
prop.table(table(bes1$leave, bes1$education), margin=2) 