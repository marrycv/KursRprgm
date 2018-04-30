rm(list=ls())
# 1

# a)

x<-1.789
y<-(sin(x)/x)+(exp(x)-exp(-x))/(exp(x)+exp(-x))
y<-round(y,4)
print(y)

# alt:

del1 <-  sin(x)/x
del2 <- exp(x)-exp(-x)
del3 <- exp(x)+exp(-x)
del4 <- del2/del3
del5 <- del1 + del4
y<-round(del5,4)

# b)

dim_vect<-c(4,5,2)
my_array<-array(data = runif(n = prod(dim_vect)),dim = dim_vect)
str(my_array)
dim(my_array)

# c)

library(dplyr) 
library(ggplot2)
data(diamonds)
temp<-filter(diamonds,color=="E"&depth>=65)
temp<-select(temp,price,color,depth)
temp<-mutate(temp,x1=price^2,x2=log(depth))
my_diamonds<-arrange(temp, desc(price))

# eller 
my_diamonds<-diamonds%>%filter(color=="E"&depth>=65)%>%
  filter(color=="E"&depth>=65)%>%
  select(price,color,depth)%>%
  mutate(x1=price^2,x2=log(depth))%>%
  arrange(desc(price))

dim(my_diamonds)
head(my_diamonds)
tail(my_diamonds)



# 2

# a)

# alt 1:
letters
vowels<-c("a","e","i","o","u","y")
sum(letters%in%vowels)
for(i in 1:length(letters)){
  part2<-paste(letters[1:i],collapse = " ")
  n<-sum(letters[1:i]%in%vowels)
  part1<-paste("Antal vokaler:",n,",")
  print(paste(part1,part2))
  # ok med cat() istället för print()+paste()
}

# alt 2:
vowels <- c("a","e","i","o","u","y")
for (i in 1:length(letters)) {
  alphabet <- letters[1:i]
  glued_alphabet <- str_c(alphabet, collapse = ' ')
  count <- 0
  for (j in alphabet) {
    if (j == 'a' | j == 'e' | j == 'i' | j == 'o' | j == 'u' | j == 'y') {
      count <- count + 1
    }
  }
  output <- paste0("Antal vokaler: ", count, ' , ', glued_alphabet)
  print(output)
}

# alt 3:
index <- which(letters=="a"|letters=="e"|letters=="o"|letters=="u"|letters=="i"|letters=="y")
vokaler <- letters[index]
for(i in 1:length(letters)){
  index2 <- letters[index]%in% letters[1:i]
  antalVokaler <- length(vokaler[index2])
  l <- letters[1:i]
  cat("Antal vokaler: ", antalVokaler,",", l, "\n")
}

# alt 4:
library(stringr)
for(i in 1:length(letters)){
  d<-str_match_all(letters[1:i],"[aeiouy]") #Räknar antal vokaler i nuvarande sträng
  cat('Antalet vokaler: ', length(unlist(d))," , ", paste(letters[1:i], " "),'\n',sep =  "")  #Utskrift
}

# alt 5:
library(stringr)
abc <- letters
i <- 1
for (i in 1:length(abc)){
  voc <- sum(str_count(abc[1:i], "[a,e,i,o,u,y]"))
  cat("Antal vokaler:", voc, ",", abc[1:i], "\n")
  i <- i + 1
}



# b)

X<-matrix(0,5,3)
i<-1
j<-1
while(i<=5){
  #print(i)
  j<-1
  while(j<=3){
    print(paste("i=",i,"j=",j))  # kontroll av att loopen gör det den ska
    X[i,j]<-(1.5*i-j)*cos(pi*j)
    j<-j+1
  }
  i<-i+1
}
X

# kontrollera lösningen med en nästlad for-loop
# X1<-matrix(0,5,3)
# for(i in 1:5){
#   for(j in 1:3){
#     X1[i,j]<-(1.5*i-j)*cos(pi*j)
#   }
# }
# X1==X


# 3 

# a)
setwd("/home/josef/Dropbox/Josef/732G33_VT2018/KursRprgm/OldExams/20180328/")
data_path<-"/home/josef/Dropbox/Josef/732G33_VT2018/KursRprgm/OldExams/20180328/wind_temp_data.csv"
wind_temp_data<-read.csv2("wind_temp_data.csv",stringsAsFactors = FALSE)

head(wind_temp_data)
wind_temp_data$Date[1:5]

library(lubridate)
library(stringr)

# b)
# i)

wind_temp_data$Date<-ymd(wind_temp_data$Date)

median_temp<-aggregate(wind_temp_data$Temp,by=list(month(wind_temp_data$Date)),FUN=median)
index<-which(median_temp$x==max(median_temp$x))
# svar:
month.name[median_temp$Group.1[index]]

# ii)

