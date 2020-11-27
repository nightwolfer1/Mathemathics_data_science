#seq() and rep() can create vectors
#v10=seq(#from=1,#to=10,#by=0.1)
#rep(#number,#times to repeat)
#Lab 1 Intro Scalar Vectors and Matrices
#1 Create a 3x4 Matrix A and fill it row wise with the numbers 1-12, what is
#a24
A=matrix(1:12,nrow = 3, ncol=4,byrow=TRUE)
A[2,4] #is 11
#rbind() can create matrix , rbind(v1,v2) v1 is row 1 and v2 row 2
#cbind() can also create matrix same as rbind but columns instead

#2 create two 1x2 vectors,v1 and v2 with numeric entries of your choice plot v1 and v2
#on the same coordinate plane.
v1=c(1,2)
v2=c(3,4)
plot(v1[1],v1[2],type='p',col='red', xlim=c(0,5),ylim=c(0,5))
arrows(x0=0,y0=0,x1=v1[1],y1=v1[2], lwd=2)
points(v2[1],v2[2],type='p',col='blue')
arrows(x0=0,y0=0,x1=v2[1],y1=v2[2], lwd=2,col='grey')

#Now add 3 to the second entry in v1 and re-plot. Describe
#the position of the new vector in 2-pace relative to v1
v1=c(1,3)
points(v1[1],v1[2],type='p',col='red')
arrows(x0=0,y0=0,x1=v1[1],y1=v1[2], lwd=2,col='red')

#create 1x3 vecotr,v3,with numeric entries of your choice. Plot v3 in -3space
v3=c(1,5,8)
#install.packages(('plot3D'))
#library(plot3D)
points3D(x=v3[1],y=v3[2],z=v3[3],col='red',xlim=c(0,5),ylim=c(0,5),zlim=c(0,10),phi=0)
arrows3D(x0=0,y0=0,z0=0,x1=v3[1],y1=v3[2],z1=v3[3],lwd=2,add=TRUE)

