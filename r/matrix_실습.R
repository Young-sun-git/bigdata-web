mat1<-matrix(c(1,2,3,4))
mat1
mat2<-matrix(c(1,2,3,4),nrow = 2)
mat3<-matrix(c(1,2,3,4),nrow = 2,byrow = T)
mat3
mat3[1,]
mat3[1,1]
mat4<-matrix(c(1,2,3
               ,4,5,6
               ,7,8,9),nrow=3,byrow = T)
mat4
mat4<-rbind(mat4,c(11,12,13))
mat4
mat5<-matrix(c('a','b','c','d'),nrow=2,byrow=T)
mat5
mat5<-cbind(mat5,c('e','f'))
mat5
colnames(mat5)<-c('First','second','Third')
mat5
seasons<-matrix(c("봄","여름","가을","겨울"),nrow=2,byrow=T)
seasons
seasons<-matrix(c("봄","여름","가을","겨울"),nrow=2)
seasons
seasons<-matrix(c("봄","여름","가을","겨울"),nrow=2,byrow=T)
seasons
