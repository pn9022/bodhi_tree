## Put comments here that give an overall description of what your
## functions do

## to make inverse of the matrix and cache it

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){
        
        x <<- y
        m <<- NULL
    }

    get <- function() x
    setInverse <- function(inverse) m <<- inverse
    getInverse <- function() m
    list(set = set, 
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## to retrieve the inverse matrix generated in above function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    m <- x$getInverse()
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
}



a <- matrix(1:4, 2,2)
a


b <- makeCacheMatrix(a)
b$get()
b$getInverse()

cacheSolve(a)

cacheSolve(b)
cacheSolve(a)
a$get()
b$getInverse()
cacheSolve(b)



