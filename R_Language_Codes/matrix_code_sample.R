##
## Matrix Data Structure
##

vec = 1:9
vec

# Creating a columnwise matrix
matx = matrix(vec,3,3)
print(matx)

# Creating a row-wise matrix
matx <- matrix(vec, ncol=3, nrow=3, byrow=TRUE) 
print(matx)

# Creating matrix with dimension names
x <- matrix(1:9, nrow = 3, dimnames = list(c("r1","r2","r3"), c("c1","c2","c3"))) 
print(x) 

## Subsetting the matrix elements using dimension names
x['r1',]  #  Returns all the elements in r1
x[, 'c2']  ## Returns all the elements from c2
x[, 2]  ## Retrieving elements using column index


# Modifying a single element
x[2,2] = 10 

print(x)

x = x * 2
print(x)

# Modifying elements using logical condition
x[, 1] = 0
x[1,2] = 0

x[x < 5] = 0
print(x)

x[, 'c1'] = x[, 'c1'] * 2
x

## Scalar multiplication
x = x * 3
print(x)

m1 = matrix(1:4, nrow=2, ncol=2)
m2 = matrix(5:8, nrow=2, ncol=2)
m1
m2

## Matrix Addition
m1 + m2

## Matrix element-wise multiplication
m1 * m2

## Matrix elemetwise division
round(m1 / m2,2)

## Matrix Multiplication operator (%*%)
m1 %*% m2

## Transpose of a matrix t()
t(matrix(1:9, nrow=3, ncol=3))


## 
## Arrays
##

a1 = array(seq(3, 81, 3), dim=c(3, 3,3))
length(seq(3, 81, 3))
a1

a1[1, , 1]
a1[, , 2]

## To generate numbers, we can use seq()
## seq(start, end, step)

seq(1, 10, 2)
seq(0,10,2)


