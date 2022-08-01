library(dplyr)
library(ggplot2)
library(datasets)

glimpse(mtcars)
str(mtcars)
rownames(mtcars)
mtcars$model = rownames(mtcars)

first <- mtcars %>% slice(1:20)
second <- mtcars %>% slice(10:35)

## getting the common rows from the first and second datasets
comm_rows <- intersect(first, second) %>% 
  select(model, mpg,cyl) %>%
  arrange(desc(cyl),desc(mpg))

comm_rows
## Combining both first and second data sets
uc <- union(first, second) %>% 
  select(model, mpg,cyl) %>%
  arrange(desc(cyl),desc(mpg)) 

## Getting the difference for first dataset from second dataset
setdiff(first,second) %>% 
  select(model, mpg,cyl) %>%
  arrange(desc(cyl),desc(mpg)) %>%
  group_by(cyl) %>%
  summarise(n())

ggplot(uc,aes(cyl))+geom_histogram()
