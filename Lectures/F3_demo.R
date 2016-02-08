# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
# Demo: Programkontroll
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------


# -------------------------------------------------------------------------------------------
# Villkorssatser
# -------------------------------------------------------------------------------------------


if(2<4) print("ja!!!")

if(2>4) print("ja!!!")

x<-10
x<-40
if(x<=20){
  print("litet x")
} else{
  print("stort x")
}


x<-1:2
if(x>=1) print("hej")

f<-function(x){
  if(is.numeric(x)){
    my_mean<-mean(x)
    print(my_mean)
  } else{
    print("x is not numeric")
  }
}
f(1:340)
f(x = "abc")


# Egen version av sign()
my_sign<-function(x){
  if(x>0){
    return(1)
  } else if(x==0){
    return(0)
  } else{
    return(-1)
  }
}
my_sign(10)
my_sign(-210.53)
my_sign(0)
#


centre <- function(x, type) {
  switch(type,
         mean = mean(x),
         median = median(x),
         trimmed = mean(x, trim = .1))
}
x <- c(21,42,21,125,675,31,19,342,2,38,42)
centre(x, "mean")
centre(x, "median")
centre(x, "trimmed")

x<-8:11
?ifelse
ifelse(test = x>10,yes = "ja",no = "nej")



# -------------------------------------------------------------------------------------------
# for-loopar
# -------------------------------------------------------------------------------------------

for(i in 1:10){
  print(i)
}

for(i in 1:10){
  print("hello")
}

x<-0
for(i in 1:10){
  x<-x+i
  print(x)
}

for(j in 1:5){
  print(j)
  if(j%%2==0){
    print("jämnt")
  } else{
    print("udda")
  }
}


# -------------------------------------------------------------------------------------------
# Nästlade for-loopar
# -------------------------------------------------------------------------------------------

A <- matrix(c(3,6,9,2), nrow = 2)
A
for ( i in 1:2 ) {
  for ( j in 1:2 ) {
    print(A[i,j])
  }
}
paste("hej",1,TRUE,sep = "")

for ( i in 1:2 ) {
  for ( j in 1:2 ) {
    print(paste("rad:",i,"kolumn:",j,"värde=",A[i,j]))
  }
}


# -------------------------------------------------------------------------------------------
# kontrollstrukturer för loopar
# -------------------------------------------------------------------------------------------

?next
?break



for(i in 3:12){
  if(i%%3!=0){
    next
  }
  print(i)
}


for(i in 3:12){
  if(i%%3!=0){
    break
  }
  print(i)
}

for(i in 3:12){
  if(i%%3!=0){
    stop("kldsag")
  }
  print(i)
}


for(i in 3:12){
  if(i%%3!=0){
    stop("avbryt!")
  }
  print(i)
}



# -------------------------------------------------------------------------------------------
# while-loopar
# -------------------------------------------------------------------------------------------


y<-10
x<-5
while(x>0){
  print(y/x)
  x<-x-1
}

while(x<=5){
  print(y/x)
  x<-x-1
}




cond<-TRUE
index<-1
while(cond){
  temp<-iris[,index]
  if(is.numeric(temp)){
    print(median(temp))
    index<-index+1
  } else{
    cond<-FALSE
  }
}
dim(iris)
head(iris)

# -------------------------------------------------------------------------------------------
# Demo debugging
# -------------------------------------------------------------------------------------------


my_mean<-function(x){
  if(!is.numeric(x)) warning("x is not numeric!")  
  return(mean(x))
}
     
my_mean(x = 1:8)
my_mean(x=c(TRUE,FALSE,FALSE))

my_mean<-function(x){
  if(!is.numeric(x)) stop("x is not numeric!")  
  return(mean(x))
}

my_mean(x = 1:8)
my_mean(x=c(TRUE,FALSE,FALSE))


my_mean<-function(x){
  print(typeof(x))
  return(mean(x))
}
my_mean(x = 1:8)
my_mean(x=c(TRUE,FALSE,FALSE))

# browser och debug


debug(my_mean)
my_mean(x = 1:8)
my_mean(x=c(TRUE,FALSE,FALSE))
undebug(my_mean)


h<-function(x){
  x_mean<-mean(x)
  x_sum<-sum(x)
  print(x_mean)
  print(x_sum)
  x2<-x^2
  z<-5
  x3<-exp(x2)
  y<-x3<-z
  return(y)
}

h(1:4)
my_val<-h(2:5)

h<-function(x){
  x_mean<-mean(x)
  x_sum<-sum(x)
  print(x_mean)
  print(x_sum)
  #browser()
  x2<-x^2
  z<-5
  x3<-exp(x2)
  y<-x3<-z
  return(y)
}













