#TOC
#1. matrix transpose
#2. matrix inverse
#3. identity matrix

#1. matrix transpose
A<-matrix(1:12,nrow=3,ncol=2,byrow=TRUE)
A.t <- t(A)
A.t
v1 <- matrix(1:4, nrow=1)
t(v1) #transpose function needs a matrix type object or it wont work.

#2. matrix inverse
A<-matrix(1:4, nrow=2,ncol=2,byrow=TRUE)
A^-1#does not return an inverse;it returns element-wise reciprocation
solve(A) #solve function is used to get the inverse.

###only square matrices are invertible
###matrix cannot have a row or column of zeros



#3. identity matrix
#a matrix times its inverse gives the identity
round(A%*%solve(A))

# get the identity directly using diag()
I2<-diag(2)
### a matrix times the identity yields the matrix again
A%*%I2
#lab 4
#1. define a matrix A as a square matrix with entries of your choice.
A<-matrix(c(1,2,6,8,9,10,12,13,20),nrow=3,ncol=3,byrow=TRUE)

#2. find the transpose of A
A.t=t(A)

#3.find the inverse of A, if it exists. if it does not exist, define a new matrix a that is invertible
A.s=solve(A)

#4. multiply a by its inverse before doing so what is the expected result
#expected result is an identity matrix of 3 by 3 .
round(I3<-A%*%A.s)