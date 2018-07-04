setwd("C:\\Users\\Mihir\\Desktop\\analyze")
datatable <- read.csv("dts2.csv")
#install.packages("data.table")
library(data.table)
datatable <- head(datatable,500)[c(-1),]

datatable$Internal.Search.Terms.Instances <- scale(datatable$Internal.Search.Terms.Instances)









library(ggplot2)
ggplot()+
  
  geom_point(aes(x=test$Internal.Search.Terms.Instances,y=test$Clicks,
                 color=test$CTR_v1))
datatable$Cat <- "None"
datatable$CTR_v2 <- datatable$CTR_v1
datatable$CTR_v1 <- gsub("%",'',datatable$CTR_v1)
datatable$CTR_v1 <- as.integer(datatable$CTR_v1)
summary(datatable)
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

for (i in 1:50){
  print(datatable[i,"CTR_v1"])
}


print(as.integer(datatable[i,"CTR_v1"]))


nrow(datatable[datatable$Cat=="0-10",])


ggplot() +
  geom_bar(aes(x=datatable$Cat,color=datatable$X.Searches))


summary(datatable[datatable$Cat=="0-10"&datatable$Internal.Search.Terms.Instances<50,])


qexp((-1:-30)/10)
-1:-30 

j=10
l=30-j
s=0.5
r <- c(dgamma(3*(1:j)/100,shape=s),seq(from=dgamma(3*(j)/100,shape=s),to=dgamma(3*(j)/100,shape=s),length.out=l))
is.vector(r)
r
plotter = data.frame(r)
plotter$r
plotter$Xer <- (1:30)
ggplot() +
  geom_point(aes(x=plotter$Xer,y=plotter$r))

is.list(dgamma(3*(1:30)/10,shape=1))
?qexp
