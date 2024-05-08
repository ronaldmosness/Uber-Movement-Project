DESCRIPTION
=============
Team 11, The Data Drivers, is creating a proof-of-concept design for a real-time travel time information and 
recommendation system with an interactive user interface for Uber’s Atlanta territory to optimize ride hailing 
services for Uber customers (Georgia Tech constituents), Uber Drivers, and City Planners modeled on a year’s data 
(2019Q2 - 2020Q1) of the Uber movement data project [20]. This dataset contains over 23 million mean travel time 
observations aggregated by month of year, hour of day, and day of week. There are roughly 239k unique trips 
(directed source/destination pairs) between 831 locations around the greater Atlanta area represented. We supplemented 
this data set with latitude and longitude information from the United States Census Bureau. We also used the Google 
geocoding API to collect name information for each geography in our data.

Our technology stack includes csv, JSON, and SQLite for data storage, Python and R for data exploration, analysis, and 
modeling. Our user type specific Interactive Visualization tool is Tableau.

----------------
File contents:
----------------
.\README.txt  :  This file

.\CODE\
.\CODE\data_location_20231128_200050.csv  :  sample output from running EDA.ipynb   python jupyter notebook
.\CODE\data_names_20231128_200559.csv     :  sample output from running Names.ipynb python jupyter notebook
.\CODE\data_trip_20231128_200051.csv      :  sample output from running EDA.ipynb   python jupyter notebook
.\CODE\DVA clustering.R                   :  R script that performs clustering analysis on Uber hourly trip data for 
                                             Atlanta census tracts. It calculates the total outbound and inbound trips 
                                             for each location ID (district) based on pickup and dropoff points. The 
                                             script uses k-means clustering to group location IDs into clusters and 
                                             outputs the resulting clusters.
.\CODE\EDA.html   :  Exploratory data analysis, Calculations, Linear Regression, and Visualization Data File 
                     creation.  This is the full version of the notebook, exported as Html, with output when 
                     run against the full data files.  To show that we did work against the full dataset.  
                     We've provided sample data files with observations from a single trip (1,76) with this 
                     submission
.\CODE\EDA.ipynb  :  Exploratory data analysis, Calculations, Linear Regression, and Visualization Data File 
                     creation.  This is a modified version of the notebook to run against the sample dataset only
.\CODE\Names.ipynb  :  Python jupyter notebook for using Google geocoding API to get census tract address names
.\CODE\pred.out     :  sample output from running EDA.ipynb
.\CODE\project_v3.twbx  :  tableau workbook source for our interactibe visualization. Our visualization is also available here: 
                           https://public.tableau.com/app/profile/james.ashworth2114/viz/UpdatedProject_17006851845450/maindashboard

.\CODE\IMG\
.\CODE\IMG\hist_mtt_gmtt.png  :  an image used in the EDA.ipynb python jupyter notebook that shows the histograms of 
                                 mean travel time and geometric mean travel time

.\CODE\UberData\
.\CODE\UberData\atlanta-censustracts-2019-2-All-HourlyAggregate.csv   :  Sample data trip (1,76) only.  Hourly  data Quarter 2 2019
.\CODE\UberData\atlanta-censustracts-2019-2-All-MonthlyAggregate.csv  :  Sample data trip (1,76) only.  Monthly data Quarter 2 2019
.\CODE\UberData\atlanta-censustracts-2019-2-WeeklyAggregate.csv       :  Sample data trip (1,76) only.  Weekly  data Quarter 2 2019
.\CODE\UberData\atlanta-censustracts-2019-3-All-HourlyAggregate.csv   :  Sample data trip (1,76) only.  Hourly  data Quarter 3 2019
.\CODE\UberData\atlanta-censustracts-2019-3-All-MonthlyAggregate.csv  :  Sample data trip (1,76) only.  Monthly data Quarter 3 2019
.\CODE\UberData\atlanta-censustracts-2019-3-WeeklyAggregate.csv       :  Sample data trip (1,76) only.  Weekly  data Quarter 3 2019
.\CODE\UberData\atlanta-censustracts-2019-4-All-HourlyAggregate.csv   :  Sample data trip (1,76) only.  Hourly  data Quarter 4 2019
.\CODE\UberData\atlanta-censustracts-2019-4-All-MonthlyAggregate.csv  :  Sample data trip (1,76) only.  Monthly data Quarter 4 2019
.\CODE\UberData\atlanta-censustracts-2019-4-WeeklyAggregate.csv       :  Sample data trip (1,76) only.  Weekly  data Quarter 4 2019
.\CODE\UberData\atlanta-censustracts-2020-1-All-HourlyAggregate.csv   :  Sample data trip (1,76) only.  Hourly  data Quarter 1 2020
.\CODE\UberData\atlanta-censustracts-2020-1-All-MonthlyAggregate.csv  :  Sample data trip (1,76) only.  Monthly data Quarter 1 2020
.\CODE\UberData\atlanta-censustracts-2020-1-WeeklyAggregate.csv       :  Sample data trip (1,76) only.  Weekly  data Quarter 1 2020
.\CODE\UberData\atlanta_censustracts_0.json  :  Sample Shapes data file with trip (1,76) data only
.\CODE\UberData\tl_2019_13_tract.dbf.csv  :  U.S. Census TIGER/line census tract data file

