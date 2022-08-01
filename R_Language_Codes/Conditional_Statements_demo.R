## If Statement

age = 18+1

if (age > 18) {
  print("Major")  ## True Block
} else {
  print("Minor")  ## False Block
}


## Nested If else statement
gender = 'F'

if (age > 18) {
  if (gender == 'M'){
    print("Major Boy")
  } else {
    print("Major Girl")
  }
} else {
  if (gender == 'M') {
    print("Minor Boy")
  } else {
    print("Minor Girl")
  }
}

a = 50
b = 55
c = 65

## Print the maximum value for the given parameters
## using nested if else.

if (a > b) {
  if (a > c) {
    print(a)
  } else {
    print(c)
  }
} else {
  if (b > c) {
    print(b)
  } else {
    print(c)
  }
}

## ifelse function
ifelse(gender == 'M', 'Boy','Girl')
