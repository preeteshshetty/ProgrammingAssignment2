##It caches the inverse of a matrix and stores it in a list.
##If exact replica of the matrix exists from the list, the function returns the inverse from the cached list.
##else it calculates the inverse and stores in the list.


## The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to
##set the value of the vector
##get the value of the vector
##set the value of the CacheMatrix
##get the value of the CacheMatrix

makeCacheMatrix <- function(x = matrix()) {
m<-NULL
set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x 
setinverse<- function(solve) m<<-solve
getinverse<--function() m
list(set=set,get=get,
     setinverse=setinverse,
     getinverse=getinverse)
}

## The below function computes the inverse of the special "vector" created with the above function.
##However, it first checks to see if the inverse has already been computed before.
##If so, it gets the inverse from the cache and skips the calculation thus avoiding waste of computing time.
##Otherwise, it calculates the inverse of the matrix and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
