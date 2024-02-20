# -----------------------------------------------------------
# Script Name: 02_pctl50_of_income_state
# Purpose: This script is used to clean the raw data "pctl_of_inc_state_w2" 
# help us draw a map
# -----------------------------------------------------------

# load package ------------------------------------------------
library(tidyverse)

# read raw data ------------------------------------------------
df = read.csv("data/raw/pctl_of_inc_state_w2.csv")

# data cleaning and change abbr name ------------------------------------------------
df_50 = df %>%
  ## subset by rows
  filter(group_var == "xall", inc_var == "TC", year == 2019) %>% 
  ## subset by columns
  select("year", "geo_abb", "pctl50_adj") %>%
  ## generate a new category income by pctl50_adj
  mutate(Income = case_when(pctl50_adj <= 30000 ~ "< 30", 
                            pctl50_adj <= 35000 ~ "30 - 35",
                            pctl50_adj <= 40000 ~ "35 - 40",
                            pctl50_adj <= 45000 ~ "40 - 45",
                            pctl50_adj <= 50000 ~ "45 - 50",
                            pctl50_adj >= 55000 ~ "> 50"))

# save csv file ------------------------------------------------
write.csv(df_50, file = "data/derived/02_pctl50_of_income_state.csv")

