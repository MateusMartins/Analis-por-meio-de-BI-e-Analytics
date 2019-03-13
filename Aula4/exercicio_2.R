
# Read CSV
auto = read.csv("~/Área de Trabalho/trabalhos/Analis-por-meio-de-BI-e-Analytics/exercicio_1/Auto.csv",header = T)
head(auto)
names(auto)
summary(auto)

# Altera o HorsePower
auto['HP'] <- as.numeric(levels(auto$horsepower))[auto$horsepower]

for(i in auto){
  auto['mpg01'] = ifelse(auto$mpg > median(auto$mpg), 1, 0)
}
