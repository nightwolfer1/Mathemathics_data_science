#lab 5 calculus
#1. from the mtcars data set, fedine the model matrices for a linear regression of mpg=wt+hp. calculate the beta vectors

#first load the data
library(tidyverse)
#B=(X^TX)^-1X^Ty expressed the loss function matrices and found the optimum with the partial derivatives
y=as.matrix(mtcars$mpg)
X=as.matrix(cbind(rep(1,length(mtcars$mpg)),mtcars$wt,mtcars$hp))
beta=solve(t(X)%*%X)%*%t(X)%*%y #mpg =37.23 -3.88*wt - 0.032*hp (beta0 =37.23 beta1=-3.88,beta2=-0.032)

#2. evaluate that B^TX^Ty and y^TXB evaluate to the same scalar.
ev1<-t(beta)%*%t(X)%*%y #13847
ev2<-t(y)%*%X%*%beta#13847

#3. validate that partial derivative dl/dbeta =-2X^Ty+2X^TXB =0
part_der<--2*t(X)%*%y+2*t(X)%*%X%*%beta # gives (0,0,0) partial derivates equals 0
#a)what dare the dimensions of the resulting vector
#it has a partial derivative beta in (3,1) dimensions, and is a 3dimensional function. This makes sense because we are doing linear regression
#with regard to two features (two dimensions) (two independent variables and one dependent variable mpg) meaning we have three beta coefficient beta0 is for the intercept.

#4.fit the model using lm() function
model <- lm(y~X)
#a) plot actual and predictes values, as well as the residuals comment on the distribution of the residuals
summary(mtcars$mpg)
summary(model$fitted.values)
library(rgl)
plot3d(x=X[,2],y=X[,3],z=y,zlim=c(8,30),col='blue')#X[,2] is wt, X[,3] is hp from mtcars and z is mpg.
plot3d(x=X[,2],y=X[,3],z=model$fitted.values,col='red',add=TRUE,type='s') #the Z values for fitted values are respressented as a plane with regards to wt and hp.
##plot residuals directly
plot(model$residuals)#residuals should be centered around 0 with no pattern
abline(h=0,lty=3)
#the residual is centered around 0 the first 20 points seems some kind of wave like pattern specially at the end of the points.

#b) calculate the SSe and RMSE and offer interpretation for each
fit.stats <- as.data.frame(cbind(mtcars$mpg,model$fitted.values))%>%
  mutate(error=mtcars$mpg-model$fitted.values,squared.error=error^2)
#SSE
SSE=sum(fit.stats$squared.error)
SSE#195 this is the lower possible squared error that can be produced with the fitted line changing the lin would simply give a 
#bigger distance between modeled plane and true values.

#RMSE
RMSE=sqrt(mean(fit.stats$squared.error))
RMSE#2.4688 on average the predicted error for each prediction of the model is around 2.468

#c) recall the RMSE for the model mpg = wt was about 2.95 what does this tell you about using hp as predictor for mpg?
#The hp data will give a improved prediction value, therefor it does contain some information that is usfull for the regression
