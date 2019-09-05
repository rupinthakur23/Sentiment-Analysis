#importing our dataset
dataset<-read.csv('Mall_Customers.csv')  
x<-dataset[4:5] 

#Finding the optimal no of clusters
dendogram<-hclust(dist(x,method='euclidean'), method='ward.D') 
plot(dendogram, main='Clusters',xlab='Customers', ylab='Distance') 

#Fitting clustering to dataset
hc<-hclust(dist(x,method='euclidean'), method='ward.D')
y_hc<- cutree(hc,k=5) 

clusplot(x,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income', 
         ylab = 'Spending Score')    
