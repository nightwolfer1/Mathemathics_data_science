#Orthogonal vectors and linear independence

#two vectors are said to be orthogonal if their inner product is 0
#orthogonal vectors are analogous to prepindicular lines
#the two vectors are going opposit directions.
#a set of vectors is called an orthogonal set if each pair of vectors is orthogonal

#Linear independence means no vector can be written as a linear combination of any of the other vectors.

#if two vectors are orthogonal, they are also linearly independent.
#a orthogonal vector set is said to be linearly indenpendent as long as vectors of zeros does not exist in the set.


#TOC:
#1. Testing for orthognality
#2. example w/ linear regression
v1 <-c(0,1)
v2 <- c(-2,5)
v3 <- c(-1,2)

v1%*%v2 #5
v1%*%v3 #2
v3%*%v2 #12
#none of these products are zero, so none of the vector pairs are orthogonal
#the vector set is not linearly independent

w1 <- c(1,3,2)
w2 <- c(3,-1,0)
w3 <- c(1,3,-5)
w1%*%w2#0
w1%*%w3#0
w3%*%w2#0
#all of the products are zero, so each pair of vectors is orthogonal
#the vector set is linearly independent

#2. example w/linear regression

###create sample data
set.seed(123)
x1 <- rnorm(n=100) #return a sample of 100 observations from the standard normal dist.
x2 <- rnorm(n=100)
x3 <- 2*x1+3*x2
y <- 4*x3

model.data <- as.data.frame(cbind(y,x1,x2,x3))
mod1 <- lm(y ~ . ,data=model.data )
summary(mod1)

mod2 <- lm(y~x3,data=model.data)
summary(mod2)# we would want to use this model bc it has fewer input variables but provides the same output.
