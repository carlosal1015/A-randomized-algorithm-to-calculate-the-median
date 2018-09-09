########################### CLASE 02 :v #################################
##################### Sentencias de Control #############################
######################################################################### 

# 0- Repasando....
#>,<,>=,<=,==,!=,%in%

# 1- La sentencia If, else :
# Estructura basica : if( Expresión logica) Acción Si es verdadera
a<-0 
if(a != 0) c("Holi")
if(a == 0 ) print("Boli")
if(a == 0) x<-"Holi"
b<- NA
c<- NULL
if(b==NA) "Valor Perdido"
if(c==NULL) "Valor Nulo"
is.na(b) ; is.na(c)
is.null(c) ; is.null(b)

# Estructura General : if (Expresión logica) accion Else accion
if(a != 0) c("Holi") else "No Boli"
a<- sample(seq(1,10,1),replace = T)
b<- sample(seq(1,10,1),replace = T)
a;b
print(c)
if ( a < 5 ) "Hola" ; if( a <  b ) "Funciona porfa"
## Observacion : la funcion if no soporta vectores . . .  :( 
## Pero existe otra que se llama ifelse :v ifelse( a<5,c<-"a es menor a 5",c<-"a es mayor o igual a 5")
c <- factor(ifelse( a<5,"a es menor a 5","a es mayor o igual a 5"))

7%in%7
7%%3
# Estructura General 2 : if(Expresión Logica) {Acciones} Else {Acciones}
a<-sample(seq(1,10,1),replace = T)
if(7 %in% a ) { x<- 5 ; y<- 6 ; z <- 9 ; x+y+z }
if(7 %in% a ) { x<- 5  ;
y<- 6 ; z <- 9 ; x+y+z }

#######################################################################

#2- La sentencia While :
# Estructura while( Condicion ) { Acciones}

i<-1
while( i < 10) {print(i);i <- i+1}
i<-1 
while( i < 10) {m[i]<-i;i <- i+1} #Debemos definir antes los objetos a usarse
m <- matrix()
while( i < 10) {m[i]<-i;i <- i+1}

#Crearemos una sumatoria de los 10 primeros numeros
i<-1 ; j <- 0
while( i <= 10) {j <- j + i ;print(j); i<-i+1} # :v

#Crearemos un factorial de los numeros menores o iguales a 10
f<-1 ; i<-1 
while (f<=10){i=i*f;print(i) ; f<-f+1}


#Hora de Practicar :) 

#Llenar en un vector (de 10 filas ) el factorial de su fila
f<-1 ; i<-1 ; vector <- matrix(1)
while (f<=10){vector[f]<-i*f; i<-i*f; print(vector);f<-f+1}

#Llenar en cada fila de un vector , la sumatoria de numeros naturales hasta el numero de fila
i<-1 ; j <- 0 ; vector <- matrix()
while( i <= 10) {vector[i] <- j+i ;j <- j + i ;print(vector);i<-i+1} # :v

#3- La sentencia For
#Estructura : for ( si i esta en x ) { Acciones}  ; donde x es un vector de numeros
x <- c(2,5,3,9,8,11,6)
count <- 0
d  <- c(1:10)
for (val in d) {
  if(val %% 3 == 0)  count = count+1
}
count 

for (i in 1:100){x[i]<-i^2; if(i==100){x<-matrix(x,ncol=1)}}
x
a <- c("h","a","b","c")
for ( i in a ) {print(i)}

d <- 5
for(i in 1:10) { 
  nam <- paste("x_", i, sep = "")
  assign(nam, rnorm(1000)+d)
}
hist(x_1)
####### rnorm(n, mean = 0, sd = 1)
###### round
##Ejercicios
#####Generar un data.frame  de 100 filas que contenga las siguientes variables con su 
#####respectiva distribucion:
#Edad : Normal , media 20 y desv. 5  ( redondear al entero )
#Peso : Normal , media 65 y desv 10 (redondear al segundo decimal)
#Sexo : Si el peso de la observacion es menor a 60, entonces, debe ser Mujer (M)
#Estado Civil : Debe ser aleatorio y sus niveles seran : "Soltero","Casado","Viudo","Divorciado"

edad <- round(rnorm(n = 100,20,5),0)
peso <- round(rnorm(n=100 ,65,10),2)
#sexo <- character()
sexo <-factor( levels = c("H","M"))

for(i in 1:length(peso))
  {
  if (peso[i] < 60) sexo[i] <- "M" else sexo[i] <- "H"
}
#sexo <- as.factor(sexo)  
data <- data.frame(edad,peso,sexo)

Estado_Civil <-factor(sample(rep(c("Soltero","Casado","Viudo","Divorciado"),25)))

data$Estado_Civil <- Estado_Civil



### Ejemplo 2
### Generar un dataframe de 100 datos
#Edad : Normal , media 24 y desv. 4  ( redondear al entero )
#Peso : Debe tener una correlacion mayor a 0.3 con la edad (cor )
#Sexo : Si el peso es mayor a 60, debe ser varon, caso contraro, mujer

edad <- round(rnorm(100,24,4),0)
cor <- 0
i <- 1
while (cor < 0.3 ) { peso <- round(rnorm(100,60,5),2) ; cor<-cor(edad,peso); i<-i+1;
if(i ==1000 ){cat(c("No Convergio hasta la iteracion :\t"),i,"\n","Intenta otra vez \n"); print(cor) ; break}
else{ if(cor> 0.3) {cat(c("Convergio en la iteracion: "),i,"\n");print(cor)}}                    
}

Data <- data.frame(edad,peso)
ifelse(peso>60,Data$Sexo<-"H",Data$Sexo<-"M")
Data$Sexo <- factor(Data$Sexo)

class(Data$Sexo) ; typeof(Data$Sexo<-"H")
plot(Data$peso,Data$edad)

