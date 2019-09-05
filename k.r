dataset<-read.csv('Mall_Customers.csv') 
x<-dataset[4:5] 

#Using the elbow mwthod to find optimal number of clusters
set.seed(6) 
wcss<-vector() 
for(i in 1:10)wcss[i] <- sum(kmeans(x,i)$withins) 

plot(1:10,wcss,type='b',main='Yippe', xlab='Number of clusters', ylab ='wcss')  

#applying kmeans to dataset
set.seed(29)
kmeans<- kmeans(x,5,iter.max = 300, nstart = 10) 

#Visualizing
clusplot(dataset,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income', 
         ylab = 'Spending Score')    
  