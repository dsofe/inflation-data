# README
# Analyzing inflation data for all MSAs

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

setwd(cloudwd)


# IMPORT data --------------------

load("C:/Users/smithda/OneDrive - NYC O365 HOSTED/r-posit/inflation/msas-all.Rdata")

# Start comment ----

# alternative load
# OR

# load(paste("~/00-OneDrive-mirror/r-posit","/inflation/msas-food-bev.RData", sep = ""))
# 
# # OR
# 
# load(paste("<w>","/msas-food-bev.RData", sep = ""))
# End comment

# ANALYZE ----

# since march 2020
# ytd 2022

msas_all1 <- msas_all %>% 
  select(cat, msa, mar_2020, apr_2020, jan_2022, feb_2022, nov_2022, dec_2022) %>%
  mutate_at(c('mar_2020', 'apr_2020', 'jan_2022', 'feb_2022', 'nov_2022', 'dec_2022'), as.numeric) %>%
  mutate(first_2020 = if_else(is.na(mar_2020), apr_2020, mar_2020),
         first_2022 = if_else(is.na(jan_2022), feb_2022, jan_2022),
         last_2022 = if_else(is.na(dec_2022), nov_2022, dec_2022))
# beginning of COVID = mar, apr 2020 
# Start of 2022 = jan, feb 2022
# End of 2022 = nov, dec 2022
# temp repair--transforming all columns with month data to numeric

# NEW ----
msas_all2 <- msas_all1 %>%
  # calc = ((<index, time 2>/<index, time 1>) - 1) * 100   
  # relative difference as pctg between index values; subtract 1 to get unadjusted pctg change; multiple by 100 to get adjusted pct change
  mutate(diff_first2020_last2022 = round(((last_2022/first_2020) - 1) * 100, 1), 
         diff_first2022_last2022 = round(((last_2022/first_2022) - 1) * 100, 1),
         diff_mar2020_nov2022 = round(((nov_2022/mar_2020) - 1) * 100, 1),
         diff_apr2020_nov2022 = round(((nov_2022/apr_2020) - 1) * 100, 1),
         diff_mar2020_dec2022 = round(((dec_2022/mar_2020) - 1) * 100, 1),
         diff_apr2020_dec2022 = round(((dec_2022/apr_2020) - 1) * 100, 1),
         diff_jan2022_nov2022 = round(((nov_2022/jan_2022) - 1) * 100, 1),
         diff_feb2022_nov2022 = round(((nov_2022/feb_2022) - 1) * 100, 1),
         diff_jan2022_dec2022 = round(((dec_2022/jan_2022) - 1) * 100, 1),
         diff_feb2022_dec2022 = round(((dec_2022/feb_2022) - 1) * 100, 1),) %>%
  relocate(c(cat, msa))

# relocate(cat, .before = "msa")
# relocate(c(diff_032020_082022, diff_042020_082022, diff_032020_072022, diff_012022_082022, diff_022022_082022, diff_012022_072022), .after = "msa")

# DT table all
table_all <- msas_all2 %>% 
  select(cat, msa, diff_first2020_last2022:diff_feb2022_dec2022) %>%
  datatable(rownames = FALSE, options = list(pageLength = 33))  # 3 categories per page

table_all


# Shared table ----

table_all_shared <- msas_all2 %>%
  select(cat, msa, diff_first2020_last2022, diff_first2022_last2022) %>%
  rename(Category =  cat,
         "Metropolitan Statistical Area" = msa,
         "Inflation (%) - since Mar. 2020"= diff_first2020_last2022,
         "Inflation (%) - 2022"= diff_first2022_last2022) %>%
  datatable(rownames = FALSE, options = list(pageLength = 33))

table_all_shared
  
# (table_neighborhood_ftp <- neighborhood_ftp_2 %>% datatable(colnames = c("Borough" = 1, "Neighborhood" = 2, "2021 (%)" = 3, "2022 (%)" = 4), rownames = FALSE, options = list(pageLength = 18)))


# DT table separate ----
table_overall <- msas_all2 %>% 
  filter(cat = "overall") %>%
  select(cat, msa, mar_2020:dec_2022) %>%
  
  
table_overall <- msas_all2 %>% 
  filter(cat = "overall") %>%
  select(cat, msa, mar_2020:dec_2022) %>%
  
table_overall <- msas_all2 %>% 
  filter(cat = "overall") %>%
  select(cat, msa, mar_2020:dec_2022) %>%
  
# filter by category
# create DT table for easy sorting, all in one table, or in 11 separate tables?


# OLD // IGNORE ----
msas_all2a <- msas_all1 %>%
  # calc = ((<index, time 2>/<index, time 1>) - 1) * 100   
  # relative difference as pctg between index values; subtract 1 to get unadjusted pctg change; multiple by 100 to get adjusted pct change
  mutate(diff_032020_112022 = round(((aug_2022/mar_2020) - 1) * 100, 1),
         diff_042020_112022 = round(((aug_2022/apr_2020) - 1) * 100, 1),
         diff_032020_072022 = round(((jul_2022/mar_2020) - 1) * 100, 1),
         diff_012022_082022 = round(((aug_2022/jan_2022) - 1) * 100, 1),
         diff_022022_082022 = round(((aug_2022/feb_2022) - 1) * 100, 1),
         diff_012022_072022 = round(((jul_2022/jan_2022) - 1) * 100, 1),) %>%
  relocate(c(diff_032020_082022, diff_042020_082022, diff_032020_072022, diff_012022_082022, diff_022022_082022, diff_012022_072022), .after = "msa") # %>%


# SAVE ----------

save.image("~/00-OneDrive-mirror/r-posit/inflation/msas-analysis.Rdata")
