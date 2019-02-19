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

quantitativos <- list('mpg', 'cylinders', 'displacement', 'weight', 'acceleration', 'year', 'origin')
qualitativos <- list('horsepower', 'name')

# Qual é o range de cada preditor quantitativo?

for(i in quantitativos){
  print(paste(i, ": ", range(auto[i])))
}

#Qual é a média e o desvio padrão de cada variável preditora?

for(i in quantitativos){
  print('Média:')
  print(paste(i, ": ", range(auto[i])))
  print('Desvio padrão:')
  print(paste(i, ": ", range(auto[i])))
}


#Suponha que desejamos prever a milhagem de gás (mpg) com base em outrasvariáveis. Quais variáveis podem ser úteis para essa previsão? Justifique suaresposta
