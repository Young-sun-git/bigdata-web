install.packages("ggplot2")
install.packages("dplyr")
library(dplyr)
library(ggplot2)
setwd("c://easyr")
mpg<-as.data.frame(ggplot2::mpg)
mpg
fuel<-data.frame(fl=c("c","d","e","p","r"),
                 price_fl=c(2.35,2.38,2.11,2.76,2.22),
                 stringAsFactors=F)
fuel
mpg<-left_join(mpg,fuel,by="fl")
mpg %>% 
  select(model,fl,price_fl) %>% 
  head(5)

