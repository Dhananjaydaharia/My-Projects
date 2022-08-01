library(dplyr)

set.seed(1)
log <- data.frame(
  user_id = sample(c(1,2,3), 10, TRUE),
  item_id = sample(c(1,2,3), 10, TRUE),
  correct = sample(c(0,1), 10, TRUE)
) %>% as.tbl

users <- data.frame(
  user_id = c(1,2,4),
  age = c(20,20,30)
) %>% as.tbl

items <- data.frame(
  item_id = 1:3,
  item = c("1+1","2*2","3/3")
) %>% as.tbl

## Left Join
log %>% left_join(users, "user_id") %>% left_join(items, "item_id")

## Inner join
log %>% inner_join(users, "user_id")

## Semi Join
log %>% semi_join(users, "user_id")

## Anti Join
log %>% anti_join(users, "user_id")

## Joining tables with different names

set.seed(1)
log <- data.frame(
  id = 1:10,
  user_id = sample(c(1,2,3), 10, TRUE),
  item_id = sample(c(1,2,3), 10, TRUE),
  correct = sample(c(0,1), 10, TRUE)
) %>% as.tbl

users <- data.frame(
  id = c(1,2,4),
  age = c(20,20,30)
) %>% as.tbl

items <- data.frame(
  id = 1:3,
  item = c("1+1","2*2","3/3")
) %>% as.tbl

log %>% 
  left_join(users, c("user_id" = "id")) %>% 
  left_join(items, c("item_id" = "id"))