

#-----------------------------------------------------------------------
# 1
#-----------------------------------------------------------------------

# a)
x<-0.5
y<-sin(x^3/log(x,base = 10))
y

# b)
data(trees)
index<-trees$Girth>=11
my_var<-var(trees$Height[index])
my_var

# c)
set.seed(387)
my_mat<-matrix(rpois(n = 30,lambda = 2),3,10)
my_mat

# d)
my_list<-list(y = y, my_var = my_var,my_mat=my_mat)
my_list

#-----------------------------------------------------------------------
# 2
#-----------------------------------------------------------------------

# a)

A<-matrix(0,3,4)
A
for(i in 1:3){
  for(j in 1:4){
    A[i,j]<-j*cos(i*pi)/i
  }
}
A  
round(A,3)

# b)

# eftersom jag inte specificerade hurvida 0 ska vara med
# eller inte så är båda lösningarna ok:
# 0, 13, 26, ..., 117
# 13, 26, 39, ..., 130

# alt 1:
i<-1
no_int<-1
while(no_int<=10){
  if(i%%13==0) {
    print(i)
    no_int<-no_int+1
  }
  i<-i+1
}

# alt 2:
i<-0
no_int<-1
while(no_int<=10){
  if(i%%13==0) {
    print(i)
    no_int<-no_int+1
  }
  i<-i+1
}

# alt 3:
i<-1
while(i<=10){
  print(13*i)
  i<-i+1
}

#-----------------------------------------------------------------------
# 3
#-----------------------------------------------------------------------

# a)
library(lubridate)
a_born <- ymd("1879-03-14")
a_dead <- ymd("1955-04-18")

f_born <- ymd("1820-05-12")
f_dead <- ymd("1910-08-13")

# i.
# båda lösningarna är ok:
interval(f_born, a_born) %/% weeks(1)
interval(f_born, a_born-days(1)) %/% weeks(1)

# ii
interval(a_born, f_dead) %/% months(1)
# iii
# tänk på att inkludera dagen de avled, testa koden nedan:
a<-ymd("2016-03-21")
b<-ymd("2016-03-22")
# intervallet mellan a och b är två dagar med gränser inkluderade.
interval(a,b)%/%days(1)
interval(a,b)%/%days(1)+1
# 0 p: inkludera dagen då de avled.
# antal dagar:
# båda lösnigarna är OK:
interval(a_born,a_dead)%/% days(1)+interval(f_born,f_dead)%/% days(1)+2
interval(a_born,a_dead)%/% ddays(1)+interval(f_born,f_dead)%/% ddays(1)


# iv
wday(f_dead, label=TRUE)


# b)
library(stringr)
ploy_derivative<-function(f){
  index1<-str_locate(string = f,pattern = "[0-9]+")
  a<-as.numeric(str_sub(string = f,start = index1[1],end = index1[2]))
  index2<-str_locate(string = f,pattern = "\\^")+1
  n<-as.numeric(str_sub(string = f,start = index2[1],end = index2[2]))
  an<-a*n
  new_n<-n-1
  der<-str_c("dy/dx=",an,"x^",new_n)
  return(der)
}

ploy_derivative(f = "3x^1")
ploy_derivative(f = "10x^2")
ploy_derivative(f = "125x^3")
ploy_derivative(f = "8x^9")
ploy_derivative(f = "10001x^9")







#-----------------------------------------------------------------------
# 4
#-----------------------------------------------------------------------

# a)

my_conf<-function(x,alpha){
  if(is.numeric(x)|is.integer(x)){
    z_prob<-1-alpha/2
    z<-qnorm(z_prob)
    n<-length(x)
    x_bar<-mean(x)
    if(all(x==1|x==0)){
      SE<-sqrt((x_bar*(1-x_bar))/n)
      lower_ki<-x_bar-z*SE
      upper_ki<-x_bar+z*SE
    }else{
      SE<-sd(x)/sqrt(n)
      lower_ki<-x_bar-z*SE
      upper_ki<-x_bar+z*SE
    }
  } else{
    stop("x is not numeric")
  }
  return(c(lower_ki,upper_ki))
}

set.seed(298)
a<-rnorm(100,3,4)
b<-rbinom(n = 300,size = 1,prob = 0.4)
a2<-rnorm(n = 200,mean = 0.5,sd = 0.1)
a3<-c(a2,0,1)

my_conf(x = a,alpha = 0.05)
my_conf(x = a,alpha = 0.001)
my_conf(x = b,alpha = 0.1)
my_conf(x = b,alpha = 0.05)
my_conf(x = b,alpha = 0.01)
my_conf(x = a2,alpha = 0.05)
my_conf(x = a2,alpha = 0.1)
my_conf(x = a3,alpha = 0.05)
my_conf(x = "hej",alpha = 0.1)

my_conf(x = a)
my_conf(x = b)
my_conf(x = a2)

#-----------------------------------------------------------------------
# 5
#-----------------------------------------------------------------------


# a)
list_stats<-function(x){
  res<-lapply(X = x,FUN = summary)
  return(res)
}
data(trees)


a<-list(trees,trees+10,cbind(trees,trees))
set.seed(3044)
b<-list(trees,matrix(rnorm(400),100,4))
list_stats(x = b)
list_stats(x = a)


#-----------------------------------------------------------------------
# 6
#-----------------------------------------------------------------------

# a)
data("PlantGrowth")
x1<-PlantGrowth[PlantGrowth[,2]=="trt1",1]
x2<-PlantGrowth[PlantGrowth[,2]=="trt2",1]
a_test<-t.test(x = x1,y = x2,paired = FALSE)
a_test
a_test$conf.int

# b)
library(ggplot2)
data(mpg)
a<-qplot(x = cty,y = displ,data = mpg,facets = drv~.,geom = "point")
a+geom_smooth(method = "lm")

# Bedömning:
# scatter plot: 0.5 p
# 3 radvisa paneler: 0.5 p
# 3 linjära regressionlinjer: 0.5 p

