# TODO: Add comment
# 
# Author: mike-bowles
###############################################################################

setwd("/Users/ekoontz/ml101/sonar")
train<-read.csv("sonar_train.csv",header=FALSE)
require(rpart)
nxval <- 10
ndepth <- 10
trainOutput <- matrix(0.0,nrow = ndepth, ncol = 2)
testOutput <- matrix(0.0,nrow =ndepth, ncol = 2)
I <- seq(from = 1, to = nrow(train))

for(idepth in 1:ndepth){
	trainErr <- 0.0
	testErr <- 0.0
	for(ixval in seq(from =  1, to = nxval)){
		Iout <- which(I%%nxval == ixval%%nxval)
		trainIn <- train[-Iout,]
		trainOut <- train[Iout,]
		yin <- as.factor(trainIn[,61])
		yout <- as.factor(trainOut[,61])
		xin <- trainIn[,1:60]
		xout <- trainOut[,1:60]
		
		fit <- rpart(yin~.,xin,control=rpart.control(maxdepth=idepth))
		dum <- predict(fit,xin)
		yhat <- rep(0.0,nrow(dum))
		for(i in 1:nrow(dum)){
			yhat[i] <- 2*(which.max(dum[i,]) - 1) -1			
		}
		trainErr <- trainErr + (1-sum(yin==yhat)/length(yin))
		dum <- predict(fit,xout)
		yhat <- rep(0.0,nrow(dum))
		for(i in 1:nrow(dum)){
			yhat[i] <- 2*(which.max(dum[i,]) - 1) -1			
		}
		testErr <- testErr + (1-sum(yout==yhat)/length(yout))
	}
	trainOutput[idepth,1] <- idepth
	trainOutput[idepth,2] <- trainErr/nxval
	testOutput[idepth,1] <- idepth
	testOutput[idepth,2] <- testErr/nxval
}

maxval = max(testOutput[,2])
plot(trainOutput, ylim=c(0,maxval))
points(testOutput, col = 2)

