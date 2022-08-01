library(tidyr)
library(dplyr)
library(stringr)

glimpse(who)
head(who,1)

write.csv(who,"f:/who.csv")
colnames(who)

dim(who)
whotidy = who %>% gather(treatgrp, value, new_sp_m014:newrel_f65, na.rm = TRUE )
glimpse(whotidy)
tail(whotidy)
whotidy1 = whotidy %>% mutate(treatgrp = str_replace(treatgrp, 'newrel','new_rel'))
head(whotidy1)
tail(whotidy1)
whotidy1 = whotidy1 %>% separate(treatgrp, c('dummy','treattype','gender_agegrp'))
head(whotidy1)
whotidy1 = select(whotidy1, -c(dummy, iso2, iso3))
head(whotidy1)
tail(whotidy1, 20)
whotidy1 = whotidy1 %>%separate(gender_agegrp, c('gender','agegrp'), sep=1)
head(whotidy1)

## Demo the above example using pipeline operator
w_tidy = who %>% gather(treatgrp, value, new_sp_m014:newrel_f65, na.rm = TRUE ) %>% 
  mutate(treatgrp = str_replace(treatgrp, 'newrel','new_rel')) %>% 
  separate(treatgrp, c('dummy','treattype','gender_agegrp')) %>% 
  select(-c(dummy, iso2, iso3))  %>% 
  separate(gender_agegrp, c('gender','agegrp'), sep=1)


head(w_tidy)
tail(w_tidy)

dim(who)
dim(w_tidy)

table(w_tidy$year, w_tidy$gender)

w_tidy %>%
  group_by(country, year, gender) %>%
  summarize(total_patients = n())
  
  
