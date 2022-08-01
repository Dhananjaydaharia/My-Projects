## Finding a factorial of given number

number = 5
fact_value = 1
while (number > 0) {
  fact_value = fact_value * number
  number = number - 1
}

cat("Factorial of given number is : ", fact_value)

## Creating the factorial function
fact_fn = function(number) {
  fact_value = 1
  for (i in 1:number) {
    fact_value = fact_value * i
  }
  print(paste("The factorial of given number ", number, 'is : ', fact_value))
}

fact_fn(5)  ## calling the factorial function for value 5
fact_fn(10)  ## calling the factorial function for value 10



fact_function=function(num){
  fact_value=1
  if(num==0){
    return(fact_value)
  } else {
    fact_value=fact_value*num
  }return(fact_value)
}
dfact_function(5)
  


# print the prime numbers upto any given input number

num= readline (prompt = "Enter the num:")
prime_funct=function(num) {
  count=1
  for (i in 1:num){
    if(num%%i==0){
      break
    }else{
      return(num)
      count=count+1
    }
  }
prime_funct(10)  

num= readline (prompt = "Enter the num:")


## Function with return statement

area_calculation = function(param, type = 'circle') {
  if (type == 'circle') {
    return ((22 / 7) * (param ^ 2))
  } else if (type == "square") {
    return (param * param)
  } else {
    return (param ^ 3)
  }
}


# Sort the given vector
v1=c(10,2,33,55,6,7)

for (i in 1:length(v1)-1){
  for (j in 2:length(v1){
    if(i<j){
      temp=v1[i]
      v1[i]=v1[j]
      v[j]=temp
    }
  } 
} 

area_of_circle = area_calculation(6)
print(paste("Area of a circle for radius 6 is :", round(area_of_circle,2) ))

area_of_square = area_calculation(10, "square")
print(paste("Area of a square for side 10 is :", round(area_of_square,2) ))

## Function to create area of a rectange
area_rectangle = function(length, breadth) {
  print(paste("Length = ", length))
  print(paste("Breadth = ", breadth))
  if ((length > 0) & (breadth > 0)) {
    return (length * breadth)
  } else {
    return (NA)
  }
}

## Calling the function area_rectange to get the area for given parameters
area_of_rectangle = area_rectangle(6, 8)
print(paste("Area of a rectangel is : ", area_of_rectangle))
area_of_rectangle = area_rectangle(breadth = 6, length = 8)
print(paste("Area of a rectangel is : ", area_of_rectangle))

## In-built functions

vector1 = seq(10,50,2)  ## seq is an in-built function to generate numbers
print(vector1)

max(vector1)
min(vector1)
mean(vector1)
var(vector1)
sd(vector1)

lang = "R Programming"
print(toupper(lang))
