#Lab 3 Calculus
#1. Define the function f(x) = x^4 - 2x^2+3 for x between -1.5 and 1.5, plot the function
f <- function(x) x^4 - 2*x^2 +3
plot(f,xlim=c(-1.5,1.5),ylim=c(-10,10),col='red')
#2. From the graph, estimate values and critical points of f.

#we can expect 3 critical points and extrem values by just looking at the plot, were it flattens out.
library(Deriv)
#start by getting function of the derivative
f.prime <- Deriv(f)

#critical points will be found at the root where the derivative is 0. 3 intervalls to look at
# -1.2 and -0.8 ,   -0.3 and 0.3 , 0.6 and 1.4
critical.point1 = uniroot(f.prime,interval=c(-1.2,-0.8))$root
critical.point2 = uniroot(f.prime,interval=c(-0.3,0.3))$root
critical.point3 = uniroot(f.prime,interval=c(0.6,1.4))$root
critical.point1 #-1
critical.point2 # 0
critical.point3 # 1

#extrem values is the y value for f at the critical point
extrem1 = f(critical.point1)
extrem2 = f(critical.point2)
extrem3 = f(critical.point3)

extrem1 #2
extrem2 #3
extrem3 #2

#3. find the derivative of f and plot does f'=0 at the critical points? Yes
f.prime
plot(f.prime,col='green',xlim=c(-1.5,1.5),add=TRUE)
abline(h=0,lty=3)

#4. verify whether each extreme value is a max or a min by using the second derivative test

f.prime.prime<- Deriv(f.prime)

f.prime.prime(critical.point1)#8 
# if second derivative is negative in the critical points its a maximum value and the reverse for minimum value
#first maximum value is a min value, can be verified from plot

f.prime.prime(critical.point2)#-4
#second maximum value is a max value, can be verified from plot

f.prime.prime(critical.point3)#8
#third maximum value is a min value, can be verified from plot