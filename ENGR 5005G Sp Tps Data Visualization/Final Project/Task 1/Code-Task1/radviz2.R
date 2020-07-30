#Install all libraries
library(Radviz)
library(ggplot2)
library(dplyr)
library(tidyr)

#Load the objective data
data1<- read.csv("test1.csv")

#Convert the dataset into dataframe
ref.df <- data.frame(data1)

#Normalizing the data
trans <- function(coln) do.L(coln,fun=function(x) quantile(x,c(0.005,0.995)))

#Plot the histogram for one objective
hist(ref.df$F1)
abline(v=quantile(ref.df$F3,c(0.005,0.995)),
       col=2,lty=2)

#Defining the anchors
ct.S <- make.S(dimnames(data1)[[2]])

##Optimizing the position of anchors
#Compute the similarity matrix
ct.sim <- cosine(as.matrix(ref.df[,row.names(ct.S)]))
#The current Radviz-independent measure of projection efficiency
in.da(ct.S,ct.sim)
#The current Radviz-independent measure of projection efficiency
rv.da(ct.S,ct.sim)

#Optimization procedure
optim.ct <- do.optimRadviz(ct.S,ct.sim,iter=100,n=1000)
ct.S <- make.S(get.optim(optim.ct))

#Projection
ct.rv <- do.radviz(ref.df,ct.S,trans=trans)

dim(ct.rv)

plot(ct.rv,anchors.only=FALSE)
plot(ct.rv)+ geom_point()

plot(ct.rv)+
  geom_point(data=. %>% 
               arrange(F1),
             aes(color=F1))+
  scale_color_gradient(low='grey80',high="dodgerblue4")
smoothRadviz(ct.rv)

contour(ct.rv)

cur.pop <- 'igm+'
sub.rv <- subset(ct.rv,refAnnots$Cells==cur.pop)
smoothRadviz(ct.rv)+
  geom_density2d(data=sub.rv$proj$data,
                 aes(x=rx,y=ry),
                 color='black')

hexplot(ct.rv)

hexplot(ct.rv,color='F1')