# TODO: Add comment
# 
# Author: PatriciaHoffman
###############################################################################
rm(list=ls())
require("rpart")

setwd("/Users/ekoontz/ml101")

# create the model (use the "train" function in R)
train<-read.csv("table4_8pg199.txt",header=TRUE)
y<-as.factor(train[,5]) #class labels 0 or 1
x<-train[,2:4]
str(train)
x;y
is.numeric(train$a3)

# Tree of maxdepth = 5
fit<-rpart(y~.,x,control=rpart.control(minsplit=0,minbucket=0,cp=-1,
				maxcompete=0, maxsurrogate=0, usesurrogate=0, 
				xval=0,maxdepth=5))

1-sum(y==predict(fit,x,type="class"))/length(y)
# returns 0  all correct
plot(fit)
text(fit)
print(fit)

# Tree of maxdepth = 2
fit<-rpart(y~.,x,control=rpart.control(minsplit=0,minbucket=0,cp=-1,
				maxcompete=0, maxsurrogate=0, usesurrogate=0, 
				xval=0,maxdepth=2))

1-sum(y==predict(fit,x,type="class"))/length(y)
# returns 0.222  20% error
plot(fit)
text(fit)

fit

print(fit)