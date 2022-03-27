dataset = read.csv("50_Startups.csv")
dataset$State = factor(dataset$State, labels = c(1,2,3))

library(caTools)
set.seed(123)

split = sample.split(dataset$Profit, SplitRatio = 0.8)
train_set = dataset[split,]
test_set= dataset[!split,]

#Uses all-in estimation method where it assumes all variables are statistically significant
model = lm(Profit ~ ., data = train_set)
pred = predict(model,test_set)
