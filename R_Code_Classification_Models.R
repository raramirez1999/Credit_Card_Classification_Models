# remove objects in environment.
rm(list = ls())

# Utilizing a SVM Classification model.
# call library 'kernlab' for use.
library(kernlab)

# load 'credit_card_data.txt' file into a table without headers.
myData <- read.table("credit_card_data.txt", stringsAsFactors = FALSE, header = FALSE)
head(myData)

# call ksvm function, vanilladot is a simple linear kernel.
myModel <- ksvm(V11~V1+V2+V3+V4+V5+V6+V7+V8+V9+V10,
                data = myData,
                type = "C-svc",
                kernel = "vanilladot",
                C = 100,
                scaled = TRUE)

# call model and check attributes
myModel
attributes(myModel)

#Getting the coefficients of the equation of the classifier & the intercept.
a <- colSums(myModel@xmatrix[[1]]*myModel@coef[[1]])
a0 <- -myModel@b
a
a0

#Formula for the equation of the classifier
# 0 = a1V1+a2V2 + ... +a10V10 + a0
# 0 = -0.0010065348*V1 + -0.0011729048*V2 + -0.0016261967*V3 + 0.0030064203*V4 + 1.0049405641*V5 + -0.0028259432*V6+
#   0.0002600295*V7 + -0.0005349551*V8 + -0.0012283758*V9 + 0.1063633995*V10 + 0.08158492

# see what the model predicts.
pred <- predict(myModel,myData[,1:10])
pred

# see what fraction of the model’s predictions match the actual classification.
sum(pred == myData[,11]) / nrow(myData)

#Approaching the data with KNN classification model.
# Call library 'kknn' for use.
library(kknn)

# Initialize a variable to store the count of the matches.
matches <- 0

# Iterate through values of i for all data points.
for (i in 1:654){
  # Create the kknn model to iterate through all 654 data points.
  myModel_knn = kknn(V11~.,
                     myData[-i,],
                     myData[i,],
                     k = 15,
                     distance = 2,
                     kernel = "optimal",
                     scale = TRUE)
  
  # Round the fitted values of the model to 0 or 1, to see if they match the data from myData.
  rounded_fitted_values <- round(fitted.values(myModel_knn))
  
  # Check if the rounded values match the data and add 1 to the matches if so.
  if (rounded_fitted_values == myData[i, 11]){
    matches <- matches + 1
  }
}

# Calculate the percentage of matches, (matches) / (total data points) * 100.
accuracy <- (matches / 654) * 100
accuracy