## Create a small class that creates a matrix with a cacheable inverse.  It provides 
## two functions, makeCacheMatrix which builds the matrix and cacheSolve which returns the inverse, 
## computing it only if necessary.

##  Much of this code was adopted from the code given in the assignment.  Lots and lots of it, actually.



##  makeCacheMatrix creates the matrix from the parameter given by the user.  
##       It provides the functions below to operate on this matrix:
##          --  set to give the matrix a new value and invalidate the existing inverse
##          --  get to return the current matrix
##          --  getInverse to return the inverse that was assigned from outside the class or NULL if none has been given
##          --  setInverse to assign a value to the inverse of the matrix
##              (As an aside, this is sorta dumb.  No, this is really dumb.  Allowing another function to set the inverse 
##               could easily lead to all sorts of data inconsistency if what I assign isn't really the inverse.  But the
##               sample program does this, so I will too.  Grudgingly.  I'll also go check the forums and see what they 
##               have to say.)

##  Precondition: the matrix sent as the parameter x to makeCacheMatrix (or to set) must be invertable.

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
 
  get <- function() x
  
  setInverse <- function(newInv) inverse  <<- newInv
  
  getInverse <- function() inverse
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## cacheSolve return the inverse of a cached matrix.  If the inverse has not been computed, it will compute it.

cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    #  message("getting cached data")  #  since I'm gonna run this thousands of times, let's not do this.
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}
