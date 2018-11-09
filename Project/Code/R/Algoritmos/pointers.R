newPointer=function(inputValue){  
  object=new.env(parent=globalenv())  
  object$value=inputValue  
  class(object)='pointer'
  
  return(object)  
}  

copy=function (object, ...) { # create S3 generic  
  UseMethod("copy")   
}   
copy.pointer=function(object1,object2=NULL,...){  
  if (is.null(object2)) {   
    object2 = new.env(parent = globalenv())   
    class(object2) = class(object1)  
    nullFlag = TRUE   
  }   
  elements = names(object1)   
  for (index in 1:length(elements)) {   
    assign(elements[index], get(elements[index], env = object1,   
                                inherits = FALSE), env = object2)   
  }   
  if (nullFlag)   
  { return(object2)   
  } else {   
    return(NULL)   
  }   
}  

updatePointerValue=function (object, ...) { # create S3 generic  
  UseMethod("updatePointerValue")   
}   
updatePointerValue.pointer=function(object,newValue){ # create S3 method  
  if (!is(object, "pointer")) { stop(" 'object' argument must be of class 'pointer' .") }   
  object$value=newValue  
  return(NULL)  
}  
##### Example  
myP=newPointer(7)  
print(myP$value) # returns '7'  
newP=copy(myP)  
copyP=myP  
updatePointerValue(myP,9)  
print(copyP$value) # returns '9'  
print(newP$value) # returns '7'

