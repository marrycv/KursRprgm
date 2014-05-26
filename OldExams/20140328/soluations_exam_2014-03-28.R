#------------------------------------------------------
#
# 732G33 Exam 1: solutions
#
# Date: 2013-03-22
# Author: Josef Wilzén & Måns Magnusson 
#
#------------------------------------------------------


lab.path<-"/home/joswi05/Dropbox/RCourse2014/Admin/exam 1"
setwd(lab.path)



#------------------------------------------------------
# 1: Datastrukturer
#------------------------------------------------------

# 1
# a)
myText<-"Hello World!"
X<-1:15
myBoolean<-rep(c(TRUE,TRUE,FALSE,TRUE,FALSE),3)

# b)
myList<-list(myText=myText,X=X,myBoolean=myBoolean)

# c)
newList<-myList
a<-newList[[2]]

newList[[2]][newList[[3]]]<-a[newList[[3]]]/-100
newList$matrixElement<-cbind(1:10,10:1)
newList


#------------------------------------------------------
# 2 Kontrollstrukturer
#------------------------------------------------------

# a)

testType<-function(X){
  if(is.numeric(X)){
    return("X is numeric")
  }else if(is.character(X)){
    return("X is character")
  }else{
    return("Other")
  }
}

testType(X=1:10)
testType(X="hej")
testType(X=TRUE)

# b)
set.seed(1234)
x1<-rchisq(n=9,df=1)
x2<-rchisq(n=9,df=5)
x3<-rchisq(n=9,df=10)
x4<-rchisq(n=9,df=15)
X<-cbind(x1,x2,x3,x4)

for(i in 1:dim(X)[2]){
  temp<-median(X[,i])
  print(paste("I kolumn ",i," är medianen ",round(temp,3),sep=""))
}


#------------------------------------------------------
# 3 Datum och strängar:
#------------------------------------------------------

# a)
library(lubridate)
library(stringr)

# b)
day1<-ymd("2014-01-01")
year2014<-seq(from=day1,by="day",length.out=365)

# c)
#weekdays(year2014)
weekends<-year2014[c(FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE)]
#weekdays(weekends)
#length(weekends)

# d)

ageData<-readLines("ageData.txt",encoding="latin1")
#ageData

onlyAge<-str_sub(string=ageData,start=9)

age<-unlist(str_extract_all(string=onlyAge,pattern="[0-9]{1,3}"))
#age<-as.numeric(unlist(str_extract_all(string=onlyAge,pattern="[0-9]{1,3}")))
ID<-str_sub(string=ageData,start=1,end=8)
personAge<-data.frame(ID=ID,age=age)


#------------------------------------------------------
# 4 Statistik och grafik
#------------------------------------------------------

# a)

myRegression<-function(x,y){
  model<-lm(y~x)
  hist(model$residuals)
  modelSum<-summary(model)
  return(modelSum$coefficients[,c(1:2,4)])
}
#myRegression(x=cars$speed,y=cars$dist)

# b)

data(cars)
plot(cars)
abline(reg=lm(cars$dist~cars$speed))


# c)
library(ggplot2)

qplot(speed, dist,data=cars,geom=c("point","smooth"), method="lm")


#------------------------------------------------------
# 5 Funktioner: Trärningsspel
#------------------------------------------------------


myD6<-function(N){
  y<-sample(1:6,N,replace=TRUE)  
return(y)
}

sumOfDice<-function(N){
  y<-sum(myD6(N))
  return(y)
}

randomSum<-function(K,mySeed=NULL){
  set.seed(mySeed)
  myResult<-matrix(0,nrow=K,ncol=2)
  colnames(myResult)<-c("noDice","values")
  for(i in 1:K){
    x<-myD6(1)
    y<-sumOfDice(N=x)
    myResult[i,]<-c(x,y)
  }
  stats<-summary(myResult[,2])
  res<-list(stats=stats,values=myResult)
  return(res)
}
#test<-randomSum(K=5)
#plot(test$values[,1],test$values[,2])



































