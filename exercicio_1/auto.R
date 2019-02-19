library(plyr)

# Read CSV
auto = read.csv("C:/aulas/Analis-por-meio-de-BI-e-Analytics/exercicio_1/Auto.csv",header = T)

# Exibe os primeiros registros do dataframe
head(auto)
# Exibe os nome das colunas
names(auto)
# Exibe informações a respeito das colunas
summary(auto)

# Quais dos preditores são quantitativos e quais são qualitativos?

# Quantitativos: 'mpg', 'cylinders', 'displacement', 'weight', 'acceleration', 'year', 'origin'
# Qualitativos: 'horsepower', 'name'
quantitativos_names <- list('mpg', 'cylinders', 'displacement', 'weight', 'acceleration', 'year', 'origin')
quantitativos <- list(auto$mpg, auto$cylinders, auto$displacement, auto$weight, auto$acceleration, auto$year, auto$origin)
quantitativos_names <- list('horsepower', 'name')
qualitativos <- list(auto$horsepower, auto$name)

# Qual é o range de cada preditor quantitativo?
for(i in quantitativos){
  print(range(i))
}

#Qual é a média e o desvio padrão de cada variável preditora?
x = 1
for(i in qualitativos){
  print(paste(quantitativos_names[x], ' -> Média: ', mean(i), 'Desvio padrão: ', sd(i)))
  x = x + 1
}

#Suponha que desejamos prever a milhagem de gás (mpg) com base em outrasvariáveis. Quais variáveis podem ser úteis para essa previsão? Justifique suaresposta
