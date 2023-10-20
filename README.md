## San Francisco Airbnb Analysis

### Purpose:
To purpose of this analysis is to explore the airbnb market in San Francisco. This will be updated in the future  to include an analysis of NYC airbnb data to compare data points

##### Repository Data
SQL_queries: Includes the queries used this project
colab_ipynb: Includes the SQLAlchemy script for importing CSV files into Postgres
original_data: Includes the original raw CSV with no changes or edits
query_data: Includes the exported results of the SQL queries

### Data:
The data was obtained from a website called Inside Airbnb
LINK: [Inside Airbnb](http://insideairbnb.com/get-the-data) http://insideairbnb.com/get-the-data)

The original data was one CSV file with information about Airbnb host, pirce point for each listing, location, 365 availability, room type, etc.
There were a number of columns that were not needed that could have been dropped before entering into database. The file was entered as is.

### Process:

###### SQLAlchemy 
A very short script was written to convert the CSV into a dataframe and send the data into a postgres database.

In the below image you can see the CSV file was uploaded using the pandas read_csv() function. This reads in a CSV file and covnerts it to a dataframe.
Below that is a variable that called pg_engine that contains a function from SQLAlchemy. 
The create_engine() function in this example takes a postgres database conntection URL that includes the database password, port number, and database  name.
Finally, the data variable that contains the converted dataframe uses the to_sql method with the name of the table for database creation and the engine information.

![sqlalchemy](https://github.com/SamvsP4K/SF_Airbnb_Analysis/assets/110923091/4c7d26c0-5f7e-49c9-86a4-600f52b827a0)

### SQL Queries:

The SQL queries were meant to answer the following questions:

1. What are the most popular stays according to availability?
2. Highest priced nieghborhood?
3. Which neighborhood has the highest concentration of airbnb listings?
4. What is the most common room types?
5. Total number of airbnbs in SF?

The following queries provided the answers to the above questions.

   
![queries](https://github.com/SamvsP4K/SF_Airbnb_Analysis/assets/110923091/010e5f08-de68-4712-9970-1eae1661389a)


### Findings:

### **The findings can be found in the "query_data" folder of this repository.**

**1. What are the most popular stays according to availability?**

This was a tough measure to accurately get. There were many listings with 0 availability left out of 365 days in the year. However, this data does not make it clear if it is because they are fully booked out or there is no availability due to bookings being paused or stopped. So using 0 was not the most reliable. For that reason I used 1 as the minimum value here. It was a guarantee that the listing is active with at least one day of the year still available. The query used looked for anything less that 50 and greater than or equal to at least 1 day available. There were a total of 765 airbnbs within these bounds but only 42 of them has just one day left available.

**2. Highest priced nieghborhood?**

The top 3 most expensive neighborhoods are:
*the Financial District with an average price of $1118.69 per night
*Chinatown with an average price of $1045.73 per night
*Downtown/Civic Center with an average price of 684.06 per night.

**3. Which neighborhood has the highest concentration of airbnb listings?**

The top 3 neighborhoods with the highest concentration of airbnbs are:
*Downtown/Civic Center with 866 listings
*The Mission Districtn with 657 listings
*South of Market with 549 listings

**4. What is the most common room types?**
   
The most common room types are:
*Entire homes or apartments with a count of 4842
*Private rooms with a count of 2466
*Shared rooms with a count of 69
*Hotel rooms with a count of 49

**5. Total number of airbnbs in SF?**

The total number of airbnbs in SF according to this data is 7418

### Problems with the data and bias

The website where this data was acquired is from an activist organization that showcases the impact of short-term rentals on housing and residential communities. 
It does not state how or where the data was gathered. While there is no proof that any information was skewed to showcase a more negative impact it should be noted that the purpose of this website is to showcase those negative impacts.

This data did not come with a schema or any type of description of what certain items mean. Some assumuptions were made based on I thought the data meant. 
For example, it was not noted anywhere that the "availability_365" column was how many days were left for booking in the 365 day calendar year, but based on how the data was presented I made that assumption.

#### Updates
In a future update, unnecessary columns will be dropped and the database will be updated for more efficiency. 
New York data will be added for comparison. 
The metrics from above will be visualized.



















