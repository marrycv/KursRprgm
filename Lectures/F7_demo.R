

#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# ggplot()
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
library(ggplot2)
?ggplot()

data(diamonds)
data(longley)
?longley
?qplot


# testa ggplot:

?ggplot
# qplot():
qplot(x=)
qplot(displ,hwy,data=mpg)
qplot(displ,hwy,data=mpg, facets=.~drv)



g<-ggplot(mpg,aes(displ,hwy))


g<-ggplot(mpg,mapping=aes(displ,hwy))
print(g)
str(g)
summary(g)
class(g)

p<-g+geom_point()
print(p)

g+geom_point()+geom_smooth()
g+geom_point()+geom_smooth(method="lm")

g+geom_point()+geom_smooth(method="lm")

g+geom_point()+facet_grid(.~drv)

g+geom_point()+geom_smooth(method="lm")+facet_grid(.~drv)

g+geom_point()+geom_smooth(method="loess")+facet_grid(.~drv)

# För lite data
g+geom_point()+geom_smooth(method="lm")+facet_grid(fl~drv)




names(mpg)
?mpg


# använda "konstanta" färger:
g+geom_point(color="steelblue")+geom_smooth(method="lm")
g+geom_point(color="green",size=4,alpha=0.5)+geom_smooth(method="lm")



# anv?nda variabla f?rger:
g+geom_point(aes(color=drv),size=6,alpha=0.5)+geom_smooth(method="lm")

g+geom_point(color="green",size=4,alpha=0.5)+geom_smooth(method="lm")

# ?ndra mer p? plotten...
g+geom_point(aes(color=drv),size=6,alpha=0.5)+labs(title="mpg data")+ labs(x="x variable is displ")

g+geom_point(aes(color=drv),size=6,alpha=0.5)+labs(title="mpg data")+ labs(x="x variable is displ")

g+geom_point(aes(color=drv),size=6,alpha=0.5)+labs(title="mpg data")+ labs(x="x variable is displ")+
  geom_smooth(size=2,linetype=5,method="loess", se=FALSE)


# tema black and white
g+geom_point(color="green",size=4,alpha=0.5)+geom_smooth(method="lm") +theme_bw()
g+geom_point(color="green",size=4,alpha=0.5)+geom_smooth(method="lm") +theme_dark(base_family="")


# gr?nser f?r axlarna:
testData<-data.frame(x=1:100,y=rnorm(100))
testData[42,2]<-75 # outlier
plot(testData[,1],testData[,2],type="l",ylim=c(-3,3))

b<-ggplot(testData,aes(x=x,y=y))
b+geom_line()

b+geom_line()
# tar bort data som ligger utanf?r gr?nsen
b+geom_line() +ylim(-3,3)
# indkluderar data som ligger ?tanf?r gr?nsen
b+geom_line()+ coord_cartesian(ylim=c(-3,3))



# longley data:

data(longley)
d<-ggplot(data=longley,aes(Year,GNP.deflator,Year, GNP))
e<-ggplot(data=longley,aes(Year, GNP))
e+geom_line()


# ggplot och histgram:
data(chickwts)
a<-ggplot(data=chickwts,aes(x=weight))
a+geom_bar()+facet_grid(.~feed)
a+geom_histogram(binwidth = 10)
a+geom_histogram(binwidth = 30)+facet_grid(.~feed)


#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
# regression:
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
?lm

data("trees")
class(trees)
plot(trees)
cov(trees)
cor(trees)
cor.test(trees$Girth,trees$Volume)



x<-lm(formula = Volume~Girth,data = trees)
class(x)
print(x)
x
summary(x)
anova(x)
plot(x)

str(x)

coef(x)
predict(x)
plot(trees$Girth,predict(x))

x<-lm(formula = Volume~.,data = trees)
x<-lm(formula = Volume~Girth+Height,data = trees)
print(x)
x
summary(x)
anova(x)
plot(x)

coef(x)
predict(x)
str(x)



