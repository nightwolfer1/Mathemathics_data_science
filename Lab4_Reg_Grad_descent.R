#lab4 linear reg & Gradient descent
#loading 
#1. open baeball2018 data set
baseball <- read.csv('Baseball2018.csv')

#using SSE as the error function, run gradient descent to fit a simple linear regression model  to predict 'WinPct'
#use Rdiff,OPS,HomeRun and StrikeOut as pontential input variables

#a) two of the runs will not converge. compare these data to the ones that do converge and offer hyphothesies for the lack 
#of convergence.


y=baseball['WinPct']
X1<-baseball['Rdiff']
X2<-baseball['OPS']
X3<- baseball['HomeRun']
X4<- baseball['StrikeOut']
x <- as.matrix(X2)
y<- as.matrix(y)
#using gradient descent

#define error function
error <- function(b0,b1){
  sum((y-(b0+b1*x))^2)
}
#defining partial derivatives of beta coefficients
der.b0 <- function(b0,b1){
  (2/length(x))*sum(-(y-(b0+b1*x)))
}
der.b1 <- function(b0,b1){
  (2/length(x)) * sum(-x*(y-(b1*x+b0)))
}

#intitializing values
b0=0
b1=3
alpha=0.01
n.iter<-5000
error.history<-numeric(n.iter)
b0.history<-numeric(n.iter)
b1.history<-numeric(n.iter)

#numeric solutions 
#x=X1 (Rdiff)
#plot(as.matrix(X1),as.matrix(y))
#y= 0.5+0.097*x converges to an error of 0.02, converged well

#x=X2 (OPS)
#y=0.32+0.25*x  converges to an error of 0.20 however it could have converged more, given a different start value
#plot(as.matrix(X2),as.matrix(y))


#x=X3 (HomeRun) does not converge instead it diverges at starting point 0,0, meaning error increases with gradient descent.
#lets plot the data see how it looks # when plotting x against y you see no correlation, therefor a linear fit
#the data is larger in scale, so starting point might be changed and also the number of iterations for convergence,
#looking at the data it has a big dispersion, not alot of correlation between dependent variable and undependent variable.


#x=X4 (StrikeOut) same as above




for(i in 1:n.iter){
  b0.gradient <- der.b0(b0,b1)
  b1.gradient <- der.b1(b0,b1)
  b0 <- b0-alpha*b0.gradient
  b1 <- b1-alpha*b1.gradient
  #storing parameter and error in history arrays.
  error.history[i]<-error(b0,b1)
  b0.history[i]<-b0
  b1.history[i]<-b1
}



#use 2) 2 to detemine the best predictor 
#based on the SSE, best predictor for WinPct is the Rdiff, it has 10 times lower error then OPS the rest are giving a fit.
#also less dispersion and good correlation when plotting the scatter.

#actuals and fitted line w/ optimal beta values
plot(x,y)
abline(a=b0,b=b1,col='red')