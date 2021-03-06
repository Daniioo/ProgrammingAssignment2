## Cache the inverse of a matrix (if you can)


## Creates a special matrix object that can cache its inverse
makeCacheMatrix <- function( m = matrix() ) {
        
        ## Parameter initializing the inverse matrix
        i <- NULL
        
        ## Setting the matrix
        set <- function( matrix ) {
                m <<- matrix
                i <<- NULL
        }
        
        ## Getting the matrix
        get <- function() {
                ## Returning the matrix
                m
        }
        
        ## Setting the inverse of the matrix
        setInverse <- function(inverse) {
                i <<- inverse
        }
        
        ## Method to get the inverse of the matrix
        getInverse <- function() {
                ## Return the inverse property
                i
        }
        
        ## Return a list of the methods
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## Compute the inverse of the special matrix returned by "makeCacheMatrix"
## above. If the inverse has already been calculated (and the matrix has not
## changed), then the "cachesolve" should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        
        ## Returning a matrix that is the inverse of 'x'
        m <- x$getInverse()
        
        ## Returning the inverse if its already set
        if( !is.null(m) ) {
                message("getting cached data")
                return(m)
        }
        
        ## Getting the matrix from our object
        data <- x$get()
        
        ## Calculating the inverse using matrix multiplication
        m <- solve(data) %*% data
        
        ## Setting the inverse to the object
        x$setInverse(m)
        
        ## Returning the matrix
        m
}