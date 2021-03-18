#Task 2
#Prediction using Unsupervised ML


#required libraries
library(ggplot2)
iris_d<-read.csv("C:\\Data science\\Iris.csv")
iris_df<-data.frame(iris_d)
View(iris_df)

#EDA of the dataset
summary(iris_df)
sapply(iris_df[,-5], var)
ggplot(iris_df,aes(x = SepalLengthCm, y = SepalWidthCm, col= Species)) + geom_point()
ggplot(iris_df,aes(x = PetalLengthCm, y = PetalWidthCm, col= Species)) + geom_point()



#Clustering algorithm 
set.seed(200)
k.max <- 10
wss<- sapply(1:k.max,function(k){kmeans(iris_df[,3:4],k,nstart = 20,iter.max = 20)$tot.withinss})
wss

plot(1:k.max,wss, type= "b", xlab = "Number of clusters", ylab = "Within cluster sum of squares")
icluster <- kmeans(iris_df[,3:4],3,nstart = 20)
table(icluster$cluster,iris_df$Species)

plot(iris_df[c("PetalLengthCm","PetalWidthCm")],col=icluster$cluster)
plot(iris_df[c("SepalLengthCm","SepalWidthCm")],col=icluster$cluster)
