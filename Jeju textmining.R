getwd()
setwd("C:/Users/Administrator/Documents/project180804_2")
list.files()
useSejongDic()

txt <- readLines("jeju.txt")
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

write(unlist(txt),"jejutop.txt")
txt<-read.table("jejutop.txt")
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
  "제주도 추천 여행 코스 분석",
  cex = 0.8,
  fill = NA,
  border = NA,
  bg = "white",
  text.col="red",
  text.font = 2,
  box.co1=1
)


top <- head(
  sort(txt,decreasing = T),
  40
)

top
top10<-c("중문","주상절리","성산","천지연폭포","한라산","산방산","섭지코지",
         "송악산","신창","오설록")
top10count <- c(
  13,12,10,9,9,8,6,6,7,5
)
barplot(
  top10count,
  beside = T,
  names = top10,
  col = rainbow(length(top10))
)



