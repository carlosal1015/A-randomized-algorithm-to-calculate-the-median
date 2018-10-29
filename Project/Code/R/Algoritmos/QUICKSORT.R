cambio <- function(A,i,j){
  
  a1 <- A[i]  #Se agrega el dato en una variable temporal
  a2 <- A[j]  #para evitar problemas con el compilador
  
  A <- replace(A,c(i,j),c(a2,a1)) #Se cambia con la funcion replace
  
}


quick <- function(A,p,r){
  
  if(p < r){
    
    ####comienza partition######
    
    x <- A[r]
    #print(x)
    i <- p-1
    
    for(j in p:(r-1)){
      #print(j)
      if(A[j] <= x){
        
        i <- i+1
        A <- cambio(A,i,j)
        
      }
    }
    
    A <- cambio(A,i+1,r)
    
    ###termina partition######
    
    q <- i+1
    #print(q)
    #print(A)
    A <- quick(A,p,q-1)
    A <- quick(A,q+1,r)
    
  }
  return(A)
}


####comienza el main#####
#### ejemplo basico #####
v <- c(2,90,6,4,7,5)
print(v)

#v <- cambio(v,1,2)
#v <- partition(v,1,5)

v <- quick(v,1,6)

print(v)

####termina el main#####
