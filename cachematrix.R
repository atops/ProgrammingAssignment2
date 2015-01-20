## Put comments here that give an overall description of what your
## functions do

# test square matrix. save this for later.
m <- matrix(rnorm(9, mean=5, sd=4), nrow=3)

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL # inverse
        # set caches the matrix
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        # get returns the cached matrix
        get <- function() x
        # setInverse caches the matrix inverse
        setInverse <- function(inv) { i <<- inv }
        # getInverse returns the cached inverse
        getInverse <- function() { i }
        # return value is a list of functions
        # so that we can do: returnvalue$getInverse()
        list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
