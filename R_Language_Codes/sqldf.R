rm(list=ls())


library(sqldf)
#'Set up the path to data
#+ message = F, warning = F
# path2data <- file.path(file.choose())
# path2data



##Data wrangling using SQL statements via `sqldf`
#'
#'Load the trimmed iris dataset into R
#+ message = F, warning = F
#iris_all <- read.csv.sql("E:/iprimed/sampledata/iris.csv", sql = "SELECT * FROM file", header = TRUE, sep = ",")
iris_all <- read.csv("E:/iprimed/sampledata/iris.csv", header = TRUE, sep = ",")
head(iris_all)
str(iris_all)

#'##`sqldf`: SELECT    
#'
#'* used to select either some or all the variables from a table  
#'* `*` is a wildcard that is used to denote all variables  
#'* a good programming practice to list the variable names that you need and avoid the use of `SELECT *`  
#'
#'Let's obtain only the `Species` and `Sepal.Length` variables from the `iris_all` data.frame, looking at the first 10 observations.  
#'
#+ message = FALSE, warning = FALSE
sqldf("SELECT species, sepal_length FROM iris_all LIMIT 10")

#'Create a new variable `Sepal.Area` given by `Sepal.Area = Sepal.Length * Sepal.Width`
#'
#+ message = FALSE, warning = FALSE
sqldf("SELECT sepal_length, sepal_width, sepal_length * sepal_width AS sepal_area FROM iris_all LIMIT 10")


#'##`sqldf`: DISTINCT
#'
#'* Similar to the `unique` function in base R
#'* Retrieves distinct records from the variables specified
#'* Used together with the `SELECT` keyword
#'
#'What are the distinct `Species` in the `iris_all` data.frame?  
#'
#+ message = FALSE, warning = FALSE
sqldf("SELECT DISTINCT Species
      FROM iris_all")

#'##`sqldf`: WHERE
#'
#'* used to filter the observations based on certain conditions 
#'
#'Which observations have `Sepal.Length` strictly less than 4.5 units?  
#'
#+ message = FALSE, warning = FALSE
sqldf("SELECT * 
      FROM iris_all
      WHERE sepal_length < 4.5")

#'##`sqldf`: AND, OR, LIKE, IN
#'
#'* `AND` & `OR`: used when there are multiple filter conditions (similar to `&` and `|` in base R)
#'* `LIKE`: used to filter for similarity of strings
#'    * `_`: exactly one unknown character  
#'    * `%`: an unknown number of unknown characters  
#'
#'* `IN`: used to filter values belonging to a set of values (similar to `%in%` in base R)
#'
#'Which `setosa` observations have `Sepal.Length` strictly less than 5 units?  
#'
#+ message = FALSE, warning = FALSE
# AND
sqldf("SELECT * 
      FROM iris_all
      WHERE Species = 'setosa' AND sepal_length < 5")

#'Which observations have either `Sepal.Length` strictly less than 4.5 units or `Sepal.Width` strictly less than 2.5 units?  
#+
# OR
sqldf("SELECT * 
      FROM iris_all
      WHERE sepal_length < 4.5 OR sepal_width < 2.5")

#'Which observations have `Species` starting with `"se"`?  
#+
# LIKE
sqldf("SELECT * 
      FROM iris_all
      WHERE Species LIKE 'se%'")

#'Which observations have `Species` either equal to `"versicolor"` or `"setosa"`?  
#+
# IN
sqldf("SELECT * 
      FROM iris_all
      WHERE Species IN ('versicolor', 'setosa')")


#'##`sqldf`: ORDER BY
#'
#'* order/sort data by variables
#'
#'Sort the data by descending order of `Species`, followed by ascending order of `Sepal.Length`.  
#'
#+ message = FALSE, warning = FALSE
sqldf("SELECT * 
      FROM iris_all
      ORDER BY Species DESC, sepal_length ASC
      LIMIT 10")


#'##`sqldf`: Aggregation and GROUP BY
#'
#'* Aggregation: used to create summarized values
#'* `GROUP BY`: usually used during aggregation based on group
#'
#'Obtain the mean, min and max values of `Sepal.Length` for the entire iris_all dataset.  
#'Obtain the mean, min and max values of `Sepal.Length` for each `Species`.  
#'
#+ message = FALSE, warning = FALSE
# No grouping; aggregate by whole dataset
sqldf("SELECT AVG(sepal_length) as avg, MIN(sepal_length) as min, MAX(sepal_length) as max
      FROM iris_all")

# Aggregation by Species
iris_group <- sqldf("SELECT Species, AVG(sepal_length) as avg, MIN(sepal_length) as min, MAX(sepal_length) as max
                    FROM iris_all
                    GROUP BY Species")
iris_group


sqldf("SELECT iris_all.Species, iris_all.sepal_length, iris_group.avg, iris_group.max, iris_group.min
      FROM iris_all
      INNER JOIN iris_group
      ON iris_all.Species = iris_group.Species
      LIMIT 10")
