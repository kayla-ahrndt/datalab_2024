#install.packages('tidytext')
#install.packages('wordcloud2')
#install.packages('sentimentr')

library(ggplot2)
library(dplyr)
library(tidytext)
library(gsheet)
library(wordcloud2)
library(sentimentr)
library(lubridate)

survey <- gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1W9eGIihIHppys3LZe5FNbUuaIi_tfdscIq521lidRBU/edit?usp=sharing')
View(survey)

#Take a look at the first few rows of the data. What is the unit of observation?
head(survey)
  #people and their answers!

#Create a variable named date_time in your survey data. This should be based on the Timestamp variable. Use the mdy_hms variable to created a “date-time” object.
date_time <- ymd_hms(survey$Timestamp) %>% as.numeric() %>% 
  mutate(date_time = )

#Create a visualization of the date_time variable.

#Create an object called sentiments by running the following:
sentiments <- get_sentiments('bing')
sentiments

#Explore the sentiments object. How many rows? How many columns? What is the unit of observation.
  #words (adjectives)
nrow(sentiments)  
  #6786
ncol(sentiments)
  #2

#Create an object named 'words'
words <- survey %>%
  dplyr::select(first_name,
                feeling_num,
                feeling) %>%
  unnest_tokens(word, feeling)
words
  #names, numbers, words

#Look up the help documentation for the function wordcloud2. What does it expect as the first argument of the function?


#Create a dataframe named word_freq. This should be a dataframe which is conformant with the expectation of wordcloud2, showing how frequently each word appeared in our feelings.
word_freq <- words %>%  group_by(word) %>%  tally()

#Make a word cloud.

#Create an object named 'sw'.
sw <- read_csv('https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/stopwords.csv')












