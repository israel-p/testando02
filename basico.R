# 1� CURSO: Data Science R Basics
# Material de apoio baseado nas aulas e nos exerc�cios do datacamp.
# O curso/exerc�cios s�o baseado numa biblioteca (dslabs) e no datatype (murders )

##########  R BASICS ########## 

# Testando uma equa��o b�sica no R 
# Calcular soma dos primeiras 100 n�meros inteiros.  
n<-100
n*(n+1)/2

#Soma das sequ�ncias
n <- 1000
x <- seq(1,n)
sum(x)

#Log
log2(16)

log10(sqrt(100))

# Raiz quadrada
sqrt(log2(16))

########## DATA TYPES ########## 

#Estrura de dado
library(dslabs)
data(murders) # carrega os dados
murders  # exibir o dado(objeto)
str(murders) # exibe estrutura do objeto

# Extrair a coluna do data frame 
names(murders)

# Carregar uma vari�vel a partir de uma coluna (vetor) de um data frame
p <- murders$population  

# Outro modo de carregar a vari�vel
o <- murders[["population"]]
identical(o, p) # fun��o que testa se s�o iguais 'o' e 'p'

# Classe do objeto 
class(murders$region) # classe da vari�vel regi�o 

# tamanho de um objeto 
a= levels(murders$region) 
length(a) # determina o n�mero de regi�es incluida na vari�vel. 

# recebendo um vetor como entrada e retornando a frequ�ncia de cada elemento �nico do vetor:
x <- c("a", "a", "b", "b", "b", "c")
table(x) 
table(murders$region)


########## VECTORS ##########

# vetor- s�rie de valores, todos do mesmo tipo.
temp <- c(35,88,42,84,81,30)
temp

city= c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
city


# Conectando vetores num�ricos e de caracteres

cost <- c(50, 75, 90, 100, 150)
food <- c("pizza", "burgers", "salads", "cheese", "pasta")
names(cost) <- food
cost

# acessando um subconjunto dos dados:
cost[1] # vendo o primeiro item do vetor cost

# Vetores de subconjuntos
cost[3:5] # vendo os �ltimos 3 itens do vetor cost. 
city[1:3]



# acessando um subconjunto dos dados por meio de um vetor
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
names(temp) <- city # definindo temp
temp[c(3,5)]  # elementos 3 e 5 
temp[c(5,3)]  # elementos 5 e 3 

# sequ�ncias
x= 12:73 # vetor com inteiros de 12 a 73
length(x)

# sequ�ncia a partir da fun��o seq
seq(7,49,7)  #1� argumento: onde come�a/ 2�: o valor m�ximo / 3�:intervalo, em default � 1
seq(7,49)
seq(1,99,2) 

a = seq(6,55,4/7) # ultimo argumento neste caso � uma fra��o
a
length(a)

# sequ�cias que aumentam na mesma quantidade com tamanho pr�-especificado
x <- seq(0, 100, length.out = 5) # incrementos de 5 em 5
x
class(x) #objeto da classe num�ica


# n�mero inteiro
class(3L) # basta acrescentar o 'L' ap�s o n�mero
# para fins pr�ticos n�meros inteiros e num�ricos s�o indistingu�veis
# por�m os inteiros ocupam menos espa�o na mem�ria do PC

# Coer��o - NA(Not Available)
#Podemos evitar problemas com coer��o em R mudando os caracteres para num�ricos e vice-versa
as.numeric(x) # caracteres ---> num�ricos
as.character(x) # num�ricos ---> caracteres


########## SORTING ##########

#indice: c(3,4,8,10,32). Valor 3 possui o �ndice 1. Valor 4 possui o ind�ce 2... Valor 32 possui o �ndice 5
x=c(31,4,15,92,65)
x

## sort 
sort(x) # coloca os valores de x em ordem crescente 


##order: um vetor que  retorna os �ndices que classificam esse vetor.
index=order(x)  # vari�vel index recebe os �ndices, respectivos a ordem crescente dos valores. 

