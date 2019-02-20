# Carrega CSV 
auto = read.csv("./Desktop/Auto.csv")
head(auto)
names(auto)
summary(auto)

plot(auto$mpg, auto$horsepower)

auto['HP'] <- as.numeric(levels(auto$horsepower))[auto$horsepower]

# Aplica regressão linear

auto.lm1 <- lm(HP ~ mpg, data = auto)

# Descrição das variáveis após efetuar a regressão linear
summary(auto.lm1)

# Plota os dados com regressão linear
plot(auto$mpg, auto$HP)
abline(auto.lm1);

auto.lm2 <- lm(auto$HP ~ auto$mpg + auto$weight + auto$acceleration + auto$cylinders);
summary(auto.lm2);