

install.packages("HSAUR") # Download the package

rm(list=ls())# this command clears the memory
data("heptathlon",package="HSAUR") #Get the data set!

head(heptathlon)
#Some numbers are " the smaller the better"(hurdles,run200m,run800m), and we need to convert them all to " The larger the better"
heptathlon$hurdles<-max(heptathlon$hurdles)-heptathlon$hurdles#
heptathlon$run200m<-max(heptathlon$run200m)-heptathlon$run200m
heptathlon$run800m<-max(heptathlon$run800m)-heptathlon$run800m

names(heptathlon)

heptathlon[,-8]# delete the 8 th col

heptathlon_P<-prcomp(heptathlon[,-8], scale = FALSE)#Do a principal components analysis - unscaled
heptathlon_P
summary(heptathlon_P)

head(heptathlon_P)

heptathlon_PS<-prcomp(heptathlon[,-8], scale = TRUE)#Do a principal components analysis - scaled
heptathlon_PS
summary(heptathlon_PS)

head(heptathlon_PS$x)#去掉"$x"后的rotation, center,scale是什么？$x是什么？（a random vector with p variables)

pairs(heptathlon)
plot(heptathlon_PS$x[,1],heptathlon[, 8]) #plot "PC1" and "score"

#looks like a linear function, apply a linear model 
#"The null hypothesis for a liner model is that the slope is zero."
reg1<-lm(heptathlon[, 8]~heptathlon_PS$x[,1])
summary(reg1)

