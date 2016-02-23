

my_object1<-list(name="Ali",age=42,company="liu")
my_object1
class(my_object1)<-"employee"
class(my_object1)


my_object1$name
my_object1$age

print.employee<-function(x){
  print(paste("Name:",x$name,"Age:",x$age,"Company:",x$company))
}
methods(print)
print(my_object1)

my_object2<-list(name="Elin",age=34,company="liu",data=iris,data_name="iris")
class(my_object2)<-c("statistician","employee")
class(my_object2)

print.statistician<-function(x){
  print(paste(x$name,"is a statistician!"))
}

summary.statistician<-function(x){
  print(paste("Favorited data:",x$data_name))
  temp<-summary(x$data)
  print(temp)
}

print(my_object1)
print(my_object2)
summary(my_object1)
summary(my_object2)

age <- function(x) UseMethod("age")
age.default<-function(x) "No method available!"

age.employee<-function(x){
  return(x$age)
}

age(1:2)
age(iris)
age(my_object1)
age(my_object2)


# skap S3 klass i ett steg:
?structure
# skapa ny generisk funktion 
f <- function(x) UseMethod("f")
?UseMethod

library(lubridate)

a<-interval(ymd("2015-01-01"),ymd("2015-01-06"))
dst(a)
??daylight
a/days(1)
a/ddays(1)

ymd("2016-01-01")+dweeks(20)
ymd("2016-01-01")+weeks(20)

b<-dyears(120)
class(b)
str(b)
b

b2<-years(120)
class(b2)
b2
str(b2)
day(b2)
b2@day
b2
month(b2)
month(b2)<-6

class(a)
str(a)
round_date


a<-matrix(1:100,20,5)
b<-matrix(100:1,5,20)
a
b
a%*%b
b%*%a

d<-matrix(5,20,1)
d
class(d)
as.vector(d)
b%*%d

e<-b%*%a
e<-t(a)%*%a
e<-matrix(c(1,2,3,4),2,2)
e
solve(e))
matrix(c(1,2,3,4),2,2,byrow = TRUE)
diag(1:10)
