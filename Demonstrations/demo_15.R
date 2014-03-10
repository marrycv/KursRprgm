#### Demo 15: Föreläsning 8 ####

# linjär regression

data(trees)
x<-lm(formula=Volume~Height,data=trees)
x
plot(trees$Height,trees$Volume,pch=15)
abline(reg=x)

class(x)
plot(x)
summary(x)
coef(x)
fitted(x)

# kolla under value:
?lm
class(x)
attributes(x)
str(x)
# välja ut olika delar av resultatet
x$residuals
x$coefficients
x$model
x$fitted.values


y<-summary(x)
?summary.lm()
class(y)
str(y)
# Koef. och p-värdet:
y$coefficients
# den skattade standardavvikelsen på modellen:
y$sigma

# skapa ett formel-objekt 
y<-rnorm(10)
x1<-1:10
x2<-20:10
x3<-15:25
z<-as.formula("y~x1+x2+x3")
str(z)
class(z)
methods(class=formula)
plot.formula(z)
as.formula("y~.")
as.formula("y~x1:x2")
?"~"


# model med flera X-variabler.
setwd("/home/joswi05/Dropbox/Rkurs/KursRprgm/Labs/DataFiles")
dir()
# läsa in data:
google<-read.csv2(file="GoogleLabb5.csv")
names(google)

a<-lm(formula=Close~.,data=google)
b<-summary(a)












# fiktiv tidseriedata:

x<-1:120
set.seed(12422)
monthDiff<-rnorm(12,sd=10)
y<-10+0.46*x+monthDiff+rnorm(120,sd=2)
plot(x,y,type="l")
z<-y-monthDiff
plot(x,z,type="l")

residuals()




























