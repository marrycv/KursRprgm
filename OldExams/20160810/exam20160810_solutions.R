#--------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------
# solutions to the R exam 2016-06-15
# Josef Wilzén
#--------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------


# set up:
#install.packages("lubridate")
#install.packages("stringr")
#install.packages("ggplot2")


# specify path to files:
path<-"/home/josef/Dropbox/Josef/732G33_VT2016/KursRprgmTeacher/Exams/732G33 exam 2016-08-10 all files/"
setwd(path)


#--------------------------------------------------------------------------------------
# 1
#--------------------------------------------------------------------------------------
# a)
?floor
x<-c(2000)
y<-exp(floor(1+100/x^3)+1/sin(x))
y

# b
my_vect<-rep(1:15,each=3)
my_vect

# c)
data(trees)
last_index<-(dim(trees)[1]-2):dim(trees)[1]
my_df<-rbind(trees[1:3,],trees[last_index,])
my_df

# d)
list(a=4:2,b=rep(c(TRUE,FALSE,TRUE),2),c=c(NULL),d=matrix(10:1,2,5))



#--------------------------------------------------------------------------------------
# 2
#--------------------------------------------------------------------------------------
# a)

for(i in 1:100){
  if(i%%13==0){
    print(round(sqrt(i),1))
  }
}



# b)
i<-1
cum_sum<-0
while(i<=13){
  if(i%%2==1){
    cum_sum<-cum_sum+i
    print(cum_sum)
  }
  i<-i+1
}

#--------------------------------------------------------------------------------------
# 3
#--------------------------------------------------------------------------------------
# a)
library(stringr)
library(lubridate)

rm(list=ls())
production<-read.csv("production.csv")
head(production)

# b)
# i)
production$date<-ymd(production$date)
class(production$date)

index1<-wday(production$date,label = TRUE)=="Sun"|wday(production$date,label = T)=="Sat"
answer_i<-sum(production$iron[index1])
answer_i

# ii)
index2<-month(production$date,label = TRUE)=="Mar"
answer_ii<-sum(production$wood[index2])
answer_ii

# iii)
# sortera production först
production2<-production[order(production$date),]
head(production2,10)
start_date<-ymd("2003-10-13")
end_date<-ymd("2009-03-12")
index3<-production2$date>=start_date&production2$date<=end_date
answer_iii<-sum(production2[index3,2:3])
answer_iii


# c)
# data:
robot<-readLines(con = "wiki_robot.txt")
wiki_R<-robot<-readLines(con = "wiki_R.txt")

# funciton:
letter_conut<-function(x,test){
  test_letters<-test
  count<-vector("numeric",length(test))
  for(i in 1:length(test)){
    temp<-str_extract_all(x,pattern = test[i])
    count[i]<-sum(sapply(temp,length))
  }  
  result<-data.frame(letters=test,count=count)
  return(result)
}

letter_conut(x = robot,test = c("a","g"))
letter_conut(x = robot,test = c("a","b","c"))
letter_conut(x = wiki_R,test = c("h","z","t","p"))
letter_conut(x = wiki_R,test = c("i"))



#--------------------------------------------------------------------------------------
# 4
#--------------------------------------------------------------------------------------
# a)
skewness <- function(x){
  x_bar <- mean(x)
  n <- length(x)
  taljare <- sum(((x - x_bar)^3))/n
  namnare <- (sum(((x - x_bar)^2))/n)^(3/2)
  return(taljare/namnare)
}

skewness(x=1:100)
data(iris)
skewness(x=iris[,1])


# b)

skewness_list<-function(x){
  n<-length(x)
  res<-vector("list",n)
  names(res)<-names(x)
  for(i in 1:n){
    a<-skewness(x[[i]])
    b<-length(x[[i]])
    res[[i]]<-c(a,b)
  }
  return(res)
}


a<-list(hej=1:100) 
b<-list(h=c(1,40,12,9),g=1:100,tree=trees[,1]) 
test1<-skewness_list(x = a) 
test2<-skewness_list(x = b) 
test1 
test2


# c)

bus_price<-function(X){
  n<-dim(X)[1]
  res<-vector("numeric",n)
  for(i in 1:n){
    if(X$type[i]=="day"){
      price<-100*X$zones[i]
    } else{
      price<-1000*X$zones[i]
    }
    if(X$age[i]=="youth"){
      price<-price*0.7
    }else if(X$age[i]=="senior"){
      price<-price*0.9
    }
    res[i]<-price
  }
  return(res)
}

a1<-expand.grid(age=c("adult","youth","senior"),zones=c(1:2),type=c("day","month")) 
a2<-data.frame(age=c("youth","senior"),zones=4:5,type=c("month","day")) 
a3<-data.frame(age=c("adult"),zones=7,type=c("day"))

b1<-bus_price(X = a1) 
b2<-bus_price(X = a2) 
b3<-bus_price(X = a3) 
b1
b2 
b3


#--------------------------------------------------------------------------------------
# 5
#--------------------------------------------------------------------------------------
# a)

data(iris)
y<-iris[,1]
X<-cbind(1,as.matrix(iris[2:4]))


beta<-solve(t(X)%*%X)%*%t(X)%*%y
beta

# b) 
x<-c("a","b","c","d")
set.seed(967)
sample(x = x,size = 10,replace = TRUE)


# c)
hus<-read.table(file = "HUS_eng.txt",header = TRUE,sep = ",",dec = ".")
head(hus)

# i)
library(ggplot2)
ggplot(data = hus,aes(x=living.area,y=price))+geom_point()+facet_grid(pool~.)


# ii)

y<-t.test(x = hus$living.area,mu = 2100,conf.level = 0.99)
y
t_val<-y$statistic
p_val<-y$p.value
t_val
p_val
# iii)

aggregate(x = hus$price,by = list(hus$no.bedroom),median)
