install.packages("rJava")
install.packages("DBI")
install.packages("RJDBC")
install.packages("XML")
install.packages("memoise")
install.packages("KoNLP")
install.packages("wordcloud")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggmap")
install.packages("rvest")
install.packages("RColorBrewer")
install.packages("data.table")
install.packages("dplyr")
install.packages("reshape")
install.packages("stringr")

getwd()
setwd("C:/Users/Administrator/Documents/project180804_2")
list.files()
useSejongDic()

txt <- readLines("seoul_new.txt")
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
# 공백제거
write(unlist(txt),"seoul_new4.txt")
txt<-read.table("seoul_new4.txt")
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
