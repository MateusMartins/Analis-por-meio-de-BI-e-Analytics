# Carrega CSV 
carseats = read.csv("./Desktop/Carseats.csv")
head(carseats)
names(carseats)
summary(carseats)

# Aplica regressão linear multimensional para todos os campos
carseats.lm1 <- lm(carseats$Sales ~ carseats$CompPrice + carseats$Income + carseats$Advertising + carseats$Population + carseats$Price + carseats$ShelveLoc + carseats$Age + carseats$Education + carseats$Urban + carseats$US);
summary(carseats.lm1);

# Aplica regressão para campos com menos P-Value
carseats.lm1 <- lm(carseats$Sales ~ carseats$CompPrice + carseats$Income + carseats$Advertising + carseats$Price + carseats$ShelveLoc + carseats$Age);
summary(carseats.lm1);
