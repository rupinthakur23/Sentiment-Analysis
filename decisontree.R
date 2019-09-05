dataset<-read.csv('Position_Salaries.csv')  
dataset = dataset[2:3] 

# Fitting decison tree regression to dataset
regressor= rpart(formula= Salary ~ ., data=dataset, control=rpart.control(minsplit=0.1))   

#predicting a new result
y_pred= predict(regressor, data.frame(Level=6.5)) 

#visualising the result

x_grid= seq(min(dataset$Level), max(dataset$Level), 0.01) 
ggplot() +
  geom_point(aes(x=dataset$Level, y=dataset$Salary), colour='red') +
  geom_line(aes(x=x_grid, y=predict(regressor, newdata = data.frame(Level=x_grid))), colour='blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')  
