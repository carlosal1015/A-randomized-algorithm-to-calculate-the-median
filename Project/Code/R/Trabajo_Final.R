#################################################

ref <- function(..., envir=parent.frame(), inherits=TRUE){

  cl <- match.call(expand.dots = TRUE)
  cl[c(1, match(c("envir", "inherits"), names(cl), 0L))] <- NULL
  
  for (x in as.list(cl)) {
    
    s <- substitute(x)
    sx <- do.call(substitute, list(s), envir=envir)
    dx <- deparse(sx)
    expr <- substitute(assign(dx, s, envir=parent.frame(), inherits=inherits))
    do.call(on.exit, list(expr, add=TRUE), envir=envir)
    
  }

  #Extraido de:
  #https://stackoverflow.com/questions/2603184/can-you-pass-by-reference-in-r

}

#################################################

CAMBIO <- function(A,i,j){
  ref(A)      #El valor mostrado esta referenciado, es decir que
              #si se modifica en la funcion se modifica el original
  
  a1 <- A[i]  #Se agrega el dato en una variable temporal
  a2 <- A[j]  #para evitar problemas con el compilador
  
  A <- replace(A,c(i,j),c(a2,a1)) #Se cambia con la funcion replace
}

################################################

PARTICION <- function(A,p,r){
  ref(A)
  x <- A[r]
  i <- p-1
  
  for(j in p:(r-1)){
    
    if(A[j] <= x){
      i <- i+1
      CAMBIO(A,i,j)
    }
    
  }
  
  CAMBIO(A,i+1,r)
  
  return(i+1)           #regresa la posición del pivot
  
}

################################################

RANDOM.PARTICION <- function(A,p,r){
  ref(A)
  
  ##random##*
  
  tem <- sample(p:r,1,replace = F)    #tem es un aleatorio que
  CAMBIO(A,r,tem)                     #se cambia con el último elemento del vector A
  
  ##########*
  
  PARTICION(A,p,r)
  
}

################################################

QUICKSORT <- function(A,p=1,r=length(A)){       #los valores por defecto para facilitar el arreglo
  #ref(A)
  if(p < r){
    
    q <- PARTICION(A,p,r)
    A <- QUICKSORT(A,p,q-1)
    A <- QUICKSORT(A,q+1,r)
    
  }
  return(A)             #se coloca return para que se entienda que es lo que retorna
                        #sin embargo no es necesario ya que 'A' esta por referencia
}

################################################

RANDOM.QUICKSORT <- function(A,p=1,r=length(A)){    #los valores por defecto para facilitar el arreglo
  #ref(A)
  if(p < r){
    
    q <- RANDOM.PARTICION(A,p,r)
    A <- RANDOM.QUICKSORT(A,p,q-1)
    A <- RANDOM.QUICKSORT(A,q+1,r)
    
  }
  return(A)             #se coloca return para que se entienda que es lo que retorna
                        #sin embargo no es necesario ya que 'A' esta por referencia
}

################################################

QUICKSELECT <- function(A,p=1,r=length(A),m=(r+p)/2){
  #ref(A)
  
  if(p == r){
    return(A[p])
  }
  
  q <- PARTICION(A,p,r)
  
  if(m == q){
    return(A[q])
  }
  else{
    
    if(m<q){
      QUICKSELECT(A,p,q-1,m)
    }
    else{
      QUICKSELECT(A,q+1,r,m)
    }
    
  }
}

################################################

RANDOM.QUICKSELECT <- function(A,p=1,r=length(A),m=(r+p)/2){
  #ref(A)
  
  if(p == r){
    return(A[p])
  }
  
  q <- RANDOM.PARTICION(A,p,r)
  
  if(m == q){
    return(A[q])
  }
  else{
    
    if(m<q){
      RANDOM.QUICKSELECT(A,p,q-1,m)
    }
    else{
      RANDOM.QUICKSELECT(A,q+1,r,m)
    }
    
  }
  
}

################################################

MEDIANA.QSELECT <- function(A){
  
  if(length(A) %% 2 == 1){
    med <- QUICKSELECT(A)
  }
  else{
    med <- (QUICKSELECT(A,m=(length(A)/2)) + QUICKSELECT(A,m=(length(A)/2)+1))/2
  }
  return(med)
}

################################################

MEDIANA.RANDOM.QSELECT <- function(A){
  
  if(length(A) %% 2 == 1){
    med <- RANDOM.QUICKSELECT(A)
  }
  else{
    med <- (RANDOM.QUICKSELECT(A,m=(length(A)/2)) + RANDOM.QUICKSELECT(A,m=(length(A)/2)+1))/2
  }
  return(med)
}

################################################

  iteraciones=5
  tamaños=c(100,300,500,1000,3000,5000,7000,9000,10000,12000,13000,14000,15500)
  
  vector.qs <- vector()
  vector.random.qs <- vector()

  for (j in 1:length(tamaños)){
    
    for (i in 1:iteraciones) {
      
      A <- sample(1:50000,tamaños[j],replace=T)
      B<-A
      
      t <- proc.time()
      qus <- MEDIANA.QSELECT(A)
      t <- proc.time()-t
      vector.qs <- rbind(vector.qs,t[3])      #t[3] es el tiempo total
      
      t <- proc.time()
      qus <- MEDIANA.RANDOM.QSELECT(B)
      t <- proc.time()-t
      vector.random.qs <- rbind(vector.random.qs,t[3])
      
    }
    #print(vector.qs)
  }
  
  vector.qs <- matrix(vector.qs,nrow=iteraciones,ncol=length(tamaños))
  colnames(vector.qs) <- tamaños
  
  #print(vector.qs)
  y1 <- colMeans(vector.qs)
  #print(y1)
  
  vector.random.qs <- matrix(vector.random.qs,nrow=iteraciones,ncol=length(tamaños))
  colnames(vector.random.qs) <- tamaños
  
  #print(vector.random.qs)
  y2 <- colMeans(vector.random.qs)
  #print(y2)
  
  plot(tamaños,y1,pch=17,col="blue",xlab="Tamaño de datos",ylab="Tiempo total(s)",main="Gráfico QS vs R-QS")
  points(tamaños,y2,pch=16,col="red")

################################################

