library(caTools)
library(ggplot2)


# Preprocessing
table = read.csv("Salary_Data.csv")
set.seed(100)
split = sample.split(table$Salary,SplitRatio = 2/3)
train_set = table[split,]
test_set = table[!split,]

#Modelling using Simple Linear Reg
model = lm(formula = Salary ~ YearsExperience, data = train_set)
y_pred = predict(model,newdata = test_set)

#Plotting training set and test sets
ggplot() + 
  geom_point(aes(x = train_set$YearsExperience, y = train_set$Salary),
              color = "red")+
  geom_line(aes(x = train_set$YearsExperience, y = predict(model,train_set)),
            color = "blue") +
  ggtitle("Linear Reg (Training Set)") +
  xlab("Years of Experience") + 
  ylab("Salaries")

ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = "red")+
  geom_line(aes(x = train_set$YearsExperience, y = predict(model,train_set)),
            color = "blue") +
  ggtitle("Linear Reg (Test Set)") +
  xlab("Years of Experience") + 
  ylab("Salaries")