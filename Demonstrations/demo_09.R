#### Demo 09: Föreläsning 5 ####
#### Författare: Josef Wilzén

#-------------------------------------------------------------
# Grafik
#-------------------------------------------------------------

# läsa in data:
?data()
data()  # Vad gör den här koden?

data(cars)
speed<-cars$speed
dist<-cars$dist

#-------------------------------------------------------------
# Del 1
#-------------------------------------------------------------


# olika objekt:
# en vektor
plot(x=speed)
index<-1:50
plot(x=index,y=speed)

# två vektorer
plot(x=dist,y=speed)

# en matrix
firstMatrix<-cbind(dist,speed)
plot(x=firstMatrix,main="Två variabler samtidigt")

# en data.frame
z<-speed^2-3*speed+4
myData<-data.frame(firstMatrix,z)
plot(myData)

# vad är skillnaden mellan dessa?
hist(speed,10,col="blue")
hist(speed,10,freq=FALSE)
hist(speed,freq=FALSE,breaks=20)
hist(speed,breaks=20,freq=FALSE)

# boxplot:
boxplot(x=speed,main="Min boxplot", sub="text under plotten")

# Piechart: 
?pie

x<-c(12,24,13,64,45,23)
y<-x/sum(x)
y
myLabel<-c("a","b","c","d","e","f")
pie(x=y,labels=myLabel,radius=1)
# testa att ändra värdet på argumentet "col="
pie(x=y,labels=myLabel,radius=1,col=1:6)
pie(x=y,labels=myLabel,radius=1,col=c("blue","red"))  # recycle

# Vilka färger finns?
colors() 

#-------------------------------------------------------------
# Del 2
#-------------------------------------------------------------

# Kontrollera din graf med lågnivåplottar...

#-------------------------------------------------------------
# Exempel 1:

x<-seq(from=-5,to=5,length.out=20)
y<-x
plot(x=y,y=x,type="n",xlab="x",ylab="y",main="Tre funktioner")
func1<-sin(x)
points(x,func1,pch="+")
# lägg till en linje med lutning=a
abline(a=-4,b=2)
lines(x,exp(x))
# referenslinjer
abline(h=0,v=0,col="blue")
arrows(x0=-3,y0=3,x1=0,y1=0,lty="dashed",col="red",lwd=3)
text(x=-3.5,y=3.5,labels="Origo")



#-------------------------------------------------------------
# Exempel 2:

# skapa lite data:
x<--3:9
y<-2-3*x
z<-3*x^2
?par
# skapa en graf med många komponenter:
par(mar=c(5, 5, 5, 5) + 0.1)
lines()
plot(c(-3, 9), c(-10, 50), type="n", xlab="", ylab="")
abline(h=0,v=0,col="blue")
text(6, 40, "Mitt diagram")
points(7, 25)
text(7, 25, "(7, 25)", adj=c(0.5,2))
mtext(paste("Mina marginaler", 1:4), side=1:4, line=3,col=1:4)
lines(x=x,y=y,col="red")
points(x,z,lwd=4)

#-------------------------------------------------------------
# Exempel 3:

# Nollställa par():
dev.off()

# Gör subplots:
par(mfrow=c(2,2))
par(mfcol=c(2,2))
hist(speed)


# Återställa till en vanlig plott
par(mfrow=c(1,1))

# par() ger de aktuella parameterna:
par()
dev.off()


#-------------------------------------------------------------
# Exempel 4:

# plotta en matris som en heatmap (tänk karta)
data(volcano)
image(volcano,col=heat.colors(n=8,alpha=0.5))
contour(volcano)

# plotta en matematisk funktion:
curve(expr=exp, from =-3, to =3, n =50 )
curve(tan,-3, 3,200 )

# min egna funktion:

myFunc<-function(x){
  y<-ifelse(x<0,x^3,sin(10*x))  
  return(y)
}

curve(expr=myFunc, from =-1, to =1, n =100 )

# Plotta en matris...
x<-1:300
y<-1:300

# sätta upp en tom matris:
z1<-matrix(0,nrow=300,ncol=300)
# Nested for-loop
for(i in x){  # loopa över rader
  for(j in y){  # loopa över kolumner
    z1[i,j]<-i+j    # beräkningar med index i och j
  }
}
# vad händer om du byter plats på i och j här?




image(z1,col=topo.colors(n=5,alpha=1))
image(z1,col=topo.colors(n=10,alpha=1))
image(z1,col=topo.colors(n=20,alpha=1))
contour(z1)



# bonus: funktionen library() kommer på föreläsning 6
library(fields)
image.plot(z1)

# frekvenser som varierar över en matris:
x<-1:300
y<-1:300

z2<-matrix(0,nrow=300,ncol=300)
for(i in x){
  for(j in y){
    z2[i,j]<-sin(3*x[i])+sin(0.5*y[j])    # vad händer om du byter plats på i och j här?
  }
}
image(z2,col=topo.colors(n=10,alpha=1))


# frekvenserna försvinner med tiden...
z3<-matrix(0,nrow=300,ncol=300)
for(i in x){
  for(j in y){
    z3[i,j]<-sin(3*x[i])*exp(-0.005*i)+sin(0.5*y[j])*exp(-0.005*j)    
  }
}
image(z3,col=topo.colors(n=10,alpha=1))


# frekvenserna försvinner med tiden...
z4<-matrix(0,nrow=300,ncol=300)
for(i in x){
  for(j in y){
    z4[i,j]<-sin(3*x[i])*i+sin(0.5*y[j])*j   
  }
}
image(z4)
image.plot(z4)












