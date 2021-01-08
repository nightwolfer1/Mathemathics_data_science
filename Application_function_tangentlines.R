#TOC
#1. Defining function
#2. plotting a function
#3. estimating  slope of a tangent line using secant lines

#1. defining a function
f <- function(x) x## f(x) = x; syntax: function(argument/s) expression (none programmatic function)

x2 <- function(x) x^2 
x3 <- function(x) x^3
x4 <- function(x) x^4
sqrt.x <- function(x) sqrt(x)


#2. plotting a function
plot(f, main = 'f(x) = x', xlim=c(-5,5), col='blue')#function can be passed in as signle argument xlim is 0 to 1

plot(x2, main = 'f(x) = x^2', xlim=c(-5,5), col='blue')

plot(sqrt.x, main = 'f(x) = sqrt(x)', xlim=c(0,5), col='blue')



#estimating the slope of a tangent line
###function to estimate slope of tangent lines using secant lines
library(animation)
library(Deriv)

f <- function(x) x^2

secant.plots <- function(fun, pt){## fun = function; pt=point where sec lines will ocur
  f.prime <- Deriv(fun)
  x1 <- pt
  y1 <- fun(x1)
  m1 <- f.prime(x1)
  if (m1 <0){
    min <- f.prime(x1)-12
    max <- f.prime(x1)
    j <- 0.5
  }else{
    min <- f.prime(x1)+12
    max <- f.prime(x1)
    j <- -0.5
  }
  windows();
  for( i in seq (min,max,j)) {
    plot(fun, xlim= c(x1-10,x1+10), ylim=c(y1-10,y1+10), col='blue')
    points(x=x1, y=y1, col='blue', type='p', pch=16)
    sec.int<- -i*x1+y1
    abline(a = sec.int, b=i, col='red')
    text(x1+8, y1-8, labels= paste('Slope:',i, sep=""))
    text(x1-0.5, y1+0.5, labels= paste('(',x1,',',y1,')'))
    ani.pause(interval=0.5)
    }
}
  
#secant.plots(f,-2)


#Single tangent lines.
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

tangent.plots(fun=f,pt=-3)  

#secant and tangent lines for f(x) = sqrt(x)
plot(sqrt.x,xlim=c(-5,10))
tangent.plots(fun=sqrt.x,pt=5)  
  
  
