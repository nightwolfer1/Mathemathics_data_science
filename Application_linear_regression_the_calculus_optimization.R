#linear regression the calculus optimization perspective
#1. the model error function
#2. minimizing model error using partial derivatives
#recall y = b0 +b1x1 + b2x1 ... + bkxk + error
#from the mtcars model, mpg = 19.75 + (-5.05)*wt+0.93*qsec + error
#if y is the actual response for each obervation, then y* is the estimated response
#from the regression model.
#residual ( error in the estimate for each obervation) is equal to y-y*
#linear regression chooses values for beta(b) such that the sum of squared errors is minimized
#in other words, the 'loss' function can be expressed as: L=sum(error^2)=sum((y-y*))...
#square for error gives a function, that depends on betas, to find optimized value (minimization) we have to
#find where the partial derivatives are 0 for each partial derivative function. This will enable us to find the 
#critical points.
#extending that intuition to think in the terms of matrices L=e^2=e*e^T... (y-XB)^T(y-XB)..=y^Ty -B^TX^Ty-y^TXB+B^TX^TXB
#Turns out that B^TX^Ty and y^TXB and B^TX^Ty evaluates to the same scalar value so we have L=y^Ty-2B^TX^Ty+B^TX^TXB
#to minimize error (loss), use partial derivatives of L.
#dL/dB(b0,b1...,bk)=2X^Ty-2X^TXB=0 -> X^TXB=X^Ty  we can now multiply by the inverse (X^TXB)^-1 
#B=(X^TXB)^-1X^Ty expressed the loss function matrices and found the optimum with the partial derivatives.


#TOC:
#1. viewing residuals
#2. interpreting SSE and RMSE
library(tidyverse)

#1. viewing residuals
mod1 <- lm(mpg~wt, data =mtcars)
summary(mod1)
##plot actuals and predicted values
summary(mtcars$mpg)
summary(mod1$fitted.values)

plot(x=mtcars$wt,y=mtcars$mpg,ylim=c(8,30),col='blue')
points(x=mtcars$wt,y=mod1$fitted.values,col='red')

##plot residuals directly
plot(mod1$residuals)#residuals should be centered around 0 with no pattern
abline(h=0,lty=3)

#SSE, the sum of the individual squared errors is about 278
#this means there are about 278 units of squared error in the model
#this is the least amount of error available for any linear model between mpg - wt

#RMSE, the mean of the individual squared error is 9.7
#the squared root of the mse (RMSE) is 2.95
#this means the predicted values are about 2.95 from the actual values on average



