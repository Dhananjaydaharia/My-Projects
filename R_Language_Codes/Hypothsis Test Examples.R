## Hypothesis Test Examples
## Example 1
prob = round(pnorm(84, mean = 72, sd = 15.2, lower.tail = FALSE) * 100, 2)
print(paste('The Probability of students getting 84 or more is ',paste(prob,'%',sep='')))

## Example 2
qt(c(.025,.975),df=5)


## Food chain example (ANNOVA)
df = read.csv('f:/sample data/food_chain.txt',header=TRUE)
df

## Null Hypothesis = The average sales of 3 menu items are same
## Alternate Hypothesis = At least one of the average sales is different.

r = c(t(as.matrix(df)))
r

f = colnames(df)
f
k = length(colnames(df))
k
n = length(rownames(df))
n

## generating the factors for the values
tm = gl(k,1,n*k, factor(f))
tm

rep(c('item1','item2','item3'), 6)
## Applying the anova function aov for the values with given factors
av = aov(r ~ tm)
summary(av)

## From the summary we can see the p-value 0.112 > 0.05 (level of significance).
## Hence, we accept the null hypothesis.  We can conclude that the average sales
## of 3 menu items in 3 group of restaurants are same.


my_data = ToothGrowth
my_data

library(dplyr)
dplyr::sample_n(my_data, 10)

str(my_data)

# Convert dose as a factor and recode the levels
# as "D0.5", "D1", "D2"
my_data$dose <- factor(my_data$dose, 
                       levels = c(0.5, 1, 2),
                       labels = c("D0.5", "D1", "D2"))
head(my_data)

## Frequency table for supp vs dose
table(my_data$supp, my_data$dose)

levels(my_data$supp)

## Performing 2-way annova test
res_aov2 = aov(len ~ supp + dose, data = my_data)
summary(res_aov2)


##
##  Chi-Square Test
##



library(readxl)
df = read_xlsx('f:/Sample Data/Chi_Square_Example.xlsx',sheet = 2)
df = data.frame(df)
rownames(df) = df$Service
df = df[,2:4]
df

colsum = colSums(df)
rowsum = rowSums(df)

colsum
rowsum

grandsum = sum(colsum)
grandsum

exp_freq = matrix(1:9, 3, 3)
chival = 0
seq(1,3)
for (i in c(1,2,3)) {  ## For each Colsum value
  for (j in c(1,2,3)) {  ## for each rowsum value
    exp_freq[i,j] = print((colsum[i] * rowsum[j]) / grandsum)
  }
}
exp_freq

chival = sum(((df - t(exp_freq)) ^ 2)/t(exp_freq))
chival

res = chisq.test(df)
res


library(MASS)
head(survey)

data = table(survey$Smoke, survey$Exer)
data

res = chisq.test(data)
res
setwd(choose.dir())
## 
## T Test
##

## 1 sample two tailed

## Null Hypothesis :  Mu = 30
## Alternate Hypothsis : Mu != 30


## Please choose production.csv file
prod = read.csv(file.choose(),header=TRUE)
prod
t.test(prod$Items.Produced, mu=30)
dim(prod)[1]

tval = (mean(prod$Items.Produced) - 30) / (sd(prod$Items.Produced)/(dim(prod)[1] ^0.5))
tval
tablvalue = 2.264

if (tval > tablvalue) {
  print('Rejected Null Hypothesis')
} else {
  print('Accepted the Null Hypothsis')
}

## 1 sample one tailed 
## Please choose lifespan.csv file
life = read.csv(file.choose(),header=TRUE)
life

t.test(life$life, mu=45000, alternative = 'less')

## 2 sample independent test
## Please choose the Diet_Data.csv
form = read.csv(file.choose(),header=TRUE)
form

t.test(form$Diet.A, form$Diet.B, var.equal = TRUE)


## two sample paired t-test
## Please choose the sleep data file
slp = read.csv(file.choose(),header=TRUE)
slp
colnames(slp) = c('before','after')

t.test(slp$before, slp$after, paired = TRUE)
