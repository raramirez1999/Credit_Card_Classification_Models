# Credit_Card_Classification_Models

# Credit Card Classification Model - R Markdown Project

## Table of Contents
- [Introduction](#introduction)
- [Project Goals](#project-goals)
- [Methodology](#methodology)
- [Results](#results)
- [Conclusion](#conclusion)

## Introduction
This R Markdown project aims to predict whether an individual applying for a credit card will be accepted or not. The analysis involves building classification models to evaluate the likelihood of credit card approval based on various applicant features.

## Project Goals
The primary objectives of this project include:
- Implementing a Support Vector Machines (SVM) Classification model for credit card approval prediction.
- Exploring the use of k-Nearest Neighbors (KNN) classification as an alternative approach.
- Assessing the accuracy of both models in predicting credit card approval.

## Methodology
The project follows these key steps:
1. **Data Loading:** Reading the 'credit_card_data.txt' file into a table without headers.
2. **SVM Classification Model:**
   - Utilizing the `kernlab` library to implement a SVM model with a linear kernel.
   - Extracting coefficients and intercept of the SVM model.
   - Predicting credit card approval and evaluating model accuracy.
3. **KNN Classification Model:**
   - Utilizing the `kknn` library to implement a KNN model.
   - Iterating through data points to assess model accuracy.

## Results
The SVM and KNN models were evaluated for their accuracy in predicting whether an individual's credit card application will be accepted. Detailed results can be found in the code output.

## Conclusion
In conclusion, this project provides insights into predicting credit card approval using SVM and KNN classification models. The results can assist in decision-making processes related to credit card applications.
