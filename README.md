# Mid-Term Project
This repository cointains all the information you need to work on the Mid-Term project.

## Hello and Welcome!!!

The goal is to predict arrival delays of commercial flights. Often, there isn't much airlines can do to avoid the delays, therefore, they play an important role in both profits and loss of the airlines. It is critical for airlines to estimate flight delays as accurate as possible because the results can be applied to both, improvements in customer satisfaction and income of airline agencies.

### Files

- **exploratory_analysis.ipynb**: this file contains 10 questions we need to answer during the data exploration phase. They will help us to understand the data and become familiar with different variables.
- **modeling.ipynb**: this file contains instructions for modeling part of the project. We recommend to split modeling tasks into more notebooks.
- **data_description.md**: when you need to look for any information regarding specific attributes in the data this is the file to look in.
- **sample_submission.csv**: this file is the example of how the submission of the results should look like.

### Data

We will be working with data from air travel industry. We will have four separate tables:

1. **flights**: The departure and arrival information about flights in US in years 2018 and 2019.
2. **fuel_comsumption**: The fuel comsumption of different airlines from years 2015-2019 aggregated per month.
3. **passengers**: The passenger totals on different routes from years 2015-2019 aggregated per month.
5. **flights_test**: The departure and arrival information about flights in US in January 2020. This table will be used for evaluation. For submission, we are required to predict delays on flights from first 7 days of 2020 (1st of January - 7th of January). We can find sample submission in file _sample_submission.csv_

The data are stored in the Postgres database. You can see the information about the hostname and credentials [in Compass](https://data.compass.lighthouselabs.ca/23284197-327b-4c82-84fa-f220a40a7d1a). 


### Presentation Guidelines

The main goal of this presentation is to prepare you for your **Demo Day** at the end of the bootcamp where your time will be capped. Therefore, it's important to keep the duration of the presentation to **max 5 minutes** (number of slides doesn't necessarily determine the duration of the presentation). Focus on explaining what you did, how you approached the problem, what you achieved, and, if appropriate, suggest what else could be done. Don't speak to every single task and step there is, focus more on the highlights and interesting findings instead. If you struggled with something, feel free to mention it, but do not undermine your work by highlighting that part.

1. Spend **1 min** on project flow structure.
    Which steps does your project have?
2. Spend **1 min** on showing insights and relationships you found in the data during exploratory data analysis.
3. Results (**1 min**):
    - what modeling and sampling techniques did you use?
    - evaluation metrics
4. **1 min** on Feature Importance
    - mention interesting features you have created
    - what are the most important features?
5. Explain the biggest challenges in **1 min**.
    - what would you do if you have a bit more time?


### Submission Guidelines

1. Share the link to your project repository through Compass.
2. The file with the same format as _sample_submission.csv_,  named **submission.csv** , that contains the predictions of delays for the first week of the year 2020 should be included in the repository as well.


### How to Start

You should spend some time with the datasets on your own. Try to look for interesting relationships and information inside the tables. Once you are familiar with the data and information in there you can move on to the EDA tasks from us that will further help you to get familiar with the datasets. Afterward, you can move onto the data preparation and modeling steps. Make sure you have enough time to prepare you slides and presentation at the end.
