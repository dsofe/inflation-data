# README
# Wrangling overall inflation data for all MSAs
# AUG 2022 data
# data for cities, monthly, 01/2012-08/2022


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

# my paths
cloudwd <- "C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit"
localwd <- "~/00-OneDrive-mirror/r-posit"

setwd(localwd)


# IMPORT data --------------------

## AUG 2022 data, at best
## JUL 2022 data for MSAs that are analyzed bi-monthly


## NYC ----------

# inflation, overall
nyc_overall_messy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/overall/nyc-overall-202212.xlsx")

glimpse(nyc_overall_messy)


######## check - IGNORE ----
nyc_overall_columns <- nyc_overall_messy %>%
  filter(row_number() == 11)  # any way to pass these column names in a rename?

rm(nyc_overall_columns)
######## end check - IGNORE ----


# RESUME ----------

nyc_overall <- nyc_overall_messy %>>%
  filter(row_number() >= 12) %>%
# "removed" preceding header/non-data
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
# dropped Annual, Half1, and Half2 values  
  (~temp1) %>>%
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
# transformed data from long to wide
  mutate(msa = "NYC") %>%
  relocate(msa)


## ATL ----------

atl_overall_messy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/overall/atl-overall-202212.xlsx")

atl_overall <- atl_overall_messy %>>%
  filter(row_number() >= 12) %>%
  # "removed" preceding header/non-data
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
  # dropped Annual, Half1, and Half2 values  
  (~temp1) %>>%
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
# transformed data from long to wide
  mutate(msa = "ATL") %>%
  relocate(msa)


## CHI ----------


chi_overall_messy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/overall/chi-overall-202212.xlsx")

chi_overall <- chi_overall_messy %>>%
  filter(row_number() >= 12) %>%
  # "removed" preceding header/non-data
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
  # dropped Annual, Half1, and Half2 values  
  (~temp1) %>>%
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "CHI") %>%
  relocate(msa)


## LA ----------


la_overall_messy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/overall/la-overall-202212.xlsx")

la_overall <- la_overall_messy %>>%
  filter(row_number() >= 12) %>%
  # "removed" preceding header/non-data
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
  # dropped Annual, Half1, and Half2 values  
  (~temp1) %>>%
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "LA") %>%
  relocate(msa)


## US City Avg ----------


uscityavg_overall_messy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/overall/uscityavg-overall-202212.xlsx")

uscityavg_overall <- uscityavg_overall_messy %>>%
  filter(row_number() >= 12) %>%
  # "removed" preceding header/non-data
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
  # dropped Annual, Half1, and Half2 values  
  (~temp1) %>>%
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "US city avg") %>%
  relocate(msa)


#### cities with bi-monthly data -----

## BOS ----------

bos_overall_messy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/overall/bos-overall-202212.xlsx")

bos_overall <- bos_overall_messy %>>%
  filter(row_number() >= 12) %>%
  # "removed" preceding header/non-data
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
  # dropped Annual, Half1, and Half2 values  
  (~temp1) %>>%
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "BOS") %>%
  relocate(msa)


## DAL ----------

dal_overall_messy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/overall/dal-overall-202212.xlsx")

dal_overall <- dal_overall_messy %>>%
  filter(row_number() >= 12) %>%
  # "removed" preceding header/non-data
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
  # dropped Annual, Half1, and Half2 values  
  (~temp1) %>>%
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "DAL") %>%
  relocate(msa)

## WAS DC ----------

dc_overall_messy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/overall/dc-overall-202212.xlsx")

dc_overall <- dc_overall_messy %>>%
  filter(row_number() >= 12) %>%
  # "removed" preceding header/non-data
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
  # dropped Annual, Half1, and Half2 values  
  (~temp1) %>>%
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "WAS") %>%
  relocate(msa)


## HOU ----------

hou_overall_messy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/overall/hou-overall-202212.xlsx")

hou_overall <- hou_overall_messy %>>%
  filter(row_number() >= 12) %>%
  # "removed" preceding header/non-data
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
  # dropped Annual, Half1, and Half2 values  
  (~temp1) %>>%
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "HOU") %>%
  relocate(msa)


## MIA ----------

mia_overall_messy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/overall/mia-overall-202212.xlsx")

mia_overall <- mia_overall_messy %>>%
  filter(row_number() >= 12) %>%
  # "removed" preceding header/non-data
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
  # dropped Annual, Half1, and Half2 values  
  (~temp1) %>>%
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "MIA") %>%
  relocate(msa)


## PHI ----------

phi_overall_messy <- read_excel("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/raw_data/overall/phi-overall-202212.xlsx")

phi_overall <- phi_overall_messy %>>%
  filter(row_number() >= 12) %>%
  # "removed" preceding header/non-data
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
  # dropped Annual, Half1, and Half2 values  
  (~temp1) %>>%
  pivot_wider(names_from = year, 
              values_from = c(jan:dec)) %>%
  # transformed data from long to wide
  mutate(msa = "PHI") %>%
  relocate(msa)


# SAVE and DELETE data --------------------

# save messy data
save(nyc_overall_messy, uscityavg_overall_messy, atl_overall_messy, chi_overall_messy, la_overall_messy, bos_overall_messy, dal_overall_messy, dc_overall_messy, hou_overall_messy, mia_overall_messy, phi_overall_messy, file = "C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/msas-overall-cities-messy.Rdata")

# delete messy data
remove(nyc_overall_messy, uscityavg_overall_messy, atl_overall_messy, chi_overall_messy, la_overall_messy, bos_overall_messy, dal_overall_messy, dc_overall_messy, hou_overall_messy, mia_overall_messy, phi_overall_messy)


# MERGE data --------------------

# all MSAs

# full join, city by city
msas_overall <- nyc_overall %>>%
  (~temp1) %>>%  # good join
  full_join(atl_overall) %>%
  full_join(chi_overall) %>%
  full_join(la_overall) %>%
  full_join(uscityavg_overall) %>%
  full_join(bos_overall) %>%
  full_join(dal_overall) %>%
  full_join(dc_overall) %>%
  full_join(hou_overall) %>%
  full_join(mia_overall) %>%
  full_join(phi_overall) %>%
  mutate(cat = "All items") %>%
  relocate(cat)

rm(temp1)

# SAVE data --------------------

# save tidy data

# save certain objects - all cities, individual data
save(nyc_overall, uscityavg_overall, atl_overall, chi_overall, la_overall, bos_overall, dal_overall, dc_overall, hou_overall, mia_overall, phi_overall, file = "C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/msas-overall-cities.Rdata")

# save certain objects - all cities, aggregate data
save(msas_overall, file = "C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/msas-overall.Rdata")

# save tidy ws
save.image("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/msas-overall-ws.Rdata")

