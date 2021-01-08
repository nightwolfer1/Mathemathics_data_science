#Lab 1 - Calculus
#1. Define the function f(x) = x^3 and plot it in an appropriate intervall.
f<- function(x) x^3
plot(f,xlim=c(-5,5))

#2. find the slope of f at x=-1,0,2
#a) what patterns to dyou notive between the values of x and the slope of the tangent line,

x.1<-Deriv(f)(-1)#the slope of the tangent of x^3 at x=-1 is 3
x.2<- Deriv(f)(0)#the slope of the tangent of x^3 at x=0 is 0
x.3 <- Deriv(f)(2)#the slope of the tangent of x^3 at x=2 is 12
# as x increases from 0 the tangent rate of change of y to x increases
# as x decreases from 0 the tangent rate of change of y to x increases


#3. repeat 1-2 for f(x)=x^4
f2<- function(x) x^4
plot(f2,xlim=c(-5,5))

x.4<-Deriv(f2)(-1)#the slope of the tangent of x^4 at x=-1 is -4
x.5<- Deriv(f2)(0)#the slope of the tangent of x^4 at x=0 is 0
x.6 <- Deriv(f2)(2)#the slope of the tangent of x^4 at x=2 is 32

# as x increases from 0 the tangent rate of change of y to x increases 
# as x decreases from 0 the tangent rate of change of y to x increases but negativly (negative slope)


#4. plot the following functions. For x=-1,0,2 determine (without plotting) if the slopes of the tangent lines will be
#positive, negative orzero.
#Since the change of rate of the function is the derivative at the point we are looking.
#for x^5 we will have a similar function to x^3, at x=-1 positive, x=0 its zero at x= 2 its positive 
#for ln(x) at x=-1 is undefined, for x=0 is undefined and for x=2 its positive
#for e^x at x=-1 its positive (small) at x=0 its positive and at x=2 its positive
#for 1/x at x=-1 its negative for at x=0 its undefined and at x=2 its negative.

f3 <- function(x) x^5
f4 <- function(x) 1/x
#plotting x^5
plot(f3,xlim=c(-5,5))
#plotting lnx
plot(log,xlim=c(-5,5))
#plotting e^x
plot(exp,xlim=c(-5,5))

#plotting 1/x
plot(f4,xlim=c(-5,5))

