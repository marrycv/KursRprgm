#### Demo 16: Föreläsning 8 ####


# för att plotta matematiska symboler:
?plotmath
?expression
?substitute




#-------------------------------------------------------------
# Del 1: lattice del 1
#-------------------------------------------------------------


library(lattice)
package ? lattice
library(help=lattice)
data(environmental)
?environmental
head(environmental)

# xyplot(x="formel av typen y~x",data=)
xyplot(ozone~radiation,data=environmental)

xyplot(ozone~radiation,data=environmental,main="Ozone vs. Radiation")

summary(environmental$temperature)
temp.cut<-equal.count(environmental$temperature,3)

# göra betingade grafer:
xyplot(ozone~radiation|temp.cut,data=environmental)

xyplot(ozone~radiation|temp.cut,data=environmental,layout=c(1,3))

xyplot(ozone~radiation|temp.cut,data=environmental,layout=c(1,3),as.table=TRUE)
xyplot(ozone~radiation|temp.cut,data=environmental,as.table=TRUE)



# panel + anonym funktion
xyplot(ozone~radiation|temp.cut,data=environmental,as.table=TRUE,pch=20,layout=c(1,3),
       panel=function(x,y,...){
         panel.xyplot(x,y,...)
         fit<-lm(y~x)
         panel.abline(fit,lwd=2)
       }
)

# panel + vanlig funktion
# funktionen skapar en scatter plot och lägger in regressionslinjen
myFunc<-function(x,y,...){
  panel.xyplot(x,y,...)
  fit<-lm(y~x)
  panel.abline(fit,lwd=2)
}

xyplot(ozone~radiation|temp.cut,data=environmental,as.table=TRUE,pch=20,layout=c(1,3),
       panel=myFunc)



# icke-linjär regression i panel funktion
xyplot(ozone~radiation|temp.cut,data=environmental,as.table=TRUE,pch=20,
       panel=function(x,y,...){
         panel.xyplot(x,y,...)
         panel.loess(x,y)
       }, xlab="Solar radiation", ylab="Ozone(ppb)",main="Ozone vs. solar radtiation"
)


wind.cut<-equal.count(environmental$wind,3)

# betingat på två factor variabler:
xyplot(ozone~radiation|temp.cut*wind.cut,data=environmental,as.table=TRUE,pch=20,
       panel=function(x,y,...){
         panel.xyplot(x,y,...)
         panel.loess(x,y)
       }, xlab="Radiation", ylab="Ozone",main="Ozone vs. radtiation"
)

# lattice matrix plot:
splom(~environmental)

# base matrix plot:
plot(environmental)

# histogram:
histogram(~temperature,data=environmental)
histogram(~temperature| wind.cut,data=environmental)
histogram(~ozone| wind.cut,data=environmental)

histogram(~ozone| wind.cut*temp.cut,data=environmental)




#-------------------------------------------------------------
# Del 2: ggplot2 package 
#-------------------------------------------------------------

library(ggplot2)

# mpg data:data(mpg)
data(mpg)
str(mpg)
?mpg
plot(mpg)
View(mpg)

qplot(displ, hwy,data=mpg)

qplot(displ, hwy,data=mpg,color=drv)

qplot(displ, hwy,data=mpg,geom=c("point","smooth"))

qplot(hwy,data=mpg,fill=drv)

# facets= factor for rows ~ facotr for columns
qplot(hwy,data=mpg, facets=drv~., binwidth=2)
qplot(hwy,data=mpg, facets=.~drv)

qplot(hwy,data=mpg,geom="density")
qplot(hwy,data=mpg,geom="density", color=drv)
qplot(log(hwy),data=mpg,geom="density", color=drv)
qplot(sqrt(hwy),data=mpg,geom="density", color=drv)

data(iris)
qplot(x=Sepal.Length,y=Sepal.Width, shape=Species,data=iris)
qplot(x=Sepal.Length,y=Sepal.Width, color=Species,data=iris)

qplot(x=Sepal.Length,y=Sepal.Width,data=iris,color=Species,geom=c("point","smooth"), method="lm")

qplot(x=Sepal.Length,y=Sepal.Width,data=iris,color=Species,geom=c("point","smooth"), method="loess")

qplot(x=Sepal.Length,y=Sepal.Width,data=iris,geom=c("point","smooth"),facets=.~Species, method="lm")
qplot(x=Sepal.Length,y=Sepal.Width,data=iris,geom=c("point","smooth"),facets=.~Species, method="loess")



#-------------------------------
# ggplot()
#-------------------------------

ggplot()

data(diamonds)
data(longley)
?longley
?qplot
# testa ggplot:
?ggplot
qplot(x=)
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

g+geom_point()+geom_smooth(method="lm")+facet_grid(.~drv)

