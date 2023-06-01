# Script to make scatter plots of epidemic years, Figure A-2

# Set working directory
setwd("~/Developer/Schroeder-et-al.--2023----Elevated-influenza-mortality-risk/Code")
rm(list = ls())

library(tidyr) # gather
library(dplyr) # joins
library(readxl) # For reading in data from Excel
library(ggplot2) 
library(lemon)

figure.path <- "../Figures"

# ---- Load up dataset ----
influenza <- read_excel(path = "SI_Figure_A2_Data.xlsx", sheet = "Influenza")
respiratory <- read_excel(path = "SI_Figure_A2_Data.xlsx", sheet = "Respiratory")

# Push into long format for ggplot
flu <- gather(data = influenza, "City", "Influenza", -Year)
resp <- gather(data = respiratory, "City", "Respiratory", -Year)

# Join flu and respiratory data together into a single dataframe for plotting
dat <- left_join(x = flu, y = resp)
head(dat)
  
# Make figure
p <- ggplot(dat) + 
  geom_point(aes(x=Influenza, y=Respiratory, shape = City), 
            size = 1) +
  scale_x_continuous("Relative mortality (influenza)", breaks = seq(0,8,by=2), labels = seq(0,8,by=2), limits = c(0,8.5)) +
  scale_y_continuous("Relative mortality (respiratory tract diseases)", breaks = seq(0,2.5, by=0.5), labels = seq(0,2.5, by=0.5)) +
  scale_shape_manual(values = c(3,22,11,0,5,8,6,2)) + 
  theme_classic() + 
  theme(strip.background = element_blank(), 
        strip.text.x = element_text(size = 12, face = "bold"),
        panel.spacing = unit(1, "lines"))
p <- p + facet_rep_wrap(~Year) #, repeat.tick.labels = 'left') 
p

ggsave(plot = p, filename = "SI_Figure_A-2.pdf", path = figure.path, 
       width = 17, height = 10, units = "cm")

