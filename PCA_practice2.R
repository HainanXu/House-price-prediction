install.packages("MASS")

rm(list=ls())
data(crabs, package="MASS")
head(crabs)
#remove the first 3 indexing col in order to do a pairs plot
crabs[,-c(1:3)]
#pairs plot
pairs(crabs[,-c(1:3)])

#colored pairs plot
pairs(crabs[,-c(1:3)],col=c(rep(1,50),rep(2,50),rep(3,50),rep(4,50))) #how did prof add the color?

#PCA

crabs_PCA<-prcomp(crabs[,-c(1:3)], scale=TRUE)
crabs_PCA
summary(crabs_PCA)

pairs(crabs_PCA$x,col=c(rep(1,50),rep(2,50),rep(3,50),rep(4,50)))


#"do dim reduction before doing a classification problem"

#=============================================================

data("iris")
      
head(iris)#iris 没加引号

#colour the observations by "Species"
pairs(iris[,-5],col=iris[,5])
Iris_PCA<-prcomp(iris[,-5],scale=FALSE)
summary(Iris_PCA)

#plot the first 2 PC and color by species

plot(Iris_PCA$x[,1:2],col=iris[,5])
