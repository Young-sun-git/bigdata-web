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

class(welfare$sex)
table(welfare$sex)
welfare$sex<-ifelse(welfare$sex==9,NA,welfare$sex)
table(is.na(welfare$sex))
welfare$sex<-ifelse(welfare$sex==1,'male','female')
table(welfare$sex)
qplot(welfare$sex)

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



job_male<-welfare %>% 
  filter(!is.na(job)&sex=="male") %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_male
job_female<-welfare %>% 
  filter(!is.na(job)&sex=="female") %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_female

ggplot(data=job_male,aes(x=reorder(job,n),y=n))+
  geom_col()+
  coord_flip()

ggplot(data=job_female,aes(x=reorder(job,n),y=n))+
  geom_col()+
  coord_flip()
