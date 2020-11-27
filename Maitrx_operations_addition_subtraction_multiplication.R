#TOC
#1. scalar multiplication of matrices
A<-matrix(c(-1,2,7,0),nrow=2,ncol=2,byrow=TRUE)
2*A

#2. matrix addition and subtraction
A<-matrix(c(0,1,2,3),nrow=2,byrow=TRUE)
B<-matrix(c(0,-2,-5,12),nrow=2,byrow=TRUE)
A+B

#same for subtraction...

#3. matrix multiplication
A*B #is element wise multiplication
A%*%B #is matrix multiplication


#LAB 
#1.Define two matrices. Let A be a 3x4,filles row-wise with the numbers 1-12. Let B be 4x2, filled column wise with the numbers 1-8
A=matrix(1:12,nrow=3,ncol=4,byrow=TRUE)
B=matrix(1:8,nrow=4,ncol=2,byrow=FALSE)#column wise by doing byrow=FALSE

#2.Explain why A and B cannot be added or subtracted.
#The addition and subtraction is done element wise, matrixes must be same dimension therfor it wont work
#A+B
#A-B
C=matrix(12:23,nrow=3,ncol=4,byrow=TRUE)
A+C #same dimensions

#4.Find AB. before multiplying in R anticipate the dimensions of the product and multiply by hand.
A%*%B