dataset<-read.csv('Market_Basket_Optimisation.csv',header=FALSE)     
#creating sparse matrix
dataset<-read.transactions('Market_Basket_Optimisation.csv', sep=',', rm.duplicates=TRUE) 
summary(dataset)
itemFrequencyPlot(dataset,topN=30) 

#Training apriori on the dataset
rules<- apriori(dataset, parameter=list(support=0.003, confidence=0.4))  

# Visualizing the dataset

inspect(sort(rules, by='lift')[1:10])  
