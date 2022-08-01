library(readr)
library(sqldf)
library(tidyr)
library(dplyr)

# ---
# 
# readr supports seven file formats with seven read_ functions:
#   
# read_csv(): comma separated (CSV) files
# read_tsv(): tab separated files
# read_delim(): general delimited files
# read_fwf(): fixed width files
# read_table(): tabular files where columns are separated by white-space.
# read_log(): web log files
# ---
options(sqldf.driver = "SQLite")
mtcars <- read_csv(readr_example("mtcars.csv"))

crashes <- read_csv(file.choose())
glimpse(crashes)
str(crashes)

roads <- read_csv(file.choose())
glimpse(roads)


## Selecting data from dataframes
join_string <- "select
                crashes.*, roads.District, roads.Length
                from crashes
                  left join roads on crashes.Road = roads.Road"

crashes_join_roads <- sqldf(join_string, stringsAsFactors = FALSE)
head(crashes_join_roads)

join_string2 <- "select
                  crashes.*, roads.District, roads.Length
                  from crashes
                    inner join roads on crashes.Road = roads.Road"
crashes_join_roads2 <- sqldf(join_string2, stringsAsFactors = FALSE)

## Merging two dataframes
crashes_merge_roads <- merge(crashes, roads, by = c("Road"))
crashes_merge_roads2 <- merge(crashes, roads, by = c("Road"), all.x = TRUE)
crashes_merge_roads4 <- merge(crashes, roads, by = c("Road"), all.x = TRUE, 
                              all.y = TRUE)

## with conditional filter
join_string2 <- "select
                crashes.*, roads.District, roads.Length
                from crashes
                    inner join roads
                    on crashes.Road = roads.Road
                where crashes.Road = 'US-40'"                
crashes_join_roads4 <- sqldf(join_string2,stringsAsFactors = FALSE)

 ## Aggregating data using sqldf
group_string <- "select
                  crashes.Road, avg(crashes.N_Crashes) as Mean_Crashes
                from crashes
                  left join roads
                  on crashes.Road = roads.Road
                group by 1"
sqldf(group_string)

mpg_auto <- sqldf("select mpg from mtcars where am = 1")
dim(mpg_auto)

mpg_manual <- sqldf("select mpg from mtcars where am = 0")
dim(mpg_manual)


sales_data <- read_tsv(file.choose())
glimpse(sales_data)
class(sales_data)

poor_sales <- sqldf("select year, sum(salesvalue) as 'sales_by_year' from sales_data group by year")
poor_sales

sqldf("select mpg, cyl from mtcars where am = 0")
glimpse(mtcars)
head(mtcars)
rownames(mtcars)
