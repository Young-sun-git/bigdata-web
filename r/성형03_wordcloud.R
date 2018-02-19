data1<-readLines('remake2.txt')
data1
head(unlist(data1),30)
data<-sapply(data1,extractNoun,USE.NAMES = F)
data
#head(unlist(data2),30)
data2<-unlist(data)
data2
write(unlist(data2),'성형03.txt')
data4<-read.table("성형03.txt")
#data4
nrow(data4)
wordcount<-table(data4)
wordcount
head(sort(wordcount,decreasing = T),20)
library(RColorBrewer)
palete<-brewer.pal(9,"Set3")

wordcloud(names(wordcount),freq = wordcount,scale = 
            c(4,0.3),rot.per = 0.25,min.freq = 1,random.order = F,random.color=T,colors=palete)
legend(0.3,1,"성형수술 부작용 키워드 분석",cex=0.8,fill=NA,border=NA,bg="white",
       text.col="red",text.font=2,box.col="red")