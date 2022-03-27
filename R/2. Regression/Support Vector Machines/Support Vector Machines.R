dataset = read.csv("Position_Salaries.csv")
dataset = dataset[,2:3]

#install.packages('e1071')
library(e1071)
model = svm(Salary ~ ., data = dataset, type = 'eps-regression')
pred = predict(model,dataset)

library(ggplot2)

ggplot() +
  geom_line(aes(dataset$Level, pred), color = "red")+
  geom_point(aes(dataset$Level, dataset$Salary), color = "blue")+
  xlab("Position levels")+
  ylab("Salary")+
  ggtitle("Salary v/s Positions using SVM model")