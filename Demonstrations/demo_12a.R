#### Demo 11: Föreläsning 6 ####
#### Författare: Josef Wilz?n

#----------------------------------------------
# Del 1: Slumptal, statistik mm
#----------------------------------------------

?distribution

# skapa en slumpsekvens med 0/1
?rbinom
a<-rbinom(300,1,0.3)
print(a)
mean(a)

# binomialfördelning: n=10 p=0.3
b<-dbinom(x=0:10,size=10,prob=0.3)
barplot(b)
# kumulativ sannolikhet
barplot(b,col=ifelse(0:10<4,"blue","red"),main="Bin(n=10,p=0.3)",names.arg=0:10)
d<-pbinom(q=3,size=10,prob=0.3)
legend("topright",legend=paste(c("blue","red"),c("p=","p="),c(round(d,3),
        round((1-d),3))),text.col=c("blue","red"))

# poissonfördelningen
?rpois
x<-rpois(500,3)
hist(x,10,freq=FALSE)
x<-rpois(500,7)
hist(x,10,freq=FALSE)

# ta stickprov:
?sample
sample(1:10,size=5)

sample(1:10,size=5,replace=TRUE)

y<-c("a","b","b","a","c","c","a","d","c","a","a","d")
sample(y,3)


# kontinuerliga fördelningar
#normalfördelnng
?rnorm
x<-rnorm(n=300,mean=10,sd=3)
hist(x,20,freq=FALSE)
y<-density(x)
lines(y,col="red",lwd="3")
# Vad gör följande rader?
pnorm(q=1.96,mean=0,sd=1)
1-pnorm(q=1.96,mean=0,sd=1)
pnorm(q=1.96,mean=0,sd=1,lower.tail=FALSE)
qnorm(p=0.025,mean=0,sd=1)
qnorm(p=0.975,mean=0,sd=1)

# t-fördelning
?rt
x<-rt(n=300,df=2)
hist(x,20)
y<-rt(n=300,df=40)
hist(y,20)

# chi2
?rchisq
x<-rchisq(n=300,df=3)
hist(x,20)
y<-rchisq(n=300,df=20)
hist(y,20)

# f-fördelning
?rf
par(mfrow=c(3,1))
x<-rf(n=300,df1=1,df2=5)
hist(x,30,main="df1=1 df2=5")
y<-rf(n=300,df1=2,df2=10)
hist(y,30,main="df1=2 df2=10")
z<-rf(n=300,df1=5,df2=5)
hist(z,30,main="df1=5 df2=5")
par(mfrow=c(1,1))

# lite mer om table:
x<-sample(x=letters[1:3],size=20,replace=TRUE)
y<-sample(x=letters[1:4],size=20,replace=TRUE)
z<-table(x,y)
prop.table(z) # relativt totalsumman, jmf: z/sum(z)
prop.table(z,margin=1) # relativt radsumman
prop.table(z,margin=2) # relativt kolumnsumman


# Konfidensintervall och hypotestest för medelvärde i normalpopulation 
?t.test
data(trees)
vol<-trees$Volume
# Är medelvärdet=20?
myTest<-t.test(x=vol,mu=20,conf.level=0.95)
print(myTest)
class(myTest)
str(myTest)
myTest$p.value
myTest$null.value
myTest$p.value
myTest$conf.int

# Test av frekvenstabeller: 
x<-sample(x=letters[1:3],size=100,replace=TRUE)
y<-sample(x=letters[5:8],size=100,replace=TRUE)
z<-table(x,y)
?barplot
print(z)
barplot(z, main="",xlab="",legend = rownames(z),col=3:5)
barplot(z, main="", ylab= "",beside=TRUE, col=3:5)
legend("topright", c("a","b","c"), cex=1, bty="n", fill=3:5)

summary(z)
chisq.test(z)

x2<-sample(x=letters[1:3],size=10,replace=TRUE)
y2<-sample(x=letters[5:8],size=10,replace=TRUE)
z2<-table(x2,y2)
z2
fisher.test(x=z2)





#----------------------------------------------
# Del 2: lubridate och datum/tid
#----------------------------------------------

# läsa in paketet
library(lubridate) 

# Läsa in datum 

just_nu<-now() 
just_nu

idag<-today() 
idag

birthday<-"1981-11-05" 
class(birthday)
birthday+1 

birth<-ymd(birthday)
birth
class(birth)
birth+days(1)

# Plocka ut delar ur datumet 

week(birth) 

yday(birth)

wday(birth,label=TRUE,abbr=FALSE) 

# Byt delar av datumet 
names()<-
year(birth)<-1983 

month(birth)<-6 

day(birth)<-24 

birth
# Datumberäkningar (exakt - kontinuerlig tid) 

myLife<-new_interval(birth,today()) 

myLife/dyears() 

myLife/dweeks() 

myLife/ddays() 

myLife/dhours() 

# Datumberäkningar (relativ - diskret tid) 

myLife/months(1) 

12*31 

myLife/years(1) 

birth+days(10000) 


#avrunda:
round_date(x=birth,unit="day")
round_date(x=birth,unit="year")
floor_date(x=birth,unit="month")
ceiling_date(x=birth,unit="month")

# Någon som vill veta när de fyller 10000 dagar?
student<-ymd("")
life<-new_interval(student,now())
student+days(10000)






















