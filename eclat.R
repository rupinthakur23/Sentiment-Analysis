dataset<-read.csv('Market_Basket_Optimisation.csv',header=FALSE)     
#creating sparse matrix
dataset<-read.transactions('Market_Basket_Optimisation.csv', sep=',', rm.duplicates=TRUE) 
summary(dataset)
itemFrequencyPlot(dataset,topN=30) 

#Training eclat on the dataset
rules<- eclat(dataset, parameter=list(support=0.003, minlen=2))   

# Visualizing the dataset
 
inspect(sort(rules, by='support')[1:10])   