## max e which.max
max(x) # retorna o valor m�ximo
which.max(x) #retorna o �ndice onde o n�mero m�ximo reside

## min e which.min
min() # retorna o valor min�mo
which.min(murders$total) #retorna o �ndice onde o n�mero min�mo reside

## rank
rank(x)
# gera um vetor. cujo primeiro valor nos indica onde o primeiro n�mero do vetor x est� no ranking(1�,2�...)
# se o primeiro valor do vetor x � o 3� maior, o vetor gerado de rank(X) nos dar� o valor 3

## data frame
temp <- c(35, 88, 42, 84, 81, 30)
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
city_temps <- data.frame(name = city, temperature = temp)
city_temps #data frame with city names and temperature 

# exemplo murders:
i_max= which.max(murders$total) #i_max foi definida para receber o index do maior total
i_max
murders$state[i_max] #i_max sendo usado para encontrar o estado com o maior valor total

## NA
library(dslabs)
data(na_example)
mean(na_example) #n�o � poss�vel calcular, pois o dataset: na_example, cont�m v�rios "NA" no dado
ind=is.na(na_example) #criando index(ind) l�gico, locais com NA (TRUE)
ind
sum(ind == TRUE) #contando quantos NA temos no dado

# Eliminando partes do vetor com NA usando um vetor com T e F
a=c(1,2,3,4,10)
a

b=c(T,F,F,F,F)
a[b] # somente aparecer� agora o primeiro elemento (TRUE)
a[!b] # exclama��o inverte elementos do vetor b, de modo que agora n�o aparecer� o primeiro elemento(FALSE)


########## VECTOR ARITHMETICS ##########
 
city <- c("Beijing", "Lagos", "Paris", "Rio de Janeiro", "San Juan", "Toronto")
temp <- c(35, 88, 42, 84, 81, 30)
temp= (temp-32)*5/9 #  Fahrenheit -> Celsius 
temp
city_temps = data.frame(name = city, temperature = temp)
city_temps




########## INDEXING ##########

# logical operators:
# == (exatamente igual)
#!= (n�o � igual)
#! (nega��o)
# | (opera��o 'ou')
# & (opera��o 'e')


#Usar opera��es l�gicas para indexar(classificar) vetores
murder_rate = murders$total/murders$population*100000  # n�mero de assassinatos a cada 10^5 habitantes

index=murder_rate<0.71 #comparando o vetor com um �nico n�mero
index
index1=murder_rate<=0.71
index1 
murders$state[index] #estados que atendem a condi��o do index (propor��o de assassinatos menor que 0,71)

# combinando uso de compara��es e index para selecionar parte do dado que atenda as condi��es
west= murders$region == "West"
safe= murder_rate <=1
index2=safe & west 
murders$state[index2]

#coer��o em uma soma: TRUE->1 e FALSE->0
sum(index)

#fun��es de indexa��o :
#which- fornce as entradas de um vetor l�gico que s�o verdadeiras.
x=c(F,T,F,T,T,F)
which(x) # o 2�,4� e 5� elementos s�o "TRuE"

index = which(murders$state == "Massachusetts") # O index receber� a o �ndice referente ao estado de Massachusetts
index
murder_rate[index] # com o �ndice referente ao estado, calcula-se a propor��o de assassinatos referente a ele.

#match - procura entradas em um vetor e retorna o �ndice necess�rio para acess�-los.
index = match(c("New York", "Florida","Texas"),murders$state) 
index # mostra quais ind�ces do 2� vetor corresponde a cada uma das entradas de um 1� vetor
murders$state[index] # apenas confirmando a correspond�ncia 


#%in% forma de saber se cada elemento de um 1� vetor est� em um 2� vetor
x=c(2,3,5)
y=c(1,2,3,4)
x%in%y # x est� presente em y? Caso positivo (TRUE), e � gerado um vetor do tamanho do primeiro vetor- x(T or F)

c("Boston","Dakota","Washington") %in% murders$state



########## BASIC DATA WRANGLING ##########

########## BASIC PLOTS ##########

########## PROGRAMMING BASICS ##########
 
