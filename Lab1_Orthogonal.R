#lab1 orthogonal vectors
#1. create  a pair of orthgonal 2-dimensional vectors
v1 <- c(1,-3)
v2 <- c(3,1)
v1%*%v2 #ass can be seen the cross product is 0 which means the vectors are orthogonal

#2. create a pair of orthogonal 3-dimensional vectors.
v3 <- c(1,1,2)
v4 <-c(-1,1,0)
v3%*%v4# is 0 same reason as mentioned above.

#3. load the baseball2018 data set
baseball <- read.csv('Baseball2018.csv')
#a) the variable game is a linear combination of wins and losses (games = wins + losses) there is one more variable
#that is linear combination of the two other variables. Express this in the form 
#v3=c1*v1+c2*v2

#wins + losses, WinPct is Wins/losses
Baseball.model <- lm(Games ~ Wins+Losses+WinPct,data = baseball) # Games = 1*wins+1*losses
summary(Baseball.model) 

Baseball2.model <- lm(Runs ~ Rdiff+RunsAgainst, data=baseball)
summary(Baseball2.model)
#Runs is a linear combinations of Rdiff + RunsAgaingst
#Runs = c1*Rdiff+c2*RunsAgainst
#reviewing the solutions rdiff = 1*Runs+(-1)*RunsAgainst, however it dosent mather since they all can be seen as linear
#combinations of eachother, however the model fit will differ.

#b)+c) for the variables i found in part a fit a linear regression model of WinPct v1+v2 and WinPct v3
Baseball3.model <- lm(WinPct ~ Rdiff, data=baseball)
Baseball4.model <- lm(WinPct ~ Runs+RunsAgainst, data = baseball)
#WinPct = 0.5+0.097*Rdiff
#WinPct = 0.51+0.096*Runs-0.098*RunsAgainst
plot(Baseball3.model$fitted.values,Baseball4.model$fitted.values)
abline(a=0,b=1,col='red')
#4)Having one variable is better than two if the one variable is a linear combination of the others since it contains all
#the information, having less independent variables is better since it gives a lower chance of introducting bad data points.