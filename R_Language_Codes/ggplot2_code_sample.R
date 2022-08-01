library(tidyverse)
library(ggplot2)

glimpse(diamonds)
names(diamonds)

## Displaying the basic plot (Scatter plot)
gg <- ggplot(data = diamonds, aes(carat,price)) +
  geom_point(color = 'brown4')
gg

ggplot(data = diamonds, aes(cut)) +
  geom_bar()

ggplot(data = diamonds, aes(price)) +
  geom_density()

## Adding a title to graph
gg <- gg + ggtitle("Diamond Carat and Price")
gg

## Removing ticks from x and Y axis
gg <- gg + theme(axis.ticks.y = element_blank(), axis.ticks.x = element_blank())
gg

## Setting axis limits
gg <- gg + xlim(0,5) + ylim(250,20000)
gg
max(diamonds$price)
max(diamonds$carat)

## Setting legends
gg <- ggplot(diamonds, aes(price, carat, color=factor(cut))) + 
  geom_point()
gg <-gg + labs(color = "Cut")
gg

gg <- gg + theme(axis.text.x=element_text(angle=50, size = 10, vjust=0.5))
gg

gg <- gg + theme(axis.text.x=element_text(color='green',vjust=0.45), 
                axis.text.y=element_text(color='red', vjust=0.45))
gg

gg <- gg + facet_wrap(~cut, nrow=4)
gg
ggbar <- ggplot(data=diamonds, aes(cut)) + geom_bar()
ggbar

ggboxplot <- ggplot(data = diamonds, aes(clarity,price)) +
                geom_boxplot(width=0.5, fill='firebrick',color='blue',
                             outlier.color = 'purple', outlier.shape = 2) +
                  ggtitle("Boxplot of Price by Carat Clarity")
ggboxplot
glimpse(diamonds)

