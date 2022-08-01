
library(RMySQL)

## Creating connection to MySQL DB
mysqlconnection = dbConnect(MySQL(), 
                            user='root', 
                            password='Family@123', 
                            dbname='sakila', 
                            host='localhost')

## Listing tables from sakila database
dbListTables(mysqlconnection)

# Query the "actor" tables to get all the rows.
result = dbSendQuery(mysqlconnection, "select * from actor")
class(result)

# Store the result in a R data frame object. n=5 is used to fetch first 5 rows.
actor_df = fetch(result, n=5)
print(actor_df)
class(actor_df)

## Clearing the pending results
dbClearResult(result)


## Query with filter
result = dbSendQuery(mysqlconnection, "select * from actor where last_name='TORN'")

# Fetch all the records(with n = -1) and store it as a data frame.
data.frame = fetch(result, n=-1)
print(data.frame)

## Clearing the pending results
dbClearResult(result)

# Use the R data frame "mtcars" to create the table in MySql.
# All the rows of mtcars are taken inot MySql.
dbWriteTable(mysqlconnection, "mtcars", mtcars[, ], overwrite = TRUE)

## Updating data in the table
dbSendQuery(mysqlconnection, "update mtcars set disp = 168.5 where hp = 110")

## Inserting data into mtcars table
dbSendQuery(mysqlconnection,
            "insert into mtcars(row_names, mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb)
            values('New Mazda RX4 Wag', 21, 6, 168.5, 110, 3.9, 2.875, 17.02, 0, 1, 4, 4)"
)

## Dropping a table from database
dbSendQuery(mysqlconnection, 'drop table if exists mtcars')

