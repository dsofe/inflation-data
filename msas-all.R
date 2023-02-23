# README
# MERGE all data sets into one master data set
# Add to this master data set by joining revisions to contributing data sets

# food-bev inflation data set = `msas-food-bev`
# overall inflation data set = `msas-overall`


# CLEAR environment --------------------

# clear workspace
# clear memory

library(freshr)
freshr()

rm(list=ls(all.names = TRUE))
gc()


# LOAD packages --------------------

packages <- c("tidyverse", "pipeR", "readxl", "hablar", "purrr", "janitor", "DT", "Hmisc")
suppressMessages(invisible(lapply(packages, library, character.only = TRUE)))


# SET directory --------------------

cloudwd <- "C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit"
localwd <- "~/00-OneDrive-mirror/r-posit"

setwd(localwd)


# IMPORT data --------------------

load("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/msas-overall.Rdata")
load("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/msas-food-bev.Rdata")


msas_all <- msas_overall %>% 
  full_join(msas_alc_bev) %>%
  full_join(msas_cereals_bakery_products) %>%
  full_join(msas_dairy) %>%
  full_join(msas_food) %>%
  full_join(msas_food_at_home) %>%
  full_join(msas_food_away_from_home) %>%
  full_join(msas_food_bev) %>%
  full_join(msas_fruits_veg) %>%
  full_join(msas_meats_etc) %>%
  full_join(msas_nonalc_bev) %>%
  full_join(msas_other_food_at_home) %>%
  relocate(cat)


# SAVE data ----------

# save certain objects - all cities, aggregate data
save(msas_all, file = "C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/msas-all.Rdata")

# save tidy ws
save.image("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/msas-all-ws.Rdata")
