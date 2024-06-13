#draft questions:
# Summary()
# Frequency, time of year
# Comparison to other places in Tennessee and US
  # Different stats about rainfall and weather...
  # Flooding 
  # Other natural disasters in the area: wildfires, etc.
    # Weather advisories
  # Season
  # Air quality 
  # Altitude
  # Biodiversity: plants and animals (population sizes over time)
  # Sewanee population over time
  # People's activity: chemical dumping, boating with motors, volunteering, gardening, etc.
  # How food grown in Sewanee is changed: how bountiful the crop, size of produce, etc.
  # Sewanee citizen's health in the area
  # Carbon footprint

#proposed questions:
# How long does snow last over time?
# Minimum and maximum temperature over time?
# What does precipitation/rainfall look like by month?
  # How does precipitation/rainfall influence temperature?

#final questions:
# Minimum and maximum temperature over time?
# What is the effect of temperature on precipitation from 2010 to 2020?
# What is the average temperature over time?


library(lubridate)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(ggthemes)

sewanee <- read_csv('sewanee_weather.csv')

View(sewanee)

#my question:
# What is the average temperature over time?

# create new column, 'year', that saves the year from every date column
sewanee <- sewanee %>% 
  mutate(year = year(DATE))
sewanee

range(sewanee$year)
#2000-2024

#pull average temperature of all time
avg_temp <- sewanee %>% 
  summarise(avg_temp = mean(((TMIN + TMAX)/2), na.rm = TRUE))
avg_temp
#57.8 degrees

#pull average temperatures by year
avg_temp_by_year <- sewanee %>% 
  group_by(year) %>% 
  summarise(avg_temp_by_year = mean(((TMIN + TMAX)/2), na.rm = TRUE)) %>% 
  mutate(avg_temp_by_year)
avg_temp_by_year

#line graph for average temperature by year!
#scale from 50-62 degrees
ggplot(data = avg_temp_by_year, aes(x = year, y = avg_temp_by_year)) +
  geom_point(alpha = 0.2) +
  geom_line() +
  labs(x = 'Time (Year)',
       y = 'Average Temperature',
       title = 'Average Temperature Over Time')

twenty_twenty_four <- sewanee %>% 
  filter(year == 2024)
twenty_twenty_four
#only data from january-beginning of april 2024, so temps will be much lower on avg so fa

#scale from 0-65 degrees
ggplot(data = avg_temp_by_year, aes(x = year, y = avg_temp_by_year)) +
  geom_point(alpha = 0.2) +
  geom_line() +
  coord_cartesian(ylim = c(0, 65)) +
  labs(x = 'Time (Year)',
       y = 'Average Temperature',
       title = 'Average Temperature Over Time')








