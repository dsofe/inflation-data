# README
# Wrangling overall inflation data for all MSAs

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


# MISE ----------

# alc_bev  
# cereals_bakery_products  
# dairy  
# food 
# food_at_home
# food_away_from_home 
# food_bev
# fruits_veg
# meats_etc
# nonalc_bev
# other_food_at_home

# main folder
path1 <- "C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/"

## NYC ----------

nyc_alc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/nyc/nyc-alc-bev-202212.xlsx") %>>%
  (~nyc_alc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)

# .name_repair = make_clean_names

nyc_cereals_bakery_products <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/nyc/nyc-cereals-bakery-products-202212.xlsx") %>>%
(~nyc_cereals_bakery_products_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)

nyc_dairy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/nyc/nyc-dairy-202212.xlsx") %>>%
(~nyc_dairy_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)

nyc_food <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/nyc/nyc-food-202212.xlsx") %>>% 
  (~nyc_food_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)

nyc_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/nyc/nyc-food-at-home-202212.xlsx") %>>%
(~nyc_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)

nyc_food_away_from_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/nyc/nyc-food-away-from-home-202212.xlsx") %>>%
(~nyc_food_away_from_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)

nyc_food_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/nyc/nyc-food-bev-202212.xlsx") %>>%
(~nyc_food_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)

nyc_fruits_veg <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/nyc/nyc-fruits-veg-202212.xlsx") %>>%
(~nyc_fruits_veg_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)

nyc_meats_etc <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/nyc/nyc-meats-etc-202212.xlsx") %>>%
(~nyc_meats_etc_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)

nyc_nonalc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/nyc/nyc-nonalc-bev-202212.xlsx") %>>%
(~nyc_nonalc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)

nyc_other_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/nyc/nyc-other-food-at-home-202212.xlsx") %>>%
(~nyc_other_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)

## ATL ----------

atl_alc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/atl/atl-alc-bev-202212.xlsx") %>>%
  (~atl_alc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)

# .name_repair = make_clean_names

atl_cereals_bakery_products <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/atl/atl-cereals-bakery-products-202212.xlsx") %>>%
  (~atl_cereals_bakery_products_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)

atl_dairy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/atl/atl-dairy-202212.xlsx") %>>%
  (~atl_dairy_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)

atl_food <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/atl/atl-food-202212.xlsx") %>>% 
  (~atl_food_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)

atl_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/atl/atl-food-at-home-202212.xlsx") %>>%
  (~atl_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)

atl_food_away_from_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/atl/atl-food-away-from-home-202212.xlsx") %>>%
  (~atl_food_away_from_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)

atl_food_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/atl/atl-food-bev-202212.xlsx") %>>%
  (~atl_food_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)

atl_fruits_veg <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/atl/atl-fruits-veg-202212.xlsx") %>>%
  (~atl_fruits_veg_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)

atl_meats_etc <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/atl/atl-meats-etc-202212.xlsx") %>>%
  (~atl_meats_etc_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)

atl_nonalc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/atl/atl-nonalc-bev-202212.xlsx") %>>%
  (~atl_nonalc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)

atl_other_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/atl/atl-other-food-at-home-202212.xlsx") %>>%
  (~atl_other_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)


## CHI ----------

chi_alc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/chi/chi-alc-bev-202212.xlsx") %>>%
  (~chi_alc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)

# .name_repair = make_clean_names

chi_cereals_bakery_products <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/chi/chi-cereals-bakery-products-202212.xlsx") %>>%
  (~chi_cereals_bakery_products_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)

chi_dairy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/chi/chi-dairy-202212.xlsx") %>>%
  (~chi_dairy_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)

chi_food <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/chi/chi-food-202212.xlsx") %>>% 
  (~chi_food_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)

chi_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/chi/chi-food-at-home-202212.xlsx") %>>%
  (~chi_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)

chi_food_away_from_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/chi/chi-food-away-from-home-202212.xlsx") %>>%
  (~chi_food_away_from_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)

chi_food_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/chi/chi-food-bev-202212.xlsx") %>>%
  (~chi_food_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)

chi_fruits_veg <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/chi/chi-fruits-veg-202212.xlsx") %>>%
  (~chi_fruits_veg_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)

chi_meats_etc <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/chi/chi-meats-etc-202212.xlsx") %>>%
  (~chi_meats_etc_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)

chi_nonalc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/chi/chi-nonalc-bev-202212.xlsx") %>>%
  (~chi_nonalc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)

chi_other_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/chi/chi-other-food-at-home-202212.xlsx") %>>%
  (~chi_other_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)


## LA ----------

