setwd("C://easyr")
library(KoNLP)
library(wordcloud)
library(stringr)
useSejongDic()
txt<-readLines("흡연.txt")
place<-sapply(txt,extractNoun,USE.NAMES = F)
head(unlist(place),30)
cdata<-unlist(place)
place<-str_replace_all(cdata,"[^[:alpha:]]","")
place<-gsub(" ","",place)
place<-gsub("뉴스제목","",place)

txt<-readLines("흡연.txt")
txt
cnt_txt<-length(txt)
cnt_txt
i<-1
for(i in 1:cnt_txt){
  place<-gsub((txt[i]),"",place)
}
place
place<-Filter(function(x){nchar(x)>=2},place)
write(unlist(place),"흡연.txt")
rev<-read.table("흡연.txt")
nrow(rev)
wordcount<-table(rev)
head(sort(wordcount,decreasing = T),30)
library(RColorBrewer)
palete<-brewer.pal(9,"Set1")
wordcloud(names(wordcount),freq=wordcount,scale=c(5,0.3),rot.per=0.25,
          min.freq=2,random.order=F,random.color=T,colors=palete)
legend(0.3,1,"흡연관련 키워드 분석"
       ,cex=0.8,fill=NA,bg="white",text.col="red",text.font=2,
       box.col="red")
