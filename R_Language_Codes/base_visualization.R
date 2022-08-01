head(mtcars)

counts = sort(table(mtcars$gear), decreasing = TRUE)
print(counts)

## barplot (default = vertical)
barplot(counts, 
        xlab='Number of Gears', 
        ylab='Number of Cars', 
        main='No of cars based on gear',
        col=c('red','green','orange'),
        ylim = c(0,20),
        names.arg = c('3 Gears','4 Gears','5 Gears'),
        legend=c('3 Gears','4 Gears','5 Gears'))


## Horizontal Bar Chart
barplot(counts, 
        ylab='Number of Gears', 
        xlab='Number of Cars', 
        main='No of cars based on gear',
        col=c('red','green','orange'),
        xlim = c(0,16),
        names.arg = c('3 Gears','4 Gears','5 Gears'),
        legend=c('3 Gears','4 Gears','5 Gears'),
        horiz=TRUE)

## Stacked Bar Chart
counts = table(mtcars$vs, mtcars$gear)
counts
barplot(counts, 
        xlab='Number of Gears', 
        ylab='Number of Cars', 
        main='No of cars based on gear',
        col=c('blue','yellow'),
        legend=rownames(counts),
        beside = FA)

##
## PIE Chart
##
x <- c(21, 62, 10, 53)

y =  c('A1'=21, 'A2'=62, 'A3'=10, 'A4'=53)

# Plot the chart.
labels = c("London", "New York", "Singapore", "Mumbai")
pie(x, labels)

pie(y)

pct = paste(c(round((x/sum(x))*100,0)),'%',sep='')
pct
labels <- paste(c("London", "New York", "Singapore", "Mumbai"),pct)
labels

## Pie chart with title
pie(x, radius=1.0, labels, 
    main="City Population Ratio pie chart", 
    col=rainbow(length(x)))

library(plotrix)

pie3D(x,labels= labels, explode=0.2,
      main="Pie Chart of Countries ")

##
## Histogram
##

hist(mtcars$mpg, main='Mileage Vs frequency')

## Manually creating the number of bins
hist(mtcars$mpg, main='Mileage Vs frequency',ylab = 'Count', breaks=5)


df = read.csv("C:/Users/Dhananjay/Documents/PGDA Data Science/imarticus PGDA/R Language/June_Weekday_Batch/Titanic Data/train.csv")
head(df)
dim(df)

hist(df$Age,breaks=10)


## 
## Kernal Density Plot
##
# displot , execute all till lines() by selecting all
head(mtcars, 10)
hist(mtcars$mpg,freq=FALSE)
l=(density(mtcars$mpg))
lines(l)

# just the histo gram
plot(density(mtcars$mpg), xlab = "Number of data points",
     main = 'Density plot of Mileage per Gallon')

polygon(density(mtcars$mpg), col='yellow')

data()  ## List of inbuilt data sets availability with names
library(ggplot2)
data("diamonds")  ## I am getting the 'diamonds' data set from inbuilt data sets.
head(diamonds)
dim(diamonds)

plot(density(diamonds$price))

plot(density(log(diamonds$price)))

data()
data("ChickWeight")

head(ChickWeight)

plot(density(ChickWeight$weight), 
     main='Density Plot of Chicken Weights based on Diets')

## Log of Checken Weight since the original
## Weight is not normally distributed
plot(density(log(ChickWeight$weight)), 
     main='Density Plot of Chicken Weights based on Diets',
     col='Red')

polygon(density(log(ChickWeight$weight)),
        col='skyblue',
        border = 'darkgreen',
        lwd = 4)


head(ChickWeight$weight)
##
## Line Chart
##

months = seq(1,12)
print(months)
plot(months, head(ChickWeight$weight,12), type='o',
     xlab='Months',
     ylab='Weight',
     main='Average Chicken Weight by month',
     lwd=5,col='red')

head(ChickWeight)
plot(head(ChickWeight$Time,15), head(ChickWeight$weight,15), type='o',
     xlab='Time',
     ylab='Weight',
     main='Average Chicken Weight by Time')

summary(ChickWeight$weight)

## Line Charts

# Create the data for the chart.
v <- c(7,12,28,3,41)

# Plot the Line chart.
plot(v,type="b")

##
## Box plot
## Box plots are using to identify any outliers in the data
##

boxplot(ChickWeight$weight)
qt_1 = quantile(ChickWeight$weight, .25)  ## 25th Percentile
qt_3 = quantile(ChickWeight$weight, .75)  ## 55th Percentile

iqr = IQR(ChickWeight$weight)  ## Inter quartile range
print(qt_3)
print(qt_1)
print(iqr)
min_limit = qt_1 - (1.5 * iqr)  ## Outlier lower limit
max_limit = qt_3 + (1.5 * iqr)  ## Outlier upper limit
print(min_limit)

print(max_limit)

ChickWeight$weight[ChickWeight$weight > 314.875]

chwt = ChickWeight$weight[ChickWeight$weight <= 315]
plot(density(chwt))
summary(ChickWeight$weight)

boxplot(ChickWeight$weight ~ ChickWeight$Diet)

boxplot(diamonds$price ~ diamonds$cut)
summary(diamonds$price)
plot(density(diamonds$price))

library(dplyr)
newdf = ChickWeight %>% filter(ChickWeight$weight <= 314.875)
head(newdf)

boxplot(newdf$weight)

## 
## Heatmap
##

head(mtcars)

## 
heatmap(mtcars)


heatmap(as.matrix(mtcars), scale='column')

library(dplyr)
colnames(mtcars)
mtcars %>% select(cyl, disp, hp, drat, wt) %>% cor() %>% heatmap()

heatmap(cor(mtcars), Colv =  NA, Rowv = NA)

plot(mtcars$wt, mtcars$mpg, xlab = 'Weight', ylab = 'MPG',
     main = "Scatter plot to display Weight and MPG")
plot(mtcars$qsec, mtcars$hp)

library(ggplot2)
plot(diamonds$carat, diamonds$price)

str(diamonds)
diamonds %>% 
  select(carat, depth, table, price) %>% 
  cor() %>% 
  heatmap()
heatmap(cor(diamonds))


## GGPLOT2

library(ggplot2)
head(diamonds)
ggplot(diamonds, aes(x=cut)) +
  geom_bar()

ggplot(diamonds, aes(x = price)) +
  geom_density()

ggplot(hsv, aes(x=read)) + geom_bar()

