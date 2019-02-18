library(plyr)

# Read CSV
auto = read.csv("C:/aulas/Analis-por-meio-de-BI-e-Analytics/exercicio_1/Auto.csv",header = T)

# Quais dos preditores são quantitativos e quais são qualitativos?
count(auto, vars= 'id')

#Qual é o range de cada preditor quantitativo?

#Qual é a média e o desvio padrão de cada variável preditora?

#Suponha que desejamos prever a milhagem de gás (mpg) com base em outrasvariáveis. Quais variáveis podem ser úteis para essa previsão? Justifique suaresposta
