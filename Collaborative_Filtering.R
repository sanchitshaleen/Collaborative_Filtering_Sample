## https://www.youtube.com/watch?v=aCiCwscLDz8

## What is Collaborative Filtering?
## 1) Technique of grouping customers based on their buying preferencs
## 2) Then, we find out what products have been bought by that particular grp
##    of customers
## 3) Then, use this data to make automatic predictions for newer incoming customers

## So customer's buying preferences are taken into account as well

## Multiple Applications:
# 1) Personalized Landing Page
# 2) Personalized emails/news-letters
# 3) Product Page Up-Sell
# 4) Check-Out Page Cross Sell

## What does Collaborative Filtering Do ?

# 1) Help user find the item of interest
# 2) Help item provider to deliver the right item to the right user

## Real Value of CF ???
# 1) Increases Conversion Rate
# 2) If you are bundling products, it increases the average order value via cross-selling
# 3) Improves the effectiveness of your email marketing newsletters
# 4) Helps you to increase your store's outreach via mobile app
# 5) Improves User Engagement
# 6) Increases Conversion Rate for long tail products



# For a given customer A:
# 1) Find a set of customers who have purchased/rated similar items in the past
# 2) Aggregate the items bought by these similar customers
# 3) Eliminate the items the user has already purchased/rated
# 4) Present the rest of the items
# 
# Assumption: Users with similar preferences will rate items similarily
# 
# Steps for Implementation :
#   1) Data Preparation: Data Collection, Converting To Input Matrix
# 
# 2) Model Creation: User Based Collaborative Filtering
# 
# 3) Similarity Weights/Neighbours: Cosine Similarity, K-Nearest Neighbor
# 
# 4) Predict: Predict Missing Ratings, Top-N Predictions for every User
# 
# 5) Evaluate Accuracy: Mean of Average Error, Root Mean Squared Error

library("recommenderlab")
data<- read.csv("data.csv")

# Creates Rating Matrix
r<-as(data,"realRatingMatrix")

# Create User-Based Collaborative Filtering Model
fit<-Recommender(r[1:1000],"UBCF")

# Predict list of product which can be recommended to given users
rec<-predict(fit,r[1010:1011],n=5)

# show recommendation in form of list

as(rec,"list")


#### Testing of the Recommender Algorithm

# Evaluation Scheme
e <- evaluationScheme(r[1:1000],method="split",train=0.9,given=15)

# Training Model
train_fit<-Recommender(getData(e,"train"),"UBCF")

# Predictions on the Test Data Set
test_rating<- predict(train_fit,getData(e,"known"), type="ratings")

# Error
error <- calcPredictionError(test_rating,getData(e,"unknown"))


## Business Goal
#  Which KPI are you trying to optimize ?

## Making new algorithms by 3 steps experiments

# Offline Testing
   # Calculating Error Metrics

# User Survey
   # Taking feedback from users

# Online Testing
   # Measuring click through rate and conversion rate for Product Recommendations