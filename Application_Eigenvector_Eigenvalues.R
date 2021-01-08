#Vectors - Eigenvectors and Eigenvalues

#Eigenvectors and Eigenvalues

#An eigenvector of a nxn matrix A is a nonzero vector v such that A*v=lambda*v,where lambda is scalar

#the scalar lambda is called the eigenvalue of A

#v is an eigenvector corresponding to lambda, eigeinvector represent a direction in space

#eigenvalue represent a magnitude in space.

#Given a data set of multiple variables, the covariance matrix is a square matrix containing the variance and covariance for each 
#variable or pair of variables.

#variance is a statistic that summarizes the amount of spread or variation present in the data.

#Eigenvectors and eigenvalues of the coverience matrix are used to determine where most amount of variation 
#in the data occurs.

#if the covariance matrix has a eigenvalue of 0 it could mean there is a linear dependency in the data set.

#the converse is not true! if the covariance matrix does not have an eigenvalue of 0 it does not mean there isnt a linear 
#dependency in the data set.

#technically, an eigenvalue of zero means there is no more variation in the data. this is often caused by linear dependency.

#this concept is sued in most common dimension reduction techniques.

#TOC
#1. finding the covariance matrix and eigen decomposition
#2. understanding an eigenvalue of zero

#1. finding the covariance matrix and eigen decomposition

A <- matrix(c(1,2,-1,0,2,3,4,-2,1),nrow=3,byrow=TRUE)
colnames(A) <- c('a1','a2','a3')
round(cov(A),2)
eigen(cov(A))

#2. understanding an eigenvalue of zero
set.seed(1234)
x1<- rnorm(n=50)
x2<- rnorm(n=50)
x3<- 2*x1

B <- cbind(x1,x2,x3)
cov.B<-cov(B)
eigen.B <-eigen(cov.B)
eigen.B

#eigenvectors form an orthogonal set