la_alc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-alc-bev-202212.xlsx") %>>%
  (~la_alc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)

# .name_repair = make_clean_names

la_cereals_bakery_products <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-cereals-bakery-products-202212.xlsx") %>>%
  (~la_cereals_bakery_products_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)

la_dairy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-dairy-202212.xlsx") %>>%
  (~la_dairy_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)

la_food <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-202212.xlsx") %>>% 
  (~la_food_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)

la_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-at-home-202212.xlsx") %>>%
  (~la_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)

la_food_away_from_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-away-from-home-202212.xlsx") %>>%
  (~la_food_away_from_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)

la_food_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-bev-202212.xlsx") %>>%
  (~la_food_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)

la_fruits_veg <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-fruits-veg-202212.xlsx") %>>%
  (~la_fruits_veg_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)

la_meats_etc <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-meats-etc-202212.xlsx") %>>%
  (~la_meats_etc_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)

la_nonalc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-nonalc-bev-202212.xlsx") %>>%
  (~la_nonalc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)

la_other_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-other-food-at-home-202212.xlsx") %>>%
  (~la_other_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)



## BOS ----------

bos_alc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-alc-bev-202212.xlsx") %>>%
  (~bos_alc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)

# .name_repair = make_clean_names

bos_cereals_bakery_products <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-cereals-bakery-products-202212.xlsx") %>>%
  (~bos_cereals_bakery_products_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)

bos_dairy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-dairy-202212.xlsx") %>>%
  (~bos_dairy_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)

bos_food <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-202212.xlsx") %>>% 
  (~bos_food_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)

bos_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-at-home-202212.xlsx") %>>%
  (~bos_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)

bos_food_away_from_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-away-from-home-202212.xlsx") %>>%
  (~bos_food_away_from_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)

bos_food_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-bev-202212.xlsx") %>>%
  (~bos_food_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)

bos_fruits_veg <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-fruits-veg-202212.xlsx") %>>%
  (~bos_fruits_veg_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)

bos_meats_etc <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-meats-etc-202212.xlsx") %>>%
  (~bos_meats_etc_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)

bos_nonalc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-nonalc-bev-202212.xlsx") %>>%
  (~bos_nonalc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)

bos_other_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-other-food-at-home-202212.xlsx") %>>%
  (~bos_other_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)




## DC ----------

dc_alc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-alc-bev-202212.xlsx") %>>%
  (~dc_alc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)

# .name_repair = make_clean_names

dc_cereals_bakery_products <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-cereals-bakery-products-202212.xlsx") %>>%
  (~dc_cereals_bakery_products_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)

dc_dairy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-dairy-202212.xlsx") %>>%
  (~dc_dairy_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)

dc_food <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-202212.xlsx") %>>% 
  (~dc_food_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)

dc_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-at-home-202212.xlsx") %>>%
  (~dc_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)

dc_food_away_from_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-away-from-home-202212.xlsx") %>>%
  (~dc_food_away_from_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)

dc_food_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-bev-202212.xlsx") %>>%
  (~dc_food_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)

dc_fruits_veg <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-fruits-veg-202212.xlsx") %>>%
  (~dc_fruits_veg_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)

dc_meats_etc <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-meats-etc-202212.xlsx") %>>%
  (~dc_meats_etc_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)

dc_nonalc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-nonalc-bev-202212.xlsx") %>>%
  (~dc_nonalc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)

dc_other_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-other-food-at-home-202212.xlsx") %>>%
  (~dc_other_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)




## PHI ----------

phi_alc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-alc-bev-202212.xlsx") %>>%
  (~phi_alc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)

# .name_repair = make_clean_names

phi_cereals_bakery_products <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-cereals-bakery-products-202212.xlsx") %>>%
  (~phi_cereals_bakery_products_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)

phi_dairy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-dairy-202212.xlsx") %>>%
  (~phi_dairy_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)

phi_food <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-202212.xlsx") %>>% 
  (~phi_food_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)

phi_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-at-home-202212.xlsx") %>>%
  (~phi_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)

phi_food_away_from_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-away-from-home-202212.xlsx") %>>%
  (~phi_food_away_from_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)

phi_food_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-bev-202212.xlsx") %>>%
  (~phi_food_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)

phi_fruits_veg <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-fruits-veg-202212.xlsx") %>>%
  (~phi_fruits_veg_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)

phi_meats_etc <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-meats-etc-202212.xlsx") %>>%
  (~phi_meats_etc_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)

phi_nonalc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-nonalc-bev-202212.xlsx") %>>%
  (~phi_nonalc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)

phi_other_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-other-food-at-home-202212.xlsx") %>>%
  (~phi_other_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)


