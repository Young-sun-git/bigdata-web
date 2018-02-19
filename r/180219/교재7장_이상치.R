library(ggplot2)
var1<-c(1,2,3,4,5)
plot(var1)
var2<-c(2,2,2)
plot(var2)
x<-1:3
y<-3:1
plot(x,y)
plot(x,y,xlim=c(1,10),ylim=c(1,5),
     xlab="x축값",ylab = "y축값",
     main = "Plot Test")
v1<-c(100,130,120,160,150)
plot(v1,type='o',col='red',ylim = c(0,200),
     axes=FALSE,ann=FALSE)
axis(1,at=1:5,
     lab=c("MON","TUE","WED","THU","FRI"))
axis(2,ylim=c(0,200))
title(main="FRUIT",col.main='red',font.main=4)
title(xlab="DAY",col.lab="black")
title(ylab = "PRICE",col.lab="blue")
v1
par(mfrow=c(1,3))
pie(v1)
a<-c(1,2,3)
plot(a,xlab = "aaa")
par(mgp=c(0,1,0))
plot(a,xlab="aaa")

par(oma=c(2,1,0,0))
plot(a,xlab = "aaa")
par(mfrow=c(1,1))
v1<-c(1,2,3,4,5)
v2<-c(5,4,3,2,1)
v3<-c(3,4,5,6,7)
plot(v1,type="s",col="red",ylim = c(1,5))
par(new=T)
plot(v2,type="o",col="blue",ylim = c(1,5))
par(new=T)
plot(v3,type = "l",col="green")
v1<-c(1,2,3,4,5)
v2<-c(5,4,3,2,1)
v3<-c(3,4,5,6,7)
plot(v1,type="s",col="red",ylim = c(1,5))
lines(v2,type="o",col="blue",ylim = c(1,5))
lines(v3,type = "l",col="green",ylim=c(1,15))
legend(4,9,c("v1","v2","v3"),cex=0.9,col=c("red","blue","green",lty=1)
       y<-c(3,4,5,6,7)
       plot(y)
       y<-c(3,3,4,4)       
       plot(y)
       x<-c(3,3,3)
       y<-c(2,3,4)
       plot(x,y)
       x<-c(2,4,6,8)
       y<-c(16,17,19,18)
       plot(x,y)
       plot(x,y,xlim = c(0,10),ylim = c(15,20),
            xlab = "xxx",ylab = "yyy")
       x<-c(1,2,3,4,5)
       barplot(x)
       barplot(x,horiz=T)
       x<-matrix(c(5,4,3,2),2,2)
       barplot(x,beside=T,names=c(5,3),col=c("green","yellow"))
       x
       x<-matrix(c(5,4,3,2),2,2)
       barplot(x,names=c(5,3),col=c("green","yellow"),ylim = c(0,12))
       x
       x<-matrix(c(5,4,3,2),2,2)
       par(oma=c(1,0.5,1,0.5))
       barplot(x,names=c(5,3),beside=T,col=c("green","yellow"),horiz = T)
       v1<-c(100,120,140,160,180)
       v2<-c(120,130,150,140,170)
       v3<-c(140,170,120,110,160)
       qty<-data.frame(BANANA=v1,CHERRY=v2,ORANGE=v3)
barplot(as.matrix(qty),main = "Fruit's Sales QTY",
       beside=T,col=rainbow(nrow(qty)),ylim=c(0,400))
legend(14,400,c("MON","TUE","WED","THU","FRI"),
       cex=0.8,
       fill=rainbow(nrow(qty)))  
peach<-c(180,200,250,198,170)
colors<-c()
for(i in 1:length(peach))
{if (peach[i] >=200)
{colors<-c(colors,"red")}
  else if (peach[i]>=180)
  {colors<-c(colors,"yellow")}
  else
  {colors<-c(colors,"green")}}
height<-c(182,175,167,172,163,178,181,166,159,155)
hist(height,main = "histogram of height")
par(mfrow=c(1,2),oma=c(2,2,0.1,0.1))
hist<-c(1,1,2,3,3,3)
hist(hist)
plot(hist,main="Plot")
par(mfrow=c(1,1),oma=c(0.5,0.5,0.1,0.1))
p1<-c(10,20,30,40)
pie(p1,radius = 1,init.angle = 90)
pie(p1,radius=1,init.angle = 90,col = rainbow(length(p1)),
    label=c("week1","week2","week3","week4"))
pct<-round(p1/sum(p1)*100,1)
lab<-paste(pct,"%")
pie(p1,radius = 1,init.angle=90,col = rainbow(length(p1)),
    label=lab)
legend(1,1.1,c("WEEK1","WEEK2","WEEK3","WEEK4"),
       cex=0.5,fill=rainbow(length(p1)))
install.packages("plotrix")
library(plotrix)
p1<-c(10,20,30,40,50)
f_day<-round(p1/sum(p1))*100,1)
f_label<-paste(f_day,"%")
pie3D(p1,main="3D Pie Chart",col=rainbow(length(p1)),
      cex=0.5,labels = f_label,explode = 0.05)
legend(0.5,1,c("MON","TUE","WED","THU","FRI"),
       cex=0.6,
       fill=rainbow(length(p1)))
v1<-c(10,12,15,11,20)
v2<-c(5,7,15,8,9)
V3<-c(11,20,15,18,13)
boxplot(v1,v2,v3)
df<-data.frame(sex=c("M","F",NA,"M","F"),
               score=c(5,4,3,4,NA))
df
is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))
mean(df$score)
sum(df$score)
library(dplyr)
df %>% filter(is.na(score))
df %>% filter(is.na(score))
df %>% filter(!is.na(score))
df_nomiss<-df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)
df_nomiss<-df %>% filter(!is.na(score)&!is.na(sex))
df_nomiss
df_nomiss2<-na.omit(df)
df_nomiss2
mean(df$score,na.rm=T)
sum(df$score,na.rm = T)
setwd("c://easyr")
exam<-read.csv("csv_exam.csv")
exam[c(3,8,15),"math"]<-NA
exam
exam %>% 
  summarise(mean_math=mean(math))
exam %>% 
  summarise(mean_math=mean(math,na.rm=T))
exam %>% 
  summarise(mean_math=mean(math,na.rm=T),
            sum_math=sum(math,na.rm = T),
            median_math=median(math,na.rm=T))
mean(exam$math,na.rm = T)
exam$math<-ifelse(is.na(exam$math),55,exam$math)
table(is.na(exam$math))
exam
mean(exam$math)
outlier<-data.frame(sex=c(1,2,1,3,2,1),
                    score=c(5,4,3,4,2,6))
outlier
mpg<-as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
mpg$hwy<-ifelse(mpg$hwy<12|mpg$hwy>37,NA,mpg$hwy)
table(is.na(mpg$hwy))
mpg %>% 
  group_by(drv) %>% 
  summarise(mena_hwy=mean(hwy,na.rm=T))
mpg<-as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"]<-"k"
mpg[c(29,43,129,203),"cty"]<-c(3,4,39,42)
