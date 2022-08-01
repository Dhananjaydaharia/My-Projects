##
## Data Visualization
##


## Bar Plots

H = c(7,12,28,3,41)

# Plot the bar chart.
barplot(H)

M = c("Mar","Apr","May","Jun","Jul")

# Plot the bar chart. (Vertical)
barplot(H,names.arg=M,xlab="Month",ylab="Revenue",
        col="blue", main="Revenue chart",border="red")

# Plot the bar chart. (Horizontal)
barplot(H,names.arg=M,xlab="Month",ylab="Revenue",
        col="blue", main="Revenue chart",border="red", horiz = TRUE)


## Stacked Bar Plot
# Create the input vectors.
colors = c("green","orange","brown")
months = c("Mar","Apr","May","Jun","Jul")
regions = c("East","West","North")

# Create the matrix of the values.
Values = matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11),
                nrow=3,ncol=5,byrow=TRUE)
Values

# Create the bar chart. Stacked
barplot(Values,main="total revenue",names.arg=months,
        xlab="month",ylab="revenue",col=colors)
# Add the legend to the chart.
legend("topleft", regions, cex=.8, fill=colors)

# Create the bar chart.  Beside
barplot(Values,main="total revenue",names.arg=months,
        xlab="month",ylab="revenue",col=colors, beside = TRUE)
# Add the legend to the chart.
legend("topleft", regions, cex=.8, fill=colors)

## Displaying barplot using diamonds dataframe
library(tidyverse)

glimpse(diamonds)
head(diamonds)

## Creating cut_vector
cut_vector = as.vector(levels(diamonds$cut))
length(cut_vector)
barplot(diamonds$price, names.arg = cut_vector)

## Creating color_vector
color_vector = as.vector(levels(diamonds$color))
length(color_vector)

## Display colors for each cut
colors <- c("green","orange","brown", 'blue','red')

barplot(table(diamonds$cut, diamonds$color), names.arg= color_vector, col = colors,
        beside = TRUE, 
        legend.text = TRUE, 
        args.legend = list(x = "topright",
                           inset = c(- 0.15, 0)))

##
## Pie Chart
##
x = c(21, 62, 10, 53)
labels = c("London", "New York", "Singapore", "Mumbai")

# Plot the chart.
pie(x,labels)

## Pie chart with title
pie(x, labels, main="City pie chart", col=rainbow(length(x)))
legend("topright", c("London","New York","Singapore","Mumbai"), cex=0.8, fill=rainbow(length(x)))

##
## 3D Pie Chart
##

library(plotrix) ## Uses the function pie3D from package plotrix

pie3D(x,labels= c("London", "New York", "Singapore", "Mumbai"),explode=0.1,
      main="Pie Chart of Countries ")
legend("topright", c("London","New York","Singapore","Mumbai"), cex=0.8, fill=rainbow(length(x)))

pieval=c(2,4,6,8)
pielabels=
  c("We hate\n pies","We oppose\n  pies","We don't\n  care","We just love pies")
# grab the radial positions of the labels
lp=pie3D(pieval,radius=0.9,labels=pielabels,explode=0.1,main="3D PIE OPINIONS")

# lengthen the last label and move it to the left
pielabels[4]="We cannot survive without our pies"
lp[4]=4.8

# specify some new colors
pie3D(pieval,radius=0.9,labels=pielabels,explode=0.1,main="3D PIE OPINIONS",
      col=c("brown","#ddaa00","pink","#dd00dd"),labelpos=lp)

## Percentage Pie Chart
piepercent= round(100*x/sum(x), 1)
pie(x, labels=piepercent, main="City pie chart",col=rainbow(length(x)))

##
## Histogram
##

# Create data for the graph.
v <- c(9,13,21,8,36,22,12,41,31,33,19)

# Create the histogram.
hist(v,xlab="Weight",col="yellow",border="blue")

# Generating data for histogram.
hist_data = rnorm(100, mean=20, sd=10)

hist(hist_data,xlab="Weight",col="pale green",border="blue",
     main = "Histogram of Weight Vector", ylim = c(0,40), xlim=c(-10, 50),
     breaks = 5)

