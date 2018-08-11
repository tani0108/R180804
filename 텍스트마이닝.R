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
install.packages("tm")
library(tm)

library(rJava)
library(DBI)
library(RJDBC)
library(XML)
library(memoise)
library(KoNLP)
library(wordcloud)
library(dplyr)
library(ggplot2)
library(ggmap)
library(rvest)
library(RColorBrewer)
library(data.table)
library(reshape) 
library(stringr)

##################################################
##문제1 서울시 응답소 페이지 분석
##################################################
getwd()
list.files()
KoNLP::useSejongDic()
useSejongDic()

getwd()
setwd("C:/Users/Administrator/Documents/project180804")
KoNLP::useSejongDic()
dSeoulNew <- readLines("seoul_new.txt")
View(dSeoulNew)
class(dSeoulNew)
#명사축출
dSeoulNew <- sapply(dSeoulNew,extractNoun,USE.NAMES = T)
class(dSeoulNew)
View(dSeoulNew)
head(dSeoulNew)
dSeoulNew<-unlist(dSeoulNew)
#숫자제거
dSeoulNew<-gsub("\\d+","",dSeoulNew)
#공백제거
write(dSeoulNew,"seoul_new3.txt")
dSeoulNew<-read.table("seoul_new3.txt")
View(dSeoulNew)




