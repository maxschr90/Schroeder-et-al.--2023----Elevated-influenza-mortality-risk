# Script to make scatter plots of epidemic years

# Set working directory
setwd("/Users/rebeccamancy/Developer/Schroeder-et-al.-2021--How-long-do-pandemics-last-/")
getwd()
rm(list = ls())

library(tidyr) # gather
library(dplyr) # joins
library(readxl) # For reading in data from Excel
#library(writexl)
library(ggplot2) 
library('ggthemes')
#library(cowplot)

figure.path <- "Figures/"

# ---- Select Load up dataset ----
influenza <- read_excel(path = "Data/Relative Mortality.xlsx", sheet = "Influenza")
names(influenza)[1] <- "Year"
respiratory <- read_excel(path = "Data/Relative Mortality.xlsx", sheet = "Respiratory")
names(respiratory)[1] <- "Year"

flu <- gather(data = influenza, "City", "Influenza", -Year)
#flu$variable <- "Influenza"

resp <- gather(data = respiratory, "City", "Respiratory", -Year)
#resp$variable <- "Respiratory"

dat <- left_join(x = flu, y = resp)
head(dat)
  
library(lemon)
p <- ggplot(dat) + 
  geom_point(aes(x=Influenza, y=Respiratory, colour = City), 
            size = 1, shape = 1) +
  scale_x_continuous("Relative mortality (influenza)", breaks = seq(0,8,by=2), labels = seq(0,8,by=2), limits = c(0,8.5)) +
  scale_y_continuous("Relative mortality (respiratory tract diseases)", breaks = seq(0,2.5, by=0.5), labels = seq(0,2.5, by=0.5)) +
  theme_classic() + 
  theme(strip.background = element_blank(), 
        strip.text.x = element_text(size = 12, face = "bold"),
        panel.spacing = unit(1, "lines"))
p <- p + facet_rep_wrap(~Year) #, repeat.tick.labels = 'left') 

ggsave(plot = p, filename = "Fig_Excess_Mortality.pdf", path = figure.path, 
       width = 17, height = 10, units = "cm")

