########################### CLASE 07 :v #################################
#####################  Graficas en R  :v $$$#############################
######################################################################### 


##Histogramas
set.seed(5)
datos <- rnorm(1000,0,1)
set.seed(5)
normalito <- dnorm(datos,0,1)
hist(datos,col ="lightgreen" , border = "black" ,
     main="Grafico de Barras" , labels = T 
     , xlab = "Eje X" , ylab = "Eje y" , freq = F)
curve(dnorm(x),add = T , col = "blue")
curve(dnorm(x,0.5,1),add = T , col = "red")
curve(dnorm(x,0.5,0.95),add = T , col = "brown")

datos2 <-  as.factor(sample(rep(c("A","B","C"),500),replace = T))
datos3 <-   as.factor(sample(rep(c("Soltero","Casado","Viudo"),500),replace = T))
tabla<-table(datos2)
tabla2<-table(datos2,datos3)
barplot(tabla,main = "Titulo",xlab="Estado Civil",ylab="Frecuencia")
barplot(tabla2 ,main = "Titulo",xlab="Estado Civil",ylab="Frecuencia",
        legend = rownames(tabla2) , beside = T , 
        col = c("DarkGreen","lightgreen","forestgreen"))


x <- rnorm(1000,100,20)
  
y <- x + rnorm(1000,0,10)
z <- sample(rep(c(1,2,3,4),250),replace = T)
cor <- cor(x,y)
plot(x = x , y=y , main = "Titulo", 
     xlab="Eje X", ylab="Eje Y", axes=T ,col="lightgreen" )

h <- rnorm(1000,300,50)
boxplot(x , col = "skyblue", border="darkblue" , main="Titulo" , ylab="EjeY")
boxplot(h)
boxplot(x,h,col = "skyblue", border="darkblue")



