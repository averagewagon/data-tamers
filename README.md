### Data Tamers
# **Domain of Interest: Education**
## Why are you interested in this field/domain?
There are a lot of interesting questions to be asked about the education spending
throughout the past 3 decades, such as how nation social or political events
affect different counties and states differently. Did Washington increase
education spending in response to President Bill Clinton's illegal immigration
reform more than Texas did? How has the education spending by district in New
York changed over the years, with respect to gentrification? How does educational spending impact the youth? Performing this
data analysis would allow us to have a convenient resource that allows us to
answer questions such as this.

## What other examples of data driven project have you found related to this domain (share at least 3)?

[This](https://www.edweek.org/ew/collections/quality-counts-2018-state-finance/map-per-pupil-spending-state-by-state.html) is a map which shows the spending per pupil, organized by state, in 2018. It
is shown on a U.S. map, which is similar to how we want to present our data.

[This](https://www.statista.com/statistics/184272/educational-attainment-of-college-diploma-or-higher-by-gender/) is a graph showing the percentage of the U.S. population who completed four years of college or more from 1940 to 2018, broken down by gender.

[This](https://www.statista.com/statistics/233301/median-household-income-in-the-united-states-by-education/) is another graph, which shows the median household income in the U.S. in 2017, by educational attainment of householder.


## What data-driven questions do you hope to answer about this domain (share at least 3)?
Which states have had the most growth in education spending over the last ~30 years?

How do particular events, such as the Columbine Shooting and Immigration Reform and more, correlate with trends in education spending?

How does education spending compare with the rate of inflation in the U.S.?

How does the number of school shootings compare over time between private and public schools?

Does educational spending have an impact juvenile crime rates?

# **Finding Data**
## elsec06.xls
- Where did you download the data (e.g., a web URL)?
  - https://www.census.gov/programs-surveys/school-finances/data/tables.html
  - https://www2.census.gov/programs-surveys/school-finances/tables/2006/secondary-education-finance/elsec06.xls
- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
  - Like this
- How many observations (rows) are in your data?
  - 15188
- How many features (columns) are in the data?
  - 117
- What questions (from above) can be answered using the data in this dataset?
  - The top three questions above can be answered using this dataset in conjunction with those from other years. This particular dataset allows us to see what U.S. education spending looked like in the middle range of the last 30 years, in the midst of Immigration Reform, and specifically during the year of the Carl D. Perkins Career and Technical Education Act. With data on the value of the dollar, we can also see how this spending in 2006 relates to that of other years, and how changes compare to inflation.

## elsec16t.xls
- Where did you download the data (e.g., a web URL)?
  - https://www.census.gov/programs-surveys/school-finances/data/tables.html
  - https://www2.census.gov/programs-surveys/school-finances/tables/2016/secondary-education-finance/elsec16t.xls
- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
  - like this
- How many observations (rows) are in your data?
  - 14325
- How many features (columns) are in the data?
  - 40
- What questions (from above) can be answered using the data in this dataset?
  - Again, the first three questions above can be answered using this dataset in conjunction with those from other years. This particular dataset allows us to see what U.S. education spending looked like in the recent range of the last 30 years, and the beginnings of education under Betsy DeVoss in the Trump administration. Additionally, this data may add context to the January 11 teacher protest of this year, protesting the debt of Detroit Public Schools. With data on the value of the dollar, we can also see how this spending in 2016 relates to that of other years, and how changes compare to inflation.

## elsec97.xls
- Where did you download the data (e.g., a web URL)?
  - https://www.census.gov/programs-surveys/school-finances/data/tables.html
  - https://www2.census.gov/programs-surveys/school-finances/tables/1997/secondary-education-finance/elsec97.xls
- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
  - like this
- How many observations (rows) are in your data?
  - 15679
- How many features (columns) are in the data?
  - 105
- What questions (from above) can be answered using the data in this dataset?
  - Again, the first three questions above can be answered using this dataset in conjunction with those from other years. This particular dataset allows us to see what U.S. education spending looked like in the early to mid range of the last 30 years, and increased funding for preschool education. With data on the value of the dollar, we can also see how this spending in 1997 relates to that of other years, and how changes compare to inflation.

  ## cps_01_formatted.csv
  - Where did you download the data (e.g., a web URL)?
    - https://github.com/ecodan/school-shooting-data
  - How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
    - This data was compiled by GitHub user "ecodan" based on information from the [dataset underlying the Pah/Amaral/Hagan research](https://news.northwestern.edu/stories/2017/01/shootings-us-schools-link-unemployment) and a [Wikipedia article](https://en.wikipedia.org/wiki/School_shootings_in_the_United_States) on school shootings in the U.S. from 1990 to present. Pah compiled the first source by compiling previously-used data sets, reading reports on each incident of gun violence and establishing criteria for what constituted an incident. Wikipedia's list is compiled from various reports, added by various contributors. This particular dataset details the reported number of school shootings in the U.S., broken down by year and type of school (level and public vs. private.
  - How many observations (rows) are in your data?
    - 64
  - How many features (columns) are in the data?
    - 18
  - What questions (from above) can be answered using the data in this dataset?
    - This dataset will help answer our fourth question, since it breaks down the number of reported school shootings by private vs. public school over 64 years.

 ## Juvenile Arrests by Crime in the US

    - This dataset is an [API](https://public.opendatasoft.com/explore/dataset/juvenile-arrests-by-crime-in-the-us/table/?dataChart=eyJxdWVyaWVzIjpbeyJjaGFydHMiOlt7InR5cGUiOiJjb2x1bW4iLCJmdW5jIjoiQVZHIiwieUF4aXMiOiJjb3VudCIsInNjaWVudGlmaWNEaXNwbGF5Ijp0cnVlLCJjb2xvciI6IiMyQzNGNTYifV0sInhBeGlzIjoieWVhciIsIm1heHBvaW50cyI6NTAsInNvcnQiOiIiLCJjb25maWciOnsiZGF0YXNldCI6Imp1dmVuaWxlLWFycmVzdHMtYnktY3JpbWUtaW4tdGhlLXVzIiwib3B0aW9ucyI6e319fV0sInRpbWVzY2FsZSI6IiIsImRpc3BsYXlMZWdlbmQiOnRydWUsImFsaWduTW9udGgiOnRydWV9)

    - This dataset was collected by the Uniform Crime Reporting Program (URC). The arrests are by offense and categorized by age, sex, and sometimes race. The URC considers juveniles to be any individual under 18 years old. The years in this dataset range from 1995-2016.
    - How many observations (rows) are in your data?
      - 1920
    - How many features (columns) are in the data?
      - 4
    - What questions (from above) can be answered using the data in this dataset?
      - The last question can be answered by grouping this dataset and the education spending datasets by year. After this grouping the datasets can be joined and trends in educational spending and juvenile crime rates will be analyzed.    
