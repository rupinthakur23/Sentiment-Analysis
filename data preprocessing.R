 dataset<- read.csv("Data.csv")          
dataset$Salary<- ifelse(is.na(dataset$Salary),
                           ave(dataset$Salary, FUN= function(x) mean(x, na.rm=TRUE)),
                            dataset$Salary)  
dataset$Age <- ifelse(is.na(dataset$Age), ave(dataset$Age, FUN= function(x) mean(x, na.rm=TRUE)),
                      dataset$Age
                      )                           
dataset$Country <- factor( dataset$Country,
                           levels= c('France','Spain' ,'Germany'),
                           labels= c(1,2,3))                            

)                          
 dataset$Purchased <- factor( dataset$Purchased,
                            levels= c('Yes','No'),
                            labels= c(23,9))  
 #splitting the dataset into training set
 set.seed(123)
 split=sample.split(dataset$Purchased,SplitRatio = 0.7) 
View(split)  
training_set= subset(dataset, split==TRUE) 
test_set= subset(dataset, split==FALSE)  
#Future scaling

training_set[,2:3] = scale(training_set[,2:3]) 
test_set[,2:3] = scale(test_set[t,2:3])  
