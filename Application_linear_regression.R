#TOC
#1. Deterministic example
#2. Stochatic example
#3. Model error
library(tidyverse)

#1. Determinstic example
#create hot dog data and plot

hot.dogs<- 0:20 #the number of hot dogs purchased
fries <-0:20#number of fries purchased
game.cost<- expand.grid(hot.dogs, fries)#gives us all of the possible combinations of hot dogs and fries.
colnames(game.cost)<-c('Hot.Dogs','Fries')
game.cost<-game.cost %>%
  mutate(ticket=20,Total.Cost =ticket + 3*Hot.Dogs+2*Fries )


###create a plot
# library(rgl)
# plot3d(x = game.cost$Hot.Dogs,
#        y = game.cost$Fries,
#        z = game.cost$Total.Cost,
#        type = 'p',
#        col = 'green',
#        xlim = c(0,20),
#        ylim = c(0,20),
#        zlim = c(0,120),
#        xlab = 'Hot Dogs Purchased',
#        ylab = 'French Fries Purchased',
#        zlab = 'Total Cost')

# use lm() function to estimate a linear regression model, estimate total cost as a function of hot dogs and fries.
hot.dog.model <- lm(Total.Cost ~ Hot.Dogs+Fries, data=game.cost)
hot.dog.model
summary(hot.dog.model)

#2. Stochastic example
view(mtcars)

###create a plot
# plot3d(x = mtcars$wt,
#        y = mtcars$qsec,
#        z = mtcars$mpg,
#        type = 's',
#        col = 'green',
#        xlim = c(min(mtcars$wt)-1,max(mtcars$wt)+1),
#        ylim = c(min(mtcars$qsec)-1,max(mtcars$qsec)+1),
#        zlim = c(min(mtcars$mpg)-1,max(mtcars$mpg)+1),
#        xlab = 'Wt',
#        ylab = 'Qsec',
#        zlab = 'MPG')
       
#Use lm() to fit a linear regression model
mpg.model <- lm(mpg ~ wt + qsec,data = mtcars)
mpg.model #MODEL: mpg = 19.75 -5.05*wt + 0.93*qsec + e




#3. Model error
#Different outputs
mpg.model #gives the beta vector
summary(mpg.model)

#Calculate error measures for the model
error.measures <- as.data.frame(cbind(mtcars$mpg,mpg.model$fitted.values))
colnames(error.measures)<-c('Actuals','Predicted.Values')
error.measures <- error.measures %>%
  mutate(error=Actuals-Predicted.Values,
         squared.error=error^2)

#why square the error?
sum(error.measures$error)
#why is the sum 0? Its by design, our regression equation fits perfectly balanced through the actual data.
#when the model was fit the estimated values will fall between the real data, with some higher than the real and some lower 
#then the real where they cancel eachother out.
boxplot(error.measures$error)
boxplot(error.measures$squared.error) #knocks all errors out of scale and distorts the destribution.

#Mse and Rmse
mean.squared.error <- mean(error.measures$squared.error)#falls under the third quartile, not very representative
root.mse<-sqrt(mean.squared.error)#falls around the mean, measure of total error in the model.

###lab 5
#1. download 'Baseball2018.csv' data set and load it into R.
Baseball<-read.csv(file='Baseball2018.csv')

#2. plot Runs vs. HomeRun and Runs vs. H9 
plot(x=Baseball$Runs, y=Baseball$HomeRun, col='blue')
plot(x=Baseball$Runs, y=Baseball$H9, col='black')
#we can se a trend that as homerun increases runs increases, however  for H9 the trend seems more negativly correlated with higher spread.

#plot Runs vs.Homerun and H9 in 3-space.

plot3d(x = Baseball$HomeRun,
       y = Baseball$H9,
       z = Baseball$Runs,
       col = 'green',
       type='s',
       xlim = c(min(Baseball$HomeRun)-1 , max(Baseball$HomeRun)+1),
       ylim = c(min(Baseball$H9)-1 , max(Baseball$H9)+1),
       zlim = c(min(Baseball$Runs)-1, max(Baseball$Runs)+1),
       xlab = 'HomeRun',
       ylab = 'H9',
       zlab = 'Runs'
)



#3. Use lm() function to estimate the linear regression model for runs as a function of homerun and h9.

Model.Runs<- lm(Runs ~ HomeRun + H9,data = Baseball)
Model.Runs #  Regression Equation: Runs = 5.15 + 0.01*HomeRun  - 0.29 * H9
summary(Model.Runs)
#Plot fitted values vs actual values
plot(fitted.values(Model.Runs),Baseball$Runs,col = 'green', type='p')
#you can see a good correlation between fitted values and true values.
#how accurate would you say the predictions are?
#R squared is around 0.7 which means 70 % of the variance can be explained by the model, its decent but not perfect


#4. Calculate RMSE for the model and offer an interpretation for the value in the context of the problem does this change your perception of the 
#quality of the model?
#error.measures <- as.data.frame(cbind(mtcars$mpg,mpg.model$fitted.values))
#lets first calculate error of the model 
model.error<- as.data.frame(cbind(Baseball$Runs,Model.Runs$fitted.values)) 
colnames(model.error)<- c('Real.runs','Pred.runs')
model.error <- model.error %>%
  mutate(error=Real.runs-Pred.runs,
         squared.error=error^2)
#Mean Seaured Error
MS.error<-mean(model.error$squared.error)
#Root Mean Squared Error
RMS.error<- sqrt(MS.error)
RMS.error #RMSerror is approx 0.238 which mean in average the model gives a wrong prediction of approx 0.24
#what is the mean number of runs?
mean(model.error$Real.runs)#4.45 which mean the model is giving a very accurate estimation.


