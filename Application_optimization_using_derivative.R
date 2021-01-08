#TOC
#1. solving for zero
#2. second derivative test

#1. solving for zero
library(Deriv)
f<- function(x) -0.02*x^2+0.75*x
plot(f,xlim=c(0,40),col='green')
f.prime<- Deriv(f)
f.prime
curve(f.prime,col='red',add=TRUE)
abline(h=0,lty=3)




##does f.prime =0 at the critical value? Yes.

##use uniroot() to solve for zero
critical.points <- uniroot(f.prime,interval=c(15,25))$root#uniroot searches tehe given interval
#to ifnd where the function equals zero


##find the extreme value by plugging the critical point into f
f(critical.points)


#2. second derivative test
f.prime.prime <- Deriv(f.prime)
f.prime.prime

abline(h=-0.04)

## 2 D.T says
### if f'(x) = 0 and f''(x) > 0, then f(x) is a local min
### if f'(x) = 0 and f''(X) < 0, then f(x) is local max
#Here, f.prime.prime=-0.04 which is always <0 so f(18.75) is a local max
