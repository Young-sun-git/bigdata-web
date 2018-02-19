install.packages("ggplot2")
install.packages("dplyr")
library(dplyr)
library(ggplot2)
setwd("c://easyr")
mpg<-as.data.frame(ggplot2::mpg)
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(3)
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy=mean(hwy) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)
mpg %>%
  filter(class==compact) %>% 
  group_by(maufacturer) %>%
  summarise(count=n()) %>% 
  arrange(desc(count))
  