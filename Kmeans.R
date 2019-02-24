

dataset<- read.csv("Iris.csv")
str(dataset)
df<- dataset[,2:5]
#scaling is only done on continuous variable and not on categorical one
df <- scale(df)

# we dont know how many clusters we need to use

#using the elbow method
wcss <- vector()
for (i in 1:10) {
  wcss[i] <- sum(kmeans(df,i)$withinss)
}

plot(1:10, wcss, type = "b",
     xlab = "No of Clusters",
     ylab = "WCSS",
     main = " Cluster of Iris")

#k-means clusters
kmeans <- kmeans(df,3, iter.max = 200, nstart= 10)
kmeans

install.packages("cluster")
library(cluster)
clusplot(df,kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         xlab = "species",
         ylab = "clusters",
         main = paste("Species by features"))


# to get the list of results

result <- data.frame(cbind(dataset$Id,kmeans$cluster))

colnames(result) <- c("Customer-Id", "ClusterNumber")

filter1<- result[result$ClusterNumber == "1",]
filter2<- result[result$ClusterNumber == "2",]
filter3<- result[result$ClusterNumber == "3",]








