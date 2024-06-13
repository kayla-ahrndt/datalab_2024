#load libraries
library(dplyr)
library(readr)

#read in clean csv
dives <- read_csv('https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/whales-dives.csv')

#view clean data
View(dives)

#read in the messy csv
messy_dives <- read_csv('https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/whales-dives-messy.csv')

#make a copy of the messy csv
messy_dives2 <- read_csv('https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/whales-dives-messy.csv')

#padding the dates by adding the necessary numbers to match clean id
messy_dives2 <- messy_dives2 %>%
  mutate(YEAR = str_pad(YEAR,width=3,side="left",pad="0")) %>%
  mutate(YEAR = str_pad(YEAR,width=4,side="left",pad="2")) %>%
  mutate(Day = str_pad(Day,width=2,side="left",pad="0")) %>%
  mutate(Month = str_pad(Month,width=2,side="left",pad="0")) %>% 
  mutate(sit = substr(sit, 10, 12))
messy_dives2

#creating id column by combining ymd and sit
messy_dives2$id <- paste0(messy_dives2$YEAR, messy_dives2$Month, messy_dives2$Day, messy_dives2$sit)

#remove the 'YEAR' column using subset
messy_dives2 <- subset(messy_dives2, select = -c(YEAR, Month, Day, sit))
print(messy_dives2)

#reorder columns
messy_dives2 <- messy_dives2 %>% select(id, Species.ID, bhvr, PreyVolume, PreyDepth, Dive_Time, Surfacetime, Blow.Interval, Blow_number_count)
messy_dives2

#rename columns
dput(names(messy_dives2))
names(messy_dives2) <- c(
  'id', # "id",
  'species', # "Species.ID", 
  'behavior', # "bhvr", 
  'prey.volume', # "PreyVolume", 
  'prey.depth', # "PreyDepth", 
  'dive.time', # "Dive_Time", 
  'surface.time', # "Surfacetime", 
  'blow.interval', # "Blow.Interval", 
  'blow.number' # "Blow_number_count"
)
View(messy_dives2)

#get rid of all NAs
messy_dives2 <- messy_dives2 %>% 
  na.omit()
messy_dives2

#distinct() to get rid of all duplicate rows
messy_dives2 <- messy_dives2 %>% distinct()
messy_dives2

#get rid of all non- hw or fw species
#%in% for multiple filters or group_by
messy_dives2 <- messy_dives2 %>% 
  filter(behavior %in% c('FEED', 'OTHER')) %>% 
  filter(species %in% c('FW', 'HW')) 
messy_dives2

#arrange in ascending order
messy_dives2 <- messy_dives2 %>% 
  arrange(messy_dives2$id)
messy_dives2

