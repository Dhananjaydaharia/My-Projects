library(tidyr)
library(dplyr)
library(datasets)

## Creating Data Frame
set.seed(1)
stocks <- data.frame(
  date = as.Date('2022-06-01') + 0:14,
  IBM = rnorm(15, 20, 1),
  MS = rnorm(15, 25, 2),
  YAHOO = rnorm(15, 22, 3),
  GOOGLE = rnorm(15, 35, 3)
)
print(stocks)
dim(stocks)

## Demonstrating gather function - part of tidyr package
stocksL <- gather(data = stocks, key = CompanyName, value = StockPrice, IBM:GOOGLE)

head(stocksL,15)
tail(stocksL, 15)
slice(stocksL, 16:30)# slicing the rows from dataframe
dim(stocksL)

stocksL %>% 
  group_by(CompanyName) %>%
  summarise(avg_price = mean(StockPrice),
            min_price = min(StockPrice),
            max_price = max(StockPrice))


## Demonstrating spread function
spread(data = stocksL, key = CompanyName, value = StockPrice)

library(dplyr)

stocksL %>% group_by(CompanyName) %>% summarise(avg_price = mean(StockPrice))

## Another example using mtcars
## mtcars is an in-built dataset
head(mtcars)

## adding the car names as a new column
mtcars$car <- rownames(mtcars)
head(mtcars)

## rearranging the columns
mtcars <- mtcars[, c(12,1:11)]

mtcarsNew <- mtcars %>% gather(attribute, value, -car)
head(mtcarsNew)

mtcarsNew <- mtcars %>% gather(attribute, value, mpg:gear)
head(mtcarsNew)
tail(mtcarsNew)


## creating a new set of data for unite() and separate()
set.seed(1)
date <- as.Date('2016-01-01') + 0:14
hour <- sample(1:24, 15)
min <- sample(1:60, 15)
second <- sample(1:60, 15)
event <- sample(letters, 15)
data <- data.frame(date, hour, min, second, event, stringsAsFactors = FALSE)
head(data)

## unite() creating a date column using individual units
dataNew <- data %>%
  unite(datehour, date, hour, sep = ' ') %>%
  unite(datetime, datehour, min, second, sep = ':')
head(dataNew)


## covert strings to datetime format
#$as.POSIXct(datetime,'%y-%m-%d)


## separate()

data1 <- dataNew %>% 
  separate(datetime, c('date', 'time'), sep = ' ') %>% 
  separate(time, c('hour', 'min', 'second'), sep = ':')
head(data1)

stocks <- data.frame(
  year   = c(2015, 2015, 2016, 2016),
  half  = c(   1,    2,     1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>% 
  spread(key=year, value=return) %>% 
  gather(year, return, `2015`:`2016`)

## Missing values
stocks <- data.frame(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)
print(stocks)

stocksN <- data.frame(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016, 2017,2017,2017),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4,1,3,4),
  return = c(1.88, NA, 0.35,   NA, 0.92, 0.17, 2.66,1.63,NA,1.89)
)
print(stocksN)
stNN <- stocksN %>% complete(year,qtr)%>%fill(return)
tapply(stNN$return, stNN$year, sum)
sum(is.na(stNN))



