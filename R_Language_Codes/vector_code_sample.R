## Vector Samples

x = c(10, 20)
class(x)
typeof(x)

char_vec=c('python','java','c#')
print(char_vec)
class(char_vec)

## Accessing the first element
x[1]

## 2nd Element
x[2]

#accessing all elements but not the first
char_vec[-1]

# Accessing last Element
char_vec[length(char_vec)]


#reversing the elements
rev(char_vec)


# sorting the elements of the vector
sort(char_vec,decreasing=TRUE) # ascending



vector1 = seq(10, 30, 3)
vector1
## Length of the vector
length(vector1)


## Accessing the vector elements by index
for (i in 1:length(vector1)) {
  
  cat("Index = ", i, "Value = ",vector1[i], fill = TRUE)
  
}

## Vectors
v1 = c(10, 11, 2, 3, 5, 7)
v2 = c(1, 3, 5, 7, 9, 11)
print(v1)

## Adding two vectors
v1+v2

## Subtracting 2nd vector elements from 1st vector
v1 - v2


v2 - v1 

## Scalar multiplication
v1 * 3

## Elementwise multiplication
v1 * v2

## Subsetting the vector with condition
print(v1)
newv1 = v1[v1 > 5]
newv1

## Selecting with set of elements
newv1 = v1[1:3]
newv1
# Create a vector. 
colors =  c('red','green',"yellow") 
print(colors) 
class(colors)


# Accessing vector elements. 
str1 = ""
for (x in 1:length(colors)) {

  str1 = paste(str1, colors[x])
  
}

print(str1)

## Accessing multiple elements
print(colors[1:2]) 

# Creating named vectors elements
colors = c("first" = 'red', "second" = 'green', "third" = 'yellow')
print(colors["second"])
print(colors[2])
print(colors[c("first","second")])

# to get all the keys
names(colors)

# Modifying vector elements
colors["second"] = "Orange"
print(colors)

colors[c('second','third')]=c('purple','pink')
print(colors)

# Deleting a vector
colors = NULL
print(colors)


# Creating named vectors elements
colors = c("first" = 'red', "second" = 'green', "third" = 'yellow')
print(colors)

# Can't delete a single element
colors[2] = NULL

# Recreating vector using required elements
colors <- colors[c(1,3)]
print(colors)

## Checking the existence of an element in a vector using %in% operator
'red' %in% colors
'Brown' %in% colors

n1 = c(10, 20, 30, 40, 50)
n2 = 40

for (x in 1:length(n1)) {
  if (n1[x] == n2) {
    print(cat(n2, 'is exist in vector n1'))
  }
}

n1 %in% n2

x1 = 1:20
x1

x1 = c(10, 20, 10, 30, 20, 40, 50, 40)

## To remove the duplicates

x1 = unique(x1)
x1

# Intersection elements

v1=c(1,3,4,4,5,6,7,7,9)
v2=c(7,8,9,22,33,22)
intersect(v1,v2)    # getting the common elements


# performing union
union(v1,v2) # getting all elements

setdiff(v1,v2) # Getting the elements from v1 which are not present in v2

setequal(v1,v2)  # checking whether all elements are same  in both vectors



