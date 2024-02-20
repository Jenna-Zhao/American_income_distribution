# -----------------------------------------------------------
# Script Name: 01_pctl_of_income_US
# Purpose: This script is used to clean the raw data "pctl_of_inc_us_w2" 
# help us draw plots more conveniently 
# -----------------------------------------------------------

# load package ------------------------------------------------
library(tidyverse)

# read raw data ------------------------------------------------
df = read.csv("data/raw/pctl_of_inc_us_w2.csv")

# new column names ------------------------------------------------
lookup =c(`10%` = "pctl10_adj", `25%` = "pctl25_adj", 
          `50%` = "pctl50_adj", `75%` = "pctl75_adj", 
          `90%` = "pctl90_adj", `95%` = "pctl95_adj", 
          `98%` = "pctl98_adj", `99%` = "pctl99_adj")

# data cleaning 
df_clean = df %>%
  ## subset by rows
  filter(group_var == "xall", inc_var == "TC") %>% 
  ## subset by columns
  select("year", "samp", 
         "pctl10_adj", "pctl25_adj", "pctl50_adj", "pctl75_adj", 
         "pctl90_adj", "pctl95_adj", "pctl98_adj", "pctl99_adj") %>%
  ## change column names 
  rename(all_of(lookup)) %>%
  ## from wide to long table
  pivot_longer(col = c("10%", "25%", "50%", "75%", 
                       "90%", "95%", "98%", "99%"),
               names_to = "Percentile", values_to = "value") 

# change categories name
df_clean$samp[df_clean$samp 
              == "prime_age_working_w2"] = "Prime-age Workers"
df_clean$samp[df_clean$samp 
              == "all_w2_pik"] = "All Workers"

# save csv file ------------------------------------------------
write.csv(df_clean, file = "data/derived/01_pctl_of_income_US.csv")

