
#Reading the diabetes dataset
diabetes_dataset=read.csv("Diabetes.csv")

#Analysing the dataset

dim(diabetes_dataset)

head(diabetes_dataset)

summary(diabetes_dataset)

str(diabetes_dataset)

is.na(diabetes_dataset)

#set seed

set.seed(123)

#spliting the diabetes dataset into train and test dataset

library(caTools)

diabetes_data_sample=sample.split(diabetes_dataset, SplitRatio = 0.75)

train_diabetes=subset(diabetes_dataset,diabetes_data_sample==TRUE)

test_diabetes=subset(diabetes_dataset,diabetes_data_sample==FALSE)

#Building the model

library(randomForest)
model=randomForest(Class.variable~Number.of.times.pregnant
                   +Plasma.glucose.concentration
                   +Diastolic.blood.pressure
                   +Triceps.skin.fold.thickness
                   +X2.Hour.serum.insulin
                   +Body.mass.index
                   +Diabetes.pedigree.function
                   +Age..years., data = train_diabetes, ntree=600, mtry=4)

attributes(model)

dia_predict=predict(model, test_diabetes)

#Confusion Matrix

table(test_diabetes$Class.variable,dia_predict)


