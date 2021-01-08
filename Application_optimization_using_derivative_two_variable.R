#optimization using derivatives two variable functions
#f(x,y) has extreme valeue at (x*,y*) then fx(x*,y*) and fy(x*,y*) will both equal 0
#the point (x*,y*) is a critical point of f.
#if (x*,y*) is a critical point of f(x,y), let the quantity D be defined as 
#D=fxx(x*,y*)fyy(x*,y*)- [fxy(x*,y*)]^2
#case 1 if D > 0 and fxx(x*,y*) > 0, then f(x*,y*) is a local minimum
#case 2 if D > 0 and fxx(x*,y*) < 0, then f(x*,y*) is a local maximum
#case 3 if D < 0, then f(x*,y*) is niether a local min nor a local max

#TOC
#1. finding all derivatives equal to zero
#2. second derivative teest for two vars
library(Deriv)
#1. finding all derivatives equal to zero
f<- function(x,y) x^2+y^2-2*x-6*y+14
f.x <- Deriv(f, x='x')#2x - 2
f.y <- Deriv(f, x='y')#2y - 6

###in this case, we can do f.x and f.y individually with uniroot()
uniroot(f.x, interval=c(-10,10))#1
#need to pass uniroot() somthing thats a function of 'x'
uniroot(function(x) 2*x-6,interval=c(-10,10))#3


#critical point is at (1,3)


### a couple other methods can be used too. Use Solve().
#want:
### 2x-2=0 --> 2x + 0y - 2 = 0 --> 2x + 0y = 2
### 2y-6=0 --> 0x + 2y - 6 = 0 --> 0x + 2y = 6
LHS <- matrix(c(2,0,0,2), nrow = 2, byrow = TRUE)
LHS
RHS <- c(2,6)
RHS

solve(LHS,RHS)#trying to find the values for x and y that solves the equation
#critical point is (1, 3)


#What if f' is a function of two variables?
###EX
f2 <- function(x,y) x^2+y^2+x*y
f2.x <- Deriv(f2, x='x')
f2.x#2x +y
f2.y <- Deriv(f2, x='y')
f2.y#2y +x
#new package rootSolve has the function multiroot()
library(rootSolve)
func <- function(x) c(f1 = 2*x[1]+x[2],
                      f2= 2*x[2]+x[1])#both partial derivatives x[1] and x[2] indicates two different variables
multiroot(f=func, start = c(1,3))
#critical point at (0,0)



#2. second derivative test for two vars
f.xx <- Deriv(f.x,x='x')
f.yy <- Deriv(f.y,x='y')
f.xy <- Deriv(f.x,x='y')

D <- f.xx(c(1,3))*f.yy(c(1,3))-f.xy(c(1,3))^2
D
## D >0 and f.xx > 0, so (1, 3) is a local min



