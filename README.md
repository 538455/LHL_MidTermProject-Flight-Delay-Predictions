# Flight Delay Predictions

## Project / Goals
- Predict lateness of flights in Jan 2020 using a regression model 
- Create machine learning model based on US domestic flights from 2018 and 2019

## Process
**Data Import**
- Pulled 200K sample from PostgreSQL
- Pulled relevant information from passengers, fuel consumption table
- Pulled data from first week of January 2020

 **Data Cleaning**
 - Cleaned data (rename columns, outliers, missing values, and duplicates)

  **EDA**
- **Distribution** 
    - Examined distribution of late-arriving flights - distribution is right-tailed
    - Removed outliers but distribution was not normal
    - used Kolmogorov-Smirnov test on 200K sample and Shapiro-Wilks on 5K sub-sample, both showed that the distribution was not normal
![](/figures/figure1.png)
- **Arrival Delays by Month**
    - Flights were most late, on average, in June. 
- **Mean and Median Lateness**
    - Very different from one another  due to the right-tailed distribution
![](/figures/figure2.png)

    - **Weather**
        - Flight lateness most correlated with thunder and fog
![](/figures/figure3.png)
    - **Flight Speed with Departure Delay**
        -  mean of flights with no departure delay = 6.6 miles/minute
        - mean of flights with no departure delay = 6.8 miles/minute
        - used a z-test to demonstrate that these are *not* from the same distribution
    - **Airport Busy-ness**
        - number of arriving and outgoing planes and number of passengers all closely correlated
    ![](/figures/figure4.png)

**Feature Engineering** (Seb can you do more in this part?)
    - weather (Seb to add more info!)
    - ID column to join all collected information into a single table to run our models on

**Modeling**
- Tried the following models:
    - Linear regression (including ridge, lasso)
    - Random Forest Regressor
    - SVM
    - Random Forest Classifier
    - XGBoost --> **best results!**




## Results:
- Used following parameters: 
    - learning rate = 
    - gamma = 
    - lambda = 
    - alpha = 
    - max_depth = 
    - subsample = 

## Challenges:
- limited weather data available for past dates
- limited success with model predictions
- tuning model parameters is time and CPU-intensive!


## Future Goals: 
- consider using weather forecast data to represent reality


