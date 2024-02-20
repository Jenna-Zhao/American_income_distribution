
# load packages
library(ggplot2)  
library(ggthemes)
library(dplyr)
library(sf)
library(tigris)

# load data
df = read.csv("data/derived/02_pctl50_of_income_state.csv")

# load US map data
us_state_map = tigris::states(cb = T, resolution = "20m", class = "sf")
us_state_map = tigris::shift_geometry(us_state_map, geoid_column = "GEOID", 
                                       position = "below")

# merge income data with map data
df_50_income_map = merge(x = us_state_map, y = df,
                         by.x = "STUSPS", by.y = "geo_abb")

# change class to factor (legend order)
df_50_income_map$Income = factor(df_50_income_map$Income,
                      levels = c("< 30", "30 - 35", "35 - 40",
                                 "40 - 45", "45 - 50", "> 50"))

col = rev(c("#005F73", "#00788D", "#0092A7", "#25ADC2", "#4EC8DE", "#6FE4FB"))

p = ggplot(df_50_income_map) +
  geom_sf(aes(fill = Income), colour = "white") +
  scale_x_continuous(expand = c(0, 0)) + 
  scale_fill_manual(values = col) +
  labs(title = "50th percentile of Income (2019)", 
       subtitle = "United States",
       fill = expression("Income (10" ^ 3* ")"),
       caption = "Sources: Percentiles of Income Module; Federal Reserve Bank of Minneapolis") + 
  theme_void() + 
  theme(
   plot.margin = margin(0, 0, 0, 1, unit = "pt"),
   
   legend.text = element_text(size = 7, family = "sans"),
   legend.title = element_text(size = 7, hjust = -1, face = "bold", 
                               family = "sans",
                               margin = margin(10, 0, 1.5, 0, "pt")),
   legend.justification = "right",
   legend.spacing.x = unit(2, "pt"),
   legend.spacing.y = unit(1, "pt"),
   legend.box = "horizontal",
   legend.key.size = unit(0.3, "cm"),
   legend.margin = margin(0, 0, 265, -106, unit = "pt"),
   
   plot.title = element_text(size = unit(11, "pt"), hjust = 0, face = "bold", 
                            family = "sans",
                            margin = margin(10, 0, 1.5, 0, "pt")),
   plot.subtitle = element_text(size = 9.5, hjust = 0, family = "sans",
                               margin = margin(1, 0, 10, 0)),
   plot.caption = element_text(hjust = 0, vjust = 5, size = 6.5, colour = "#404040")) +
  # make legend become 2 rows
  guides(fill = guide_legend(nrow = 2, byrow = TRUE, 
                             title.position = "top", title.hjust = 0.5)) 

# Generate a ggplot2 plot grob.
p_grob = ggplotGrob(p)

# open device to save plot
png("outputs/02_pctl50_of_income_state/02_50pctl_of_income_state_map.png", 
    width = 4.5, height = 3.7, units = "in",
    res = 300)

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

