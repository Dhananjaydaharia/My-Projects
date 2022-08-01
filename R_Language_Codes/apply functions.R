## 
## Demo of apply family of functions
##

#apply
mymatrix <- matrix(seq(1,60,2), 5, 6, byrow = TRUE)
print(mymatrix)

dim(mymatrix)[1]

## Get the average of each row
for (idx in 1:dim(mymatrix)[1]) {
  print(mean(mymatrix[idx,]))
}

apply(mymatrix, MARGIN = 1, FUN=mean)
apply(mymatrix, MARGIN = 1, FUN=max)
apply(mymatrix, MARGIN = 2, FUN=mean)
round(apply(mymatrix, MARGIN = 2, FUN=sd),2)

sum(mymatrix)

rowMeans(mymatrix)
colMeans(mymatrix)

mycolmeans = function(x) {
  return (apply(x, MARGIN=2, FUN = mean))
}

mycolmeans(mymatrix)

#lapply
mylist <- list(x = 1:5, y = 6:15, z = 10:25)
mylist
length(mylist)

sum_of_mylist = lapply(mylist, FUN = sum)  ## The output will be a list
sum_of_mylist

for (i in 1:length(mylist)) {  ## Iterating each and every element in the list
  total = 0
  for (j in 1:length(mylist[[i]])) {  ## Iterating each and every element in the list element
    total = total + mylist[[i]][j]
  }
  print(total)
}

sapply(mylist, FUN = sum)  ## The output will be as a vector
sapply(mylist, FUN = mean)

# tapply

#library(mtcars)
library(datasets)
dim(mtcars)
head(mtcars)

sort(unique(mtcars$cyl))
table(mtcars$cyl)

subset(mtcars, mtcars$cyl == 6)
unique(mtcars$cyl)

mean(mtcars$mpg)

round(tapply(mtcars$mpg, mtcars$cyl, mean),2)

round(tapply(mtcars$mpg, mtcars$am, mean))
# rapply

x=list(1,2,3,4)

rapply(x,function(x){x^2},class=c("numeric"))

x=list(1,2,3,4,'a')
x
rapply(x,function(x){x^2},class=c("numeric"))

x=list(1,list(2,3),4,list(5,list(6,7)))
str(x)
rapply(x,function(x){x^2},class=c("numeric"))

vec1 = seq(1:10)*3

vapply(as.character(vec1``), mean, FUN.VALUE = 'numeric')
