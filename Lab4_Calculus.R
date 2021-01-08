#Lab4 Calculus
#1. define and plot the function f(x,y) =x^2 +xy+y^2+y for x and y between -10 and 10.
f<- function(x,y) x^2+x*y+y^2+y
library(rgl)
plot3d(f,xlim=c(-10,10),ylim=c(-10,10),col='red')
library(Deriv)
#2. find fx,fy,fxx,fyy,fxy and write the close form expression for each
f.x <- Deriv(f,x='x') #2x+y
f.y <- Deriv(f, x='y')#2y+x
f.xx <- Deriv(f.x,x='x')#2
f.yy <- Deriv(f.y,x='y')#2
f.xy <- Deriv(f.x,x='y')#1
#3. the critical point is at (1/3,-2/3). Verify analytically that fx and fy both equal 0 at that point.
#verify by plotting both partials aswell
f.x(1/3,-2/3) #gives 0
f.y(1/3,-2/3) #gives 0 
#true
plot3d(f.x,xlim=c(-1,2),ylim=c(-1,2),zlim=c(0,10))
plot3d(f.y,xlim=c(-1,2),ylim=c(-1,2),zlim=c(0,10))
plot3d(f,add=TRUE,xlim=c(-1,2),ylim=c(-1,2),zlim=c(0,10),col='red')
#verify that (1/3,-2/3) satisfies the conditions for a local minimum by using the second derivative test
D <- f.xx(c(1/3,-2/3))*f.yy(c(1/3,-2/3))-f.xy(c(1/3,-2/3))^2
D#3
#D > 0 and f.xx(x*,y*) >0, if D > 0 and fxx(x*,y*) > 0, then f(x*,y*) is a local minimum