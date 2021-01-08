#Lab 2 Vectors Calculus.

#1. load the baseball 2018 data set and retain Runs,RunsAgainst and Rdiff
baseball <- read.csv('Baseball2018.csv')
baseball2018<-baseball[c('Runs','RunsAgainst','Rdiff')]

#Create Covarience matrix and explain what each entry means
baseball.cov <- cov(baseball2018)
baseball.cov

#the matrix returned by the covariance explains the variance within the data set
#the diagonal explains the variance of each vector with itself
# in (1,2) (row 1 , col 2) is the variance between Runs and RunsAgainst
# in (1,3) is the variance between Runs and Rdiff
#in (2,3) is the variance between RunsAgainst and Rdiff 

#3. create the eigen decomposition for the data set how many eigen vectors are needed to account
#for almost all variation in the data?

eigen.cov<-eigen(baseball.cov)
eigen.cov

#as can be seen from the eigenvalues the third eigen value correponding to the third eiegencavtors is very small
#therfor almost all variation of the data can be explained by just the first two eigenvectors.