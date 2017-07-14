train = training
dim(train)
test = testing
dim(test)

set.seed(217313)

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

dim(myData_scale)

myData.complete = hclust(dist(myData_scale), method="ward.D2")
myData.average = hclust(dist(myData_scale), method="ward")

# We plot the dendograms side by side for comparison

par(mfrow=c(1,3))
plot(myData.complete,main="Ward D2 Linkage", xlab="", sub="", cex=.9,labels = FALSE)
plot(myData.average, main="Ward Linkage", xlab="", sub="", cex=.9,labels = FALSE)

# Can we improve this?
table(myData[[1]], cutree(myData.complete,4))
table(myData[[1]], cutree(myData.average,4))

# Let's check for the correlation
# check for correlation
summary(myData_scale)
library(corrplot)
corrplot(cor(myData_scale,method="pearson"), method = "circle")

#as per the plot there is a strong relation between b2 and b3
# b6 and b5 , and b8 and b9
# lets remove b2, b6 and b8
dim(myData_scale)
plot(myData_scale)
myData_new = myData
dim(myData_new)
myData_new$b2 = NULL
#myData_new$b6 = NULL
#myData_new$b8 = NULL

#Scale 
myData_scale = scale(myData_new[-1])
dim(myData_scale)

new.complete = hclust(dist(myData_scale), method="ward.D2")
new.average = hclust(dist(myData_scale), method="ward")

# We plot the dendograms side by side for comparison
par(mfrow=c(1,2))
plot(new.complete,main="Ward.D2 Linkage", xlab="", sub="", cex=.9,labels = FALSE)
rect.hclust(new.complete, k=4, border="red")
plot(new.average, main="Ward Linkage", xlab="", sub="", cex=.9,labels = FALSE)
rect.hclust(new.average, k=4, border="red")

# Something is wrong with hclust
cutree(myData.complete,4)
table(myData[[1]], cutree(new.complete,4))
table(myData[[1]], cutree(new.average,4))

