########################### CLASE 01 :v #################################
########################## Comenzando Ando el curso #####################
######################################################################### 


# I) Tipos de datos 
#   Character (Textos)
"Holiii" 
"xDDD"  
"Equizdeeeee"
"Holiii" ;"xDDD";"Equizdeeeee"
"5"
#   Numeric   (Numeros (xD))
5
7
5;7;9;8;5

#   Integer   (Numeros...)
1L ;2L;3L

#   Booleans  (Valores logicos-Numeros :v)  
TRUE
FALSE


#Tipos de datos: Numeric , integer , character  , Booleans
#alt + -
 
x<- 1 ; y<- "lol" ; z<- T ; x_1 <- 2.1e23 ; 
xD <- c(1L,2L,3L) ; w<- c(1L,2) ; 
vector_raro <- c(2,3,"no va a funcionar")
matrizota <- matrix(data=c(1:6),nrow=3,byrow = TRUE) ;matriz<-matrix(c(1,2,3,4,5,6),nrow=2)
quepasa <- c(x,y)
c(T,F,FALSE,TRUE,5)
help(matrix)

#Class -> Nos devuelve el tipo de Objeto
x;y;z;x_1
class(x) ; class(y) ; class(z) ; class(x_1) ; 
xD ; w
class(xD) ; class(w)
class(vector_raro)
class(as.numeric(xD))
class(matrizota) ; class(matriz)

#Typeof -> Tipo de dato
x;y;z;x_1
typeof(x) ; typeof(y) ; typeof(z) ; typeof(x_1) ; 
xD ; w
typeof(xD) ; typeof(w)
typeof(vector_raro)
typeof(as.numeric(xD))
typeof(matrizota) ; typeof(matriz)


#Generación de datos
#Secuencias Regulares 
# El operador ":" tiene prioridad sobre los demás, pero, no sobre los paréntesis
a <- 1:30
b <- 1:10 -1 
c <- 1:(10-1)
d <- seq(1,10,0.1)
seq(1,10,0.7)
help(seq)
e <- seq(length=9,from=1,to=5)
rep(c(1,4),20)
rep(matrizota,3)
#sequence(a) genera numeros desde 1 hasta a
sequence(5)
sequence(5:7)
#Generador de niveles : gl(k,n) ; k:numero de niveles ; n:numero de replicas de cada nivel
#Adicionalmente length : numero de datos producidos y labels que especifica los nombres de los factores

h<-gl(3,5,length=15,labels = c("a","b","c"))
miren <- expand.grid(altura=c(60,65,80),p=c(70,85),sexo=c("Masculino","Femenino","ND"))

#######Manipulación de Objetos######

#2) Tipos de Objetos

#Podemos crear objetos especificando la clase, tipo y longitudde este , crear objetos vacios y modificarlos
#de manera sucesiva 
#Vector : elementos numericos, caracter o logico
logical(length = 5) ; numeric(length = 5) ; character(length = 2) 

#Factor : Incluye valores correspondientes a una variable categórica, además
# de los posibles los diferentes niveeles posibles de esta variables.
# factor(x, leveles = sort(unique(x), na.last = TRUE) , labeles =levels, exclude = NA , 
# ordered= is.ordered(x) )

factor(1:3)
factor(c("HOLI_BOLI","CASA","AMO"))
factor(c(1:6,1))
factor(1:5 , levels = 1:6)
#¿Que pasaría en los siguientes casos?
factor(1:3 , levels = 4:7) #¿si los niveles no estan dentro del vector X la función funciona?
factor(1:3 , labels  = c("A","B")) #¿el numero de etiquetas debe de coincidir con el tamaño de X?
factor(1:3 , labels  = c("A","B","C"))
factor(rep(1:4,2) , exclude = 4 , labels = c("A","B","C"))
factor(rep(3:1,2) , labels  = c("B","A","C")) #¿Como asigna R las etiquetas?
factor(rep(3:1,2) , labels  = c("B","A","C") , ordered = TRUE)
factor(rep(1:3,2) , labels  = c("B","A","C") , ordered = TRUE)
levels(factor(1:3))
#Matriz : Un vector con una dimensión extra al menos, contiene un mismo tipo de dato
# matrix(data = NA , nrow = 1 , ncol =1, byrow = FALSE , dimnames = NULL)
# dimnames : Una lista de tamaño = 2 (length = 2) con el nombre de la fila y columna Respectivamente!!!
a<-matrix(data = c(1,2,3,4,5,6))
b<-matrix(data = c(1,2,3,4,5,6), nrow=2)
matrix(data = c(1,2,3,4,5,6), nrow=2 , byrow=TRUE)
asig<-matrix(data = c(1,2,3,4,5,6), nrow=2 , byrow=TRUE , dimnames = list(c("1","2"), c("Tengo","Mucho","Sueño")))
matrix(data = c(1,2,3,4,5,6), ncol=2)
matrix(data = c(1,2,3,4,5,6), ncol=2 , byrow=TRUE)
matrix(data = c(1,2,3,4,5,6,7,8), ncol=2 , dimnames = list(c(1:4) ,c("Tengo","Sueño")))

