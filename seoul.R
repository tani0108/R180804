getwd()
setwd("C:/Users/Administrator/Documents/project180804_2")
list.files()
useSejongDic()

txt <- readLines("seoul_go.txt")
txt <- gsub("\\d+","",txt)
txt <- sapply(txt, extractNoun, USE.NAMES = F)
txt<- unlist(txt)

myGsub<- readLines("myGsub.txt")
i<-1
for(i in 1:length(myGsub)){
  txt<-gsub(myGsub[i],"",txt)
}
txt<- Filter(function(x){!nchar(x)==1},txt)
txt<- Filter(function(x){nchar(x)<=10},txt)

head(sort(txt,decreasing=T),20)

write(unlist(txt),"seoulgo4.txt")
txt<-read.table("seoulgo4.txt")
txt<-table(txt)
head(sort(txt,decreasing = T),20)
pal<-brewer.pal(8,"Dark2")
set.seed(1234)

wordcloud::wordcloud(names(txt),
                     freq=txt,
                     min.freq=1,
                     random.order=F,
                     rot.per=0.25,
                     scale=c(5,1),
                     colors=pal
)

legend(
  0.3,
  1,
  "서울 추천 여행 코스 분석",
  cex = 0.8,
  fill = NA,
  border = NA,
  bg = "white",
  text.col="red",
  text.font = 2,
  box.col="red"
)

