[toc]

## Regression



### Support Vector Regression

$\epsilon$-incentive tube:

<img src="/Users/hainanxu/Library/Application Support/typora-user-images/Screen Shot 2022-02-10 at 23.43.18.png" alt="Screen Shot 2022-02-10 at 23.43.18" style="zoom:50%;" />

Minimize the distance to the tube.

```R
library(e1071)
regressor = svm(formula = Salary ~ .,
                data = dataset,
                type = 'eps-regression',
                kernel = 'radial')


y_pred = predict(regressor, data.frame(Level = 6.5))
```

### Decision Tree Regression

<img src="/Users/hainanxu/Library/Application Support/typora-user-images/Screen Shot 2022-02-11 at 00.02.49.png" alt="Screen Shot 2022-02-11 at 00.02.49" style="zoom:50%;" />

```R
library(rpart)

regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))


y_pred = predict(regressor, data.frame(Level = 6.5))
```

### Random Forest

a version of ensemble learning: when you take multiple algorithms or take the same algorithm multiple times.

**Step 1** Pick at random K data points from the training set

**Step 2** Build __decision tree__ associated to the K data points

**Step 3** Choose the number **Ntrees** you want to build and repeat step 1 and 2

**Step 4** For a new datapoint, make each one of the Ntree trees predict the value of Y for the data point in question, and assign new dtat point the **average** across the predicted Y values.

```R
# Splitting the dataset into the Training set and Test set
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
# Feature Scaling

library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[-2],
                         y = dataset$Salary,
                         ntree = 500)


y_pred = predict(regressor, data.frame(Level = 6.5))
```

### Model selection???

#### AIC



## Classification

### Logistic regression



```R
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting Logistic Regression to the Training set
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)

# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
y_pred = ifelse(prob_pred > 0.5, 1, 0)
```

### K-Nearest Neighbors

```R
# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting K-NN to the Training set and Predicting the Test set results
library(class)
y_pred = knn(train = training_set[, -3],
             test = test_set[, -3],
             cl = training_set[, 3],
             k = 5,
             prob = TRUE)

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
```

### SVM

```R
# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting SVM to the Training set
# install.packages('e1071')
library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
```

### Kernal SVM

<img src="/Users/hainanxu/Library/Application Support/typora-user-images/Screen Shot 2022-02-11 at 00.23.16.png" alt="Screen Shot 2022-02-11 at 00.23.16" style="zoom:33%;" />

Mapping to a higher dimonsion get a linearly separable dataset.(can be compute-intensive)

<img src="/Users/hainanxu/Library/Application Support/typora-user-images/Screen Shot 2022-02-11 at 00.27.49.png" alt="Screen Shot 2022-02-11 at 00.27.49" style="zoom:50%;" />

<img src="/Users/hainanxu/Library/Application Support/typora-user-images/Screen Shot 2022-02-11 at 00.57.40.png" alt="Screen Shot 2022-02-11 at 00.57.40" style="zoom:50%;" />

#### Types of kernal functions:

Gaussian RBF Kernel

Sigmoid Kernel

Polynomial Kernel

#### Non-linear SVR:???

```R
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting Kernel SVM to the Training set
# install.packages('e1071')
library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'radial')

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
```

### Naive Bayes