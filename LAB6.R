### lab 6 intro Matrix representation of linear regression

#1. download 'Baseball2018.csv' data set and load it into R.
Baseball<-read.csv(file='Baseball2018.csv')
#2. plot winPct vs Rdiff and winPct vs ERA, which appears to be more closly related to WinPct? plot winPct vs. rdiff in 3 -space

plot(Baseball$WinPct,Baseball$Rdiff) #good positive correlation, not alot of spread in the data points.

plot(Baseball$WinPct,Baseball$ERA) #good negative correlation, kind of hard to decide which is better im leaning to Rdiff due to what seems to be lower spread.

library(rgl)
plot3d(x=Baseball$Rdiff,
       y=Baseball$ERA,
       z=Baseball$WinPct,
       col='red',
       type='s'
       )

#conclusion Rdiff correlates better.

#3. create the model matrices and estimate the linear model for WinPct as function of Rdiff and Era .Write the regression equation

X<-as.matrix(cbind(rep(1,length(Baseball$Rdiff)),Baseball[,c('Rdiff','ERA')]))
y<- as.matrix(Baseball$WinPct)

Beta_Baseball <- solve(t(X)%*%X)%*%t(X)%*%y
# WinPct = 0.521129 + 0.09477*Rdiff - 0.00492*ERA



#4. Calculate predicted values of the data. plot predicted values against actuals in 2-space and 3 space. 
#How Accurate would you say the prediction is?
Input <- Baseball[,c('WinPct','Rdiff','ERA')]

pred <- Input  %>%
  mutate(Intercept=Beta_Baseball[1],Baseball.pred=Intercept+Beta_Baseball[2]*Rdiff+Beta_Baseball[3]*ERA)

plot(Baseball$WinPct,pred$Baseball.pred)

#
plot3d(x=Baseball$Rdiff,
       y=Baseball$ERA,
       z=pred$Baseball.pred,
       col='blue',
       type='s',
       add=TRUE
       )
#just from looking it seems they are good
pred.error <- Baseball$WinPct-pred$Baseball.pred
#Mean squared error
MSE <- mean(pred.error^2)
#RMSE
RMSE <- sqrt(MSE) 
#average error to predict is around 0.027 in WinPct, which is 2.7% out of 100%. That is a good prediction.
