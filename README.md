# ETL_Project_GroupB

For the ETL assignment we chose to build our project around Tom Hanks, an American Treasure.  There are three sources of data for this project:
--1)Open Movie Database (OMDB)
--2)The Movie Database (TMDB)
--3)A survey conducted via Survey Monkey to obtain some demographic data in conjunction with survey respondents' picks for top three Tom Hanks films.

--Extraction
**TMDB extraction--

**OMDB extraction--
For the extraction of the data from the Open Movide Database (OMDB), their API web service was utilized.  All of the extraction process for the OMDB source can be found in the "OMDB" folder in our repository, in the "ETL_OMDB_API" jupyter notebook. An early problem encoutered with the OMDB API service was that they don't provide a search parameter for an actor's name.  In order to work around this, and only pull Tom Hanks movies from OMDB, we used the data that was extracted from TMDB.  TMDB API service allows for queries based on actor's name/ID, and from there you can pull all the movies titles associated with a specific actor.  So once we had all the Tom Hanks' movie titles from TMDB, those titles were put into a list using the ".tolist()" function in Pandas.  That list of titles was then assigned a variable ('titles') so that it was possible to loop through each specific Tom Hanks' movie title and pull all the corresponding data for each Hanks movie contained in OMDB.  

**Survey Monkey extraction--
The first step in our Survey Monkey Extraction was creating a survey. We devised a simple survey that identified user's top three Tom Hanks movies, favorite genre, and some simple demographic information: year of birth and gender. After receiving 60 responses, we exported the data into a CSV, and indexed it for ease of use. If time had allowed, we would have gathered more responses. This was then imported into a dataframe using Pandas within the OMDB jupyter notebook.

--Transform
**TMDB transformation--


**OMDB transformation--
All of the transformation that was done to the OMDB data was done using Python and pandas and can be found in the "OMDB" folder in our repository, in the "ETL_OMDB_API" jupyter notebook.  For starters, we had a list of dictionaries for all of his movies, after looping through all of the Hanks' titles in OMDB,.  So then it was really easy to take that list of dictionaries and put them into DataFrame.  From there it was on to the cleaning up and structuring of the DataFrame.  Getting rid of junk columns that only contained "NaN" or "N/A" values was the first bit of clean-up that had to be done.  And after that it was just a matter of comparing the OMDB DataFrame to the TMDB DataFrame and getting rid of redundancies.


**Survey Monkey transformation--
Transforming the Survey Monkey data consisted of adding two columns of indexing, and breaking the data into a table that would make for easy manipulation. We first separated each individual's response into seperate rows for each of the three selections, adding an index number for each individual and for each selection location, which indicated if it was selection 1, 2 , or 3. This allowed our end user to easily create a summary table and identify which movie was most popular.



--Load

The loading portion of the project was pretty straightforward.  We started by diagramming the layout of the tables in QuickDBD website.  The layout was saved in a .png format and you can view it in the "Hanks_ERD.png" file that is in this repository.  QuickDBD also provides a .sql schema file that gave us a good start in setting up the three tables in pgAdmin.  So from QuickDBD, it was time to go over to pgAdmin and create the database, "tom_hanks".  After that, the .sql schema file from QuickDBD was imported, and really the only thing that had to be changed from the QuickDBD schema was that it assigned the "Other" column in the "hanks_survey" table as having a "Not Null" constraint.  And since that column has many Null values, the "Not Null" constraint was removed.  So once the database was set-up with the necessary tables, I connected to my local postgresql in the "ETL_OMDB_API" jupyter notebook and used Pandas to load the DataFrames that were created from each source -- TMDB, OMDB, & Survey Monkey data.