## switch Statement 
# Executes the statement when matches
x <- switch( 
  1, 
  "first", 
  "second", 
  "third", 
  "fourth" 
) 

print(x) 

## Returns NULL if no value matched
x <- switch( 
  5, 
  "first", 
  "second", 
  "third", 
  "fourth" 
) 

print(x) 

## Using Strings
x = "Blue"
switch(x, 
       "color" = "red", 
       "shape" = "square", 
       "length" = 5,
       "Unknown")

## The above statement can be written in nested if else
if (x == "color") {
  print("red")
} else if (x == "shape") {
  print("square")
} else if (x == "length") {
  print(5)
} else {
  print('Unknown')
}
x = "length"
switch(x, "color" = "red", "shape" = "square", "length" = 5)

mark = 80

switch(
  mark,
  "< 50" = print("Grade D"),
  "< 75" = print("Grade C"),
  "< 90" = print("Grade B"), 
  "Grade A"
)

