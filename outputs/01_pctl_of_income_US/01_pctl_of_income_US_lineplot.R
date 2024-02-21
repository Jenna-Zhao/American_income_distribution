# -----------------------------------------------------------
# Script Name: 01_pctl_of_income_US_lineplot
# Purpose: This script is used to draw
# the percentile of income from 2005 to 2019
# -----------------------------------------------------------

# load packages------------------------------------------------
library(ggplot2)
library(ggthemes)
library(grid)

# load data------------------------------------------------
df = read.csv("data/derived/01_pctl_of_income_US.csv")

# drawing the line plot------------------------------------------------
p = ggplot(df) + 
  geom_line(aes(x = year, y = value, col = Percentile)) + ## add line
  geom_point(aes(x = year, y = value, col = Percentile)) + ## add point
  facet_wrap(~ samp) + ## facet by `samp` variable
  ## add title, subtitle, caption and axis titles
  labs(title = "Percentiles of total compensation",
       subtitle = "United States, in thousands of USD, 2005-2019",
       x = "", y = "",
       caption = "Sources: Percentiles of Income Module; Federal Reserve Bank of Minneapolis") +
  ## adjust texts and breaks in x-axis and y-axis
  scale_x_continuous(expand = c(0, 0.8), 
                     breaks = seq(2005, 2020, 2),
                     labels = c("2005", "07", "09", "11", 
                               "13", "15", "17", "19")) + 
  scale_y_continuous(position = "right",
                     expand = c(0, 0),
                     limits = c(0, 345000),
                     breaks = seq(0, 340000, 100000),
                     labels = c("", "100", "200", "300")) + 
  ## change line colour
  scale_colour_economist() + 
  theme(
    ## set plot margin
    plot.margin = margin(t = 0, r = -43, b = 0, l = 0, unit = "pt"),
    
    ## remove background colour
    plot.background = element_rect(fill = "white"),
    
    ## adjust panel title and relative space
    strip.background = element_rect(color = NA, fill = NA), 
    strip.placement = "outside",
    strip.text = element_text(size = 8, margin = margin(6, 0, 10, 0), 
                              hjust = 0, family = "sans"),
    strip.clip = "off",
    
    ## adjust space between panels 
    ## remove background colour
    ## remove unnecessary grid line and adjust grid line 
    panel.spacing.x = unit(24, "pt"),
    panel.background = element_rect(fill = "white"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(color = "#B7C6CF", linewidth = unit(.5, "pt")),
    panel.grid.minor.y = element_blank(),
    
    ## adjust legend
    ## remove background colour, text size, 
    ## remove title, change position and adjust space
    legend.background = element_blank(), 
    legend.text = element_text(size = 7.5, family = "sans"),
    legend.title = element_blank(),
    legend.key = element_blank(),
    legend.position = c(.85, 1.2),
    legend.spacing.x = unit(2.5, "pt"),
    legend.spacing.y = unit(1, "pt"),
    
    ## adjust axis text size, axis line colour and y-axis title 
    axis.text.x = element_text(size = 7, family = "sans"),
    axis.line.x  = element_line(color = "black", linewidth = unit(.4, "pt")),
    axis.ticks.y = element_blank(),
    axis.text.y.right = element_text(hjust = -1.2, vjust = -.5, 
                                     size = 7, family = "sans"),
    
    ## adjust title/subtitle/caption size, position, face, colour and space
    plot.title.position = "plot",
    plot.title = element_text(size = 11, hjust = 0, face = "bold", 
                              family = "sans",
                              margin = margin(10, 0, 3, 0, "pt")),
    plot.subtitle = element_text(size = 9.5, hjust = 0, family = "sans",
                                 margin = margin(1, 0, 10, 0)),
    plot.caption = element_text(hjust = 0, vjust = 5, size = 6.5, 
                                family = "sans", colour = "#404040")) +
  # make legend become 2 rows
  guides(colour = guide_legend(nrow = 2, byrow = TRUE)) 

# Generate a ggplot2 plot grob
p_grob = ggplotGrob(p)

# open device to save plot------------------------------------------------
png("outputs/01_pctl_of_income_US/01_pctl_of_income_US_lineplot.png", 
    width = 7.3, height = 4.3, units = "in",
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
## add marker for panels
grid.rect(x = 0, y = unit(.85, "npc"),
          width = unit(11, "points"), height = unit(1.3, "points"), 
          just = c("left", "top"),
          gp = gpar(fill = "#E3120B", lwd = 0))
grid.rect(x = unit(0.5, "npc") + unit(32.5, "points"), y = unit(.85, "npc"),
          width = unit(10.5, "points"), height = unit(1.3, "points"), 2, 
          just = c("left", "top"),
          gp = gpar(fill = "#E3120B", lwd = 0))
# Close the device
dev.off()


