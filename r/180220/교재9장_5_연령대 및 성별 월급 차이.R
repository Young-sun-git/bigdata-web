install.packages("foreign")  # foreign 패키지 설치

library(foreign)             # SPSS 파일 로드
library(dplyr)               # 전처리
library(ggplot2)             # 시각화
library(readxl)              # 엑셀 파일 불러오기
setwd("C://easy_r")
raw_welfare<-read.spss(file='Koweps_hpc10_2015_beta1.sav',
                       to.data.frame=T)
welfare<-raw_welfare
head(welfare)
tail(welfare)
welfare<-rename(welfare,
                sex=h10_g3,            
                birth=h10_g4,
                marriage=h10_g10,
                religion=h10_g11,
                income=p1002_8aq1,
                code_job=h10_eco9,
                code_region=h10_reg7)
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)
summary(welfare$birth)
table(is.na(welfare$birth))
welfare$birth<-ifelse(welfare$birth==9999,NA,welfare$birth)
table(is.na(welfare$birth))
welfare$age<-2018-welfare$birth+1
sex_income<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,sex) %>% 
  summarise(mean_income=mean(income))
sex_income
ggplot(data=sex_income,aes(x=ageg,y=mean_income,fill=sex))+
  geom_col()+
  scale_x_discrete(limits=c("young","middle","old"))

ggplot(data=sex_income,aes(x=ageg,y=mean_income,fill_sex))+
  geom_col(position="dodge")+
  scale_x_discrete(limits=c("young","middle","old"))
sex_age<-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age,sex) %>% 
  summarise(mean_income=mean(income))
head(sex_age)
ggplot(data=sex_age,aes(x=age,y=mean_income,col=sex))+geom_line()
