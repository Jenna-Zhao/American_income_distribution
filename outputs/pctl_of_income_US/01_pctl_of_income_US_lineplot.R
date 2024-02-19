# This code is used for drawing the percentile of income from 2005 to 2019

# load packages
library(ggplot2)
library(ggthemes)
library(ggtext)
library(grid)

# load data
df = read.csv("data/derived/01_pctl_for_all_and_prime_age.csv")

# drawing the line plot
p = ggplot(df) + 
  geom_line(aes(x = year, y = value, col = Percentile)) + ## add line
  geom_point(aes(x = year, y = value, col = Percentile)) + ## add point
  facet_wrap(~ samp) + ## facet by `samp` variable
  ## add title, subtitle, caption and axis titles
  labs(title = "Percentile of Income from 2005 to 2020",
       subtitle = "United States",
       x = "", y = expression("Income (10" ^ 4* ")"),
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
                     labels = c("", "10", "20", "30")) + 
  ## change line colour
  scale_colour_economist() + 
  theme(
    ## set plot margin
    plot.margin = margin(t = 0, r = 2, b = 0, l = 0, unit = "pt"),
    
    ## remove background colour
    plot.background = element_rect(fill = "white"),
    
    ## adjust panel title and relative space
    strip.background = element_rect(color = NA, fill = NA), 
    strip.placement = "outside",
    strip.text = element_text(size = 8, margin = margin(6, 0 ,20, 0), 
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
    legend.text = element_text(size = 9, family = "sans"),
    legend.title = element_blank(),
    legend.key = element_blank(),
    legend.position = c(.87, 1.37),
    legend.spacing.x = unit(2, "pt"),
    legend.spacing.y = unit(1, "pt"),
    
    ## adjust axis text size, axis line colour and y-axis title 
    axis.text.x = element_text(size = 7, family = "sans"),
    axis.line.x  = element_line(color = "black", linewidth = unit(.4, "pt")),
    axis.ticks.y = element_blank(),
    axis.text.y.right = element_text(hjust = -1.3, vjust = -.5, 
                                     size = 7, family = "sans"),
    axis.title.y.right = element_text(vjust = 1.1, hjust = -1, angle = 0,
                                      size = 7, family = "sans",
                                      margin = margin(l = -65)),
    
    ## adjust title/subtitle/caption size, position, face, colour and space
    plot.title = element_text(size = 11, hjust = 0, face = "bold", 
                              family = "sans",
                              margin = margin(10, 0, 1.5, 0, "pt")),
    plot.subtitle = element_text(size = 9.5, hjust = 0, family = "sans",
                                 margin = margin(1, 0, 10, 0)),
    plot.caption = element_text(hjust = 0, vjust = 5, size = 6.5, colour = "#404040")) +
  # make legend become 2 rows
  guides(colour = guide_legend(nrow = 2, byrow = TRUE)) 

# Generate a ggplot2 plot grob.
p_grob <- ggplotGrob(p)

# open device to save plot
png("outputs/pctl_of_income_US/pctl_plot.png", 
    width = 8.5, height = 3.5, units = "in",
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
## add marker for panels
grid.rect(x = 0, y = unit(.825, "npc"),
          width = unit(10, "points"), height = unit(1, "points"), 
          just = c("left", "top"),
          gp = gpar(fill = "#E3120B", lwd = 0))
grid.rect(x = unit(0.5, "npc") + unit(31, "points"), y = unit(.825, "npc"),
          width = unit(10, "points"), height = unit(1, "points"), 2, 
          just = c("left", "top"),
          gp = gpar(fill = "#E3120B", lwd = 0))
# Close the device
dev.off()


