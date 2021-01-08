#Vectors - linear regression - The gradient descent perspective
#1. cost function in linear regression
#2. gradient descent for linear regresssion

#RECALL: in linear regression, the cost (loss, or error) function is L=sum (error^2)


#assume a simple linear regression model of y =b0 +b1x1
#applying gradient descent to the function will allow us to find b0 and b1 such that the loss (error) is minimized.

#L(b0,b1) =....^2
#delta L = [1....,2....] (partial derivative with regard to b0 first and b1 second)
#initialize value b0,b1 and step size alpha (learning rate) then we can run gradient descent on the loss function
#this will find the minumum of the error function and the corresponding indenpendet coefficient b0,b1.

#TOC
#1. generate data and fit model
#2. Run gradient descent



#1. generate data and fit model
set.seed(1234)
x<- rnorm(500)
y<- 5+2*x+rnorm(500)#b0 =5, b1=2
plot(x,y)

lm.mod <- lm(y~x)
lm.mod#pretty close the actual values of 5 and 2
abline(a=lm.mod$coefficients[1],b=lm.mod$coefficients[2],col='red')

#run Gradient descent
X <- as.matrix(cbind(1,x))#add vector of 1s for intercept term
#define error function
error <- function(b0,b1){
  sum((X%*%beta-y)^2) #sum of squared error
} 

#Define partials for b0 and b1
del.b0 <- function(b0,b1){
  sum(-y+(b1*x+b0))*(2/length(x))
}

del.b1<-function(b0,b1){
  sum(x%*%(-y+(b1*x+b0)))*(2/length(x))
}


#initializing parametrs  for algorithm
b0<-0
b1<-0
alpha=0.01
n.iter <- 500
error.history<-numeric(n.iter)
b0.history<-numeric(n.iter)
b1.history<-numeric(n.iter)

for(i in 1:n.iter){
  b0.gradient <- del.b0(b0,b1)
  b1.gradient <- del.b1(b0,b1)
  b0<- b0-alpha*b0.gradient
  b1<- b1-alpha*b1.gradient
  beta <- as.matrix(c(b0,b1))  
  error.history[i] <- error(beta)
  b0.history[i]<-b0
  b1.history[i]<-b1
  
}
#view results
beta#b0=4.945 b1=2.076
lm.mod#b0=4.945 b1=2.076
#same values using gradient descent as using lm function for finding beta coefficients.

#actuals and fitted line w/ optimal beta values
plot(x,y)
abline(a=b0,b=b1,col='red')


#convergence towards minimum error
min.error <- round(error.history[n.iter],3)
plot(error.history)
length(which(round(error.history,3)> min.error))


#actuals with convergence of best fit line
# library(animation)
# windows();
# for(i in 1:n.iter){
#   plot(x,y)
#   abline(a=b0.history[i],b=b1.history[i],col='red')
#   text(c(-2,-2,-2),c(6,8,10),labels=c(paste('b1 = ',b1.history[i],sep='' ),
#                                       paste('b0 = ',b0.history[i],sep=''),
#                                       paste('Iteration: ', i)))
#   ani.pause(interval=0.1)
# }