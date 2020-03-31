# R Studio API Code
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


# Libraries
library(qualtRics)
library(tidyverse)
library(lubridate)


# Data Import and Cleaning
qualtrics_api_credentials(
  api_key   = "apikeygoeshere",
  base_url  = "https://umn.ca1.qualtrics.com",
  install   = T,
  overwrite = T)
qualtrics_tbl <- all_surveys() %>%
  mutate(lastModified = ymd_hms(lastModified),
         creationDate = ymd_hms(creationDate))

# Visualization
qualtrics_tbl %>%
  ggplot(aes(x = year(creationDate))) + 
  geom_bar(stat = "count") +
  theme_classic() +
  labs(title = "Number of Qualtrics surveys by year", x = "Creation date")