## DAL ----------

dal_alc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-alc-bev-202212.xlsx") %>>%
  (~dal_alc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)

# .name_repair = make_clean_names

dal_cereals_bakery_products <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-cereals-bakery-products-202212.xlsx") %>>%
  (~dal_cereals_bakery_products_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)

dal_dairy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-dairy-202212.xlsx") %>>%
  (~dal_dairy_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)

dal_food <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-202212.xlsx") %>>% 
  (~dal_food_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)

dal_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-at-home-202212.xlsx") %>>%
  (~dal_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)

dal_food_away_from_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-away-from-home-202212.xlsx") %>>%
  (~dal_food_away_from_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)

dal_food_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-bev-202212.xlsx") %>>%
  (~dal_food_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)

dal_fruits_veg <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-fruits-veg-202212.xlsx") %>>%
  (~dal_fruits_veg_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)

dal_meats_etc <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-meats-etc-202212.xlsx") %>>%
  (~dal_meats_etc_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)

dal_nonalc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-nonalc-bev-202212.xlsx") %>>%
  (~dal_nonalc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)

dal_other_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-other-food-at-home-202212.xlsx") %>>%
  (~dal_other_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)


## HOU ----------

hou_alc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-alc-bev-202212.xlsx") %>>%
  (~hou_alc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)

# .name_repair = make_clean_names

hou_cereals_bakery_products <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-cereals-bakery-products-202212.xlsx") %>>%
  (~hou_cereals_bakery_products_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)

hou_dairy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-dairy-202212.xlsx") %>>%
  (~hou_dairy_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)

hou_food <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-202212.xlsx") %>>% 
  (~hou_food_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)

hou_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-at-home-202212.xlsx") %>>%
  (~hou_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)

hou_food_away_from_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-away-from-home-202212.xlsx") %>>%
  (~hou_food_away_from_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)

hou_food_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-bev-202212.xlsx") %>>%
  (~hou_food_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)

hou_fruits_veg <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-fruits-veg-202212.xlsx") %>>%
  (~hou_fruits_veg_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)

hou_meats_etc <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-meats-etc-202212.xlsx") %>>%
  (~hou_meats_etc_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)

hou_nonalc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-nonalc-bev-202212.xlsx") %>>%
  (~hou_nonalc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)

hou_other_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-other-food-at-home-202212.xlsx") %>>%
  (~hou_other_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)


## MIA ----------

mia_alc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-alc-bev-202212.xlsx") %>>%
  (~mia_alc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)

# .name_repair = make_clean_names

mia_cereals_bakery_products <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-cereals-bakery-products-202212.xlsx") %>>%
  (~mia_cereals_bakery_products_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)

mia_dairy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-dairy-202212.xlsx") %>>%
  (~mia_dairy_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)

mia_food <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-202212.xlsx") %>>% 
  (~mia_food_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)

mia_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-at-home-202212.xlsx") %>>%
  (~mia_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)

mia_food_away_from_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-away-from-home-202212.xlsx") %>>%
  (~mia_food_away_from_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)

mia_food_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-food-bev-202212.xlsx") %>>%
  (~mia_food_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)

mia_fruits_veg <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-fruits-veg-202212.xlsx") %>>%
  (~mia_fruits_veg_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)

mia_meats_etc <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-meats-etc-202212.xlsx") %>>%
  (~mia_meats_etc_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)

mia_nonalc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-nonalc-bev-202212.xlsx") %>>%
  (~mia_nonalc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)

mia_other_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/la/la-other-food-at-home-202212.xlsx") %>>%
  (~mia_other_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)


## US City Avg ----------

uscityavg_alc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/uscityavg/uscityavg-alc-bev-202212.xlsx") %>>%
  (~uscityavg_alc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)

# .name_repair = make_clean_names

uscityavg_cereals_bakery_products <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/uscityavg/uscityavg-cereals-bakery-products-202212.xlsx") %>>%
  (~uscityavg_cereals_bakery_products_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)

uscityavg_dairy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/uscityavg/uscityavg-dairy-202212.xlsx") %>>%
  (~uscityavg_dairy_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)

uscityavg_food <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/uscityavg/uscityavg-food-202212.xlsx") %>>% 
  (~uscityavg_food_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)

uscityavg_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/uscityavg/uscityavg-food-at-home-202212.xlsx") %>>%
  (~uscityavg_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)

uscityavg_food_away_from_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/uscityavg/uscityavg-food-away-from-home-202212.xlsx") %>>%
  (~uscityavg_food_away_from_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)

