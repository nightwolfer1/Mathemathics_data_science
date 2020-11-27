#LAB1 
#load the data
mpg <- mpg
#1. view the 6 first observations of the data
#by using head function
head(mpg)
#by slicing into the database all features row 1->6 with indexing functionality
mpg[1:6,]

#2.what is the average of cty for compact cars
mpg%>%
  filter(class == "compact")%>%   #filtering by compact
  summarise(mean.cty.compact=mean(cty)) #summarising by the mean of cty of the compact class.
#the mean for cty in the class compact is 20.1

#create a new dataframe that has five variables, manufacturer,class,cyl,mean.hwy and hwy.per.cyl
#first mutate the new feature telling us the hwy per cyl by by dividing them
#then we group by the features we are want to look at (manufacturer,class,cyl)
#last step is to summarise to who the last two features, by using the mean in the grouped by data for
#hwy and hwy.per.cyl
df =mpg%>%
    mutate(hwy.per.cyl=hwy/cyl)%>%
    group_by(manufacturer,class,cyl)%>%
    summarise(mean.hwy=mean(hwy),hwy.per.cyl=mean(hwy.per.cyl))
    
 
  
#plot hwy against cty for all 2008 models
plot(x=filter(mpg,year==2008)$hwy,y=filter(mpg,year==2008)$cty,col='blue',xlab=' hwy 2008 models',ylab=' cty 2008 models')
