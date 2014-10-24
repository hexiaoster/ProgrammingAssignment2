## The following is a pair of functions that cache the inverse of a matrix.


## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to

## set the value of the matrix
## get the value of the matrix
## set the value of the solve
## get the value of the solve

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function (y) {
                x <<- y
                m <<- NULL
        }
        get <- function () x
        setSolve <- function(solve) m <<- solve
        getSolve <- function() m
        list (set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}

## The following function calculates the inverse of the special "matrix" created 
## with the above function. However, it first checks to see if the inverse has 
## already been calculated. If so, it gets the inverse matrix from the cache and skips 
## the computation. Otherwise, it calculates the inverse matrix of the data and sets the 
## value of the inverse in the cache via the setSolve function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getSolve()
        if(!is.null(m)) {
                message ("getting cached data")
                return (m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setSolve(m)
        m
}
