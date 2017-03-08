#Final project
# Data wranling
# Jonas Harjunpää
# jonas.harjunpaa@helsinki.fi
# Date: 28.02.2017

# I am going to wrangle the 'Hobbies' data from the package FactoMineR.
# I am going to use the wrangled data to do Multiple Correspondence Analysis on the data


library(FactoMineR)
library(dplyr)

#Import the data set and look at it
data("hobbies")
str(hobbies)

#Remove uncomplete cases
complete <- filter(hobbies, complete.cases(hobbies) == TRUE)

#Rename the factore levels
levels(complete$Reading) <- c('No reading','Reading')
levels(complete$Computer) <- c('No computer','Computer')
levels(complete$Sport) <- c('No sport','Sport')
levels(complete$Walking) <- c('No walking','Walking')
levels(complete$Travelling) <- c('No travelling','Travelling')
levels(complete$`Playing music`) <- c('No playing music','Playing music')
levels(complete$Volunteering) <- c('No volunteering','Volunteering')
levels(complete$Mechanic) <- c('No mechanic','Mechanic')
levels(complete$Gardening) <- c('No gardening','Gardening')
levels(complete$Knitting) <- c('No knitting','Knitting')
levels(complete$Cooking) <- c('No cooking','Cooking')
levels(complete$Fishing) <- c('No fishing','Fishing')

#Remove some general categories, i.e. cinema, listening to movies etc.
keep_columns <- c("Reading", "Computer", "Sport", "Walking", "Travelling", "Playing music", "Volunteering", 
                  "Mechanic", "Gardening", "Knitting", "Cooking", "Fishing", "Sex", "Age")
complete <-select(complete, one_of(keep_columns))
summary(complete)

#Save to csv
setwd("~/GitHub/IODS-final")
write.csv(complete, file = "hobbies.csv", row.names=TRUE)