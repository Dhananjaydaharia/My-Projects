library(xlsx)

setwd('"C:/Users/Dhananjay/Documents/PGDA Data Science/imarticus PGDA/R Language/June_Weekday_Batch/Titanic Data/"')

# first row contains variable names, comma is separator 
# assign the variable id to row names
# note the / instead of / on mswindows systems 
mydata <- read.table("Titanic Data/train.csv", header=TRUE, 
                     sep=",", row.names="PassengerId")

class(mydata)
head(mydata)
str(mydata)
summary(mydata)

# read in the first worksheet from the workbook myexcel.xlsx
# first row contains variable names
library(readxl)
df_excel =  read_excel(file.choose())
df_excel
head(df_excel)

table(mydata$Survived)

head(mydata)
mysurivordata <- subset(mydata, mydata$Survived == 1)
str(mysurivordata)

write.csv(mysurivordata, file = ""C:/Users/Dhananjay/Documents/PGDA Data Science/imarticus PGDA/R Language/June_Weekday_Batch/Titanic Data/train.csv"")

setwd(choose.dir())  ## Setting the working directory by choosing the directory




library(RMySQL)
