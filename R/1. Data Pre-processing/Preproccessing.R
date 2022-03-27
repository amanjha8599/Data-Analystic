library(caTools)

#reading CSV
dataset = read.csv("Data.csv")

#reading missing data
dataset$Age = ifelse(is.na(dataset$Age), mean(dataset$Age,na.rm = TRUE),dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),mean(dataset$Salary , na.rm = TRUE),dataset$Salary)

#Encoding Categorical data
dataset$Country = factor(dataset$Country, labels = c(0,1,2))
dataset$Purchased = factor(dataset$Purchased, labels = c(0,1))

#Splitting dataset
set.seed(123)
split = sample.split(dataset$Purchased,SplitRatio = 0.8)
training_set = subset(dataset , split == TRUE)
test_set = subset(dataset , split == FALSE)

#Feature Scaling
training_set[,2:3] = scale(training_set[,2:3] )
test_set[,2:3]  = scale(test_set[,2:3] )