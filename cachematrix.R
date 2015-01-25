##This files contains the functions makeCacheMatrix and Cachesolve.
##The purpose of makeCacheMatrix is to create a matrix and caches its inverse
## The second function calculates the inverse of the matrix, but
## first checks to see if the inverse has already been calculated and
##is in the cache.

#makeCacheMatrix stores the matrix "x" and its inverse in the cache


makeCacheMatrix <- function(x = matrix()) {

    I <-NULL
    
    set <- function (y) {
        x<<- y
        I <<- NULL
    }
    get <-function() x
    setinverse <-function(inv) I <<- inv
    getinverse <- function() I
    list (set=set,get=get, setinverse=setinverse,
          getinverse=getinverse)
}


#Cachesolve is a function that returns the inverse of the matrix x.
#It checks for the value in the cache if it has previously
#been computed. If not, then the value is computed and stored
#in the cache.

cacheSolve <- function (x, ...) {
    # check for inverse in the cache
    I <-x$getInverse()
    
    if(!is.null(I)) {
        message("Retrieving cached data") 
        return(I) 
    }

    else {
        a <-x$get()
        I <-solve(a,...)
        x$setInverse(I)
        
        I   #returns the calculated inverse
    }
}
