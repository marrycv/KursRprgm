

# 1
# a)
round((1-cos(2.3*pi))^(1-sqrt(7)),4)

# b)
my_list<-list(trees=trees, AirPassengers=AirPassengers,iris=iris)
str(my_list)

# c)
my_array<-array(rnorm(5*3*2,mean = 14,sd = 2),dim = c(5,3,2))
mean(my_array)
sd((my_array))

# d)
colnames(iris)
my_frame<-iris[iris$Species=="versicolor",c(1,3,5)]


# 2)

X<-matrix(0,3,4)
for(i in 1:3){
  for(j in 1:4){
    X[i,j]<-(i-2.5)^j
  }
}
X

# b)

r<-1
sum_val<-0
while(sum_val<1000){
  area<-pi*r^2
  sum_val<-sum_val+area
  r<-r+1
  if(sum_val<1000){
    print(sum_val)  
  }
}

# 3:
library(stringr)
library(lubridate)
robot<-readLines(con = "/home/josef/Dropbox/Josef/732G33_VT2017/KursRprgmTeacher/Exams/732G33 exam 2017-06-07/wiki_robot.txt")

# b)
robot
a<-str_split(string = robot,pattern = "[ ,.()]")
index<-sapply(lapply(a,str_length),max)>=14
robot[index]

# c)
kaffe<-read.csv(file = "/home/josef/Dropbox/Josef/732G33_VT2017/KursRprgmTeacher/Exams/732G33 exam 2017-06-07/kaffe_data.csv")
#plot(kaffe$kaffe)

# i )
g<-aggregate(x = kaffe$kaffe,by=list(month(kaffe$datum,label = TRUE,abbr = FALSE)),mean)
g[g$x==max(g$x),]

# ii )
wday(kaffe$datum[which(min(kaffe$kaffe)==kaffe$kaffe)],label = TRUE,abbr = FALSE)


# iii )
min_dag<-kaffe$datum[which(min(kaffe$kaffe)==kaffe$kaffe)]
max_dag<-kaffe$datum[which(max(kaffe$kaffe)==kaffe$kaffe)]
floor(interval(min_dag,max_dag)/weeks(1))

# iv )

index<-which(kaffe$datum=="1994-01-01"):which(kaffe$datum=="1995-12-31")
sd(kaffe$kaffe[index])

# 4 )

# a)

quad_func<-function(x){
  a<-str_extract(string = x,pattern = "\\([a-z0-9]{1,3}")
  a<-str_extract(string = a,pattern = "[a-z0-9]{1,3}")
  b<-str_extract(string = x,pattern = "[a-z0-9]{1,3}\\)")
  b<-str_extract(string = b,pattern = "[a-z0-9]{1,3}")
  x_sign<-str_extract(string = x,pattern = "[-+]")
  suppressWarnings(expr = {
    a2<-as.numeric(a)
    b2<-as.numeric(b)
    }
  )
  a3<-ifelse(!is.na(a2),as.numeric(a2)^2,NA)
  part1<-ifelse(is.na(a2),paste0(a,"^2"),a3)
  b3<-ifelse(!is.na(b2),as.numeric(b2)^2,NA)
  part3<-ifelse(is.na(b2),paste0(b,"^2"),b3)  
  part2<-ifelse(!is.na(a2)&!is.na(b2),2*a2*b2,paste0("2*",a,"*",b)) 
  res<-paste0(x," = ",part1,x_sign,part2,"+",part3)
  return(res)
}
x1<-c("(a+b)^2","(d-t)^2","(2-b)^2","(e+921)^2")
x2<-c("(11+3)^2","(312-z)^2","(q+49)^2","(w+10)^2","(2+6)^2")
quad_func(x = x1)
test2<-quad_func(x = x2)
test2


# 5)

fmri<-read.csv2(file = "/home/josef/Dropbox/Josef/732G33_VT2017/KursRprgmTeacher/Exams/732G33 exam 2017-06-07/fmri_data.csv")

# check data:
head(fmri)
dim(fmri)
colnames(fmri)
y<-as.matrix(fmri$y)
X<-as.matrix(fmri[,-1])
dim(X)

# estiamte beta:
lambda1<-5
lambda2<-100
beta_hat1<-solve(t(X)%*%X+lambda1*diag(dim(X)[2]))%*%t(X)%*%y
beta_hat2<-solve(t(X)%*%X+lambda2*diag(dim(X)[2]))%*%t(X)%*%y

y_hat1<-X%*%beta_hat1
y_hat2<-X%*%beta_hat2

# b)

library(ggplot2)
all_data<-cbind(fmri,y_hat1=y_hat1,y_hat2=y_hat2,time=1:72)
ggplot(data = all_data,aes(y=y,x=time))+geom_point()+geom_line(aes(y=y_hat1),col="red")+geom_line(aes(y=y_hat2),col="blue")+ylab("BOLD fmri")+xlab("tid")