g+geom_point()+geom_smooth(method="loess")+facet_grid(.~drv)

# för lite data
g+geom_point()+geom_smooth(method="lm")+facet_grid(fl~drv)
g+geom_point()+geom_smooth(method="lm")+facet_grid(.~mpg$y)



names(mpg)
?mpg


# använda "konstanta" färger:
g+geom_point(color="steelblue")+geom_smooth(method="lm")
g+geom_point(color="green",size=4,alpha=0.5)+geom_smooth(method="lm")



# använda variabla färger:
g+geom_point(aes(color=drv),size=6,alpha=0.5)+geom_smooth(method="lm")

g+geom_point(color="green",size=4,alpha=0.5)+geom_smooth(method="lm")

# ändra mer på plotten...
g+geom_point(aes(color=drv),size=6,alpha=0.5)+labs(title="mpg data")+ labs(x="x variable is displ")

g+geom_point(aes(color=drv),size=6,alpha=0.5)+labs(title="mpg data")+ labs(x="x variable is displ")

g+geom_point(aes(color=drv),size=6,alpha=0.5)+labs(title="mpg data")+ labs(x="x variable is displ")+
  geom_smooth(size=2,linetype=5,method="loess", se=FALSE)


# tema black and white
g+geom_point(color="green",size=4,alpha=0.5)+geom_smooth(method="lm") +theme_bw()
g+geom_point(color="green",size=4,alpha=0.5)+geom_smooth(method="lm") +theme_bw(base_family="Times")


# gränser för axlarna:
testData<-data.frame(x=1:100,y=rnorm(100))
testData[42,2]<-75 # outlier
plot(testData[,1],testData[,2],type="l",ylim=c(-3,3))

b<-ggplot(testData,aes(x=x,y=y))
b+geom_line()

b+geom_line()
# tar bort data som ligger utanför gränsen
b+geom_line() +ylim(-3,3)
# indkluderar data som ligger útanför gränsen
b+geom_line()+ coord_cartesian(ylim=c(-3,3))


# större exempel:
?mpg
cutPoints<-quantile(mpg$cty,seq(0,1,length=3),na.rm=TRUE)
x<-cut(mpg$cty,breaks=cutPoints)
mpg2<-mpg
mpg2$ctyCut<-x
levels(mpg$ctyCut)
table(mpg$ctyCut)

u<-ggplot(mpg2,aes(displ,hwy))
u+geom_point()+facet_grid(drv~ctyCut)+geom_smooth()
table(mpg2$ctyCut)


# longley data:

data(longley)
d<-ggplot(data=longley,aes(Year,GNP.deflator,Year, GNP))
e<-ggplot(data=longley,aes(Year, GNP))
e+d+geom_line()


# ggplot och histgram:
data(chickwts)
a<-ggplot(data=chickwts,aes(x=weight))
a+geom_bar()+facet_grid(.~feed)




#-------------------------------------------------------------
# Del 3: spatiala data  
#-------------------------------------------------------------

library(maptools)

setwd("/home/joswi05/Dropbox/Josef/732G33 josef/labbar/spatial")
dir()
# läsa in data
sweMap <- readShapePoly("Lan_SCB_07")
Encoding(as.character(sweMap@data$LNNAMN))<-"latin1" 

as.character(sweMap@data$LNNAMN)

is.factor(sweMap@data$LNNAMN)

?readShapePoly
str(sweMap)
# ladda ner data med län med sweSCB:
plot(sweMap)

# @ funkar som $ fungerar i en lista i vissa R-objekt (S4-objekt)
sweMap@data

# plotta ut statistk på länsnivå
sweMap@data[,1]
dim(sweMap@data)
sweMap@data<-cbind(sweMap@data,hej=rnorm(21))
spplot(sweMap,"hej")
  
sweMap@data<-cbind(sweMap@data,number=seq(0,300,length.out=21))
spplot(sweMap,"number")

names(sweMap@data)
x<-sweMap@data$BEF05/sweMap@data$LANDAREAKM
sweMap@data<-cbind(sweMap@data,density=x)
spplot(sweMap,"density")


setwd("/home/joswi05/Dropbox/Rkurs/KursRprgm/Labs/DataFiles")

# följande fil ligger på kurshemsidan, där ni hittar filer till labbarna.
bokbuss<-read.csv(file="bokbusar.csv",encoding="latin1")
names(bokbuss)

library(stringr)
ID<-factor(str_sub(bokbuss$region,start=1,end=2))
bok<-data.frame(bokbussar=bokbuss$X2012,ID=ID)
temp<-base::merge(x=sweMap@data,y=bok,by.x="LNKOD",by.y="ID")
sweMap@data<-temp

# Hur många bokbussar finnas i det i olika län?
spplot(sweMap,"bokbussar")




# läsa in data


