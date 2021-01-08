#Lab 2 Intro derivatives

#1. for each function f(x)=sqrt(x) and f(x)=x, do the following
#defining f
f1 <- function(x) sqrt(x)
f2 <- function(x) x
#a define f and f' and write the closed for form f'
library(Deriv)
#defininf f'
fd1 <- Deriv(f1)
fd2 <- Deriv(f2)
fd1 #closed form of f1' is f1'(x) = 1/(2*sqrt(x))
fd2 #closed form of f2' is  f2'(x)=1

#b plot f and f' in the same plot
#f1 and f'1
plot(f1,xlim=c(0,5),col='blue')
plot(fd1,xlim=c(0,5),col='red',add=TRUE)

#f2 and f'2
plot(f2,xlim=c(0,5),col='blue')
plot(Vectorize(fd2),xlim=c(0,5),col='red',add=TRUE)

#pick 3-5 values of x calculate f'(x) and plot the points
#keeping track: f'(1)=0.5//f'(2)=0.35//f'(3)=0.289// f'(4)=0.25//f'(5)=0.224
fd1(1)
fd2(2)
fd1(3)
fd1(4)
fd1(5)

plot(f1,xlim=c(0,5),col='blue')
plot(fd1,xlim=c(0,5),col='red',add=TRUE)
points(x=1:5,y=c(0.5,0.35,0.289,0.25,0.224), col= 'red', pch=16)

#d) what is the slope of the tangent line to f at each value of x from part c?
#the slope is equal to the y value of of each calculated point, since derivative calculates the rate of change at each point.



#2. for f(x) = x^3+ y^3 
#a find fx and fy
#defining the function
f3 <- function(x,y) x^3 + y^3

#a) find fx and fy
f.x <- Deriv(f3,x='x') #partial derivative wrg to x
f.y <- Deriv(f3,x='y')#partial derivative wrg to y

#b) plot f,fx and fy in the same plot
library(rgl)
plot3d(f3,xlim=c(-10,10),ylim=c(-10,10),col='red')
plot3d(f.x,xlim=c(-10,10),ylim=c(-10,10),col='blue', type='p',add=TRUE)
plot3d(f.y,xlim=c(-10,10),ylim=c(-10,10),col='black',type='p',add=TRUE)
