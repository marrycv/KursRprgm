#### Demo 10: Föreläsning 5 ####
#### Författare: Josef Wilzén

#-------------------------------------------------------------
# Del 1: Beskrivande statistik
#-------------------------------------------------------------

# ladda in två dataset:
data(trees)
plot(trees)
data(iris)
plot(iris)

summary(trees)
cov(trees$Volume,trees$Height)
cor(trees$Volume,trees$Height)
cov(trees)
colMeans(trees)
colSums(trees)


# frekvenstabeller:
table(iris$Species)

x<-iris[,1]>6
y<-iris[,2]>3
table(iris$Species,x)
table(iris$Species,x,y)

# apply-funktioner

# Över kolumner:
apply(X=trees,MARGIN=2,FUN=range)
apply(X=trees,MARGIN=2,FUN=min)
# Över rader:
apply(X=trees,MARGIN=1,FUN=min)

par(mfrow=c(1,3))
apply(X=trees,MARGIN=2,FUN=boxplot)
dev.off()

test<-list(x=1:20,y=trees$Height[1:12],z=c(1,1,0,0,1,0,1,0,0,0,0,1))
test
lapply(X=test,FUN=mean)

# vad är skillnaden nedan?
a<-lapply(X=trees,FUN=mean)
b<-sapply(X=trees,FUN=mean)
a
b
class(a)
class(b)

# gruppera på en faktor:
# iris data:
by(data=iris$Sepal.Length,INDICES=iris$Species,FUN=mean)
by(data=iris$Sepal.Length,INDICES=iris$Species,FUN=sd)

aggregate(x=iris$Sepal.Length,by=list(iris$Species),FUN=sd)



#-------------------------------------------------------------
# Del 2: Objekt, klasser mm
#-------------------------------------------------------------

myByObject<-by(data=iris$Sepal.Length,INDICES=iris$Species,FUN=mean)

attributes(myByObject)
class(myByObject)
myByObject
str(myByObject)
list(myByObject)


x<-iris[,1]>6
y<-iris[,2]>3
test1<-table(iris$Species,x)
test2<-table(iris$Species,x,y)

class(test1)
class(test2)
str(test1)
attributes(test1)
attributes(test2)

rownames(test1)
colnames(test1)
names(test1)

is.matrix(test1)
is.numeric(test1)
is.logical(test1)

# testa att använda generiska funktioner ett table objekt
plot(test1)
plot(test2)
summary(test1)
summary
summary.table(test1)
summary.default(test1)









