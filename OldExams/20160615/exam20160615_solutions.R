#--------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------
# solutions to the R exam 2016-06-15
# Josef Wilzén
#--------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------



#--------------------------------------------------------------------------------------
# 1
#--------------------------------------------------------------------------------------
# a)

x<-10
y<-exp(x-3)*x^(3-log(x))
y

# b
my_list<-vector("list",5)
my_list<-list(NULL,NULL,NULL,NULL,NULL)
my_list

# c)
data.frame(num=10:1,logi=rep(c(TRUE,FALSE),5),char=letters[1:10])

# d)
array(data = 20:9,dim = c(3,4,2),dimnames = list(c("x1","x2","x3"),c("y1","y2","y3","y4"),c("z1","z2")))

#--------------------------------------------------------------------------------------
# 2
#--------------------------------------------------------------------------------------
# a)
for (i in 1:2){   
  print(paste("yttre index",i))   
  for (j in 1:4){     
    print(paste("inre index",j))  
  } 
} 

# b)
x<-17
i<-1
while(i<=5){
  if(x%%17==0){
    print(x)
    i<-i+1
  }
  x<-x+1
}

#--------------------------------------------------------------------------------------
# 3
#--------------------------------------------------------------------------------------
# a)
library(stringr)
library(lubridate)
path<-"/home/josef/Dropbox/Josef/732G33_VT2016/KursRprgmTeacher/Exams/"
setwd(path)
IDE<-readLines("R_IDE.txt")
IDE

# b)
my_text<-str_extract(string = IDE,pattern = "^[A-Za-z ]+")
my_text
# c)
a<-ymd("1992-12-02") 
b<-ymd("2016-06-15")
all_days<-seq(a,b,1)
sum(weekdays(all_days)=="tisdag")

# d)

my_formula<-function(x){
  my_coef<-x$coefficients
  library(stringr)
  temp<-str_c("y = ",round(my_coef[1],2))
  for(i in 2:length(my_coef)){
    temp<-str_c(temp," + ",round(my_coef[i],2),"*",names(my_coef)[i])  
  }
  return(temp)
}

data("trees")
a1<-lm(Volume~Girth,data=trees)
my_formula(a1)
a2<-lm(Volume~Girth+Height,data=trees)
my_formula(a2)
data("iris")
a3<-lm(Sepal.Length~Sepal.Width+Petal.Length+Petal.Width,data=iris)
my_formula(a3)

#--------------------------------------------------------------------------------------
# 4
#--------------------------------------------------------------------------------------
# a)
poisson_pdf<-function(n,lambda){
  y<-(exp(-lambda)*(lambda^n))/factorial(n)
  return(y)
}
poisson_pdf(n = 0:3,lambda = 1)
poisson_pdf(n = 3:5,lambda = 3)


# b)
my_math<-function(x,a=1,b=1){
  y<-ifelse(x<0,sin(b*x)/x,ifelse(x==0,1,a*exp(-x)))
  return(y)
}
x<-seq(-2,2,1)
y<-my_math(x,a = 0.1,b = 2)
y
my_math(x = c(5,-4,0),a = 10,b = 12)
curve(my_math,from=-10,to = 10,a=10)

# c)
my_data_analysis<-function(path,func,col){
  a<-read.csv(file = path)
  b<-apply(X = a[,col],2,func)
  return(b)
}

path<-"/home/josef/Dropbox/Josef/732G33_VT2016/KursRprgmTeacher/Exams/"
setwd(path)

my_data_analysis(path = "AppleTest.csv",mean,col = 3:6)
my_data_analysis(path = "AppleTest.csv",col = 5:4,func = max)
my_data_analysis(path = "AppleTest.csv",col = c(6,3),func = sum)

#--------------------------------------------------------------------------------------
# 5
#--------------------------------------------------------------------------------------
# a)
x<-rt(n = 250,df = 7)+12
hist(x)
summary(x)

# b) 
data(CO2)
library(ggplot2)
a<-ggplot(data = CO2,aes(x=conc,y=uptake))
a+geom_point(aes(color=Treatment))

# c)
path<-"/home/josef/Dropbox/Josef/732G33_VT2016/KursRprgmTeacher/Exams/"
setwd(path)
hus<-read.table(file = "HUS_eng.txt",header = TRUE,sep = ",",dec = ".")
head(hus)

# i)

table(hus$no.bedroom,hus$air.conditioning)

# ii)
index<-hus$no.bedroom>=3&hus$no.bedroom<=5
sd(hus[index,1])

# iii)
hist(hus$living.area,30,col="pink",main="",xlab="",freq=FALSE)

