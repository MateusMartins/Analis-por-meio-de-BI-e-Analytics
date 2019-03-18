library(ggplot2)
library(caret)
library(tidyverse)
library(car)
library(ISLR)
library(mlbench)
library(MASS)



# Read CSV
auto = read.csv("~/Desktop/trabalho/Analis-por-meio-de-BI-e-Analytics/exercicio_1/Auto.csv", header = T)
head(auto)
names(auto)
summary(auto)

# Altera o HorsePower
auto$HP <- as.numeric(levels(auto$horsepower))[auto$horsepower]

# Questão A
auto$mpg01 <- ifelse(auto$mpg > median(auto$mpg), 1, 0)

# Questão B
correlation <- glm(mpg01 ~ acceleration, family = "binomial", data = auto)
summary(correlation)

ggplot(data = auto, aes(x = acceleration, y = mpg)) + geom_point() + geom_smooth(method = "lm")

# Questão C
set.seed(100)
trainDataIndex <- createDataPartition(auto$mpg01, p=0.7, list = F)  # 70% training data
trainData <- auto[trainDataIndex, ]
testData <- auto[-trainDataIndex, ]

# Questão D
# a)
result <- lda(formula = mpg01 ~ acceleration, data = auto)
result

# b)
# Erro
summary(glm(mpg01 ~ acceleration, family = "binomial", data = auto))

# matriz de confusão
lda.train <- predict(result)
auto$lda <- lda.train$class
table(auto$lda,auto$mpg01)

# Exercicio D
train_regression <- glm(mpg01 ~ acceleration, family = "binomial", data = trainData)
summary(train_regression)

# Matriz
result2 <- lda(formula = mpg01 ~ acceleration, data = trainData)
result2

lda.train <- predict(result2)
trainData$lda <- lda.train$class
table(trainData$lda,trainData$mpg01)
