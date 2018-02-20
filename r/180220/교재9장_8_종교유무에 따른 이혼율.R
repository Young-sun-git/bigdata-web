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
welfare <- welfare %>% #09-4에서 추가
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle", "old")))

class(welfare$religion)
table(welfare$religion)
welfare$religion<-ifelse(welfare$religion==1,"yes","no")
table(welfare$religion)
qplot(welfare$religion)

#혼인 변수 검토 및 전처리
class(welfare$marriage)
table(welfare$marriage)
welfare$group_marriage<-ifelse(welfare$marriage==1,"marriage",
                               ifelse(welfare$marriage==3,"divorce",NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage)

#종교 유무에 따른 이혼율 분석
religion_marriage<-welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion,group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))
religion_marriage

religion_marriage<-welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  count(religion,group_marriage) %>% 
  group_by(religion) %>% 
  mutate(pct=round(n/sum(n)*100,1))

divorce<-religion_marriage %>% 
  filter(group_marriage=="divorce") %>% 
  select(religion,pct)
divorce
ggplot(data=divorce,aes(x=religion,y=pct))+geom_col()

ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(ageg, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n / tot_group * 100, 1))

ageg_marriage

ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  count(ageg, group_marriage) %>%
  group_by(ageg) %>%
  mutate(pct = round(n / sum(n) * 100, 1))

# 초년 제외, 이혼 추출
ageg_divorce <- ageg_marriage %>%
  filter(ageg != "young" & group_marriage == "divorce") %>%
  select(ageg, pct)

ageg_divorce

# 그래프 만들기
ggplot(data = ageg_divorce, aes(x = ageg, y = pct)) + geom_col()


## -------------------------------------------------------------------- ##
# 연령대, 종교유무, 결혼상태별 비율표 만들기
ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n / tot_group * 100, 1))

ageg_religion_marriage

ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  count(ageg, religion, group_marriage) %>%
  group_by(ageg, religion) %>%
  mutate(pct = round(n / sum(n) * 100, 1))

# 연령대 및 종교 유무별 이혼율 표 만들기
df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(ageg, religion, pct)

df_divorce

ggplot(data = df_divorce, aes(x = ageg, y = pct, fill = religion)) +
  geom_col(position = "dodge")


