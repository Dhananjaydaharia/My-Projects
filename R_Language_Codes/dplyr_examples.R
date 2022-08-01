library(downloader)
library(dplyr)

## Downloading the data from web directly
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- "sleep_data.csv"

getwd()  ## Displays the current working directory
setwd('C:/Users/Dhananjay/Documents/PGDA Data Science/imarticus PGDA/R Language')

if (!file.exists(filename)) download(url,filename)
msleep <- read.csv("sleep_data.csv")

str(msleep)
glimpse(msleep)  ## equivalent of str()
head(msleep)

colnames(msleep)  ## It prints only the column names

## Selecting only the name and sleeping total columns
msleep[, c('name','sleep_total')]
temp_df = select(msleep, name, sleep_total)
class(temp_df)
head(select(msleep, name, sleep_total),10)

## Selecting columns using select()
sleepData = select(msleep, name, sleep_total)
head(sleepData)

## To select all the columns except a specific column, 
## use the "-" (subtraction) operator (also known as negative indexing)
select(msleep, -c(name,conservation))
str(msleep)


##To select a range of columns by name, use the ":" (colon) operator
head(select(msleep, name:order), 10)  ## Displays top 10 rows
tail(select(msleep, name:order), 10)  ## Displays bottom 10 rows
colnames(msleep)
## To select all columns that start with the character string "sl",
## use the function starts_with()
head(select(msleep, starts_with("sl")))

## Using select function with various sub functions.

glimpse(iris)
select(iris, starts_with("Petal")) %>% head(10)
select(iris, ends_with("Width")) %>% head(10)
select(iris, contains("etal")) %>% head(10)
select(iris, matches(".t.")) %>% head(10)

##
## filter()  - This is equivalent of subset()
##

glimpse(msleep)
# Selecting the subset of rows using filter() and also selecting the required columns
filter(msleep, bodywt >= 600)
filter(msleep, sleep_total >= 16) %>% select(name, sleep_total)

## Filter the rows for mammals that sleep a total of more than 16 hours and 
## have a body weight of greater than 1 kilogram.

filter(msleep, sleep_total >= 16, bodywt >= 1) %>% select(name, sleep_total, bodywt)
filter(msleep, sleep_total >= 16 | bodywt >= 200) %>% select(name, sleep_total, bodywt)

## Filter the rows using %in% clause
filter(msleep, order %in% c("Perissodactyla", "Primates")) %>% select(name, order, sleep_total, bodywt)

## Demonstration of Piping Operator
msleep %>% 
  select(name, sleep_total) %>% 
  head(10)

## 
## Arrange()
##
## Arranging the data using arrange() function. 
## Default order is Ascending
msleep %>% 
  select(name, order, sleep_total) %>% 
  arrange(order, desc(sleep_total)) %>% 
  head(20)

## Using descending order as well as using multiple functions
msleep %>% 
  select(name, order, sleep_total) %>%
  arrange(order, desc(sleep_total)) %>% 
  filter(sleep_total <= 16) %>% tail(20)

##
## mutate()
##

## Demonstration of mutate()
## Mutate is used to create new computational column using existing columns.
colnames(msleep)
msleep['rem_proportion'] = msleep['sleep_rem'] / msleep['sleep_total']
head(msleep)
msleep$rem_proportion = NULL

msleep %>% 
  mutate(rem_proportion = round(sleep_rem / sleep_total,2)) %>%
  select(name, sleep_rem, sleep_total, rem_proportion) %>%
  head(10)

msleep %>% 
  mutate(rem_proportion = round(sleep_rem / sleep_total,2), 
         bodywt_grams = bodywt * 1000) %>%
  select(name, sleep_rem, sleep_total, rem_proportion, bodywt_grams) %>%
  head()

head(msleep$brainwt)


## Updating the existing column
msleep %>% 
  mutate(brainwt = brainwt * 1000) %>%
  head(10)

## Demonstration of summarise()
msleep %>% 
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total),
            max_sleep = max(sleep_total),
            total = n())

summary(msleep$sleep_total)  ## Summary Statistics of the data frame (Only for numerical data)

## Demonstration of group_by() and Summarise()
msleep %>% 
  filter(bodywt > 100) %>%
  group_by(order) %>%
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total), 
            max_sleep = max(sleep_total),
            sd_sleep = sd(sleep_total),
            total = n())



head(mtcars)


mtcars %>% 
  group_by(cyl, am) %>% 
  summarize(avg_mpg = mean(mpg),
            min_mpg = min(mpg),
            max_mpg = max(mpg))

mtcars %>% slice_max(mpg, n= 5) %>% select(mpg, cyl) ## It will display top 5 mpg records.

mtcars %>% arrange(desc(mpg)) %>% head(5)
mtcars %>% 
  mutate(carname = rownames(mtcars)) %>% 
  slice_min(mpg, n= 5) %>% 
  select(carname, mpg)


##  missing values checking 
sum(is.na(msleep))

miss_value_records = msleep[which(is.na(msleep), arr.ind = TRUE), ]

miss_value_records %>% head(10)