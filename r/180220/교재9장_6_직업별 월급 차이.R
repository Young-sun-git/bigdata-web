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
class(welfare$code_job)
table(welfare$code_job)
library(readxl)
list_job<-read_excel("Koweps_Codebook.xlsx",
                     col_names=T,sheet=2)
head(list_job)
dim(list_job)
welfare<-left_join(welfare,list_job,id="code_job")
welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job,job) %>% 
  head(10)

job_income<-welfare %>% 
  filter(!is.na(job)& !is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income=mean(income))

head(job_income)

top10<-job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)

top10
ggplot(data=top10,aes(x=reorder(job,mean_income),y=mean_income))+
  geom_col()+
  coord_flip()

bottom10<-job_income %>% 
  arrange(mean_income) %>% 
  head(10)

bottom10

ggplot(data=bottom10,aes(x=reorder(job,-mean_income),
                         y=mean_income))+
                         geom_col()+
                           coord_flip()+
                           ylim(0,850)
                         