.\DOC\
.\DOC\team011poster.pdf  :  our project poster
.\DOC\team011report.pdf  :  our final report document


INSTALLATION
==============
Install the Python interpreter.  The Python Jupyter notebooks were developed and run with python version 3.12.0.
Python 3.12.0 can be downloaded here:
    * https://www.python.org/downloads/release/python-3120/

Install VScode or the jupyter notebook environment of choice.  The following resources will help you get VSCode 
set up for Python and Jupyter.
    * https://code.visualstudio.com/docs/python/python-tutorial
    * https://code.visualstudio.com/docs/datascience/jupyter-notebooks

Install the required Python packages.  All required packages are in the first cell of each notebook.  Packages 
can be installed using the following python pip command if you have pip installed.
    * python -m pip install package-name
    * https://packaging.python.org/en/latest/tutorials/installing-packages/

R and RStudio are used for our clustering.
    * Install R from this location: https://www.r-project.org/
    * Install R Studio from this location: https://posit.co/download/rstudio-desktop/
    * Ensure Required R packages (dplyr) are installed.

A Google API key is required for getting the census tract names.  Here is a link with instructiond for getting an 
API Key: https://support.google.com/googleapi/answer/6158862?hl=en. More information about the google gocoding API 
can be found here: https://developers.google.com/maps/documentation/geocoding/overview.

EXECUTION
===========
1. Open and Run the whole EDA.ipynb python jupyter notebook.
2. Observe output from cells with various summaries.
3. Expected file outputs are the following data files:
    * YYYYMMDD_HHMMSS in the file names below is a timestamp of when the file was created.  YYYY: year, MM: month, 
      DD: day, HH: hour, MM: minute, SS: second
    * data_location_YYYYMMDD_HHMMSS.csv - the locations data file to be fed into the Names.ipynb notebook to get 
      location names.  This file is also used in the visualization.
    * data_trip_YYYYMMDD_HHMMSS.csv - the locations data file used in the visualization.
    * pred.out - the calculated trip metrics, linear regression predictions and prediction intervals.  This is the 
      output of the regression, but gets used by the notebook and becomes part of data_trip_YYYYMMDD_HHMMSS.csv.
4. Open the Names.ipynb python jupyter notebook.
5. Edit the fileName variable value in the "File Read" cell to match the name of your data_location_YYYYMMDD_HHMMSS.csv 
   file.
6. Run the whole Names.ipynb python jupyter notebook.
    * This will require a Google API Key.  It will need to be the only text in ../secrets_dva_project.txt to run the 
      code.  However, sample output is provided.
7. Expected file output is the following data file:
    * data_names_YYYYMMDD_HHMMSS.csv - The names for each location used by the visualization.
8. Clustering:
    NOTE Ensure proper file paths are updated before running the script to access input and output data.
    8.1 Ensure all Uber hourly aggregate CSV files for Atlanta census tracts (2019-2, 2019-3, 2019-4, 2020-1) are available.
    8.2 Update the file_path_XXXX variables in the script with the correct file paths for these CSV files.
    8.3 Open the provided R script, "DVA clustering.R", in your R environment.
    8.4 Execute the script from start to finish.
    8.5 The script performs data aggregation, k-means clustering, and generates an output CSV file named 
        3_cluster_locationid_based_on_pickup_dropoff_data.csv.  The resulting CSV file contains columns for location 
        IDs and their corresponding clusters based on pickup and dropoff data. This file is used in the visualization.

Visualization:
----------------
Open the Tableau workbook file .\CODE\project_v3.twbx or this visualization is also available on Tableau public:
https://public.tableau.com/app/profile/james.ashworth2114/viz/UpdatedProject_17006851845450/maindashboard

Welcome to the dashboard of Team 11, "The Data Drivers." This summary provides insights into the dashboard report and 
guidance on its utilization. The main dashboard offers three distinct options to choose from: Passengers, Uber Drivers, 
and City Planners. Each selection reveals relevant maps, complemented by filters (slicers) on the right-hand side, 
facilitating a more refined exploration of the data.

Within these filters, users can narrow their search based on specific pickup or drop-off locations, and analyze the 
mean travel time during different times of the day, such as weekends, mornings, and evenings. Additionally, an 
intriguing filter highlights specific spots on the map, offering comprehensive information about Uber rides.
 
The City Planner option introduces a distinctive feature displaying the population density of areas. This map is 
particularly valuable for business considerations, providing insights into the best locations based on demographic 
data and ride patterns.
 
Noteworthy is the Map Control Settings located in the top left corner of the map. This feature allows users to manipulate 
the map—enabling zoom in and out functionality. The home icon resets the map to its default setting, while the arrow 
icon provides various options. Users can zoom in on specific areas, navigate around the map (hover), and use shape icons 
to mark specific areas within the selected icon, offering a detailed view of particular locations.
 
The comprehensive features of this Tableau dashboard empower users to extract valuable insights into Uber ride patterns, 
demographic data, and optimal business locations.

DEMO VIDEO
============
Our visualization demo video can be viewed here: https://youtu.be/DFVTmMO0JvA
