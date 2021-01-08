#Gradient descent

#recall: if a function of x and y,then fx and fy is partial derivative of f with respect to x and y.
# the partial derivatives are functions describing the rate of change of f, in the x and y direction

#we can then define a function of fx and fy
#this function knowsn as del f is gradient of f.
#deltaf(x,y) = [fx(x,y),fy(x,y)] is a vector function. it returns a vector not a singel value.
#delta f provides the direction with maximum rate of change of f from the point(x,y)

#the gradient descent algorithm
#delta f(x,y)= [fx(x,y),fy(x,y)]
#initialize a starting point (x1,y1)
#calculate delta f(x1,y1)
#calculate (x2,y2) as x2 = x1-a*fx(x1,y1) and y2=y1-a*fy(x1,y1)
#a is the learning rate and determines how big the steps are
#repeat untill (xn,yn) is a critical point.

#TOC:
#1. running the gradient descent algorithm
#2. visualizing and interpreting results.
library(Deriv)
library(rgl)

#1. running the gradient descent algorithm
f <- function(x,y)(x-2)^2+(y+3)^2
plot3d(f,xlim=c(-10,10),ylim=c(-10,10),col='green')

#1. define del.f
f.x <- Deriv(f,x='x')
f.y <- Deriv(f,x='y')

#initialize a starting point
x <- 0 
y <- 0

#run a loop for repeating section
alpha = 0.01
n.iter <- 500
f.history <- numeric(n.iter)
x.history <- numeric(n.iter)
y.history <- numeric(n.iter)

for (i in 1:n.iter) {
  #3. calculate del.f(x,y)
  x.gradient <-  f.x(x=x)
  y.gradient <-  f.y(y=y)
  #4. Calculate new point as xnew=alpha*f_x(x,y) and ynew=y-alphaf_y(x,y)
  x <- x - alpha*x.gradient
  y <- y - alpha*y.gradient
  
  #repeat untill (x,y) is a critical point
  f.history[i] <- f(x,y)
  x.history[i] <- x
  y.history[i] <- y
}
#visualizing and interpreting results
plot(f.history)
plot(x.history,y.history)

plot3d(f,xlim=c(-5,5),ylim=c(-5,5),col='green')
points3d(x.history,y.history,f(x.history,y.history),col='red')
