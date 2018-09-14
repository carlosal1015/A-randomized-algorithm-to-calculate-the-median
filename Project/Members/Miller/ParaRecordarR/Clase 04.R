
# Algunas funciones ?tiles:

a <- c(1,5,3,2,9,10)

rev(a) # Orden inverso del vector input
sort(a) # Ordenar en orden (de)creciente los elementos de un vector.

mean(a) # Calcula el valor promedio de los elementos del vector.
sqrt(a) # Calcula la raiz cuadrada de c/u de los elementos del vector.

round(sqrt(a),2) # Redondea a n decimales

# Valores missing o perdidos:

# Muchas veces, podemos no contar informaci?n para ciertos registros.
# Para indicar que un valor es perdido utilizamos el valor NA

alumnos <- letters[1:7]
notas_pc1 <- c(10,15,20,NA,21,NA,10) 

# notas promedio
mean(notas_pc1)
mean(notas_pc1,na.rm = T)

# Operadores l?gicos, algo m?s:

# N?mero de alumnos que aprobaron la pc1
notas_pc1>10
sum(notas_pc1>10)

vec <- (sample(1:50)*10)/50

# Indexaci?n con condicionales:

# Del ejemplo anterior:
# ?Qu? alumnos aprobaron la pc1?
# ?De qui?nes no tenemos infomaci?n de sus notas? is.na

# Eliminar valores missing:
notas_pc1[!is.na(notas_pc1)]

# Ejercicio:
x <- c(1:50,rep(NA,30),11:20)

# Crear una muestra aleatoria de 20 elementos.
set.seed(123)
x_20 <- sample(x,20)

# Cuantos valores missing tenemos en la muestra?
# cual es el valor promedio de los elementos no perdidos de la muestra?
# Cuantos valores son divisibles por 2? por 3?


# Data Frames:

# Sigamos usando iris:

# ?Cu?ntas filas y columnas tiene el dataset iris?
# ?Cu?ntas variables son de tipo num?rica?
# ?Existen variables de tipo caracter?

x <- vector(length = 0)

for(col in 1:5){
  clase_col <- class(iris[,col])
  print(clase_col)
  x <- c(x,clase_col)
}

table(x)

# Seleccionar 10 filas de manera aleatoria y guardarlas en
# el objeto de nombre iris_sub
set.seed(123)
iris_sub <- iris[sample(1:nrow(iris),10),]

# Ordenar el data.frame por columnas:
# - Sepal.Length ascendente
# - Petal.Length descendente
# - Species ascendente y Sepal.Length descendente

iris_sub[order(iris_sub$Sepal.Length),]
iris_sub[order(-iris_sub$Petal.Length),]
iris_sub[order(iris_sub$Species,-iris_sub$Petal.Length),]

# attach() y detach()

# Ejercicio: 

# - Obtener los registros de iris, cuyo Sepal.Length
#   sea mayor al promedio de todos las medidas de Sepal.Length registrados.
# - Obtener solo los regitros cuya Specie sea setosa y guardarlas
#   en un objeto llamado setosa.


# Funci?n paste:

# Generar el siguiente vector:
# ("UNI 1", "UNI 2", ....., "UNI 30").


# Ejercicios:

# Se obtiene un data frame, con participantes de una carrera en europa
# Se pide obtener lo siguiente:

# - Importar el archivo carreras.txt a R.
# - Cuantos participantes existen en nuestro dataset.
# - Cuantas variables tenemos en nuestro dataset.
# - ?Es correcto que las variables Nombre y Apellido sean de tipo factor?
#   De no serlo, convertir las columnas a caracter.

# - Cual es la proporci?n(%) de hombres y mujeres en el dataset.
# - ?Cu?l es el puntaje m?ximo y m?nimo obtenido.
# - ?El puntaje m?ximo obtenido por las chicas es mayor al puntaje
#   m?ximo obtenido por los hombres?
# - En promedio, ?qui?nes obtuvieron mayor puntaje, los chicos o chicas?

# - Filtrar aquellas personas que obtuvieron un puntaje mayor al promedio.
# - ?Cuantas personas son menores a 30 a?os?

# - Listar los nombres de los hombres menores a 30 a?os.
# - Obtener los apellidos de las personas que son mayores a 30 a?os
#   y obtuvieron un puntaje menor que 300.

# - Listar los nombres de personas con apellido "Knudsen"
# - ?Tenemos personas con el apellido "Quispe" dentro de nuestro dataset?
# - Abreviar el apellido "Knudsen" por "Knud".
