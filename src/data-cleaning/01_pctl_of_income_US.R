# Following codes clean the raw data "pctl_of_inc_us_w2" to help us draw plots
# more conveniently (drived data "01_pctl_for_all_and_prime_age")

# load package
library(tidyverse)

# read raw data
df = read.csv("data/raw/pctl_of_inc_us_w2.csv")

# new column names
lookup =c(`10%` = "pctl10", `25%` = "pctl25", 
          `50%` = "pctl50", `75%` = "pctl75", 
          `90%` = "pctl90", `95%` = "pctl95", 
          `98%` = "pctl98", `99%` = "pctl99")

# data cleaning 
df_clean = df %>%
  ## subset by rows
  filter(group_var == "xall", inc_var == "TC") %>% 
  ## subset by columns
  select("year", "samp", "pctl10", "pctl25", "pctl50",
         "pctl75", "pctl90", "pctl95", "pctl98", "pctl99") %>%
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

# save csv file
write.csv(df_clean, file = "data/derived/01_pctl_of_income_US.csv")

