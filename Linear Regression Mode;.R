 
project<- read.csv(file.choose())  

set.speed(123)
split= sample.split(project$Salary, SplitRatio=2/3)    

training_set= subset( project, split==TRUE) 
test_set= subset( project, split==FALSE) 

#fitting Simple Linear Regression into Training Set

regressor= lm(formula= Salary~YearsExperience, data=training_set) 

#Predicting the test result
y_predict= predict(regressor,newdata = test_set) 
View(y_predict) 

#Visualize the dataset
ggplot() +
    geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary) , colour= 'red') + 
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor,newdata = training_set)) , colour='blue') +
  ggtitle('Salary vs Experience(Training Set)') +
  xlab('Years Experience') +
  ylab('Salary')
  
#Visualize the dataset
ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary) , colour= 'red') + 
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor,newdata = training_set)) , colour='blue') +
  ggtitle('Salary vs Experience(Test Set)') +
  xlab('Years Experience') +
  ylab('Salary')
















  
  
  
  
  
  