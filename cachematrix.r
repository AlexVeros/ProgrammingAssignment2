## Assignment: Caching the Inverse of a Matrix
## Matrix inversion is usually a costly computation and there may be some benefit 
## to caching the inverse of a matrix rather than computing it repeatedly 
## (there are also alternatives to matrix inversion that we will not discuss here). 
## Your assignment is to write a pair of functions that cache the inverse of a matrix.
## Write the following functions:
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then cacheSolve should retrieve the inverse from the cache.
## Computing the inverse of a square matrix can be done with the solve function in R. 
## For example, if X is a square invertible matrix, then solve(X) returns its inverse.

## In order to create a matrix that has the ability to cache it's inverse we created this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## The following function is used in order to compute the invers of the matrix/fuction created above. It's worth mentioning
##that in the case that the inverse has been arleady calculated and therofor the matrix hasn't changed, then it retrieves 
##the inverse frim the cache

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverseFunction <- x$getInverse()
  if(!is.null(inverseFunction)) {
    message("getting cached data")
    return(inverseFunction)
  }
  data <- x$get()
  inverseFunction <- solve(data, ...)
  x$setInverse(inverseFunction)
  inverseFunction
}
