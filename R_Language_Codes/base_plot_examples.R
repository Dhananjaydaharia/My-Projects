library(plotrix)

x <- c(21, 62, 10, 53)
labels <- c("London", "New York", "Singapore", "Mumbai")

# Plot the chart.
pie(x,labels)

## Pie chart with title
pie(x, labels, main="City pie chart", col=rainbow(length(x)))

pie3D(x,labels= c("London", "New York", "Singapore", "Mumbai"),explode=0.1,
      main="Pie Chart of Countries ")

## 3 dimension pie chart
pieval<-c(2,4,6,8)

pielabels<-
  c("We hate\n pies","We oppose\n  pies","We don't\n  care","We just love pies")
# grab the radial positions of the labels
lp<-pie3D(pieval,radius=0.9,labels=pielabels,explode=0.1,main="3D PIE OPINIONS")
# lengthen the last label and move it to the left
pielabels[4]<-"We cannot survive without our pies"
lp[4]<-4.8
# specify some new colors
pie3D(pieval,radius=0.9,labels=pielabels,explode=0.1,main="3D PIE OPINIONS",
      col=c("brown","#ddaa00","pink","#dd00dd"),labelpos=lp, theta = 1)

## Percentage Pie Chart
piepercent<- round(100*x/sum(x), 1)
pie(x, labels=piepercent, main="City pie chart",col=rainbow(length(x)))

## Bar Plots

H <- c(7,12,28,3,41)
# Give the chart file a name.

# Plot the bar chart.
barplot(H)

M <- c("Mar","Apr","May","Jun","Jul")

# Plot the bar chart.
barplot(H, names.arg=M, ylab="Month", xlab="Revenue", col="blue",
        main="Revenue chart",border="red", horiz = TRUE)

## Stacked Bar Plot
# Create the input vectors.
colors <- c("green","orange","brown")
months <- c("Mar","Apr","May","Jun","Jul")
regions <- c("East","West","North")

# Create the matrix of the values.
Values <- matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11),nrow=3,ncol=5,byrow=TRUE)
# Create the bar chart.
barplot(Values, main="total revenue", names.arg=months,
        xlab="month",ylab="revenue",col=colors,
        legend = regions, beside = TRUE)

## Box plots

input <- mtcars[,c('mpg','cyl')]
summary(input)
# Plot the chart.
boxplot(mpg ~ cyl, data=mtcars,
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon",
        main="Mileage Data")

##
## Histogram
##

# Create data for the graph.
v <- c(9,13,21,8,36,22,12,41,31,33,19)

# Create the histogram.
hist(v,xlab="Weight",col="yellow",border="blue")

## Line Charts

# Create the data for the chart.
v <- c(7,12,28,3,41)

# Plot the Line chart.
plot(v,type="o")

## Scatter Plot
##

head(mtcars)
plot(x = mtcars$wt, y = mtcars$mpg, 
  xlab = "Weight",
  ylab = "Miles per Gallon",
  xlim = c(round(min(mtcars$wt),1),round(max(mtcars$wt),1)),
  ylim = c(round(min(mtcars$mpg),0), round(max(mtcars$mpg),0)),
  main = "Miles per Gallon vs Weight"
)

df = read.csv("f:/Sample Data/wordcloud.csv", header=TRUE)
head(df)
colnames(df)
df1 = df %>% arrange(desc(freq)) %>% select(word, freq)
dim(df1)
head(df1)
min(df1$freq)
library(wordcloud)
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
