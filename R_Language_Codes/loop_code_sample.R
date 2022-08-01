###
### Loop Statements 
###

## While Loop Statement
## Execute the code 0 or more 
i = 1
while (i < 10) {
  cat("I = " , i, fill = TRUE)
  #print(paste("I = " , i * i))
  i = i + 1
}

## Not executing statements even once if the test expression 
## returns FALSE
i <- 11
while (i < 10) {
  cat("I = " , i, fill = TRUE)
  i = i + 1
}

## Repeat Statement
i = 10
repeat {
    cat("I = " , i, fill = TRUE)
    i = i - 1
    if (i < 1) {
      break   ## To exit from the loop
    }
}

sum <- 0
repeat{
  sum = sum+1
  print(sum)
  if (sum == 6){
    print("repeat loop ends");
    break
  }
}

## for loop statement

v1 = 1:5  ## Using range operator (:)
v1
for (i in v1) {
  print(i ^ 2) ## Printing the square of the number
}

v = c("one","two","three","four","five")
for (st in v) {
  print(st)
}

## Break statement

# R for loop with break statement

x <- 1:5
for (i in x) {
  if (i == 3){
    break  ## It breaks the loop and exit from the loop
  }
  print(i)
}

## Next Statement

x <- 1:10
for (i in x) {
  if (i <= 3) {
    next  ## It goes back to fetch the next value
  }
  print(i)
}


## Nested for loop
v1 = 1:5
v2 = 6:10
for (i in v1) {
  print(i)
  for (j in v2) {
    print(i * j)
  }
}

