# Creating a Factor
x = factor(c("single", "married", "married", "single"));
class(x)
print(x) 


# value counts
table(x)

#Give the percentage of record in each category
prop.table(table(x))


x = factor(append(x, 'widow'))
levels(x)


#Deleting the second element
length(x1)
x1=x1[-2]
length(x1)

## Adding a new category with existing categories
x = factor(append(as.character(x),'widow'))
print(x)
x = factor(append(as.character(x), 'widow'), levels=c('married','single','widow'))
print(x)
levels(x)

# Creating a factor with more levels
x = factor(c("single", "married", "married", "single"), levels = c("single", "married", "widow","divorced")); 
print(x)

## Selecting elements from factor variable
x[1] ## Printing the 1st element from the factor variable
x[2:4]

ratings = factor(c(1, 2, 2, 3, 4, 5, 1, 2, 5), levels = c(1, 2, 3, 4, 5))
print(ratings)
