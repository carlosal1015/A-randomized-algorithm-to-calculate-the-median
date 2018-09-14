####################################################################
####################### R Programming - Class 02 ###################
####################################################################

######################
# R como Calculadora #
######################

# - Operaciones aritméticas.

# + - / * ^ %% %/%

# Ejercicios:

((5+9)*5)^3

# ¿Arrojarían el mismo resultado?
5^2^3
5^(2^3)
(5^2)^3

# Variables:

# Operador de asignación: "<-" o "=" 

peso_franklin <- 83
talla_franklin = 1.70
'UNI' -> uni_franklin

# única diferencia entre "<-" y "=".

sum(x=c(1,2,3))
sum(x<-c(1,2,3))


##################
# Tipos de datos #
##################

# Character

"Hola. Bienvenido"
'Hola.Mundo'

# numeric 
# integer

# booleans

TRUE
FALSE

# Saber el tipo de dato:
class(5)

vec <- c(5,6,8)
vec.int <- as.integer(vec)
class(vec.int)

vec.int <- c(5L,6L,8L)
class(vec.int)

####################
# Tipos de Objetos #
####################

# Vectores:

# Clase de objeto más básico.
# Son colecciones de elementos de un solo tipo de dato.

# Ejemplos:

# Crear vectores en R

# c()
v1 <- c(1,2,3,4,5)

# - rep: Repetir un elemento una cierta cantidad de veces.

v2 <- rep(10,5)# Crear un vector con el elemento 10 repetido 5 veces.

# - seq

v3 <- seq(1,10,2) # Crear una secuencia del 1 al 10 con paso 2.

# - :
v4 <- 1:10 # Crear una secuencia del 1 al 10

v1
v2 <- c(FALSE,F,TRUE,T)

v12 <- c(v1,v2)
v3 <- c('luis','uni','pedro')

v23 <- c(v2,v3)

# Coerción:

# character + numeric = character
# character + boolean = character
# numeric + boolean = numeric
# numeric + integer = numeric
# integer +  boolean = integer

# Asignarle nombre a los vectores.

pesos <- c(30,55.5,75.4)
pesos

names(pesos) <- c("Luis","Hugo","Luisa")

# Element Wise-Operations

# Operación vectorial vs operación elemento a elemento.

c(5,7,2)%*%c(5,2,3)
c(5,7,2)*c(5,2,3)

# Reciclaje: ¿Habría algún problema?
a <- c(1,3,5,9)
b <- 1:3
a * b

# Se mantienen los nombres del primer vector.
names(a) <- c('f','v','c','d')
names(b) <- c('a','b','f')
a*b

# EJercicios:

# 1. Crear un vector de n�meros pares del 1 al 20.
seq(2,20,2)

# 2. Crear un vector de números impares del 1 al 20.
seq(1,20,2)

# 3. ¿Cuál es el valor de la siguiente expresión?

k <- c("Lunes","Martes",FALSE)
is.character(k)

# 4. ¿Qué pasa en la siguientes expresiones?
x <- y <- 5
6 -> z

# 5. ¿Qué resultado se obtiene al usar length en el vector k?

length(x)

# Remover todos los objetos del global environment
rm(list=ls())

# Inicializar un vector:
vec.ini <- vector('integer',6)
vec.ini

# Ejemplo, división sin funciones:

vec.sum <- 
vec.cont <- 

    
# Factores:

# Diseñada especialmente para variables categóricas. Nominales y
# ordinales.

civil_ini <- c(rep("soltero",5),rep("casado",5),rep("divorciado",5))
civil <- factor(x = civil_ini)

civil_ini_2 <- sample(civil_ini)
a<-factor(civil,levels = c('divorciado','casado','soltero'))

# 1. Crear un vector de género 10 masculino 10 femenino en orden aleatorio

set.seed(123)
gen <- sample(c(rep('M',10),rep('F',10)))

genero <- factor(gen,labels=c('Femenino','Masculino'))

# Matrices:

# Es una colección de elementos del mismo tipo de dato
# en dos dimensiones.

# Vector con un atributo adicional: dim

# matrix(vector,nrow = a, ncol = b, byrow = FALSE)

vect <- 1:12
matrix(vect,nrow=3,byrow=TRUE)

# Operaciones con matrices:

A <- matrix(1:16,nrow=4)
B <- matrix(1:4,nrow=4)

A*B
# A %*% B

t(A)
diag(A)
# eigen() autovalores y autovectores
solve(A)
# rowMeans,rowSumns,colMeans,colSums

rownames(A) <- c('A','B','C','D')
colnames(A) <- c('PC1','PC2','PC3','PC4')

rowMeans(A)
colMeans(A)

# cbind() y rbind()

A =cbind(A,PC5=c(10,12,14,15))
A =rbind(A,E=c(8,9,10,11,12))

p <- cbind(matrix(1:9,3),1:7)

# Podemos añadir nombres a las filas y columnas
# rownames() y colnames()


##############
# Ejercicios #
##############

# Crear las siguientes matrices:

# Solución:

# 1. Asignar nombre m1.

#       [,1] [,2]
# [1,]    1  101
# [2,]    2  102
# [3,]    3  103
# [4,]    4  104

m1 <- matrix(c(1:4,101:104),ncol=2)

# 2. Asignar nombre m2.

#       [,1] [,2] [,3] [,4]
# [1,]    1    2    3    4
# [2,]  101  102  103  104

m2 <- matrix(c(1:4,101:104),nrow=2,byrow = T)

m2 <- t(m1)

# 3. Asignar nombre n1.

#       [,1] [,2] [,3] [,4]
# [1,]    5    0    0    0
# [2,]    0    5    0    0
# [3,]    0    0    5    0
# [4,]    0    0    0    5

p <- rep(5,4)
n1 <- diag(p)
n1 <-5*diag(4)

# 4.

#       [,1] [,2] [,3] [,4]
# [1,]    3    0    0    0
# [2,]    0    1    0    0
# [3,]    0    0   -2    0
# [4,]    0    0    0    0

n2 <- diag(c(3,1,-2,0))


# 5. Calcular el producto matricial de m1 y m2

n1 %*% n2

# 5. Calcular la inversa de m1 y m2
solve(m1)
solve(m2)