# notera att i denna uppgift räcker det inte att svara helg eller vardag,
# utan det måste även vara en korrekta beräkningar som leder fram till lösningen.

day_no<-wday(wind_temp_data$Date,label = FALSE,week_start = 1)  # notera argumentet week_start
day_index<-day_no==6|day_no==7

# kontrollerar: 
wday(wind_temp_data$Date[day_index],label =  TRUE)

weekends_mean<-mean(wind_temp_data$Temp[day_index])  # helger
weekdays_mean<-mean(wind_temp_data$Temp[!day_index])  # vardagar
weekends_mean>weekdays_mean
# Vardagarna har ett högre medelvärde

# iii)
index<-which.min(wind_temp_data$Wind)
wind_temp_data$Date[index]
floor(interval(start = wind_temp_data$Date[index],end = "1973-09-19")/weeks(1))
# 12 veckor


# c)

library(stringr)
id_detect<-function(x){
  # väljer ut de element som uppfyller vilkoret:
  index<-str_detect(string = x,pattern = "(^| )[a-z]{3}-[0-5]{3}($| )")
  # skapar en vektor som ska returneras
  y<-rep("No ID",length(x))
  # sparar de hittade ID-nummren:
  y[index]<-str_extract(string = x[index],pattern = "[a-z]{3}-[0-5]{3}")
  return(y)
}

text1<-c("abc-123"," xyz-123","agq-123 ","abcd-123","abc-1234","abc--123")
id_detect(x = text1)
text2<-c("abse abc-123","hejabc-123hej","abc abc-123 abc","abc abc-123 abc","abcabc-123 abc","abc.123")
id_detect(x = text2)
text3<-c("abse abc-126","hejabc-123hej","abc abcg-123 abc","abc abc-1231 abc")
id_detect(x = text3)


# 4 
# a)
library(lubridate)
company<-function(name,age,startdate){
  # any() används för att kolla om något element i vektorn ej uppfyller kravet
  # kan även lösas med for-loop som loopar över elementen i vektorerna. 
  if(any(!is.character(name))) stop("name is not character")
  if(any(!age>0)) stop("age is not greater then zero")
  if(any(!is.Date(startdate))) stop("startdate is not of Date-class")
  # skapa strukturen för klassen:
  y<-list(name=name,age=age,startdate=startdate)
  # tilldela klass
  class(y)<-"company"
  return(y)
}

test1<-company(name = c("Stine","Lo"),age = c(29,38),startdate = c(ymd("2010-05-02"),ymd("2017-09-10")))
str(test1)
company(name = 10,age = c(29,38),startdate = c(ymd("2010-05-02"),ymd("2017-09-10")))
company(name = c("Stine","Lo"),age = c(43,-38),startdate = c(ymd("2010-05-02"),ymd("2017-09-10")))
company(name = c("Stine","Lo"),age = c(29,38),startdate = "2010-05-02")
is.list(test1)
names(test1)

# b) print-method:
print.company<-function(x,compare){
  employment_days<-interval(x$startdate,end = compare)/days(1)
  employment_weeks<-interval(x$startdate,end = compare)/weeks(1)
  res<-data.frame(name=x$name,age=x$age,no_days=employment_days,no_weeks=employment_weeks)
  print(res)
}

print(test1,compare = ymd("2018-02-05"))
print(test1,compare = ymd("2017-12-12"))

test2<-company(name = c("a","b","c"),age = c(1,2,3),salary = c(10,100,1000),startdate = c(ymd("2013-01-02"),ymd("2014-02-03"),ymd("2015-03-04")))
print(test1,compare = ymd("2018-02-05"))
print(test1,compare = ymd("2017-12-12"))
print(test1,compare = ymd("2017-02-12"))

# 5

# a)

# i)
data(mtcars)
?mtcars
mtcars$am
# ska göra en factor-variabel:
am<-as.factor(x = mtcars$am)
levels(am)<-c("automatic","manual")
mtcars$am<-am

# alt:
mtcars$am <- factor(mtcars$am, labels = c("automatic","manual"))

head(mtcars)

# ii)
hp_category<-mtcars$hp
index<-hp_category<=130
hp_category[index]<-"low"
hp_category[!index]<-"high"
table(hp_category,am)

# iii
test_obj<-chisq.test(x = table(hp_category,am))

test_stat<-test_obj$statistic
test_stat
p_value<-test_obj$p.value
p_value

# b)
data(faithful)
# kollar data:
plot(faithful)
# eruptions>=2.7 delar data

faithful$cat<-as.integer(faithful$eruptions>3)+1

# i)
library(ggplot2)
ggplot(data=faithful,aes(y=eruptions,x=waiting))+geom_point(color=faithful$cat)+ggtitle("Old faithful")

# ii)
ggplot(data=faithful,aes(y=eruptions,x=waiting))+geom_point(shape=faithful$cat)+ggtitle("Old faithful")


