## Aaron Traub Assignement 2 R programming week 3

## Matrix inversion is usually a costly computation and there may be some benefit
## to caching the inverse of a matrix rather than computing it repeatedly (there are 
## also alternatives to matrix inversion that we will not discuss here). 
##Your assignment is to write a pair of functions that cache the inverse of a matrix.

## Ro run the script, source it and do the following...

# tempMatrix <- matrix(1:4,2,2)
# specialMatrix <- makeCacheMatrix(tempMatrix)
# cacheSolve(specialMatrix)

## This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## his function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve should retrieve the 
##inverse from the cache.

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
# 
# ############################################################################
# ############################################################################
# ############################################################################
# makeVector <- function(x = numeric()) {
#     m <- NULL
#     set <- function(y) {
#         x <<- y
#         m <<- NULL
#     }
#     get <- function() x
#     setmean <- function(mean) m <<- mean
#     getmean <- function() m
#     list(set = set, get = get,
#          setmean = setmean,
#          getmean = getmean)
# }
# 
# cachemean <- function(x, ...) {
#     m <- x$getmean()
#     if(!is.null(m)) {
#         message("getting cached data")
#         return(m)
#     }
#     data <- x$get()
#     m <- mean(data, ...)
#     x$setmean(m)
#     m
# }
