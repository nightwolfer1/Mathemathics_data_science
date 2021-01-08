#TOC:
#1. plotting a function and its derivative
#2. finding a derivative (and the power rules)
#3. finding and plotting partial derivatives

library(Deriv)##package for finding closed form expression for derivatives

#plotting a function and its derivative

#Recall: a derivative is a function that gives the slopes of the tangent lines of another function 
#start w/ a function
f <- function(x) x^3

##lets plot some of the tangent lines
tangent.plots <- function(fun, pt){## fun = function; pt=point where sec lines will ocur
  f.prime <- Deriv(fun)
  x1 <- pt
  y1 <- fun(x1)
  m1 <- f.prime(x1)
  plot(fun, xlim= c(x1-10,x1+10), ylim=c(y1-10,y1+10), col='blue')
  points(x=x1, y=y1, col='blue', type='p', pch=16)
  sec.int<- -m1*x1+y1
  abline(a = sec.int, b=m1, col='red')
  text(x1+8, y1-8, labels= paste('Slope:',m1, sep=""))
  text(x1-0.5, y1+0.5, labels= paste('(',x1,',',y1,')'))
}
tangent.plots(fun=f, pt=-2)
##keeping track: f'(-2)=12//f'(-1)=3//f'(0)=0//f'(1)=3//f'(2)=12//f'(-3)=27//f'(3)=27
plot(f,xlim=c(-5,5),col='blue')
points(x=-4:4,y=c(48,27,12,3,0,3,12,27,48), col= 'red', pch=16)


#2. finding a derivative (and the power rule)
#use the Deriv() function to find the closed form of a derivative
f.prime <- Deriv(f)
f.prime

#add to the previous plot 
curve(f.prime, add=TRUE)

f<- function (x) x^2
Deriv(f)
#keeping track: f=x^2 , f'=2x// f=x^3, f' =3x^2// f=x^4, f'=4x^3 ... f=x^5 , f'=5x^4

#power rule for finding derivatives: if f(x)=x^n, then f'(x) =  n*x^(n-1)
#more generally if  f(x)=ax^n, f'(x)=n*a*x^(n-1)

#3. finding and plotting partial derivatives
f<- function(x,y) x^2+ y^2
f.x <- Deriv(f,x='x') ##partial derivative wrt x
f.y <- Deriv(f,x='y') ##partial derivative wrt y

library(rgl)
plot3d(f,xlim=c(-10,10),ylim=c(-10,10), col='blue')
plot3d(f.x,xlim=c(-10,10),ylim=c(-10,10),type='p', col='red',add=TRUE)
plot3d(f.y,xlim=c(-10,10),ylim=c(-10,10),type='p', col='green',add=TRUE)


