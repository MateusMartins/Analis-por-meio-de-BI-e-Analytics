library(dplyr)
library(MASS)

# Informações do dataset
?Boston
names(Boston)
head(charles)

qualitative_names <- list('crim', 'zn', 'indus', 'chas', 'nox', 'rm', 'age', 'dis', 'rad', 'tax', 'ptratio', 'black', 'lstat', 'medv')
qualitative <- list(Boston$crim, Boston$zn, Boston$indus, Boston$chas, Boston$nox, Boston$rm, Boston$age, Boston$dis, Boston$rad, Boston$tax, Boston$ptratio, Boston$black, Boston$lstat, Boston$medv)

# Faça alguns diagramas de dispersão de pares de preditores (colunas) nesteconjunto de dados. Descreva suas descobertas.
x = 1
for(i in qualitative){
  scatter.smooth(x=i, y=Boston$crim, main=qualitative_names[x])
  x = x + 1
}

# Algum dos preditores estão associados à taxa de criminalidade per capita? Se sim, explique o relacionamento.
x = 1
for(i in qualitative){
  scatter.smooth(x=i, y=Boston$crim, main=qualitative_names[x])
  x = x + 1
}

# Há subúrbios de Boston que possuem altas taxas de criminalidade particularmente? Altas Taxas de impostos? E alta Proporções aluno-professor? Comente sobre o intervalo (range) de cada preditor.
summary(Boston)


# Quantos subúrbios nesse dataset são ligados ao rio Charles?
count(Boston$chas)


# Qual é a mediana da relação aluno-professor entre as cidades neste conjuntode dados?
summary(Boston$ptratio)

# Neste conjunto de dados, quantos dos subúrbios têm em média mais de sete quartos por habitação? Mais de oito quartos por habitação? Comente sobre os subúrbios quen tem em média mais de oito quartos por habitação.

Maior7 <- filter(Boston, rm > 7)
count(Maior7)

Maior8 <- filter(Boston, rm > 8)
count(Maior8)
