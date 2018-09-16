########################### CLASE 00 :v #################################
#####################  Repasando ando :v $$$#############################
######################################################################### 

Ingresos <- round(rnorm(1000,1000,300),0 )
bd <-data.frame(Ingresos)
attach(bd)
####Ejemeplo 1 : Categorizar los Ingresos de acuerdo a lo siguiente
#### Si el ingreso es menor  o igual a 1200 , Clasificarlo como categoria C
#### Si el ingreso es menor  o igual a 1500 o mayor a 1200 , Clasificarlo como categoria B
#### Si el ingreso es mayor a 1500, Clasificarlo como categoria A

for (i in 1:nrow(bd))
{
  if( Ingresos[i] <=1200 )
  {bd$Categorizado[i] <- "C"}
  else
  {
    if(Ingresos[i] <= 1500 )
    {bd$Categorizado[i] <- "B"}
    else
    {bd$Categorizado[i] <- "A" }
  } 
}


####Ejemplo 2 : Imputar los datos faltantes en la siguiente variable, por el promedio de 
#### los datos presentes en el vector

x <- c(1:10 , NA ,NA)
ux<-mean(x,na.rm = T)

for(i in 1:length(x)) 
{
  if ( is.na(x[i])  == T )
  { x[i] <- ux}
  else
  { x[i]<- x[i]}
  
}


####Ejemplo 3 : Contar missing en una variable

y <- c(1:10 , NA ,NA)
sum(is.na(y))

#####Ejemplo 4 : 
### Parte 1: Sirve para Generar una matriz de datos 
### La funcion exists  sirve para evaluar si un objeto cuyo nombre se especifica, ya existe
### Sus resultados son True o False
for(i in 1:100)
{w <- sample(rep(c(NA,0),50),replace = T) 
if ( exists(x = "bd") == T ){ bd <- data.frame(bd)} 
else{bd<- data.frame(matrix(, nrow=length(w), ncol=0)) } 

  nombre_columna <- paste("w_",i,sep = "")
  bd[[nombre_columna]] <- w
  }
####


for( i in 1:length(names(bd)))
{if ( exists(x="OutPut")==T){ OutPut<-OutPut } 
      else {OutPut<-data.frame(matrix(,ncol=0,nrow=length(names(bd))))  }

  var <- names(bd)[i]
  OutPut[i,1]<- var
  OutPut[i,2]<- 100*sum(is.na(bd[[var]]))/nrow(bd)
  colnames(OutPut)<- c("Variable","% de NA")
}


lol <- data.frame( colnames(bd) ,colSums(is.na(bd)) , row.names = NULL)
colnames(lol)<-c("Var","% NA")

