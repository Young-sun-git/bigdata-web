install.packages("ggplot2")
install.packages("dplyr")
library(dplyr)
library(ggplot2)
setwd("c://easyr")
mpg<-as.data.frame(ggplot2::mpg)
mpg_new<-mpg
mpg_new<-mpg_new %>% mutate(total=cty+hwy)
mpg_new<-mpg_new %>% mutate(mean=total/2)
mpg_new %>% 
  arrange(desc(mean)) %>% 
  head(3)
mpg %>% 
  mutate(total=cty+hwy,
         mean=total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)
