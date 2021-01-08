#Lab 3 Intro Vectors Gradient descent

#1. define and plot the function f(x,y) = x^2 +xy + y^2 +y for x and y between -10 and 10. plot the function

f <- function(x,y) x^2+x*y+y^2+y
plot3d(f,xlim=c(-10,10),ylim=c(-10,10),zlim=c(-2,10),col='red')

#2. run gradient descent on f to find its minimum using (0,0) as initial point and second using (5,5)

#define the partial derivatives of f.
f.x <- Deriv(f,x='x')
f.y <- Deriv(f, x='y')

#intitial points
x=5
y=5

#number of iterations and alpha
alpha=0.01
n.iter=500

#storing points
f.history=numeric(n.iter)
x.history=numeric(n.iter)
y.history=numeric(n.iter)

for(i in 1:n.iter){
  #gradients at each step
  x.gradient=f.x(x,y)
  y.gradient=f.y(x,y)
  #new starting points
  x=x-alpha*x.gradient
  y=y-alpha*y.gradient
  #storing the x,y values for each step and where in the function we are located after each move.
  x.history[i]<-x
  y.history[i]<-y
  f.history[i]<-f(x,y)
}

plot(f.history)
#plot(x.history,y.history)
#with initial starting point (0,0) the function converges to -1/3 as minimum value and should be found at around  300 iterations
#x is 1/3 and y is -2/3 at the minumum
#plot(x.history,y.history)
#with initial starting point (5,5) the function converges to -1/3 as minimum value and should be found at around  300 iterations
#x is 1/3 and y is -2/3 at the minimum

#a)compare the numbers of iteration required for each run before convergence. Does this make any sense? what do you think happens?
#It does make sense, i think the reasaon for a faster convergence at (5,5) is that it takes steper steps at that starting points, 
#what i mean by that is that at 5,5 we have a steper path from the start even if it starts longer from the minimum
#looking at the function its not a even path at any point if the function was x^2 +y^2 then starting point (0,0) is faster.


#3. plot the path taken by each run
plot3d(f,xlim=c(-5,5),ylim=c(-5,5),col='green')
points3d(x.history,y.history,f(x.history,y.history),col='red')



#4. propose starting points that would satisfy the following criteria
#a) take less iterations to reach convergence than point(5,5)
#could take same path but start closer to minumum, looking at x history and y history x=2.000 y=1.775
#b) take more iterations to reach convergence than the point (5,5)
#that would be somthing very far from the minumum (40,40)
#c)take same numbers of iteration to reach (5,5)
#looking at the plot (-5,-5) has the same shape and stepness in the parth of the curve
#i would say (-5,5) #reach -1/3 at 217 iterations, (5,5) reaches -1/3 at 218 so almost identical might be rounding differences.
#or somthing very close to (5,5)