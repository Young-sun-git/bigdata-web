install.packages("ggplot2")
install.packages("dplyr")
library(dplyr)
library(ggplot2)
setwd("c://easyr")
midwest<-as.data.frame(ggplot2::midwest)
midwest<-midwest %>% 
  mutate(ratio_child=(poptotal-popadults)/poptotal*100)
midwest %>% 
  arrange(desc(ratio_child)) %>% 
  select(county) %>% 
  head(5)
midwest<-midwest %>% 
  mutate(grade=ifelse(ratio_child>=40,"large",
                      ifelse(ratio_child>=30,"middle","small")))
table(midwest$grade)
midwest %>% 
  mutate(ratio_asian=(popasian/poptotal*100)) %>% 
           arrange(ratio_asian) %>% 
           select(state,county,ratio_asian) %>% 
           head(10)
           
         