uscityavg_food_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/uscityavg/uscityavg-food-bev-202212.xlsx") %>>%
  (~uscityavg_food_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)

uscityavg_fruits_veg <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/uscityavg/uscityavg-fruits-veg-202212.xlsx") %>>%
  (~uscityavg_fruits_veg_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)

uscityavg_meats_etc <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/uscityavg/uscityavg-meats-etc-202212.xlsx") %>>%
  (~uscityavg_meats_etc_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)

uscityavg_nonalc_bev <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/uscityavg/uscityavg-nonalc-bev-202212.xlsx") %>>%
  (~uscityavg_nonalc_bev_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)

uscityavg_other_food_at_home <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/food-bev/uscityavg/uscityavg-other-food-at-home-202212.xlsx") %>>%
  (~uscityavg_other_food_at_home_messy) %>>%
  slice(12:n()) %>%
  rename(year = `CPI for All Urban Consumers (CPI-U)`,
         jan = `...2`,
         feb = `...3`,
         mar = `...4`,
         apr = `...5`,
         may = `...6`,
         jun = `...7`,
         jul = `...8`,
         aug = `...9`,
         sep = `...10`,
         oct = `...11`,
         nov = `...12`,
         dec = `...13`,) %>%
  convert(int(year)) %>%
  select(year:dec) %>>%
  (~temp) %>>%
  # dropped Annual, Half1, and Half2 values  
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)



# MERGE --------------------

# full join, city by city, for every item

# alc_bev  
msas_alc_bev <- nyc_alc_bev %>>%
  (~temp1) %>>%  # good join
  full_join(atl_alc_bev) %>%
  full_join(chi_alc_bev) %>%
  full_join(la_alc_bev) %>%
  full_join(bos_alc_bev) %>%
  full_join(dal_alc_bev) %>%
  full_join(dc_alc_bev) %>%
  full_join(hou_alc_bev) %>%
  full_join(mia_alc_bev) %>%
  full_join(phi_alc_bev)  %>%
  full_join(uscityavg_alc_bev) %>%
  mutate(cat = "Alcoholic beverages") %>%
  relocate(cat)


# cereals_bakery_products  
msas_cereals_bakery_products <- nyc_cereals_bakery_products %>>%
  (~temp1) %>>%  # good join
  full_join(atl_cereals_bakery_products) %>%
  full_join(chi_cereals_bakery_products) %>%
  full_join(la_cereals_bakery_products) %>%
  full_join(bos_cereals_bakery_products) %>%
  full_join(dal_cereals_bakery_products) %>%
  full_join(dc_cereals_bakery_products) %>%
  full_join(hou_cereals_bakery_products) %>%
  full_join(mia_cereals_bakery_products) %>%
  full_join(phi_cereals_bakery_products) %>%
  full_join(uscityavg_cereals_bakery_products) %>%
  mutate(cat = "Cereals and bakery products") %>%
  relocate(cat)


# dairy  
msas_dairy <- nyc_dairy %>>%
  (~temp1) %>>%  # good join
  full_join(atl_dairy) %>%
  full_join(chi_dairy) %>%
  full_join(la_dairy) %>%
  full_join(bos_dairy) %>%
  full_join(dal_dairy) %>%
  full_join(dc_dairy) %>%
  full_join(hou_dairy) %>%
  full_join(mia_dairy) %>%
  full_join(phi_dairy) %>%
  full_join(uscityavg_dairy) %>%
  mutate(cat = "Dairy and related products") %>%
  relocate(cat)


# food 
msas_food <- nyc_food %>>%
  (~temp1) %>>%  # good join
  full_join(atl_food) %>%
  full_join(chi_food) %>%
  full_join(la_food) %>%
  full_join(bos_food) %>%
  full_join(dal_food) %>%
  full_join(dc_food) %>%
  full_join(hou_food) %>%
  full_join(mia_food) %>%
  full_join(phi_food) %>%
  full_join(uscityavg_food) %>%
  mutate(cat = "Food") %>%
  relocate(cat)


# food_at_home
msas_food_at_home <- nyc_food_at_home %>>%
  (~temp1) %>>%  # good join
  full_join(atl_food_at_home) %>%
  full_join(chi_food_at_home) %>%
  full_join(la_food_at_home) %>%
  full_join(bos_food_at_home) %>%
  full_join(dal_food_at_home) %>%
  full_join(dc_food_at_home) %>%
  full_join(hou_food_at_home) %>%
  full_join(mia_food_at_home) %>%
  full_join(phi_food_at_home) %>%
  full_join(uscityavg_food_at_home) %>%
  mutate(cat = "Food at home") %>%
  relocate(cat)