x <- matrix(data = c(1:100), ncol=2 )
matrix(data = x , ncol=ncol(x) , dimnames=list(c(1:nrow(x)),c("Tengo","Sueño")))
4+5; 5/2 ; 2**4 ; 4*5
A<- matrix(c(1:9),ncol=3, byrow = T)
B<- matrix(c(11:19),ncol=3,byrow = T)
A*B #Producto Elemento a elemento
A%*%B #Producto Matricial
t(A) #Transpuesta
crossprod(A,B)
help(crossprod)
diag(A)
eigen(A) #autovalores y autovectores
rowMeans(A) ; rowSums(A) ; colMeans(A) ; colSums(A)

#Indexación
matriz <- matrix(c(21:45), ncol=5 , byrow = F)
matriz[,1];matriz[1,] ; matriz[1:3,2]
indice <- matrix(c(1:5,5:1),ncol=2)
matriz[indice]
matriz[indice] <- c(1,2,3,4,999)
matriz

indice2 <- matrix(c(rep(1,3),rep(2:4,2),rep(1,3)),ncol=2,byrow=F)
matriz2 <- matriz
matriz[indice2]<-0
cbind(matriz,matriz2)
rbind()
matriz3 <- matriz[-5,]
cbind(matriz,matriz3)# nope
vector<- matriz3[,1]
cbind(matriz,vector)#nope

rbind(matriz,matriz3)


#Marco de Datos :Hoja de datos
# Es una lista que pertece a una clasa denominada "Data.Frame"
# Los componentes deben ser vectores ( incluso otras hojas de datos)
# Las matrices, listas y hojas de datos contribuyen a la nueva hoja de datos con tantas variables tengan
# Los vetores numéricos y factores entran sin modificar,
# los no numericos se fuerzan a factores cuyos niveles son los unicos valores en el vector.
# Los vectores deben tener todos la misma longitud y las matrices, el mismo numero de filas

x<- 1:10 ; y <- 10 ; m <- c(10,35) ; z<-2:4 ; c<-c("lol","xD") ; o<-c(11,12,13) ;c2<-c("bah","buh","i")
# ¿Que pasará en los siguientes casos ?"
data.frame(x,y)
data.frame(x,m)

data.frame(x,z) # :V
data.frame(m,o)
data.frame(c,c2)

data.frame(x,c) 
data.frame(m,c)
length(data.frame(x,y))  

### Notas 
e <- round(rnorm(n = 50,mean = 30,sd = 3),0)
p <- round(rnorm(n=50,mean = 70,sd=6),2)
Data <- data.frame(Edad=e , Peso = p)
attach(Data,pos = 2)
mean(Edad) ; mean(Peso) ; mean(Data$Edad) ; mean(Data$Peso)
detach(Data,pos = 2)
Edad <- Edad + Peso


#Listas
# Una lista viene a ser un objeto consistente en una colección ordenada de objetos, 
# conocidos como componentes, no es necesario que sean del mismo tipo, por lo que,
# una lista puede albergar una gran variedad de objetos tales como numericos, caracteres etc

lista <- list(nombre="Alex", profesion="Ing. Estadistico" , no.hijos=0 , edad=c(23) )
lista2<- list("holi","reboli","gatito")
lista
length(lista) # Nos devolverá el numero de objetos
data.frame(x,lista) # Que paso ? . . . Recordar : Cada elemento de una lista es un objeto

#llamar a los elementos de una lista
lista$nombre ; lista$profesion 
lista[1] ; lista[2] ; lista[[1]]
lista[["nombre"]] ; lista[["profesion"]]
# Cuando nos sirve este ultimo ?
x<- "nombre"
lista[[x]]
### Consideraciones
# lista[1] y lista[[1]]
# [[...]] -> Operador utilizado para seleccionar un sólo elemento, 
# [....] es un operador general de indexado
lista[[1]] # primer objeto de la lista cuyo nombre es lista 
lista[1] # es una sublista de la lista cuyo nombre es lista

### No es necesario escribir todo el nombre
lista$nom ; lista$prof  
### Concatenar Listas
lista2<-lista
oki <- c(lista,lista2)
