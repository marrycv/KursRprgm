#---------------------------------------------------------------
#---------------------------------------------------------------
# Tenta 2013-06-04
#---------------------------------------------------------------
#---------------------------------------------------------------


#---------------------------------------------------------------
# 1. Datastrukturer
# a)

pi^exp(1) + log(x=3,base=2)


# b)

x <- 2 * 1:25
x<-seq(from=2,to=50,by=2)


myText <- rep(c("Mon","Tue","Wed","Thu","Fri"),5)

y <- 10 + log(x,base=exp(1))

# c)

myDF<-data.frame(x=x,myText=myText,y=y)
temp<-list(a=1:19,b=3:5)
temp[3]<-"hej"

myDF$check <- x > y
sum(x > y)

sum(!myDF$check)



#---------------------------------------------------------------
# 2. Kontrollstrukturer

# a)

for (i in 45:61){
  print(i)
}


# b)

str_c()
for (i in 139:177){
  
  if(i%%7==0 & i%%11==0){
    
    print(paste(i,"is my favorite number!"))
    
  }else if(i%%7==0){
    
    print(paste(i,"can be divided with 7."))
    
  }else if(i%%11==0){
    
    print(paste(i,"can be divided with 11."))
    
  }
}


# c)

Z <- 1000 

while(log(Z)>6){
  Z <- Z-1 
} 
Z 

log(x=(Z+1))
log(x=Z)

#---------------------------------------------------------------
# 3. Strängar och datum

# a)

library(stringr)
library(lubridate)


birth<-ymd("1989-05-03")
class(birth)
attributes(birth)

birth+days(10000) 
birth+days(100) 
# b)

temp<-2000*1:5

birth+days(temp)


# c)
setwd("/home/joswi05/Dropbox/Rkurs/KursRprgm/Demonstrations/old exam")
dir()

BBC<-readLines(con="BBCarticle.txt") 
cat(BBC)

sum(str_length(BBC)) 

str_length(c("ab c","dlkds"))

# d)

str_count(string=BBC,pattern="(^|\"| )[Tt]he($| )")

temp<-str_count(string=BBC,pattern="(^|\"| )[Tt]he($| )")
sum(temp)

temp<-str_count(string=BBC,pattern="(^|[:punct:]| )[Tt]he($|[:punct:]| )")
sum(temp)


regexp
sum(str_count(BBC,"(^|\"| )[Tt]he($| )"))


sum(str_count(BBC,"(^|\"| )[Tt]he($| )"))


#---------------------------------------------------------------
# 4. Funktioner 

# a)
myExp <- function(x,N){   
  
  xvec<-rep(x,N+1)  
  n<-0:N   
  xCalc<-xvec^n/factorial(n)
  myE<-sum(xCalc)
  
  return(myE)
}

for(i in 1:10){
  print(myExp(1,i))
  print(round(myExp(1,i),5)==round(exp(1),5))
} 
exp(1) 



# b)
pnr<-function(pnrText){
  thirdNo<-as.numeric(str_sub(pnrText,start=10,end=10))
  if(thirdNo%%2==0){
    return("Female")
  }else{
    return("Male")
  }
}
pnr("811218-9876")
pnr("811218-9846")




# 5. Statistik och grafik 

# vad gjorde seed?
set.seed(73233)

# a)
?distribution
hist(rweibull(n=1000,shape=10,scale=10)) 

# b)
x <- runif(400,min=0,max=1) 
y <- rnorm(400,mean=x*10,sd=1) 
hist(y)


# c)
model <- lm(y~x)
temp<-summary(model)
temp$coefficients