## Visualizing mpg column from mtcars dataset 
hist(mtcars$mpg, main = "Mileage of cars", xlab = "Miles per Galon")


## 
## Density Plot
##

plot(density(diamonds$price), main = "Price distribution of Diamonds Price",
     xlab="Price", )
polygon(density(diamonds$price), col = 'green', border = 'red',lwd=2.5)

## mpg from mtcars dataset
plot(density(mtcars$mpg), main="Mileage distribution of cars",
     xlab = 'Miles per Galon')
polygon(density(mtcars$mpg), col = 'palegreen', border = 'darkblue',lwd=3.0)


## Line Charts

# Create the data for the chart.
v = c(7,12,28,3,41)
t = c(14,7,6,19,3)
x = c(10,3,5,8,20)

# Plot the Multiple chart.
plot(v,type = "o",col = "red", xlab = "Month", ylab = "Rain fall",
     main = "Rain fall chart")
lines(t, type = "o", col = "blue")
lines(x, type = "o", col = "green")

stocks = data.frame(
  date = as.Date('2009-01-01') + 0:14,
  Apple = rnorm(15, 20, 1),
  IBM = rnorm(15, 25, 2),
  Cisco = rnorm(15, 22, 3),
  MS = rnorm(15, 30, 5)
)

plot(stocks$date, stocks$Apple, type = 'o', col = 'darkgreen', ylim=c(15,45))
lines(stocks$date, stocks$IBM, type = 'o', col = 'red')
lines(stocks$date, stocks$Cisco, type = 'o', col = 'blue')
lines(stocks$date, stocks$MS, type = 'o', col = 'black')

##
## Box plots
##

input = mtcars[,c('mpg','cyl')]

# Plot the chart.
boxplot(mpg ~ cyl, data=mtcars,
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon",
        main="Mileage Data",
        col='yellow')

boxplot(mtcars$mpg, data=mtcars)

library(tidyverse)
head(diamonds)

boxplot(diamonds$price ~ diamonds$color)

plot(density(diamonds$price))

boxplot(log(diamonds$price))

plot(density(log(diamonds$price)))

## Scatter Plots

# Get the input values.
input = mtcars[,c('wt','mpg')]

# Plot the chart for cars with weight between 2.5 to 5 and mileage between 15 and 30.
plot(x=input$wt,y=input$mpg,
     xlab="Weight",
     ylab="Milage",
     xlim=c(2.5,5),
     ylim=c(15,30),
     main="Weight vs Milage"
)

colnames(diamonds)
plot(x=diamonds$carat,y=diamonds$price,
     xlab="cart",
     ylab="Price",
     main="Diamond Price caret vs price",
     col = diamonds$cut
)

## Scatter Plot Matrices  Pairplot

# Plot the matrices between 4 variables giving 12 plots.
# One variable with 3 others and total 4 variables.
pairs(~wt+mpg+disp+cyl,data=mtcars,
      main="Scatterplot Matrix")

##
## Heatmap
##

mtcars_matrix = as.matrix(mtcars)

heatmap(mtcars_matrix)

heatmap(mtcars_matrix, scale = 'column')

heatmap(mtcars_matrix, Colv = NA, Rowv = NA, scale = 'column')

##
## Wordcloud
##
library(dplyr)
library(wordcloud)

df = read.csv("f:/Sample Data/wordcloud.csv", header=TRUE)
head(df)
colnames(df)
df1 = df %>% arrange(desc(freq)) %>% select(word, freq) 
head(df1)
min(df1$freq)

set.seed(100)
wordcloud(words = df1$word, freq=df1$freq,
          random.order=TRUE,
          max.words=250,
          rot.per=0.20, 
          colors=brewer.pal(8, "Dark2"))


wordcloud(
  "Many years ago the great British explorer George Mallory, who 
was to die on Mount Everest, was asked why did he want to climb 
it. He said, \"Because it is there.\"

Well, space is there, and we're going to climb it, and the 
moon and the planets are there, and new hopes for knowledge 
and peace are there. And, therefore, as we set sail we ask 
God's blessing on the most hazardous and dangerous and greatest 
adventure on which man has ever embarked.",random.order=FALSE)

