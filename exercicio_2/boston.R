library(dplyr)
library(MASS)

# Informa��es do dataset
?Boston
names(Boston)
head(charles)

qualitative_names <- list('crim', 'zn', 'indus', 'chas', 'nox', 'rm', 'age', 'dis', 'rad', 'tax', 'ptratio', 'black', 'lstat', 'medv')
qualitative <- list(Boston$crim, Boston$zn, Boston$indus, Boston$chas, Boston$nox, Boston$rm, Boston$age, Boston$dis, Boston$rad, Boston$tax, Boston$ptratio, Boston$black, Boston$lstat, Boston$medv)

# Fa�a alguns diagramas de dispers�o de pares de preditores (colunas) nesteconjunto de dados. Descreva suas descobertas.
x = 1
for(i in qualitative){
  scatter.smooth(x=i, y=Boston$crim, main=qualitative_names[x])
  x = x + 1
}

# Algum dos preditores est�o associados � taxa de criminalidade per capita? Se sim, explique o relacionamento.
x = 1
for(i in qualitative){
  scatter.smooth(x=i, y=Boston$crim, main=qualitative_names[x])
  x = x + 1
}

# H� sub�rbios de Boston que possuem altas taxas de criminalidade particularmente? Altas Taxas de impostos? E alta Propor��es aluno-professor? Comente sobre o intervalo (range) de cada preditor.
summary(Boston)


# Quantos sub�rbios nesse dataset s�o ligados ao rio Charles?
count(Boston$chas)


# Qual � a mediana da rela��o aluno-professor entre as cidades neste conjuntode dados?
summary(Boston$ptratio)

# Neste conjunto de dados, quantos dos sub�rbios t�m em m�dia mais de sete quartos por habita��o? Mais de oito quartos por habita��o? Comente sobre os sub�rbios quen tem em m�dia mais de oito quartos por habita��o.

Maior7 <- filter(Boston, rm > 7)
count(Maior7)

Maior8 <- filter(Boston, rm > 8)
count(Maior8)

new_boston <-Boston %>% filter(rm > 8)

summary(new_boston)
