# -----------------------------------------------------------
# Script Name: 02_pct50_of_income_state_map
# Purpose: This script is used to draw
# map of 50th percentile of income in 2019 for each state
# -----------------------------------------------------------

# load packages -------------------------

library(ggplot2)  
library(grid)
library(dplyr)
library(sf)
library(tigris)

# Map data ----------------------------
# load data 
df = read.csv("data/derived/02_pctl50_of_income_state.csv")

# load US map data by using tigris package 
us_state_map = tigris::states(cb = T, resolution = "20m", class = "sf")
us_state_map = tigris::shift_geometry(us_state_map, geoid_column = "GEOID", 
                                       position = "below")

# merge income data with map data by state abbr
df_50_income_map = merge(x = us_state_map, y = df,
                         by.x = "STUSPS", by.y = "geo_abb")

# change class to factor (for legend order)
df_50_income_map$Income = factor(df_50_income_map$Income,
                      levels = c("< 30", "30 - 35", "35 - 40",
                                 "40 - 45", "45 - 50", "> 50"))

# set color
col = rev(c("#005F73", "#00788D", "#0092A7", "#25ADC2", "#4EC8DE", "#6FE4FB"))

# plot ----------------------------
p = ggplot(df_50_income_map) +
  ## fill state by income
  geom_sf(aes(fill = Income), colour = "white") +
  ## add label to each state
  geom_sf_text(aes(label = STUSPS),  check_overlap = TRUE, 
               size = 2, colour = "#404040", family = "sans") +
  ## remove scale by 5% on each side for continuous variables
  scale_x_continuous(expand = c(0, 0)) + 
  ## reset fill colour
  scale_fill_manual(values = col) +
  ## add labels (title, subtitle, legend title & caption)
  labs(title = "50th percentile of total compensation", 
       subtitle = "United States, United States, in thousands of USD, 2019",
       fill = "",
       caption = "Sources: Percentiles of Income Module; Federal Reserve Bank of Minneapolis") + 
  ## remove unnecessary lines (grid line & box)
  theme_void() + 
  theme(
    ## adjust plot margin 
    plot.margin = margin(0, 5, 0, -34.5, unit = "pt"),
    
    ## adjust size, family and position of legend text and title
    legend.text = element_text(size = 7.5, family = "sans"),
    ## move legend to top right 
    legend.justification = "right", 
    legend.box = "horizontal",
    legend.margin = margin(0, 1, 355, -83, unit = "pt"),
    legend.position = c(1, 0.5),
    ## adjust space between legend key  
    legend.spacing.x = unit(2, "pt"),
    legend.spacing.y = unit(1, "pt"),
    ## adjust space between size of legend key 
    legend.key.size = unit(0.4, "cm"),
    
    ## adjust size, font, face and position of title, subtitle & caption
    plot.title = element_text(size = unit(11, "pt"), hjust = 0, face = "bold", 
                              family = "sans", margin = margin(10, 0, 3, 0, "pt")),
    plot.subtitle = element_text(size = unit(9.5, "pt"), hjust = 0, family = "sans",
                                 margin = margin(1, 0, 1, 0)),
    plot.caption = element_text(hjust = 0, vjust = 5, size = 6.5, colour = "#404040",
                                family = "sans", margin = margin(2.5, 0, 1, 0, "pt"))) +
  
  ## make legend become 2 rows
  guides(fill = guide_legend(nrow = 2, byrow = TRUE, 
                             title.position = "top", title.hjust = 0.5)) 

# Generate a ggplot2 plot grob
p_grob = ggplotGrob(p)

# open device to save plot ----------------------------
png("outputs/02_pctl50_of_income_state/02_50pctl_of_income_state_map.png", 
    width = 7.15, height = 5, units = "in",
    res = 500)

## draw the grob
grid.draw(p_grob)

## add rotated tag
grid.lines(x = c(0, 1), y = 1, gp = gpar(col = "#E3120B", 
                                         lwd = unit(2, "points"))) 
grid.rect(x = unit(0, "npc"), y = 1, 
          width = unit(15, "points"), height = unit(5, "points"), 
          just = c("left", "top"),
          gp = gpar(fill = "#E3120B", lwd = 0))

# Close the device
dev.off()

