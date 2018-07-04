# Initial
setwd("C:\\Users\\Mihir\\Desktop\\analyze")
datatable <- read.csv("dts2.csv")

# Libs -
library(data.table)
library(caTools)
library(ggplot2)

# Creating categories- 

for (i in 1:nrow(datatable)){
  if(between(as.integer(datatable[i,"CTR_v1"]),0,10))
    datatable[i,"Cat"] <- "0-10"
  if(between(as.integer(datatable[i,"CTR_v1"]),10,20))
    datatable[i,"Cat"] <- "10-20"
  
  if(between(as.integer(datatable[i,"CTR_v1"]),20,30))
    datatable[i,"Cat"] <- "20-30"
  
  if(between(as.integer(datatable[i,"CTR_v1"]),30,40))
    datatable[i,"Cat"] <- "30-40"
  
  if(between(as.integer(datatable[i,"CTR_v1"]),40,50))
    datatable[i,"Cat"] <- "40-50"
  
  if(between(as.integer(datatable[i,"CTR_v1"]),50,60))
    datatable[i,"Cat"] <- "50-60"
  
  if(between(as.integer(datatable[i,"CTR_v1"]),60,70))
    datatable[i,"Cat"] <- "60-70"
  
  if(between(as.integer(datatable[i,"CTR_v1"]),70,80))
    datatable[i,"Cat"] <- "70-80"
  
  if(between(as.integer(datatable[i,"CTR_v1"]),80,90))
    datatable[i,"Cat"] <- "80-90"
  
  if(between(as.integer(datatable[i,"CTR_v1"]),90,100))
    datatable[i,"Cat"] <- "90-100"
  
}

datatable$ST <- "None"
for (i in 1:nrow(datatable)){
  if(between(as.integer(datatable[i,"Internal.Search.Terms.Instances"]),0,10))
    datatable[i,"ST"] <- "0-10"
  if(between(as.integer(datatable[i,"Internal.Search.Terms.Instances"]),10,100))
    datatable[i,"ST"] <- "10-100"
  
  if(between(as.integer(datatable[i,"Internal.Search.Terms.Instances"]),100,500))
    datatable[i,"ST"] <- "100-500"
  
  if(between(as.integer(datatable[i,"Internal.Search.Terms.Instances"]),500,1000))
    datatable[i,"ST"] <- "500-1000"
  
  if(between(as.integer(datatable[i,"Internal.Search.Terms.Instances"]),1000,5000))
    datatable[i,"ST"] <- "1000-5000"
  
  if(between(as.integer(datatable[i,"Internal.Search.Terms.Instances"]),5000,10000))
    datatable[i,"ST"] <- "5000-10000"
  
  if (datatable[i,"Internal.Search.Terms.Instances"]>10000)
    datatable[i,"ST"] <- "10000+"
  
  
}


?geom_bar



ggplot() +
  geom_bar(aes(x=datatable[1:1000,"Cat"],fill=datatable[1:1000,"ST"]),color='black')+
  xlab("CTR %") +
  ylab("Number of search terms") +
  ggtitle("Suggestion analysis") +
  guides(fill=guide_legend(title="Search Instances"))



library(tm)
library(SnowballC)
datatable_original <- datatable
corpus = VCorpus(VectorSource(datatable_original$Search.Keywords))
corpus = tm_map(corpus, content_transformer(tolower))
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords())
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, stripWhitespace)



