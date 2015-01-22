## Put comments here that give an overall description of what your
## functions do

# test square matrix. save this for later.
m <- matrix(rnorm(9, mean=5, sd=4), nrow=3)

## makeCacheMatrix stores a matrix and returns a list of functions
##  that enable cacheSolve to access and store the inverse

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL # inverse
        # set caches the matrix
        set <- function(y) {
                x <<- y # x is in the parent environ (makeCacheMatrix)
                i <<- NULL # i is in the parent environ (makeCacheMatrix)
        }
        # get returns the cached matrix
        get <- function() x
        # set_inverse caches the matrix inverse
        set_inverse <- function(inv) {
        	i <<- inv
        }
        # get_inverse returns the cached inverse
        get_inverse <- function() { 
        	i 
        }
        # return value is a list of functions
        #  that expose its in-scope variables to cacheSolve
        list(set=set, 
             get=get, 
             set_inverse=set_inverse, 
             get_inverse=get_inverse)
}

## cacheSolve runs the solve function on the matrix and returns the inverse
##  it first solves the inverse if it hasn't been solved already already

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        # get the inverse matrix if it has been cached
        i <- x$get_inverse()
        # if the inverse matrix is none, return it
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        # otherwise get the matrix
        m <- x$get()
        # calculate the inverse
        i <- solve(m, ...)
        # cache it
        x$set_inverse(i)
        # and return it
        i
}
