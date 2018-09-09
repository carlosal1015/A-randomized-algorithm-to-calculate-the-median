
########################################################################
################## R Programming - IF, ELSE, FOR #################
########################################################################

# IF .... ELSE

# Estructura:

# if(condicion){
#     ...instrucciones si condicion es verdadera...
#  } else {
#     ...instrucciones si condicion es falsa...
#  }


# Ejemplo:

# 1. Probar edad:

mi_edad <- 10

if(mi_edad>=18){
    print('Usted es mayor de edad')
} else{
    print('Usted no es mayor de edad')
}

# Forma reducida: No recomendable para lectura
if(mi_edad>=18) print('Usted es mayor de edad') else print('Usted no es mayor de edad')

# 2. Probar si un numero ingresado es positivo, negativo o cero.

num <- 0

# Solución:

if(num<0){
  print('El numero es negativo')
} else if(num>0){
  print('El numero es positivo')
} else {
  print('El numero es cero')
}



# if else anidados:

# Ejercicio:

# 1. Dada una serie de notas para un curso, validar si el alumno aprueba
#    tiene oportunidad de dar el examen sustitutorio, o desaprobó.
#    - Nota solo son 3 prácticas, no se elimina ninguna.
#    - Se aprueba si (PP+EP+EF)/3 es no menor a 10
#    - Se tiene derecho a susti solo aquellos temporalmente desaprobados
#      pero con un promedio de práctica mayor a 6 

pc1 <- 4
pc2 <- 12
pc3 <- 4
ep <- 15 
ef <- 12

pp <- mean(c(pc1,pc2,pc3))



# Solución

if(mean(c(pp,ep,ef))>=10){
  print('Felicidades! Aprobaste!')
} else if(pp>=6){
  print('SUSTI con fe')
} else{
  print('Para el otro ciclo será')
}



# Bucles:

# - for:

# for(var in vector){
#   -- instrucciones
# }

# Notar que la cantidad de iteraciones está determinado por el número de
# elementos o la longitud del vector.

# Ejemplo 1: Print los años del 2000 al 2012 uno debajo de otro

for(anio in 2000:2012){
    print(anio)
}

# Ejemplo 2:

for(a in 1:10){
    print('R Programming')
}

# Ejercicios:

# 1. Dado un vector del 1 al 10. Mostrar solo los números impares.

vec <- 1:10

# for(n in vec){
#   if(n %%2 != 0){
#     print(n)
#   } else {
#     next
#   }
# }


# Escribe un for loop que muestre los números del 1 al 10 elevados
# al cubo.

# Mostrar en pantalla el nombre de las columnas del dataset iris junto
# a su cantidad de caracters.



st <- 'UNI'
nchar(st)
paste('hola',st,sep='')


nombres <- colnames(iris)

for(nombre in nombres){
  print(paste(nombre," (",nchar(nombre),")",sep=""))
}


