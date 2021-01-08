#1. Translting Linear Regression Components to matrices

#2. Calculating the b vector (containing the independent factors of linear regression)

#3. Deterministic Example (b vector is known)

#TOC: 
#1. Determinstic example
#2. Stochastic example
#3. calculated predicted values


#1. Determinstic example
y<-c(24,30,41)#cost vector (Dependent variable)
x.0 <- rep(1,3) #beta0 unit vector for intercept term
x.1 <- c(0,2,5) #number of hot dogs purchased
x.2 <- c(2,2,3) #number of fries purchased

X<- cbind(x.0,x.1,x.2)

#Calculate beta vector
beta <- solve(t(X)%*%X)%*%t(X)%*%y


#2. Stochastic example
View(mtcars)
#Define mtcars data (desired model: mpg ~ wt+qsec) #converting to matrix to be able use matrix operations, else
#it would be data.frame objects.
y <- as.matrix(mtcars$mpg) #dependent variable
X <-as.matrix(cbind(rep(1,length(mtcars$mpg)),mtcars[,c('wt','qsec')]))
#Calculate beta vector
beta_mtcars <- solve(t(X)%*%X)%*%t(X)%*%y
beta_mtcars#from last time we solved this beta values, should be 19.75,-5.05 and 0.93 (result was the same with unrounded values)

library(tidyverse)
#3. Calculate predicted values
inputs <- mtcars[,c('mpg','wt','qsec')]
pred <- inputs %>%
  mutate(Intercept=beta_mtcars[1],
         mpg.pred=Intercept+beta_mtcars[2]*wt+beta_mtcars[3]*qsec)
plot(mtcars$mpg,pred$mpg.pred)

