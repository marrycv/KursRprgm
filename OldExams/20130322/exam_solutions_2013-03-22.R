#------------------------------------------------------
#
# 732G33 Exam 1: solutions
#
# Date: 2013-03-22
# Author: Josef Wilzén & Måns Magnusson 
#
#------------------------------------------------------


#lab.path<-"C:/Users/joswi05/Dropbox/Josef & Måns/RCourse2013/tenta/Exam 1"


#setwd(lab.path)



#------------------------------------------------------
# 1: Datastrukturer
#------------------------------------------------------


# a)
# skapa vektorer:
answer.1a1<-myBoolean<-rep(c(TRUE,NA,FALSE,TRUE),10)  
answer.1a2<-X<-seq(1,40, length=40)
answer.1a3<-Y<-X*exp(X/10)*sin(X^2)


# b)
# skapa data.frame:
answer.1b<-data.frame(myBoolean,X,Y)


# c)
# kopiera
answer.1c<-answer.1b
# ta bort rader med NA:
answer.1c<-answer.1c[!is.na(answer.1c[,1]),]
# Ändra X:
answer.1c[answer.1c[,1]==TRUE,2]<-answer.1c[answer.1c[,1]==TRUE,2]*1.1
# Ändra Y:
Xnew<-answer.1c[,2]
answer.1c[,3]<-Xnew*exp(Xnew/10)*sin(Xnew^2)





#------------------------------------------------------
# 2 Kontrollstrukturer
#------------------------------------------------------

# a)
# Skriva ut i^3:
for(i in 1:10){
  print(paste("Current value: ",i^3))
}

# b)


answer.2b<-function(myValue){
  
  if(myValue%%4==0){
    print("Jämt delbart med 4")
  }else if(myValue%%3==0){
    print("Jämt delbart med 3")
  }else{
    print("Kan ej delas med 3 eller 4")
  }
  
}
# test:
# answer.2b(4)
# answer.2b(3)
# answer.2b(7)


# c)

Z<-1
test<-5639
while(test>100){
  Z<-Z+1
  test<-5639/Z
  
}
answer.2c<-Z
rm(Z)



#------------------------------------------------------
# 3 Datum och strängar:
#------------------------------------------------------

dir()

# a)

#install.packages("lubridate")
#install.packages("stringr")

# ladda in...
library(lubridate)
library(stringr)

# b)

answer.3b<-ymd("2013-01-01")+days(0:364)

# c)

answer.3c<-new_interval("2013-03-22","2013-06-01")/dweeks(1)


# d)
# läsa in data:
transtrom<-readLines("transtrom.txt")

answer.3d<-str_length(transtrom)

# Med felstavat namn:
answer.3.d<-str_length(transtrom)



#------------------------------------------------------
# 4 Funktioner: Matematik
#------------------------------------------------------

# a) 

answer.4aFunc<-function(a,b,c){
  
  # första roten:
  x1<-(-b+sqrt(b^2-4*a*c))/(2*a)
  
  # Andra roten:
  x2<-(-b-sqrt(b^2-4*a*c))/(2*a)
  # samla lösningar:
  mySolutions<-c(x1,x2)
  return(mySolutions)
}
answer.4aTest<-answer.4aFunc(a=4,b=-9,c=-5)



# b)
# nu med vektorer:

# med "fel" namn

answer.4dFunc<-function(a,b,c){
  
  # första roten:
  x1<-(-b+sqrt(b^2-4*a*c))/(2*a)
  
  # Andra roten:
  x2<-(-b-sqrt(b^2-4*a*c))/(2*a)
  
  # samla lösningar i en data.frame:
  mySolutions<-data.frame(X1=x1,X2=x2)
  
  return(mySolutions)
}

answer.4dTest<-answer.4dFunc(a=c(4,1,-5),b=c(-9,-4,-10),c=c(-5,4,8))



# med "rätt" namn

answer.4bFunc<-function(a,b,c){
  
  # första roten:
  x1<-(-b+sqrt(b^2-4*a*c))/(2*a)
  
  # Andra roten:
  x2<-(-b-sqrt(b^2-4*a*c))/(2*a)
  
  # samla lösningar i en data.frame:
  mySolutions<-data.frame(X1=x1,X2=x2)
  
  return(mySolutions)
}

answer.4bTest<-answer.4dFunc(a=c(4,1,-5),b=c(-9,-4,-10),c=c(-5,4,8))






#------------------------------------------------------
# 6 Funktioner: Statistik och grafik
#------------------------------------------------------


# a)
answer.5a<-function(mySample,conf){
  
  testObj<-t.test(x=mySample,conf.level=conf)  # get the CI
  lower<-testObj$conf[1]  # lower CI
  upper<-testObj$conf[2]  # upper CI
  sampleMean<-as.vector(testObj$est)  # mean
  res<-c(lower,sampleMean,upper)  # results
  
  return(res)
}

answer.5b<-function(myData,borders){
  
  hist(myData, main="Histogram over my variable",xlab="Variable")  # create histogram
  abline(v=borders,lwd=5)  # add lines
  
}

answer.5c<-function(pop,sampleSize,conf){
  mySample<-sample(x=pop,size=sampleSize,replace=FALSE)  # take sample
  myCI<-answer.5a(mySample=mySample,conf=conf)  # get the CI
  
  lowerUpper<-myCI[c(1,3)]  # chose the upper and lower CI limits
  answer.5b(myData=pop,borders=lowerUpper)  # plot data
  
  return(myCI)
}


set.seed(seed=500)
myPopulation<-round(rchisq(n=5000,df=6),1)
answer.5Test<-answer.5c(pop=myPopulation,sampleSize=20,conf=0.01)
answer.5Test1<-answer.5c(pop=myPopulation,sampleSize=20,conf=0.99)






