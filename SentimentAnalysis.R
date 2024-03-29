
# Natural Language Processing

# Importing the dataset
dataset_original = read.delim('good.txt', quote = '', stringsAsFactors = FALSE) 

# Cleaning the texts
# install.packages('tm')
# install.packages('SnowballC')
library(tm)
library(SnowballC)
data<-sapply(dataset_original$Reviews,function(x) iconv(enc2utf8(x),sub='byte')) 
corpus = VCorpus(VectorSource(data)) 
corpus = tm_map(corpus, content_transformer(tolower))
corpus = tm_map(corpus, removeNumbers)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords())
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, stripWhitespace)


# Creating the Bag of Words model
dtm = DocumentTermMatrix(corpus) 
dtm = removeSparseTerms(dtm, 0.999)     
dataset = as.data.frame(as.matrix(dtm))  
dataset$Rating= dataset_original$Rating 


# Encoding the target feature as factor
dataset$Rating = factor(dataset$Rating, levels = c(0, 1)) 

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Rating, SplitRatio = 0.8) 
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Fitting Random Forest Classification to the Training set
# install.packages('randomForest')
library(randomForest)
classifier = randomForest(x = training_set[-2538],
                          y = training_set$Rating,
                          ntree = 10) 

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-2538])

# Making the Confusion Matrix
cm = table(test_set[, 2538], y_pred) 
