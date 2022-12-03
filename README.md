# Flight Delay Predictions

This project was completed by:
- Melissa Nielsen - GitHub: [mnicnielsen](https://github.com/mnicnielsen)
- Sébastien Garneau - GitHub: [538455](https://github.com/538455)

## Project / Goals
- Predict lateness of flights in Jan 2020 using a regression model 
- Create machine learning model based on US domestic flights from 2018 and 2019

## Process
**Data Import**
- Pulled 2x 200K sample from the provided PostgreSQL DB. The second sample was used for testing the model on a similar scale as the January 2020 data;
  
- Pulled data from the provided PostgreSQL DB for the first week of January 2020 (dataset we need to predict delay for);
- Pulled relevant information from the passengers table provided in the PostgreSQL - process documented [here](src/ipynb/Step_1-Preparation-Passengers.ipynb);
- Pulled 2018-2020 weather information for every airport in our dataset from the [NOAA](https://www.ncdc.noaa.gov/cdo-web/) FTP server. Original dataset (100M+ rows that required pivoting) was provided by weather stations. Our process consisted of obtaining lat/long information for all airports and weather stations and finding weather stations that were proximate to airports. More details [here](src/ipynb/Step_1-Preparation-Weather.ipynb).
<br/><br/>

 **Data Cleaning**
 - Broken down into 5x parts:
    1. List unique values for each column and look for formatting issues and 'missing' values (999 or N/A in a column);
   
    2. Review the data types and name of all columns;
    3. Look for missing values and decide how to handle them;
    4. Remove duplicate values, if applicable;
    5. Identify outliers and decide how to handle them. 
     
- These steps have been done for every dataset, but are better documented in the following [notebook](src/ipynb/Step_1-Preparation-Flights_Sample&Test.ipynb). Please note the *dataCleaning* function which consolidates all the steps above into one function.
  
**EDA**
- **Distribution** 
    - Examined distribution of late-arriving flights - distribution is right-tailed
    - Removed outliers but distribution was not normal
    - used Kolmogorov-Smirnov test on 200K sample and Shapiro-Wilks on 5K sub-sample, both showed that the distribution was not normal
    ![](/figures/figure1.png)
<br/><br/>

- **Arrival Delays by Month**
    - Flights were mostly late, on average, in June. 
<br/><br/>

- **Mean and Median Lateness**
    - Very different from one another  due to the right-tailed distribution
    ![](/figures/figure2.png)
<br/><br/>

- **Weather**
  - Flight lateness most correlated with thunder and fog
  
    ![](/figures/figure3.png)
<br/><br/>

- **Flight Speed with Departure Delay**
        -  mean of flights with no departure delay = 6.6 miles/minute
        - mean of flights with no departure delay = 6.8 miles/minute
        - used a z-test to demonstrate that these are *not* from the same distribution
<br/><br/>

- **Airport Busy-ness**
  - number of arriving and outgoing planes and number of passengers all closely correlated
        
    ![](/figures/figure4.png)

- More details on EDA can be found [here](src/ipynb/Step_1-Exploratory_analysis.ipynb).

**Feature Engineering** 
- Created a busyness score for each airport based on the number of flights it had that day in comparison to the average number of daily flights for that airport. More details [here](src/ipynb/Step_1-Preparation-BusynessScore.ipynb).
- Joined all datasets together
  
  - Weather data was joined with our flights table on arrival/departure airport & date.
  
  - Avg payload and passengers were joined with our flights table by carriers' routes (origin, destination, and carrier).
  - Additional details on airports collected while getting the weather data was joined with our flights table on arrival/departure airport.
  - Airport busyness scores were joined with our flights table on arrival/departure airport.

- Turned categorical variables into dummy variables
- More details on feature engineering can be found [here](src/ipynb/Step_3-Modeling.ipynb).
  
  

**Modeling**
- Tried the following models:
    - Linear regression (including ridge, lasso)
    - Random Forest Regressor
    - SVM
    - Random Forest Classifier
    - XGBoost --> **best results!**

- More details on modeling can be found [here](src/ipynb/Step_2-Modeling.ipynb).



## Results:
- Favoured model is XGBoost using following parameters: 
    - learning rate = .01 
    - n_estimators = 400
    - reg_lambda = 1
    - gamma = 1 
    - subsample = 0.5
    - max_depth = 11
- Model is saved as a pickle file [here](src/pickles/XGBoost+model.pkl).
<br/><br/>

- Results - Train/Test split: 
  - RMSE: 
  - MSE: 
  - R2: 6.5 - 8%

- Results - 40K Test
  - RMSE: 6.5
  - MSE:
  - R2:

- Results - 200K Test
  - RMSE:
  - MSE:
  - R2:
<br/><br/>

- Jan 2020 data
  - Our predictions can be found [here](output/XGBoostReg_tuned.csv).



## Challenges:
- limited free weather data available for past dates, thanks again to the NOAA for having this data publicly available!
  
- limited success with model predictions
- running and tuning some models is time and CPU-intensive!


## Future Goals: 
- consider using weather forecast data to represent reality if we want to predict future delays and use weather 

- flights to/from other countries than the US & territories were not included in our dataset. Consider including international flights data to increase accuracy of our busyness score. 
- consider bringing in additional data to see if that has an impact on lateness, to include:
  - data based on the tail number of the planes (e.g. age of the plane, scheduled routes, etc.);
  - data on passengers per flight (e.g. reported disabilities, number of children, connecting flights, number of bags, etc.); and
  - data on airport security (e.g. number of security checks, number of security alerts, estimated time to go thru security on that day, etc.).
  


