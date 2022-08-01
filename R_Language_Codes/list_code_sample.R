## 
## Lists
##

# creating a Lists from multiple vectors
vec <- c(1,2,3)
char_vec <- c("Hadoop", "Spark", "Flink", "Mahout")
logic_vec <- c(TRUE, FALSE, TRUE, FALSE)
out_list <- list(vec, char_vec, logic_vec)
print(out_list)

length(out_list)
## Selecting the elements from the list
class(out_list)
temp_list = out_list[2]
class(temp_list)

# Creating names for list elements
data_list <- list(c("Jan","Feb","Mar"), matrix(c(1,2,3,4,-1,9), nrow = 3, ncol=2),list("Red",12.3))
data_list
names(data_list) <- c("Month", "Matrix", "Misc")
print(data_list)

# fetching only FEB
data_list$Month[2]
data_list[[1]][2]

## selecting an element from list using name of the element
data_list$Month

# Accessing main list elements
print(data_list[1])


# Accessing element in a list element
print(data_list[["Month"]][1])
data_list$Month[1]

## Accessing 'Matrix' element from data_list
data_list$Matrix

data_list$Matrix[2,2]
data_list[2]

data_list[[2]][3,2]
# Merging lists
num_list <- list(1,2,3,4,5)       #Author DataFlair
day_list <- list("Mon","Tue","Wed", "Thurs", "Fri")
merge_list <- c(num_list, day_list)
print(merge_list)


# Convecrting Lists into vectors
int_list <- list(1:5)     #Author DataFlair
print(int_list)
int_list2 <- list(10:14)
print(int_list2)

class(int_list)


# Using unlist() to create vectors
vec1 <- unlist(int_list)
vec2 <- unlist(int_list2)
print(vec1)
print(vec2)

class(vec1)

# Predefined lists available in R
#Author DataFlair
letters
LETTERS
month.abb
month.name

month_number = 5
month.name[month_number]
month.abb[month_number]

str_date = "2022-05-12"
class(str_date)

curr_date = as.Date(str_date)
class(today)

today + 1:7

for (x in  1:7) {
  print(today + x)
}

today - 1
