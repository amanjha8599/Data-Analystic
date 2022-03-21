dataset = read.csv('Position_Salaries.csv')
dataset = dataset[,2:3]

dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4

model = lm(Salary ~ ., data = dataset)

library(ggplot2)

ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = "red")+
  geom_line(aes(x=dataset$Level , y = predict(model,dataset)), color = "blue")+
  xlab("Level of Positions")+
  ylab("Salary")+
  ggtitle("Salary v/s Position Level")+
  theme(legend.position = c(0.95,0.95))