[toc]



### Regression-House price prediction

#### 1.Data preprocessing

Import and combine the training set and test set, analyse the variables. 

```R
rm(list=ls())
library(readr)
library(dplyr)
library(VIM)
library(mice)
library(dplyr)


test <- read_csv("test.csv")
train<-read.csv('train.csv')
train_saleprice<-train$SalePrice
train$SalePrice<-NULL
testid<-test$Id

#There are some error in the column name of taining set, therefore i corrected them.
names(test)[44]='X1stFlrSF'
names(test)[45]='X2ndFlrSF'
names(test)[70]='X3SsnPorch'

all<-rbind(train,test)
all$Id<-NULL
```

##### 1.1 Missing values

Have a brief look at the **missing values**.  Some variables have a lot of missing values. 

Some of the"NA" simply means the house does not have cetain facility. We replace the NA as "None" for the them. For numerical variable, I used 0 to replace NA.

```R
md.pattern(all)

all$FireplaceQu[is.na(all$FireplaceQu)]='None'
all$Fence[is.na(all$Fence)]='None'
all$Alley[is.na(all$Alley)]='None'
all$PoolQC[is.na(all$PoolQC)]='None'

#replace other categorical variable's missing value as none
all$GarageType[is.na(all$GarageType)]='None'
all$GarageFinish[is.na(all$GarageFinish)]='None'
all$GarageQual[is.na(all$GarageQual)]='None'
all$GarageCond[is.na(all$GarageCond)]='None'
all$BsmtExposure[is.na(all$BsmtExposure)]='None'
all$BsmtFinType2[is.na(all$BsmtFinType2)]='None'
all$BsmtQual[is.na(all$BsmtQual)]='None'
all$BsmtFinType1[is.na(all$BsmtFinType1)]='None'
all$BsmtCond[is.na(all$BsmtCond)]='None'

#delteted the variable that is not desired
which(colnames(all)=="MiscFeature")
which(colnames(all)=="LotFrontage")
all=all[,-c(3,74)]

#numeric missing values
all$MasVnrArea[is.na(all$MasVnrArea)]=0
all$BsmtHalfBath[is.na(all$BsmtHalfBath)]=0
all$BsmtFullBath[is.na(all$BsmtFullBath)]=0
all$BsmtFinSF1[is.na(all$BsmtFinSF1)]=0
all$BsmtFinSF2[is.na(all$BsmtFinSF2)]=0
all$BsmtUnfSF[is.na(all$BsmtUnfSF)]=0
all$GarageCars[is.na(all$GarageCars)]=0
all$GarageArea[is.na(all$GarageArea)]=0
all$TotalBsmtSF[is.na(all$TotalBsmtSF)]=0
all$GarageYrBlt=ifelse(is.na(all$GarageYrBlt),
                   ave(all$GarageYrBlt,FUN= function(x) mean(x,na.rm=TRUE)),
                   all$GarageYrBlt)
                       
#And since I was tired of replace missing values like this, for the variable that has few missing values and does not have "None" in description, I simply changed them to a random observation under that column. A better solution is to use mode to fill in the missing values, also it would be better if I can write function to deal with it.
all$MasVnrType[is.na(all$MasVnrType)]="None"
all$MSZoning[is.na(all$MSZoning)]="RL"
all$Utilities[is.na(all$Utilities)]="NoSewr"
all$Functional[is.na(all$Functional)]="Min1"
all$Exterior1st[is.na(all$Exterior1st)]="VinylSd"
all$Exterior2nd[is.na(all$Exterior2nd)]="VinylSd"
all$Electrical[is.na(all$Electrical)]="Mix"
all$KitchenQual[is.na(all$KitchenQual)]="Gd"
all$SaleType[is.na(all$SaleType)]="WD"
```

##### 1.2 Categortical data

For this part I wish I can be able to write a function that can encode the categorical variables, not sure if it's possible.

Separate the training set and test set as a and b.

```R
a<-all[1:1460,]
a<-cbind(a,train_saleprice)
summary(a)
```



#### 2.Seleting features

##### 2.1 Forward elimination

```R
empty=lm(formula = train_saleprice~1,data=a[,-1])
full=lm(train_saleprice~.,data=a[,-1])
set.seed(123)
lm_forward <- step(empty, scope=list(lower=empty, upper=full), direction="forward")
summary(lm_forward)
predicted_price_3=predict(lm_forward,newdata=b)
head(predicted_price_3)
my_submission_3 <- data_frame('Id' = test$Id, 'SalePrice' = predicted_price_3)
write_csv(my_submission_3, 'submission3.csv')

```

##### 2.2 Backward elimination

```R
empty=lm(formula = train_saleprice~1,data=a[,-1])
full=lm(train_saleprice~.,data=a[,-1])

set.seed(123)
lm_backward <- step(full, scope=list(lower=empty, upper=full), direction="backward")
summary(lm_backward)
predicted_price_3=predict(lm_backward,newdata=b)

head(predicted_price_3)
my_submission_3 <- data_frame('Id' = test$Id, 'SalePrice' = predicted_price_3)
write_csv(my_submission_3, 'submission3.csv')
```

Forward elimination and backward eliminatin get the same result.

##### 2.3 Random Forest

```R
library(randomForest)
library(Metrics)
set.seed(1234)
for_1<- randomForest(train_saleprice~.,data= a[,-1])
Prediction_7 <- predict(for_1, newdata= b)

my_submission_7<- data_frame('Id' = test$Id, 'SalePrice' = Prediction_7 )
write_csv(my_submission_7, 'submission7.csv')
```



#### 3.Model

```R
regressor =lm(formula =train_saleprice~LotArea+OverallQual+OverallCond+YearBuilt 		+MasVnrArea+BsmtFinSF1+BsmtUnfSF+X1stFlrSF+X2ndFlrSF+BsmtFullBath+BedroomAbvGr
   +KitchenAbvGr+TotRmsAbvGrd+GarageCars+ MSZoning+Neighborhood+ Exterior2nd
   + ExterQual+ Foundation+ BsmtQual+ BsmtFinType1+ 				KitchenQual+GarageType+GarageFinish+ HouseStyle,
   data=a[,-1])

summary(regressor)
predicted_price_6=predict(regressor,newdata=b)            
```



#### 4. Comments and reflection

1.try to use PCA to reduce the multicolinearity of the variables.

2.need a better way to tackle with missing values

3.need to learn how to deal with categorical variables



Jan.2022

Hainan Xu