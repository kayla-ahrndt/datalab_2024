#load libraries
library(babynames)
library(dplyr)
library(ggplot2)
library(tidyverse)


bb_names <- babynames
View(bb_names)

#Create a histogram of the name Marie since 1982
marie_1982 <- bb_names %>% 
  filter(year >= 1982) %>% 
  filter(name == 'Marie')
marie_1982
#dips due to gender 
ggplot(data= marie_1982, aes(x = year, y = n)) +
  geom_line()
#filter by sex
  #f
ggplot(data= marie_1982 %>% filter(sex == 'F'), aes(x = year, y = n)) +
  geom_line()
  #m
ggplot(data= marie_1982 %>% filter(sex == 'M'), aes(x = year, y = n)) +
  geom_line()

#Create a line plot for proportion of the name Joe, colored by sex. Make the lines a bit thicker and more transparent.
joe <- bb_names %>% 
  filter(name == 'Joe')
joe
ggplot(data = joe, aes(x = year, y = prop, color = sex)) +
  geom_line(size = 1.2, alpha = 0.3) 

#Add new x and y axis labels, as well as a chart title.
ggplot(data = joe, aes(x = year, y = prop, color = sex)) +
  geom_line(size = 1.2, alpha = 0.3) +
  labs(x = 'Time (Years)',
       y = 'Proportion (%)',
       title = 'Proportion of the Name Joe',
       subtitle = 'colored by sex, over time')

#Create a bar chart of all female names in 2002.
f_names_2002 <- bb_names %>% 
  filter(sex == 'F', year == 2002) %>% 
  arrange(desc(n)) %>% 
  head(10)
f_names_2002
ggplot(data = f_names_2002, aes(x = name)) +
  geom_bar()

#Make the bars transparent and filled with the color blue.
ggplot(data = f_names_2002, aes(x = name)) +
  geom_bar(fill = 'lightblue', alpha = 0.4)

the_nineties <- bb_names %>% 
  filter(year >= 1990, year <=1999)
the_nineties

write_csv(the_nineties, file = 'bbnames_nineties.csv')





