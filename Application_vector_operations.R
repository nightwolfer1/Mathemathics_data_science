#TOC:
#1.Plotting Vectors
#2.scalar multiplication
#3.Vector addition
#4. Vector subtraction
#5. vector multiplication and addition togheter
#6. Plotting vector addition

library(tidyverse)
library(plot3D)
#Plotting a single vector in 2-space
vecplot_2d<-function(vector,xax,yax,color){
  vec<-vector
  plot(vec[1],vec[2],type='p',col=color,xlim=xax,ylim=yax,xlab="",ylab="")
  arrows(x0=0,y0=0,x1=vec[1],y1=vec[2],lwd=2,col=color)
  text(x=vec[1],y=vec[2],labels=paste('(',vec[1],',',vec[2],')',sep=""),pos=3)
}
###apply the function
vecplot_2d(vector=c(1,2),xax=c(0,5),yax=c(0,5),color='red')

#Plotting a single vector in 3-space
vecplot_3d<-function(vector,xax,yax,zax,color){
  vec<-vector
  points3D(vec[1],vec[2],vec[3],type='p',col=color,xlim=xax,ylim=yax,
           zlim=zax,xlab="x",ylab="y",zlab="z")
  text3D(x=vec[1]+0.5,y=vec[2],z=vec[3],
         labels=paste('(',vec[1],',',vec[2],',',vec[3], ')',sep=""),add=TRUE)
  
  arrows3D(x0=0,y0=0,z0=0,x1=vec[1],y1=vec[2],z1=vec[3],lwd=2,col=color,add=TRUE)
  
}
###apply the function
vecplot_3d(vector=c(2,3,4),xax=c(0,5),yax=c(0,5),zax=c(0,5),col='green')


#2. scalar multiplication
v1=1:5
2*v1
#3.vector addition
v2=-(1:5)
v1+v2
#4. vector subtraction
v1-v2

#5. scalar multiplication and vector addition together
v1+5*v2


#6. plotting vector addition

vec.add.plot_2d <- function(vec1,vec2,xax,yax){
  to.plot<-as.data.frame(rbind(vec1, vec2, vec1+vec2))
  plot(to.plot[-2,]$v1, to.plot[-2,]$v2,type='p',col='red',lwd=2,xlim=xax,ylim=yax)
  
  #add arrows
  arrows(x0=0,y0=0,x1=to.plot[1,1],y1=to.plot[1,2],col='blue',lwd=2)
  
  arrows(x0=to.plot[1,1],y0=to.plot[1,2],x1=to.plot[3,1],y1=to.plot[3,2],col='green',lwd=2)
  
  arrows(x0=0,y0=0,x1=to.plot[3,1],y1=to.plot[3,2],col='red',lwd=2)
  
  #add point labels
  #to.plot%>%
   # mutate(point=paste('(',v1,',',v2,')',sep="")) -> to.plot
  #with(to.plot[-2,], text(to.plot[-2,],labels=point,pos=4))
}
###apply the function
vec.add.plot_2d(vec1=c(1,2),vec2=c(3,4),xax=c(0,10),yax=c(0,10))

### in 3-space
vec.add.plot_3d <- function(vec1, vec2, xax, yax, zax, phi, theta){
  points3D(x=vec1[1], y=vec1[2], z=vec1[3], col='red',
           xlim=xax, ylim=yax, zlim=zax,
           phi=phi, 
           theta=theta)
  
  text3D(x=vec1[1], y=vec2[1], z=vec1[3]+0.25,
         labels=paste("(",vec1[1], ",", vec1[2], ",", vec1[3], ")", sep="" ),add=TRUE)
  
  arrows3D(x0=0, y0=0, z0=0, x1=vec1[1], y1=vec1[2], z1=vec1[3], lwd=2, col='blue', add=TRUE)
  
  
  points3D(x=vec1[1]+vec2[1], y=vec1[2]+ vec2[2], z=vec1[3]+vec2[3], col='green',
           xlim=xax, ylim=yax, zlim=zax,
           xlab="x", ylab="y", zlab="z", add=TRUE)
  
  arrows3D(x0=vec1[1], y0=vec1[2], z0=vec1[3], x1=vec1[1]+vec2[1], y1=vec1[2]+vec2[2], z1=vec1[3]+ vec2[3],
           lwd=2, col='red', add=TRUE)
  
  
  vec3 <- vec1+vec2
  
  points3D(x=vec3[1], y=vec3[2], z=vec3[3],
           col='red',
           xlim=xax, ylim=yax, zlim=zax,
           xlab="x", ylab="y", zlab="z", 
           add=TRUE)
  
  text3D(x=vec3[1], y=vec3[1], z=vec3[3],
         labels=paste("(",vec3[1], ",", vec3[2], ",", vec3[3], ")", sep="" ),add=TRUE)
  
  arrows3D(x0=0, y0=0, z0=0, x1=vec3[1], y1=vec3[2], z1=vec3[3],
           lwd=2, col='green', add=TRUE)
  
}

###apply function
vec.add.plot_3d(vec1=c(1,2,3),vec2=c(4,5,6),xax=c(0,10),yax=c(0,10),zax=c(0,10),phi=0,theta=30)



#Lab 2 Intro Vector Operations
#1. multiply vector v1=[3 5] by -3 what is the result?
v1=c(3,5)
-3*v1  #-9 -15
#2. add v2 to v1 where v2=[4 2]. what is the result?
v2=c(4,2)
v2+v1 # [7 7]
#3. what is the sum of v2 and twice v1
v2+2*v1 #[10 12]
#4. plot v1 and v2, along with the sum,v1 + v2
vec.add.plot_2d(v1,v2,xax=c(0,10),yax=c(0,10)) #[7 7]
#5. add v3=[0 4 3] and v4=[4 7 5]. what is the result?
v3=c(0,4,3)
v4=c(4,7,5)
v3+v4 #[4 11 8]
#6. plot v3 and v4 , along with their sum,v3 + v4. change the perspective to get a better view of the vectors
vec.add.plot_3d(v3,v4,xax=c(0,15),yax=c(0,15),zax=c(0,15),phi=20,theta=20)

