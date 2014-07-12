#  A test script for the code in cacheMatrix.

source("cachematrix.R")

m <- makeCacheMatrix(matrix(1:4, 2, 2))

#  Since the only funciton being tested is cacheSolve, let's just run that.
inv <- cacheSolve(m)

#  Did we really compute the inverse?  Let's try multiplying the original matrix by it and see what we get
prod <- m$get() %*% inv
print ("Testing that we have an inverse")
print (prod)

#  So, is it really faster?  Let's build a big random matrix, but start with the same seed so it's reproducible.
set.seed(13)
bigM <- makeCacheMatrix (matrix (runif(900, -10, 10), 30, 30))

#  Now, time inverting it 2 ways, with solve and cacheSolve
slowTime <- system.time (for (i in 1:10000) solve(bigM$get()))

fastTime <- system.time (for (i in 1:10000) cacheSolve(bigM))

print ("Time with no cache")
print (slowTime)
print ("Time with caching")
print (fastTime)



