install.packages("ggplot2")
install.packages("dplyr")
library(dplyr)
library(ggplot2)
setwd("c://easyr")
mpg<-as.data.frame(ggplot2::mpg)
mpg %>% filter(manufacturer=="audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>% 
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot=mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)
  
