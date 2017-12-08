## Overall this script does 2 things: 1.) it defines a function that creates an object that caches the 
## inverse of a matrix 2.) next it defines a function that either gets the cached inverse if it exists
## or calculates the inverse in the case of non-existence 

## This function creates a special matrix object that can cache the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
    matrix1 <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the
## matrix has not changed), then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
  
        ## Return a matrix that is the inverse of 'x'
}

#The following code demonstrates that the two functions perform as expected
#Create a test matrix that I know is invertibel
matrix1 <- matrix(c(1,1,1.5,-1),2,2)
solve(matrix1)

#Define Cached object
cacheobject <- makeCacheMatrix(matrix1)
cacheSolve(cacheobject)
