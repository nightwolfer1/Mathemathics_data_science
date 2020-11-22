##assignments Operators
data.00 <- mtcars
#calling the columns
data.00$mpg
#calling column with [i,j] notation
data.00[,"mpg"] #can be done numerically
#subset of rows
data.00[1:5,1]

head(data.00) #6 first rows in data set with all columns
tail(data.00) #last 6 -:-
str(data.00)# structure tells us what is in the database, data type...


##
library(tidyverse)

#1. every column is a unique variable.
#2. every row is a unique observation.
#3. Only keep what you need in a data set

##working with what you have
filter(data.00, cyl == 4)#filters data to cases that only have 4 cylinders, row subseting function
select(data.00, mpg,cyl)#column subseting function

data.00%>% #piping operator, it tells R, that we are going to take data.00 and pip it into a function
  filter(cyl==4)
data.00%>%
  select(mpg,cyl)%>%
  filter(cyl==4)

###creating somthing new using mutate (gives a new column/feature)
data.00%>%
  mutate(mpg.per.cyl=mpg/cyl)%>%
  group_by(cyl)%>%#grouping by how many cylinders the cars have
  summarise(mean.mpg.per.cyl = mean(mpg.per.cyl))#summarise function collapses our dataframe so that each value 
  #of cylinder only gets on record.

#quick plot
plot(x=data.00$cyl,y=data.00$mpg,xlab='Cylinder',ylab='Miles Per Gallon',col='red',main='MPG by number of cylinders')