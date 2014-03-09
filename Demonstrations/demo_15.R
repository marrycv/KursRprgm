#### Demo 15: Föreläsning 8 ####

# linjär regression

data(trees)
x<-lm(formula=Volume~Height,data=trees)
plot(trees$Height,trees$Volume,pch=15)
y<-coef(x)
abline(coef=y)
abline(reg=x)
plot(y)
plot(x)
?plot
example(plot)
trees
cars
<-formula(x=x)
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


