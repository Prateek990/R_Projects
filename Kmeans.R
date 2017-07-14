library(readr)
# load data train and testing data set
training <- read_csv("~/Git/R_Project/MidTerm/ForestTypes/training.csv")
train = training
dim(train)
test = testing
dim(test)

# combine test and train
myData = rbind(train, test)
str(myData)

myData = as.data.frame(unclass(myData))

myData$pred_minus_obs_H_b1 = NULL
myData$pred_minus_obs_H_b2 = NULL
myData$pred_minus_obs_H_b3 = NULL
myData$pred_minus_obs_H_b4 = NULL
myData$pred_minus_obs_H_b5 = NULL
myData$pred_minus_obs_H_b6 = NULL
myData$pred_minus_obs_H_b7 = NULL
myData$pred_minus_obs_H_b8 = NULL
myData$pred_minus_obs_H_b9 = NULL
myData$pred_minus_obs_S_b1 = NULL
myData$pred_minus_obs_S_b2 = NULL
myData$pred_minus_obs_S_b3 = NULL
myData$pred_minus_obs_S_b4 = NULL
myData$pred_minus_obs_S_b5 = NULL
myData$pred_minus_obs_S_b6 = NULL
myData$pred_minus_obs_S_b7 = NULL
myData$pred_minus_obs_S_b8 = NULL
myData$pred_minus_obs_S_b9 = NULL

summary(myData)

dim(myData)
#Scale 
myData_scale = scale(myData[-1])
library(dplyr)
colMeans(is.na(myData_scale))

km = kmeans(myData_scale,4)
km

plot(myData[,c(1,2,3)], col=km$cluster)
table(myData[[1]], km$cluster)


