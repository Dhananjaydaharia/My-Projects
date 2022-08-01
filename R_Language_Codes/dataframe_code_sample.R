# Create the data frame.
emp.data = data.frame(
  emp_id = c(1:5),
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25),
  start_date = as.Date(c("2012-01-01","2013-09-23","2014-11-15",
                         "2014-05-11","2015-03-27")),
  stringsAsFactors = FALSE   # it is set false by default
)

# Print the data frame.
print(emp.data)

# Get the structure of the data frame.
str(emp.data)

## Get the names of all the columns from the data frame
colnames(emp.data)

# check nulls seperately
sum(is.na(emp.data))


# Print the summary.  It will display the basic statistical 
## information for numerical columns
print(summary(emp.data))

## Extracting single column
emp.data$emp_name
emp.data[, 'emp_name']
emp.data[ ,2]


class(emp.data$emp_name)


# Extract Specific columns.
result = data.frame(emp.data$emp_name,emp.data$salary)
print(result)

emp.data[,c(2:4)]

## Renamed the column names
colnames(result) = c('Emp_name', 'Salary')

sort(result$Emp_name)

## Creating a data frame with all the rows and only emp_name and
## salary columns
result = emp.data[, c('emp_name', 'salary')]
class(result)
print(result)

## Subset the data frame with number of rows and number of columns
result = emp.data[1:3, c('emp_name','salary')]
print(result)

emp.data[c(1,2,3), c('emp_name','salary')]

# Getting top 2 salaries with their all records
emp.data[emp.data$salary %in% head(sort(emp.data$salary,decreasing=TRUE),2),]

# except top 2 get all records
emp.data[!(emp.data$salary %in% head(sort(emp.data$salary,decreasing=TRUE),2)),]

# Extract first two rows and all the columns.
result = emp.data[1:2,]
print(result)

# Extract 3rd and 5th row with 2nd and 4th column.
result = emp.data[c(3,5),c(2,4)]
print(result)

# Add the "dept" coulmn.
emp.data$dept = c("IT","Operations","IT","HR","Finance")
str(emp.data)
print(emp.data)

emp.data&hobby= c("crickrt","kabaddi","kho","ball","hockey")
str(emp.data)

## Converting dept from character data type to factor (categorical data type)
emp.data$dept = as.factor(emp.data$dept)

colnames(emp.data)[5] = 'department'  ## Renaming column 'dept' to 'department'

emp_data = emp.data  ## copying the data frame into a new variable
str(emp_data)
emp_data$bonus = emp_data$salary * .10  ## Adding a computed column
emp_data

emp_data$bonus = NULL  ## Deleting the added bonus column

# Create the second data frame
emp.newdata = data.frame(
  emp_id = c (6:8),
  emp_name = c("Rasmi","Pranab","Tusar"),
  salary = c(578.0,722.5,632.8),
  start_date = as.Date(c("2013-05-21","2013-07-30","2014-06-17")),
  department = c("IT","Operations","Fianance")
)

dim(emp.data)  ## gives the dimension of the data frame
dim(emp.newdata)

print(emp.newdata)

# Bind the two data frames.
emp.finaldata = rbind(emp.data,emp.newdata)
print(emp.finaldata)
dim(emp.finaldata)

## Selecting subset of rows. Selecting the IT dept employees
itemp = subset(emp.finaldata, department == 'IT')
print(itemp)

itemp = subset(emp.finaldata, department == 'IT' & salary > 620)
print(itemp)

itemp = subset(emp.finaldata, department == 'IT' & salary < 600)
print(itemp)

subset(emp.finaldata, department %in% c('IT','HR') & salary > 600)

## To retrieve top rows (By default, it will return 6 rows)
head(emp.finaldata)

## To retrieve the bottom rows
tail(emp.finaldata)

## Preloaded data sets.
mtcars
iris

head(mtcars, n = 2)  ## Retrieving top 10 tops.
