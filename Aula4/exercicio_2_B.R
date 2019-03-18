library(MASS)

?Boston
names(Boston)
head(Boston)

# definição se é maior ou menor
Boston$crim01 <- ifelse(Boston$crim > median(Boston$crim), 1, 0)
summary(Boston)

# correlação entre os dados
correlation <- glm(crim01 ~ age + tax + lstat, family = "binomial", data = Boston)
summary(correlation)

# divisão para treino
set.seed(100)
trainDataIndex <- createDataPartition(Boston$crim01, p=0.7, list = F)  # 70% training data
trainData <- Boston[trainDataIndex, ]
testData <- Boston[-trainDataIndex, ]

result_boston <- lda(formula = crim01 ~ age + tax + lstat, data = Boston)
result_boston

lda.train <- predict(result_boston)
Boston$lda <- lda.train$class
table(Boston$lda,Boston$crim01)

age_boston <- lda(formula = crim01 ~ age, data = Boston)
age_boston

lda.train <- predict(age_boston)
Boston$lda <- lda.train$class
table(Boston$lda,Boston$crim01)

tax_boston <- lda(formula = crim01 ~ tax, data = Boston)
tax_boston

lda.train <- predict(tax_boston)
Boston$lda <- lda.train$class
table(Boston$lda,Boston$crim01)

lstat_boston <- lda(formula = crim01 ~ lstat, data = Boston)
lstat_boston

lda.train <- predict(lstat_boston)
Boston$lda <- lda.train$class
table(Boston$lda,Boston$crim01)
