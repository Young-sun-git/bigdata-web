mpg<-as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"]
table(is.na(mpg$drv))
table(is.na(mpg$hwy))
mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))