# food_away_from_home 
msas_food_away_from_home  <- nyc_food_away_from_home  %>>%
  (~temp1) %>>%  # good join
  full_join(atl_food_away_from_home ) %>%
  full_join(chi_food_away_from_home ) %>%
  full_join(la_food_away_from_home ) %>%
  full_join(bos_food_away_from_home ) %>%
  full_join(dal_food_away_from_home ) %>%
  full_join(dc_food_away_from_home ) %>%
  full_join(hou_food_away_from_home ) %>%
  full_join(mia_food_away_from_home ) %>%
  full_join(phi_food_away_from_home ) %>%
  full_join(uscityavg_food_away_from_home ) %>%
  mutate(cat = "Food away from home") %>%
  relocate(cat)


# food_bev
msas_food_bev <- nyc_food_bev %>>%
  (~temp1) %>>%  # good join
  full_join(atl_food_bev) %>%
  full_join(chi_food_bev) %>%
  full_join(la_food_bev) %>%
  full_join(bos_food_bev) %>%
  full_join(dal_food_bev) %>%
  full_join(dc_food_bev) %>%
  full_join(hou_food_bev) %>%
  full_join(mia_food_bev) %>%
  full_join(phi_food_bev) %>%
  full_join(uscityavg_food_bev) %>%
  mutate(cat = "Food and beverages") %>%
  relocate(cat) 


# fruits_veg
msas_fruits_veg <- nyc_fruits_veg %>>%
  (~temp1) %>>%  # good join
  full_join(atl_fruits_veg) %>%
  full_join(chi_fruits_veg) %>%
  full_join(la_fruits_veg) %>%
  full_join(bos_fruits_veg) %>%
  full_join(dal_fruits_veg) %>%
  full_join(dc_fruits_veg) %>%
  full_join(hou_fruits_veg) %>%
  full_join(mia_fruits_veg) %>%
  full_join(phi_fruits_veg) %>%
  full_join(uscityavg_fruits_veg) %>%
  mutate(cat = "Fruits and vegetables") %>%
  relocate(cat)


# meats_etc
msas_meats_etc <- nyc_meats_etc %>>%
  (~temp1) %>>%  # good join
  full_join(atl_meats_etc) %>%
  full_join(chi_meats_etc) %>%
  full_join(la_meats_etc) %>%
  full_join(bos_meats_etc) %>%
  full_join(dal_meats_etc) %>%
  full_join(dc_meats_etc) %>%
  full_join(hou_meats_etc) %>%
  full_join(mia_meats_etc) %>%
  full_join(phi_meats_etc) %>%
  full_join(uscityavg_meats_etc) %>%
  mutate(cat = "Meats, poultry, fish, eggs") %>%
  relocate(cat) # %>%


# nonalc_bev
msas_nonalc_bev <- nyc_nonalc_bev %>>%
  (~temp1) %>>%  # good join
  full_join(atl_nonalc_bev) %>%
  full_join(chi_nonalc_bev) %>%
  full_join(la_nonalc_bev) %>%
  full_join(bos_nonalc_bev) %>%
  full_join(dal_nonalc_bev) %>%
  full_join(dc_nonalc_bev) %>%
  full_join(hou_nonalc_bev) %>%
  full_join(mia_nonalc_bev) %>%
  full_join(phi_nonalc_bev) %>%
  full_join(uscityavg_nonalc_bev) %>%
  mutate(cat = "Nonalcoholic beverages") %>%
  relocate(cat) # %>%


# other_food_at_home
msas_other_food_at_home <- nyc_other_food_at_home %>>%
  (~temp1) %>>%  # good join
  full_join(atl_other_food_at_home) %>%
  full_join(chi_other_food_at_home) %>%
  full_join(la_other_food_at_home) %>%
  full_join(bos_other_food_at_home) %>%
  full_join(dal_other_food_at_home) %>%
  full_join(dc_other_food_at_home) %>%
  full_join(hou_other_food_at_home) %>%
  full_join(mia_other_food_at_home) %>%
  full_join(phi_other_food_at_home) %>%
  full_join(uscityavg_other_food_at_home) %>%
  mutate(cat = "Other food at home") %>%
  relocate(cat)


rm(temp1)


# SAVE data ----------

save(msas_alc_bev, msas_cereals_bakery_products, msas_dairy, msas_food, msas_food_at_home, msas_food_away_from_home, msas_food_bev, msas_fruits_veg, msas_meats_etc, msas_nonalc_bev, msas_other_food_at_home, file = "C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/msas-food-bev.RData")


save.image("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/msas-food-bev-ws.RData")

